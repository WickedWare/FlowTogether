﻿package com.kpm.ui{import com.as3collections.ArrayQueue;import com.kpm.util.Util;import com.kpm.kpm.DriverData;import fl.controls.ComboBox;		import flash.display.DisplayObject;	import flash.display.MovieClip;	import flash.display.SimpleButton;import flash.display.Stage;import flash.events.Event;	import flash.events.MouseEvent;	import flash.geom.Point;import flash.media.StageWebView;import flash.media.StageWebView;import flash.text.TextField;	import flash.text.TextFormat;	import flash.utils.clearTimeout;	import flash.utils.getDefinitionByName;	import flash.utils.setTimeout;			public class UIGod extends MovieClip	{		public static var MAX_NUM_PAGES 	: int = 20;				public static var debug_Tf 			: TextField ;		public static var feedback_Tf 		: TextField ;				public static var FUNCTION			: String = "MethodClosure";		public static var STRING			: String = "String";				public var back_Bt 				        : SimpleButton;        public static var webviews      : ArrayQueue = new ArrayQueue();						public var pages 				: Array = new Array(UIGod.MAX_NUM_PAGES);		protected var pagesStack		: Array = new Array();		protected var currentPage 		: String;				public var defaultPagePos		: Point;		public var main_mc 				: MovieClip;		public var debugOn 				: Boolean;						public static var feedbackTimeout : uint ;				public function UIGod() {}	       	       	//TODO : Add capability for transition       	//TODO : add capability to wait for UIPage to be loaded       	//fire event loading finished. boolean default to false						////////////////COMPONENT MANAGEMENT/////////////////////				public function initialize(pWindow_mc : MovieClip,  pDefaultPos : Point, pDebugOn : Boolean = false)		{			defaultPagePos = pDefaultPos;			main_mc = pWindow_mc;						feedback_Tf = main_mc.tFeedback_Tf;			debug_Tf = main_mc.tDebug_Tf;			debugOn = pDebugOn;		}				function setUIBt(pBack_Bt : SimpleButton = null, pFeedback_Tf : TextField = null, pDebug_Tf : TextField = null)		{			back_Bt = pBack_Bt ;			feedback_Tf = pFeedback_Tf ;			debug_Tf = pDebug_Tf ;						if(!debugOn)				debug_Tf.visible = false;							trace("UIGod.setUIBt " + pBack_Bt + " " + pFeedback_Tf + " " + pDebug_Tf);					}				public function addPage(pPage : UIPage)		{			//abort if maximum number of pages is exceeded			if(pages.length > UIGod.MAX_NUM_PAGES)				throw new Error("exceded max number of windows in GuiNavigation")							if(!pages[pPage.nameId])			{				pages[pPage.nameId] = pPage;				UIGod.debug("UIManager.addPage : " + pPage.nameId );			}			else			{				UIGod.debug("UIManager.addPage : name already exists");			}						//set default position for page if the position is not set,			if(pPage.posPercent.x == 0 && pPage.posPercent.y == 0) {				pPage.posPercent.x = defaultPagePos.x;  pPage.posPercent.y = defaultPagePos.y;				}						pPage.container = this;								}		public function activatePage(pPage : String, e : Event = null)		{						//TODO if page is a popup page, define it in PopUpPage...			//TODO ? if(hideAll)					UIGod.debug("UIManager.activating " + pages[pPage]);			CurrentPage = pPage;											}				public function setCurrentPageHelper(e : Event, pPage : String)		{			CurrentPage = pPage;		}				public function set CurrentPage(pPage : String)		{				if(currentPage == pPage)			{				Util.debug("pages are the same");				return;			}							//previousPage = currentPage;			//currentPage = pPage;			currentPage = pPage;						if(pagesStack[pagesStack.length-1] != currentPage)				pagesStack.push(currentPage);						UIGod.debug("setting current page " + currentPage );						hideAllPages();							if(pages[currentPage])				pages[currentPage].showPage()							dispatchActivatePage(currentPage);					}				public function goBack(e :Event)		{            var webview : StageWebView = webviews.dequeue() as StageWebView;            if(webview) webview.stage = null;			else if(pagesStack.length > 1)			{				pagesStack.pop();				CurrentPage = pagesStack[pagesStack.length-1];				Util.printArray(pagesStack);			}					}				public function get CurrentPage() : String{			return currentPage;		}				public function dispatchActivatePage(pPageName : String)		{			this.dispatchEvent(new Event(UIConst.ActivatePageEvent + pPageName, false, true));		}				//TODO needed ?		public function hideUI(pHideWindow : Boolean = true)		{			hideAllPages(true);					}				public function showUI()		{			main_mc.visible = true;			pages[currentPage].showPage();		}		public function hideAllPages(hideWindow : Boolean = false)		{			if(hideWindow)			{				main_mc.visible = false;			}						for each (var p : MovieClip in pages)			{				p.Visible = false;			}		}				public function isHidden() : Boolean		{			return !main_mc.visible;		}			public static function debug(pStr : String)		{			debug_Tf.appendText(pStr +"\n");			Util.debug(pStr);		}				public static function feedback(pStr : String = "")		{			Util.debug("UIGod.feedback " + pStr);			feedback_Tf.text = pStr;						if(pStr!= "")				feedback_Tf.visible = true;			else				feedback_Tf.visible = false;		}								//////////////EVENT MANAGEMENT////////////				//TODO : handle popuppages here ??				//check if a button has been clicked, gets the name which is the 		//identifier of the function to be called		public function linkBt(pPage_name : String, pBt_name : String, pObject : Object)		{			var type : String = Util.getClassName(pObject);						debug("linking button " +  pBt_name + " in page " + pPage_name + " to object " + pObject + " of class " + type);						if(type == UIGod.FUNCTION && pages[pPage_name].components[pBt_name])				pages[pPage_name].components[pBt_name].addEventListener(MouseEvent.CLICK, pObject);			else if(type == UIGod.STRING && pages[pObject])				pages[pPage_name].components[pBt_name].addEventListener(MouseEvent.CLICK, function(){setCurrentPageHelper(null, pObject as String);});			else				debug("linking didnt work");			}					public function linkEvent(pPage_name : String, pEvent : Event, pFunction : Function)		{			debug("linking event " +  pEvent.type + " in page " + pPage_name + " to function " + pFunction);						if(pages[pPage_name])				pages[pPage_name].addEventListener(pEvent, pFunction);			else				debug("linking function to smth that is not a button");		}							 		 public static function setDropdownStyle(cb : ComboBox, pTf : TextFormat, pWidth : int, pHeight : int, pEmbedFonts : Boolean = true)		 {		 	cb.textField.setStyle("textFormat", pTf);			cb.textField.setStyle("embedFonts", pEmbedFonts);			cb.dropdown.setRendererStyle("textFormat", pTf);			cb.dropdown.setRendererStyle("embedFonts", pEmbedFonts);			cb.textField.textField.embedFonts = pEmbedFonts;			cb.setStyle("textFormat", pTf);			cb.setStyle("embedFonts", pEmbedFonts);						cb.setSize(pWidth, pHeight);			cb.dropdownWidth = pWidth;		 			 }									}}