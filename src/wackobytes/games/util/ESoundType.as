﻿package com.kpm.util{		public class ESoundType	{		private var name;				public static const Instruction		:	ESoundType = new ESoundType("Instruction");		public static const Feedback		:	ESoundType = new ESoundType("Feedback");		public static const InstructionClick:	ESoundType = new ESoundType("InstructionClick");		public static const FeedbackClick	:	ESoundType = new ESoundType("FeedbackClick");				public function ESoundType(pName : String)		{			name = pName;		}				public function get Name () : String 		{ return name ; }				public var Text :String;		{Util.initEnumConstants(ESoundType);} // static ctor				private static var constList : Array = 			Util.getConstantsInArray(ESoundType);				public static function get Consts() : Array 	{ return constList; }					}}