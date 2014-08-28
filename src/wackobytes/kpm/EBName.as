﻿package com.kpm.kpm {		import com.kpm.util.EGoal;	import com.kpm.util.GameLib;	import com.kpm.util.Util;			public class EBName	{		public static var stdCounter : Array ;		public static var bubbleGroupList : Array = new Array(200);		public static var DEFAULT_MIN_LEVEL : int = 1;		public static var DEFAULT_MAX_LEVEL : int = 1;				private var standard  : EBStd;		private var index : uint;        private var active : Boolean;				private var minLevel, maxLevel 	: int;		private var scoreType			: EBScoreType;		private var reportable			: Boolean;				//This if for the PDF report		public static var numbers : Array = [null, "3","5","7","10","15","20"];		public static var colors : String = "red, green, blue, yellow and orange"		public static var sizes  : String = "big versus small objects";		public static var shapes : Array = [null, 		"circles, squares, rectangles, and equilateral triangles",		"circles, squares, rectangles, any triangles in different orientations", 		"circles, squares, rectangles, any triangles, parallelograms trapezoids, and ovals in different orientations",		"circles, squares, triangles, rectangles, parallelograms trapezoids, ovals, pentagons, hexagons in different orientations"];				public static var matchShapes : Array = [null, 		"circles, squares, rectangles, and equilateral triangles",		"circles, squares, rectangles and equilateral triangles in different orientations",		"circles, squares, rectangles, any triangles in different orientations", 		"circles, squares, rectangles, any triangles in different orientations", 		"circles, squares, rectangles, any triangles in different orientations", 		"circles, squares, rectangles, any triangles, parallelograms, trapezoids, and ovals in different orientations",		"circles, squares, triangles, rectangles, parallelograms, trapezoids, ovals, pentagons, hexagons in different orientations"];					    //0 NUMBERS	    public static const CountFinger_3			: EBName = new EBName(1, 1, EBStd.Numbers_Count);	    public static const Count5Frame_3			: EBName = new EBName(1, 1, EBStd.Numbers_Count);	    public static const CountDiceDots_3			: EBName = new EBName(1, 1, EBStd.Numbers_Count);	    public static const CountNumeral_3			: EBName = new EBName(1, 1, EBStd.Numbers_Count);	    public static const CountMixed_3			: EBName = new EBName(1, 1, EBStd.Numbers_Count);	    public static const CountFinger_5			: EBName = new EBName(4, 1, EBStd.Numbers_Count);	    public static const Count5Frame_5			: EBName = new EBName(4, 1, EBStd.Numbers_Count);	    public static const CountDiceDots_5			: EBName = new EBName(4, 1, EBStd.Numbers_Count);		public static const CountNumeral_5			: EBName = new EBName(4, 1, EBStd.Numbers_Count);	    public static const CountMixed_5			: EBName = new EBName(4, 1, EBStd.Numbers_Count);	    public static const CountFinger_7			: EBName = new EBName(4, 1, EBStd.Numbers_Count);	    public static const Count5Frame_7			: EBName = new EBName(4, 1, EBStd.Numbers_Count);	    public static const CountDiceDots_7			: EBName = new EBName(4, 1, EBStd.Numbers_Count);		public static const CountNumeral_7			: EBName = new EBName(4, 1, EBStd.Numbers_Count);	    public static const CountMixed_7			: EBName = new EBName(4, 1, EBStd.Numbers_Count);	    public static const CountFinger_10			: EBName = new EBName(4, 1, EBStd.Numbers_Count);	    public static const Count5Frame_10			: EBName = new EBName(4, 1, EBStd.Numbers_Count);	    public static const CountDiceDots_10		: EBName = new EBName(4, 1, EBStd.Numbers_Count);		public static const CountNumeral_10			: EBName = new EBName(4, 1, EBStd.Numbers_Count);	    public static const CountMixed_10			: EBName = new EBName(4, 1, EBStd.Numbers_Count);	    public static const SubsetFinger_3			: EBName = new EBName(4,1, EBStd.Numbers_Subset, false);	    public static const Subset5Frame_3			: EBName = new EBName(4,1, EBStd.Numbers_Subset, false);	    public static const SubsetDiceDots_3		: EBName = new EBName(4,1, EBStd.Numbers_Subset, false);	    public static const SubsetNumeral_3			: EBName = new EBName(4,1, EBStd.Numbers_Subset, false);	    public static const SubsetMixed_3			: EBName = new EBName(4,1, EBStd.Numbers_Subset, false);	    public static const SubsetFinger_5			: EBName = new EBName(4,1, EBStd.Numbers_Subset, false);	    public static const Subset5Frame_5			: EBName = new EBName(4,1, EBStd.Numbers_Subset, false);	    public static const SubsetDiceDots_5		: EBName = new EBName(4,1, EBStd.Numbers_Subset, false);	    public static const SubsetNumeral_5			: EBName = new EBName(4,1, EBStd.Numbers_Subset, false);	    public static const SubsetMixed_5			: EBName = new EBName(4,1, EBStd.Numbers_Subset, false);	    public static const SubsetFinger_7			: EBName = new EBName(4,1, EBStd.Numbers_Subset, false);	    public static const Subset5Frame_7			: EBName = new EBName(4,1, EBStd.Numbers_Subset, false);	    public static const SubsetDiceDots_7		: EBName = new EBName(4,1, EBStd.Numbers_Subset, false);	    public static const SubsetNumeral_7			: EBName = new EBName(4,1, EBStd.Numbers_Subset, false);	    public static const SubsetMixed_7			: EBName = new EBName(4,1, EBStd.Numbers_Subset, false);	    public static const SubsetFinger_10			: EBName = new EBName(4,1, EBStd.Numbers_Subset, false);	    public static const Subset5Frame_10			: EBName = new EBName(4,1, EBStd.Numbers_Subset, false);	    public static const SubsetDiceDots_10		: EBName = new EBName(4,1, EBStd.Numbers_Subset, false);	    public static const SubsetNumeral_10		: EBName = new EBName(4,1, EBStd.Numbers_Subset, false);	    public static const SubsetMixed_10			: EBName = new EBName(4,1, EBStd.Numbers_Subset, false);	    public static const Count5Frame_15			: EBName = new EBName(4, 1, EBStd.Numbers_Count);	    public static const CountNumeral_15			: EBName = new EBName(4, 1, EBStd.Numbers_Count);	    public static const Count5Frame_20			: EBName = new EBName(4, 1, EBStd.Numbers_Count);	    public static const CountNumeral_20			: EBName = new EBName(4, 1, EBStd.Numbers_Count);	    //public static const CountNumeral_30			: EBName = new EBName(4, 1, EBStd.Numbers_Count);	    //public static const Count5Frame_30			: EBName = new EBName(4, 1, EBStd.Numbers_Count);	    public static const Subset5Frame_15			: EBName = new EBName(2,1, EBStd.Numbers_Subset, false);	    public static const SubsetNumeral_15		: EBName = new EBName(2,1, EBStd.Numbers_Subset, false);	    public static const Subset5Frame_20			: EBName = new EBName(2,1, EBStd.Numbers_Subset, false);	    public static const SubsetNumeral_20		: EBName = new EBName(2,1, EBStd.Numbers_Subset, false);	    public static const ChangePlus1_3			: EBName = new EBName(4, 1, EBStd.Addition);	    public static const ChangePlus1_4			: EBName = new EBName(4, 1, EBStd.Addition);	    public static const ChangePlus1_5			: EBName = new EBName(4, 1, EBStd.Addition);	    public static const ChangePlus1_7			: EBName = new EBName(4, 1, EBStd.Addition);	    public static const ChangePlus1_10			: EBName = new EBName(4, 1, EBStd.Addition);	    public static const ChangePlus2_4			: EBName = new EBName(4, 1, EBStd.Addition);	    public static const ChangePlus2_5			: EBName = new EBName(4, 1, EBStd.Addition);	    public static const ChangePlusU_5			: EBName = new EBName(4, 1, EBStd.Addition);	    public static const IdentifyFinger			: EBName = new EBName(4,1, EBStd.Numbers_Identify);	    public static const Identify5Frame			: EBName = new EBName(6,1, EBStd.Numbers_Identify);   	    public static const IdentifyDiceDots		: EBName = new EBName(4,1, EBStd.Numbers_Identify);	    public static const IdentifyNumeral			: EBName = new EBName(6,1, EBStd.Numbers_Identify);	    public static const IdentifyMixed			: EBName = new EBName(4,1, EBStd.Numbers_Identify);	    // 3 GEOMETRY AND SPATIAL	    public static const IdentifyShape			: EBName = new EBName(5, 1, EBStd.Geometry);	    public static const MatchShape				: EBName = new EBName(8, 1, EBStd.Geometry, false);	    public static const PlaceShapeA				: EBName = new EBName(8, 1, EBStd.Geometry, false);	    public static const PlaceShapeB				: EBName = new EBName(8, 1, EBStd.Geometry, false);	    public static const PlaceShapeC				: EBName = new EBName(8, 1, EBStd.Geometry, false);	    public static const SpatialSense			: EBName = new EBName(5, 1, EBStd.SpatialSense, true, EBScoreType.Path);	    public static const VirtualPath				: EBName = new EBName(4, 1, EBStd.SpatialSense, false, EBScoreType.Proximity);	    public static const IdentifySpatial			: EBName = new EBName(4, 1, EBStd.SpatialSense, false);	    		//5 Data Measurements	    public static const IdentifyColor			: EBName = new EBName(2, 1, EBStd.DataMeasurements);	    public static const IdentifySize			: EBName = new EBName(2, 1, EBStd.DataMeasurements);	    //Comparison		public static const CompareEstimate_3		: EBName = new EBName(3, 1, EBStd.Comparison, false);		public static const CompareEstimate_5		: EBName = new EBName(3, 1, EBStd.Comparison, false);		public static const CompareEstimate_10		: EBName = new EBName(3, 1, EBStd.Comparison, false);		public static const CompareCorrespond_5		: EBName = new EBName(3, 1, EBStd.Comparison, false);		public static const CompareCorrespond_10	: EBName = new EBName(3, 1, EBStd.Comparison, false);		public static const Compare3Correspond_5	: EBName = new EBName(3, 1, EBStd.Comparison, false);		public static const Compare3Correspond_10	: EBName = new EBName(3, 1, EBStd.Comparison, false);	    public static const CompareCount_5			: EBName = new EBName(3, 1, EBStd.Comparison, false);		public static const CompareCount_10			: EBName = new EBName(3, 1, EBStd.Comparison, false);		public static const CompareDisorganized_5	: EBName = new EBName(3, 1, EBStd.Comparison, false);		public static const CompareDisorganized_10	: EBName = new EBName(3, 1, EBStd.Comparison, false);		public static const CompareDisorganized_15	: EBName = new EBName(3, 1, EBStd.Comparison, false);		public static const Compare3Disorganized_5	: EBName = new EBName(3, 1, EBStd.Comparison, false);		public static const Compare3Disorganized_10	: EBName = new EBName(3, 1, EBStd.Comparison, false);		//public static const Compare3Disorganized_15	: EBName = new EBName(3, 1, EBStd.Comparison, false);		public static const CompareMixed_5			: EBName = new EBName(3, 1, EBStd.Comparison, false);		public static const CompareMixed_10			: EBName = new EBName(3, 1, EBStd.Comparison, false);		public static const CompareMixed_15			: EBName = new EBName(3, 1, EBStd.Comparison, false);		public static const Compare3Mixed_5			: EBName = new EBName(3, 1, EBStd.Comparison, false);		public static const Compare3Mixed_10		: EBName = new EBName(3, 1, EBStd.Comparison, false);        public static const PlaceNumeral_5_1		: EBName = new EBName(4, 1, EBStd.PlaceNumber, false);        public static const PlaceNumeral_10_1	    : EBName = new EBName(4, 1, EBStd.PlaceNumber, false);        public static const PlaceNumeral_15_1	    : EBName = new EBName(4, 1, EBStd.PlaceNumber, false);        public static const PlaceNumeral_20_1	    : EBName = new EBName(4, 1, EBStd.PlaceNumber, false);        public static const PlaceNumeral_5_5		: EBName = new EBName(4, 1, EBStd.PlaceNumber, false);        public static const PlaceNumeral_10_5	    : EBName = new EBName(4, 1, EBStd.PlaceNumber, false);        public static const PlaceNumeral_15_5	    : EBName = new EBName(4, 1, EBStd.PlaceNumber, false);        public static const PlaceNumeral_20_5	    : EBName = new EBName(4, 1, EBStd.PlaceNumber, false);        public static const PlaceNumeral_30_5	    : EBName = new EBName(4, 1, EBStd.PlaceNumber, false);        public static const PlaceNumeral_40_5	    : EBName = new EBName(4, 1, EBStd.PlaceNumber, false);        public var Text :String;	    {Util.initEnumConstants(EBName);} // static ctor	   	    private static var constList : Array = 		Util.getConstantsInArray(EBName);				public static function get Consts() : Array 	{ return constList; }			    public function EBName(pMaxLevel : int, pMinLevel : int = 1, pStandard : EBStd = null, pReportable : Boolean = true, pScoreType : EBScoreType = null)	    {			if(pMaxLevel == -1)				return;            standard = pStandard;            if(!stdCounter)            {                stdCounter = new Array(GameLib.NUM_STANDARDS);                for(var i =0 ; i < GameLib.NUM_STANDARDS; i++)                    stdCounter[i] = 0;            }			index = stdCounter[standard.Index];			stdCounter[standard.Index]++;			minLevel = pMinLevel;			maxLevel = pMaxLevel;			reportable = pReportable;												if(pScoreType == null)				scoreType = EBScoreType.Choice;			else				scoreType = pScoreType;					    }		    			public function toString() : String 	{ return ("[BubbleName : " + Text + "]"); }				public function get Reportable () : Boolean { return reportable ; }		public function get Standard () : EBStd { return standard ; }		public function get ScoreType() : EBScoreType    { return scoreType; }				public function set MinLevel(pMinLevel : int) : void { minLevel = pMinLevel;}		public function set MaxLevel(pMaxLevel : int) : void { maxLevel = pMaxLevel;}				public function get MinLevel() : int { return minLevel;}		public function get MaxLevel() : int { return maxLevel; }		public function get Index () : uint { return index; }        public function set Standard (pStandard : EBStd)  { standard = pStandard ; }				public function equals(pName : Object) : Boolean		{						if(pName is String)			{				//Util.debug("comparing " + Text  + " to " + pId, this);				if(Text == pName)					return true;			}			else if (pName is BubbleId)			{				//Util.debug("comparing " + Text  + " to " + pId.Text, this);				if(Text == pName.Text)					return true;			}						return false;				}				//Gives the last number after the first "_" to know what the max number for the count and subset and addition bubbles is		public static function countNumber(bName : EBName) : uint		{			var nameArray : Array = bName.Text.split("_");			Util.debug("count number " + nameArray[1]);			return int(nameArray[nameArray.length-1]);					}					//This is for teachers to see a familiar name for the IdentifyNumber bubbles.		//instead of IdentifyFinger_1, they will see IdentifyFinger_3		public static function getFriendlyName(pBubbleString : String)		{			if(pBubbleString.indexOf("IdentifyFinger") != -1 || pBubbleString.indexOf("IdentifyNumeral") != -1 || pBubbleString.indexOf("Identify5Frame") != -1 || pBubbleString.indexOf("IdentifyDiceDots") != -1)			{				return (pBubbleString.split("_")[0] + "_" + EBName.numbers[pBubbleString.split("_")[1]]);			}			else				return pBubbleString; 								}        public function get Active() : Boolean        {            return active;        }        public function set Active(pActive : Boolean)        {            active = pActive;        }								public static function getEquivalents(pBubbleId : BubbleId) : Array		{			var equivalentBubbles : Array = new Array();			var bubbleGroup : XML = EBName.bubbleGroupList[pBubbleId.Name.Text];			Util.debug("Driver.getEquivalents for " + pBubbleId ); 			if(!bubbleGroup.@equivalenceNum)	return [pBubbleId];			 			for(var i=0; i < bubbleGroup.@equivalenceNum; i++)			{				var equiBid : BubbleId = new BubbleId(EBName[bubbleGroup["name"][i]], pBubbleId.Level);				equivalentBubbles.push(equiBid);			}						Util.debug("EBName.getEquivalentes is " );			Util.printArray(equivalentBubbles);						if(equivalentBubbles.length == 0)				return [pBubbleId];						return equivalentBubbles;		}			}}