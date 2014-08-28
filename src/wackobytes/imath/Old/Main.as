/**
 * Created by WackobytesApp on 8/25/14.
 */
package wackobytes.imath {
import com.wackobytes.games.game5.G5;
import com.wackobytes.kpm.EBName;
import com.wackobytes.util.Util;

import flash.display.Sprite;

import feathers.controls.ScrollBar;
import feathers.themes.MetalWorksMobileTheme;

import flash.geom.Point;

import starling.core.Starling;
import starling.display.DisplayObject;
import starling.display.Sprite;
import starling.events.Event;

import wackobytes.FlowKpm.controls.GC_Row;
import wackobytes.util.Point;
import greensock.TweenLite;

public class Main extends starling.display.Sprite
{
    private var game : G5;
    private var bubble : EBName;
    private var currentLevel : int;

    private static const HOME_SCREEN:String = "homeScreen";

    public function Main()
    {
        this.addEventListener(Event.ADDED_TO_STAGE, onStageReady);
    }

    //design it, name it, implement it, use it, feedback from it, redo it, ...
    private function onStageReady():void
    {
        new MetalWorksMobileTheme(null, false);
        loadGrid(new Point(-500,100));
        loadGrid(new Point(1500,100));
        //loadG5();

    }

    private function loadGrid(pPosition : Point):void
    {
        //GameBox(pNumObjects : int, position : Point, pSize : Point, pSize_Objects : Point,
        //	pBoxArtName : String, pIsAnswerBox : Boolean, pPadding : Number)

        for(var i=0; i< 5; i++)
        {
            var tempRow : GC_Row = new GC_Row(5, new Point(25,25), new Point(100 + pPosition.x, i*50 + pPosition.y), new Point(50,50), "solidColor", false, 15);
            addChild(tempRow);

            TweenLite.to(tempRow, 2, {x:300+i*50});
        }



    }

    private function loadG5():void
    {
        bubble = EBName.PlaceNumeral_10_1;
        currentLevel = 2;

        var params : Object = new Object() ;
        params.mpInitialNumeral = 5;
        params.mpNumTotalNodesInPath = 35;
        params.mpNumAnswersToChoose = 2 ;
        params.mpNumPresentations = 3;
        params.mpMinRandomAdjacentPieces = 2;
        params.mpMaxRandomAdjacentPieces = 3;
        params.mpMinRandomAdjacentWholes = 1 ;
        params.mpMaxRandomAdjacentWholes = 2;
        params.mpOrder = 0;

        game = new G5(bubble, currentLevel, params); 			//, lang, name, level);
        Starling.current.nativeOverlay.addChild(game as flash.display.Sprite);

    }



}