package com.kpm.util{	import flash.events.Event;		/**	 * @author Matt Przybylski [http://www.reintroducing.com]	 * @version 1.0	 */	public class MouseIdleMonitorEvent extends Event	{//- PRIVATE & PROTECTED VARIABLES -------------------------------------------------------------------------				//- PUBLIC & INTERNAL VARIABLES ---------------------------------------------------------------------------				// event constants		public static const MOUSE_IDLE:String = "mouseIdle";		public static const MOUSE_ACTIVE:String = "mouseActive";				public var params:Object;		//- CONSTRUCTOR	-------------------------------------------------------------------------------------------			public function MouseIdleMonitorEvent($type:String, $params:Object, $bubbles:Boolean = false, $cancelable:Boolean = false)		{			super($type, $bubbles, $cancelable);						this.params = $params;		}		//- PRIVATE & PROTECTED METHODS ---------------------------------------------------------------------------						//- PUBLIC & INTERNAL METHODS -----------------------------------------------------------------------------				//- EVENT HANDLERS ----------------------------------------------------------------------------------------				//- GETTERS & SETTERS -------------------------------------------------------------------------------------				//- HELPERS -----------------------------------------------------------------------------------------------			public override function clone():Event		{			return new MouseIdleMonitorEvent(type, this.params, bubbles, cancelable);		}				public override function toString():String		{			return formatToString("MouseIdleMonitorEvent", "params", "type", "bubbles", "cancelable");		}	//- END CLASS ---------------------------------------------------------------------------------------------	}}