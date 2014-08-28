/**
 * Created with IntelliJ IDEA.
 * User: carloslara
 * Date: 6/10/14
 * Time: 5:45 PM
 * To change this template use File | Settings | File Templates.
 */
package kpm.util {
import flash.display.Stage;

public class WebView {

    /*
     AIR for Mobile tutorial by Barbara Kaskosz

     http//www.flashandmath.com/

     last modified February 4, 2012.

     In AIR for Android settings panel, the app should be set
     to Portrait mode. Under Permissions, INTERNET should be checked.
     */

    import flash.display.StageAlign;
    import flash.display.StageScaleMode;
    import flash.events.MouseEvent;
    import flash.net.URLRequest;
    import flash.media.StageWebView;
    import flash.geom.Rectangle;


    var webView:StageWebView;

    var swvRect:Rectangle;

    var swvHeight:Number;

    var uiElemsTop:Number=140;

    var swvY:Number=140;

    var uiElemsBot:Number=40+20+75+20;

    var uiElemsHeight:Number=uiElemsTop+uiElemsBot;

    infoBox.text="";

    infoBox.visible=false;

    mainPanel.visible=false;

    webBtnsPanel.visible=false;

    mcStart.addEventListener(MouseEvent.CLICK,init);

    public function WebView(stage : Stage)
    {

        stage.align = StageAlign.TOP_LEFT;

        stage.scaleMode = StageScaleMode.NO_SCALE;
    }

    function init(e:MouseEvent):void {

        mcStart.removeEventListener(MouseEvent.CLICK,init);

        mcStart.visible=false;

        mainPanel.btnExit.addEventListener(MouseEvent.CLICK, exitApp);

        mainPanel.btnCloseSwv.addEventListener(MouseEvent.CLICK,closeSwv);

        mainPanel.btnOpenSwv.addEventListener(MouseEvent.CLICK, openSwv);

        infoBox.text="Click open stage web view to begin";

        webBtnsPanel.btnNext.addEventListener(MouseEvent.CLICK, nextPage);

        webBtnsPanel.btnPrev.addEventListener(MouseEvent.CLICK, prevPage);

        webBtnsPanel.btnReload.addEventListener(MouseEvent.CLICK, reloadPage);

        webBtnsPanel.btnStop.addEventListener(MouseEvent.CLICK, stopPage);

        swvHeight=stage.stageHeight-uiElemsHeight;

        infoBox.x=stage.stageWidth/2-infoBox.width/2;

        infoBox.y=stage.stageHeight-40;

        mainPanel.x=stage.stageWidth/2-mainPanel.width/2;

        webBtnsPanel.x=stage.stageWidth/2-webBtnsPanel.width/2;

        webBtnsPanel.y=140+swvHeight+20;

        mainPanel.visible=true;

        infoBox.visible=true;
    }

//When the user taps on Exit button, the app quits.


    function closeSwv(event:MouseEvent):void {

        if(webView==null){

            return;
        }

        webView.removeEventListener(ErrorEvent.ERROR,onError);

        webView.removeEventListener(LocationChangeEvent.LOCATION_CHANGING,onChanging);

        webView.removeEventListener(Event.COMPLETE,onComplete);

        webView.viewPort=null;
        webView.dispose();
        webView=null;

        webBtnsPanel.visible=false;

        infoBox.text="Click open stage web view to begin";
    }

    function openSwv(event:MouseEvent):void {

        if(webView!=null){

            return;
        }

        webBtnsPanel.visible=true;

        infoBox.text="";

        webView=new StageWebView();

        webView.stage=this.stage;

        webView.viewPort=new Rectangle(0,swvY,stage.stageWidth,swvHeight);

        webView.addEventListener(ErrorEvent.ERROR,onError);

        webView.addEventListener(LocationChangeEvent.LOCATION_CHANGING,onChanging);

        webView.addEventListener(Event.COMPLETE,onComplete);

        webView.loadURL("http://www.math.uri.edu/~bkaskosz/webview/index.html");
    }

    function onError(e:ErrorEvent):void {

        infoBox.text="Page is not available. Try reloading.";

    }

    function onChanging(e:LocationChangeEvent):void {

        infoBox.text="Loading...";

    }

    function onComplete(e:Event):void {

        infoBox.text="";

    }

    function nextPage(e:MouseEvent):void {

        if(webView==null){

            return;
        }

        if(!webView.isHistoryForwardEnabled){

            return;
        }

        webView.historyForward();

    }

    function prevPage(e:MouseEvent):void {

        if(webView==null){

            return;
        }

        if(!webView.isHistoryBackEnabled){

            return;
        }

        webView.historyBack();

    }

    function reloadPage(e:MouseEvent):void {

        if(webView==null){

            return;
        }

        webView.reload();

    }

    function stopPage(e:MouseEvent):void {

        if(webView==null){

            return;
        }

        webView.stop();

    }

}
}
