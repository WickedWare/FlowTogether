﻿package com.kpm.games.walkthewalk {  public class UniformGameLevelSpec {    private var mSpeciesChoice: Number;    private var mSizeChoice: Number;    private var mColorChoice: Number;    private var mNumberChoice: Number;    private var mSpeciesInv: Number;    private var mSizeInv: Number;    private var mColorInv: Number;    private var mNumberInv: Number;    private var mPlacement: Number;    private var mNumRounds: Number;    private var mNumGoalObjects: Number;        private var mMaxGoalObjects : Number;    private var mMinGoalObjects : Number;        private var mTotalObjects: Number;    private var mCountingMethod: Number;    private var mLevelType: Number;    static private const RANDOM_CHOICE: Number = 0;    static public const PLACEMENT_RANDOM: Number = 0;    static public const PLACEMENT_LINEAR: Number = 1;    static public const COUNTING_NONE: Number = -1;    static public const COUNTING_FINGERS: Number = 0;    static public const COUNTING_5FRAMES: Number = 1;    static public const COUNTING_NUMERALS: Number = 2;    static public const COUNTING_DICES: Number = 3;    static public const COUNTING_MIXED: Number = 4;    static public const COUNTING_FINGERS_OR_5FRAMES: Number = 5;    static public const LEVELTYPE_COUNTING: Number = 0;    static public const LEVELTYPE_IDENTIFY_COLOR: Number = 1;    static public const LEVELTYPE_IDENTIFY_NUMBER: Number = 2;    static public const LEVELTYPE_IDENTIFY_SIZE: Number = 3;        static public var RepeatGoal : Number = 1;    public function UniformGameLevelSpec(pActivity: String, pLevel: Number, pNumRounds: Number){      mNumRounds = pNumRounds;      mMinGoalObjects = 1;			  if(pActivity.indexOf("Identify") != -1)	  {          mSpeciesChoice = -1;          mSizeChoice = 0;          mColorChoice = -1;          mNumberChoice = 0;          mSpeciesInv = 0;          mSizeInv = 1;          mColorInv = 0;          mNumberInv = -1;          mPlacement = PLACEMENT_LINEAR;          mTotalObjects = GameLevel.TOTALGCS_SAMEASGOALOBJS;          mLevelType = LEVELTYPE_IDENTIFY_NUMBER;		  GameLevel.MIN_GOAL_OBJECTS = 1;          		  mNumGoalObjects = 0;                    switch(pLevel){            case 0:                                          GameLevel.MAX_GOAL_OBJECTS = 3;                     GameLevel.MIDDLE_VALUE = 0;                     break;            case 1:                     GameLevel.MAX_GOAL_OBJECTS = 5;                     GameLevel.MIDDLE_VALUE = 4;                     break;                                 case 2:                     GameLevel.MAX_GOAL_OBJECTS = 7;                     GameLevel.MIDDLE_VALUE = 5;                     break;            case 3:                     GameLevel.MAX_GOAL_OBJECTS = 10;                     GameLevel.MIDDLE_VALUE = 6;                     break;          }                    GameLevel.MAX_TOTAL_OBJECTS = GameLevel.MAX_GOAL_OBJECTS;	  }	  	  if(pActivity.indexOf("Count") != -1)	  {		  	switch(pLevel){		            case 0:	                     mSizeInv = 1;	                     mColorInv = 1;	                     mPlacement = PLACEMENT_LINEAR;	                     break;	            case 1:	                     mSizeInv = 0;	                     mColorInv = 0;	                     mPlacement = PLACEMENT_LINEAR;	                     break;	            case 2:	                     mSizeInv = 1;	                     mColorInv = 1;	                     mPlacement = PLACEMENT_RANDOM;	                     break;	            case 3:	                     mSizeInv = 0;	                     mColorInv = 0;	                     mPlacement = PLACEMENT_RANDOM;	                     break;		          }	  }	  	  if(pActivity.indexOf("IdentifyColor") != -1)	  {          mSpeciesChoice = 0;          mSizeChoice = 0;          mColorChoice = -1;          mNumberChoice = 0;          mSpeciesInv = 1;           mNumberInv = -1;          mPlacement = PLACEMENT_LINEAR;          mTotalObjects = GameLevel.TOTALGCS_RANDOM;          mCountingMethod = COUNTING_NONE;          mLevelType = LEVELTYPE_IDENTIFY_COLOR;                    switch(pLevel){            case 0:                     mSizeInv = 1;                     mColorInv = 0;                     GameLevel.MIN_TOTAL_OBJECTS = 5;                     GameLevel.MAX_TOTAL_OBJECTS = 7;                     mNumGoalObjects = 2;                     mPlacement = PLACEMENT_LINEAR;                     break;            case 1:                     mSizeInv = 0;                     mColorInv = 0;                     GameLevel.MIN_TOTAL_OBJECTS = 8;                     GameLevel.MAX_TOTAL_OBJECTS = 10;                     mNumGoalObjects = 3;                     mPlacement = PLACEMENT_LINEAR;                     break;          }      }            if(pActivity.indexOf("IdentifySize") != -1)	  {          mSpeciesChoice = 0;          mSizeChoice = -1;          UniformGameLevelSpec.RepeatGoal = 2;          mColorChoice = 0;          mNumberChoice = 0;          mSpeciesInv = 1;           mNumberInv = -1;          mPlacement = PLACEMENT_LINEAR;          mTotalObjects = GameLevel.TOTALGCS_RANDOM;          mCountingMethod = COUNTING_NONE;          mLevelType = LEVELTYPE_IDENTIFY_SIZE;                              switch(pLevel){            case 0:                     mSizeInv = 0;                     mColorInv = 1;                     GameLevel.MIN_TOTAL_OBJECTS = 4;                     GameLevel.MAX_TOTAL_OBJECTS = 5;                     mNumGoalObjects = 3;                     mPlacement = PLACEMENT_LINEAR;                     break;            case 1:                     mSizeInv = 0;                     mColorInv = 0;                     GameLevel.MIN_TOTAL_OBJECTS = 5;                     GameLevel.MAX_TOTAL_OBJECTS = 7;                     mNumGoalObjects = 4;                     mPlacement = PLACEMENT_LINEAR;                     break;          }      }	  	  else if (pActivity.indexOf("Count") != -1)      {      	  mSpeciesChoice = -1;          mSizeChoice = 0;          mColorChoice = 0;          mNumberChoice = 0;          mSpeciesInv = 0;          mNumberInv = -1;          mTotalObjects = GameLevel.TOTALGCS_SAMEASGOALOBJS;          mLevelType = LEVELTYPE_COUNTING;		  mNumGoalObjects = 0;      }                  else if (pActivity.indexOf("Subset") != -1)      {      	  mSpeciesInv = 1;          mSpeciesChoice = 0;          mNumberChoice = 0;          mNumberInv = -1;          mLevelType = LEVELTYPE_COUNTING;          mTotalObjects = GameLevel.TOTALGCS_FIXEDATMAX;		  mPlacement = PLACEMENT_RANDOM;		  mNumGoalObjects = 0;		              		  switch(pLevel){		            case 0:	                     mSizeInv = 1;                         mColorInv = 0;          				 mSizeChoice = 0;          				 mColorChoice = -1;	                     break;	            case 1:	                     mSizeInv = 0;                         mColorInv = 1;          				 mSizeChoice = -1;          				 mColorChoice = 0;	                     break;	            case 2:	            		 mSizeInv = 0;                         mColorInv = 0;	                     mSizeChoice = 0;          				 mColorChoice = -1;	                     break;	            case 3:	                     mSizeInv = 0;                         mColorInv = 0;	                     mSizeChoice = -1;          				 mColorChoice = 0;	                     break;		          }	          	          if(pActivity.indexOf("_3") != -1)	          {	          		GameLevel.MIN_TOTAL_OBJECTS = 4;			 		GameLevel.MAX_TOTAL_OBJECTS = 6;	          }			  else if(pActivity.indexOf("_5") != -1)			  {			  		GameLevel.MIN_TOTAL_OBJECTS = 6;			 		GameLevel.MAX_TOTAL_OBJECTS = 8;			  }			  else if(pActivity.indexOf("_7") != -1)	          {	          		GameLevel.MIN_TOTAL_OBJECTS = 8;			 		GameLevel.MAX_TOTAL_OBJECTS = 10;	          }  			  			      }		  if(pActivity.indexOf("Finger") != -1)	  		mCountingMethod = COUNTING_FINGERS;	  else if(pActivity.indexOf("5Frame") != -1)	  		mCountingMethod = COUNTING_5FRAMES;	  else if(pActivity.indexOf("Numeral") != -1)	  		mCountingMethod = COUNTING_NUMERALS;	  else if(pActivity.indexOf("Mixed") != -1)	  		mCountingMethod = COUNTING_MIXED;	  else if(pActivity.indexOf("DiceDots") != -1)	  		mCountingMethod = COUNTING_DICES;		  	  	  if(pActivity.indexOf("Subset") == -1 && pActivity.indexOf("Count") == -1)	  	return ; 	  		  if(pActivity.indexOf("_3") != -1)	  {	 		GameLevel.MIN_GOAL_OBJECTS = 1;	 		GameLevel.MIDDLE_VALUE = 0;	 		GameLevel.MAX_GOAL_OBJECTS = 3;	 			  }	  else if(pActivity.indexOf("_5") != -1)	  {	  		GameLevel.MIN_GOAL_OBJECTS = 1;	  		GameLevel.MIDDLE_VALUE = 4;	 		GameLevel.MAX_GOAL_OBJECTS = 5;	 		  }	  else if(pActivity.indexOf("_7") != -1)		  {				GameLevel.MIN_GOAL_OBJECTS = 1;			GameLevel.MIDDLE_VALUE = 5;	 		GameLevel.MAX_GOAL_OBJECTS = 7;	 		  }	  else if(pActivity.indexOf("_10") != -1)	  {					GameLevel.MIN_GOAL_OBJECTS = 1;			GameLevel.MIDDLE_VALUE = 6;	 		GameLevel.MAX_GOAL_OBJECTS = 10;	  }					  	  if (pActivity.indexOf("Count") != -1)	  	GameLevel.MAX_TOTAL_OBJECTS = GameLevel.MAX_GOAL_OBJECTS;	  		  	     }    public function get SpeciesChoice (): Number {      return mSpeciesChoice;    }    public function get SizeChoice (): Number {      return mSizeChoice;    }    public function get ColorChoice (): Number {      return mColorChoice;    }    public function get NumberChoice (): Number {      return mNumberChoice;    }    public function get SpeciesInv (): Number {      return mSpeciesInv;    }    public function get SizeInv (): Number {      return mSizeInv;    }    public function get ColorInv (): Number {      return mColorInv;    }    public function get NumberInv (): Number {      return mNumberInv;    }    public function get Placement (): Number {      return mPlacement;    }    public function get NumRounds (): Number {      return mNumRounds;    }    public function get NumGoalObjects (): Number {      return mNumGoalObjects;    }    public function get NumTotalObjects (): Number {      return mTotalObjects;    }    public function get CountingMethod (): Number {      return mCountingMethod;    }    public function get LevelType (): Number {      return mLevelType;    }  }}