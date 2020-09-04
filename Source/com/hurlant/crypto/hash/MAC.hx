/**
 * MAC
 * 
 * An ActionScript 3 implementation of MAC, Message Authentication Code
 * for use with SSL 3.0.
 * Loosely copyrighted by Bobby Parker.
 * As3crypto copyrighted by Henri Torgemane.
 * 
 * See LICENSE.txt for full license information.
 */
package com.hurlant.crypto.hash;


import haxe.Int32;
import com.hurlant.util.ByteArray;

class MAC implements IHMAC {
    private var hash:IHash;
    private var bits:Int32;
    private var pad_1:ByteArray;
    private var pad_2:ByteArray;
    private var innerHash:ByteArray;
    private var outerHash:ByteArray;
    private var outerKey:ByteArray;
    private var innerKey:ByteArray;

    /**
     * Create a MAC object (for SSL 3.0 ) and
     * optionally a number of bits to return.
     * The MAC will be truncated to that size if needed.
     */
    public function new(hash:IHash, bits:Int32 = 0) {
        this.hash = hash;
        this.bits = bits;
        innerHash = new ByteArray();
        outerHash = new ByteArray();
        innerKey = new ByteArray();
        outerKey = new ByteArray();

        if (hash != null) {
            var pad_size:Int32 = hash.getPadSize();
            pad_1 = new ByteArray();
            pad_2 = new ByteArray();

            for (x in 0...pad_size) {
                pad_1.writeByte(0x36);
                pad_2.writeByte(0x5c);
            }
        }
    }

    public function setPadSize(pad_size:Int32):Void {
    }

    public function getHashSize():Int32 {
        return (bits != 0) ? Std.int(bits / 8) : hash.getHashSize();
    }

    /**
     * Compute a MAC using a key and some data.
     */
    public function compute(key:ByteArray, data:ByteArray):ByteArray {
        // take that incoming key and do hash(key + pad_2 + hash(key + pad_1 + sequence + length + record)
        // note that data =  (sequence + type + length + record)

        if (pad_1 == null) {
            var pad_size:Int32 = hash.getPadSize();
            pad_1 = new ByteArray();
            pad_2 = new ByteArray();

            for (x in 0...pad_size) {
                pad_1.writeByte(0x36);
                pad_2.writeByte(0x5c);
            }
        } // Henri's conventions work just fine here..

        // Do some preliminary checking on stuff
        /*
        if (key.length > hash.getInputSize()) {
            hashKey = hash.hash(key);
        } else {
            hashKey = new ByteArray;
            hashKey.writeBytes(key);
        }

        while (hashKey.length < hash.getInputSize()) {
            hashKey[hashKey.length] = 0;
        }
        */

        innerKey.length = 0;
        outerKey.length = 0;
        // trace("MAC Key: " + Hex.fromArray(key));
        // trace("Key Length: " + key.length);
        // trace("Pad_1 : " + Hex.fromArray(pad_1));
        // inner hash calc
        innerKey.writeBytes(key);
        innerKey.writeBytes(pad_1);
        innerKey.writeBytes(data);
        // trace("MAC Inner Key: " + Hex.fromArray(innerKey));

        innerHash = hash.hash(innerKey);
        // trace("MAC Inner Hash: " + Hex.fromArray(innerHash));

        // outer hash calc
        outerKey.writeBytes(key);
        outerKey.writeBytes(pad_2);
        outerKey.writeBytes(innerHash);

        // trace("MAC Outer Key: " + Hex.fromArray(outerKey));
        outerHash = hash.hash(outerKey);


        if (bits > 0 && bits < 8 * outerHash.length) {
            outerHash.length = Std.int(bits / 8);
            // trace("MAC for record: " + Hex.fromArray(outerHash));
        }

        return outerHash;
    }

    public function dispose():Void {
        hash = null;
        bits = 0;
    }

    public function toString():String {
        return "mac-" + (bits > (0) ? bits + "-" : "") + hash.toString();
    }
}
