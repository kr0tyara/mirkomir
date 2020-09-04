package com.hurlant.util;

extern class Base64 {
	function new() : Void;
	static function decodeToByteArray(data : String) : flash.utils.ByteArray;
	static function encodeByteArray(data : flash.utils.ByteArray) : String;
}
