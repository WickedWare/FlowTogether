package wackobytes.games.G6FlowTogether
{

import citrus.core.starling.StarlingCitrusEngine;
import citrus.utils.Mobile;

import flash.geom.Rectangle;
import wackobytes.imath.Log;


import wackobytes.imath.DraggableCube;

/* TODO
 PutTogether : Parameters
 cardinality_Box1(min, max)
 cardinality_Box2(min,max)
 answer(boxId, cardinalityAnswer)


*/

    [SWF(backgroundColor="#FFF111", frameRate="60")]
    public class PutTogeher extends StarlingCitrusEngine {

        public function PutTogeher() {
            compileForMobile = Mobile.isIOS() ? true : false;

            this.console.addCommand("pause", pauseGame)
            Log.info("PutTogeher.PutTogeher!");
        }

        public var compileForMobile:Boolean;
        public var isIpad:Boolean = false;

        override public function initialize():void
        {
            if (compileForMobile) {

                // detect if iPad
                isIpad = Mobile.isIpad();

                if (isIpad)
                    setUpStarling(true, 1, new Rectangle(32, 64, stage.fullScreenWidth, stage.fullScreenHeight));
                else
                    setUpStarling(true, 1, new Rectangle(0, 0, stage.fullScreenWidth, stage.fullScreenHeight));
            } else
                setUpStarling(true);

        }

        override public function handleStarlingReady():void
        {
            state = new PutTogeherGameState();
        }

        override public function setUpStarling(debugMode:Boolean = false, antiAliasing:uint = 1, viewport:Rectangle = null, profile:String = "baseline"):void {

            super.setUpStarling(debugMode, antiAliasing, viewport, profile);

            if (compileForMobile) {
                // set iPhone & iPad size, used for Starling contentScaleFactor
                // landscape mode!
                _starling.stage.stageWidth = isIpad ? 512 : 480;
                _starling.stage.stageHeight = isIpad ? 384 : 320;
            }

            this.console.addCommand("pause", pauseGame);
            this.console.showConsole();
        }

        public function pauseGame(pex : String)
        {
            trace("peeeeexxxx");
            if(pex == "true") this.playing = true else this.playing = false;

        }



    }




}

