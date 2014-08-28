package com.wackobytes.games {

import com.wackobytes.kpm.PhpRequest;  import com.wackobytes.util.EventManager; import com.wackobytes.util.Game;
import com.wackobytes.util.Util;       import com.wackobytes.kpm.KpmBubble;

import flash.desktop.NativeApplication;
import flash.filesystem.File;
import flash.utils.getDefinitionByName;
import flash.system.System;     import flash.text.TextField;
import flash.display.MovieClip; import flash.display.SimpleButton;
import flash.events.Event;      import flash.events.MouseEvent;

/*GameIgniter : Bridges Flash, AS3 and Sqlite*/

public class GameIgniter extends MovieClip{

    private var _paramsPanel : MovieClip
    private var _bubble : KpmBubble;


    public static const ANIMATION_OVER : String = "ANIMATION_OVER";

    var interfacePanel : MovieClip;
    var _accompanied : Boolean;
    var feedback_TextField : TextField;
    var levelUpdatePhpRequest : PhpRequest;

    var game : Game;
    var currentlevel : int;
    var gameName : String;
    var back_Bt : SimpleButton;
    var level : Array = new Array(100);
    //var logTool : KpmLogTool;
    var allBubblesUnlocked = false;

    public function GameIgniter() {
    }


    function initGame(pGameName : String)
    {
        Util.printArray(["GameName : ", pGameName], "GameIgniter()")

        var dbFile:File = File.applicationStorageDirectory.resolvePath("Kpm.sqlite");
        sqlRunner = new SQLRunner(dbFile);

        gameName = pGameName;

        initParamsPanel();

        addInterfacePanel();
    }
    function exitApp(event:MouseEvent):void {

        NativeApplication.nativeApplication.exit(0);
    }

    private function initParamsPanel()
    {

        Util.debug("GameIgniter.initParamsPanel");

        _paramsPanel = addChild(Util.createAndPositionMc("ParametersPanel", 100, 20)) as MovieClip;
        _paramsPanel.tGoButton.addEventListener(MouseEvent.CLICK, loadGame) ;

        //interfacePanel = Util.createAndPositionMc("InterfacePanel", 1000, 600);

        feedback_TextField = Util.createTextField("", [30, 730], [100, 20]) as TextField;
        addChild(feedback_TextField);

        level[1] = addChild(Util.createAndPositionMc("FingerNum1", 150, 700));
        level[2] = addChild(Util.createAndPositionMc("FingerNum2", 250, 700));
        EventManager.addEvent(level[1],MouseEvent.CLICK, requestLevel, 1 );
        EventManager.addEvent(level[2],MouseEvent.CLICK, requestLevel, 2 );
    }

    public function requestLevel(e : Event,  pLevel : int){
        currentlevel = pLevel;
        levelUpdatePhpRequest = new PhpRequest();
        levelUpdatePhpRequest.connectToPHP("http://www.tropicalterror.net/wackobytes/parametros.php", pLevel, loadGame);
    }

    public function updateFeedback(pString : String){

        feedback_TextField.text = pString;   }

    public function updateTaskTimer(e : Event)
    {
        //if(game)
            //interfacePanel.tTaskTimer.text = game.Data.taskTimerNumber();
    }


    private function loadGame(e : Event) {

        Util.debug("GameIgniter.loadGame");

        if(game)
            finishGame();

        _paramsPanel.visible = false;


        var newGame:Class = getDefinitionByName(gameName) as Class;
        Util.printArray(["newGame5", newGame], "initalizeGame");

        var params : Object = JSON.parse(levelUpdatePhpRequest.Data as String);
        Util.debug("GameIgniter.Loading Game with params " + params + " and current Level " + (currentlevel-1) + params[currentlevel-1]);

        game = new newGame(params[currentlevel-1]); addChild(game);

        back_Bt = Util.addButton("BackButton", this, 1280 - 40, 800 - 40, finishGame) as SimpleButton;
        back_Bt.visible = true;

        EventManager.addEvent(game, ANIMATION_OVER, finishGame);


    }


    public function finishGame(e : Event = null){

        if(game){
            if(game.Data)
                game.Data.onRemove(null);

            game = null;
            Util.removeChild(game);
        }

        _paramsPanel.visible = true;
        System.gc();

    }


    public function get bubble():KpmBubble {return _bubble; }

    public function set bubble(value:KpmBubble):void {_bubble = value;}

    public function get Accompanied():Boolean {
        return _accompanied;}

    public function set Accompanied(value:Boolean):void {
        _accompanied = value;}

    public function get paramsPanel():MovieClip {
        return _paramsPanel;}

    public function addInterfacePanel(){
    }
}
}
