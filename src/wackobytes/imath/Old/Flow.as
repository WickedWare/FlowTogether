/**
 * Created by WackobytesApp on 8/25/14.
 */
package wackobytes.imath {

import com.gamua.flox.Flox;
import com.gamua.flox.Player;

import flash.events.Event;
import flash.geom.Rectangle;
import feathers.controls.Button;

import starling.display.Sprite;
import starling.core.Starling;
import flash.display.StageAlign;
import flash.display.StageDisplayState;
import flash.display.StageScaleMode;
import quicksketch.Main;


// simple flow of visual logic
// Sinestesia to represent the following queues
// At the beginning of the day, i give love to my Flow and PutTogeher Applications
// They require a lot of love, it is the most profound version of logic and visuals put together.

// TiledRowsLayout
// Move Me with Your Finger !!!
// button pressed and drag
// particle systems

// cool interface to link to video

[SWF(frameRate="60", backgroundColor="#ffffff")]
public class Flow extends Sprite
{
    private var starling:Starling;

    public function FlowKpm()
    {
        //stage.scaleMode = StageScaleMode.NO_SCALE;
        //stage.align = StageAlign.TOP_LEFT;

        //if (stage.displayState == StageDisplayState.NORMAL)
        //    stage.displayState=StageDisplayState.FULL_SCREEN_INTERACTIVE;

        stage.addEventListener(Event.RESIZE, onStageResize);
        stage.addEventListener(Event.DEACTIVATE, onStageDeactivate);

        Starling.handleLostContext = true;
        starling = new Starling(Main, stage);
        starling.start();





			/** Floxx initialization
			 * */
		Flox.init("hFZLjJiQLp7Qa59i", "sOrK4HTq5T2huTJJ", "0.9");
		var currentPlayer:Player = Player.current;

        loginWithForeignKey("pexxxx");
        sendAuthenticationEmail("carlara@gmail.com");


    }



    /** FLOXX LOGIN
     */

    public function loginWithForeignKey(pForeignKey : String) : void
    {
        Player.loginWithKey(pForeignKey,
                function onComplete(player:Player) : void {
                    Flox.logEvent("PlayerLogIn_FK", { playerName: Player.current.id });

                },
                function onError(message:String) : void {
                    Flox.logError("PlayerLogIn_FK",  "playerName: " + Player.current.id);
                }
        );
    }


    public function sendAuthenticationEmail(pEmail) : void
    {
        Player.loginWithEmail(pEmail,
                function onLoginComplete(player:Player) : void {
                    //Yay! The player is logged in.
                },
                function onLoginFailed(error:String, httpStatus:int, confirmationMailSent:Boolean) : void{
                    if(confirmationMailSent) {
                        //The player is playing on this device for the first time.
                        //He has been sent a confirmation email and needs to click
                        //on the contained confirmation link.
                        //You should now tell the player that he needs to check his
                        //emails, click the confirmation link and return to the game.

                        //When the player returns to your game, you should proceed
                        //by calling loginWithEmail() again. This time the device
                        //your player is playing on will be authorized and the login
                        //attempt will succeed.

                        Flox.logEvent("PlayerLogIn_Email", { playerName: Player.current.id });

                    } else {
                        //Darn! Something unexpected went wrong during the authentication
                        //attempt. You should probably log the error and tell your player
                        //about it.

                        Flox.logError("PlayerLogIn_Email",  "playerName: " + Player.current.id);

                    }
                }
        );
    }






    /** Stage RESIZE, ACTIVATE, DEACTIVATE */


    protected function onStageResize(event:Event):void
    {
        starling.stage.stageWidth = stage.stageWidth;
        starling.stage.stageHeight = stage.stageHeight;

        const viewPort:Rectangle = starling.viewPort;
        viewPort.width = stage.stageWidth;
        viewPort.height = stage.stageHeight;
        starling.viewPort = viewPort;
    }

    protected function onStageDeactivate(event:Event):void
    {
        starling.stop();
        stage.addEventListener(Event.ACTIVATE, onStageActivate);
    }

    protected function onStageActivate(event:Event):void
    {
        stage.removeEventListener(Event.ACTIVATE, onStageActivate);
        starling.start();
    }





}
}