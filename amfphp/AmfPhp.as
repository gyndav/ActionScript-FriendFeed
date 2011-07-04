package amfphp {
	
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.net.NetConnection;
	import flash.net.Responder;
	
	public class AmfPhp extends EventDispatcher
	{
		private var amf:NetConnection = new NetConnection();
		private var gateway_url:String = 'http://localhost/WheesperBadge/amfphp/gateway.php';
		
		public var result:*;
		public var pdata:*;

		public function AmfPhp(service:String,nickname:String=null,num:String=null)
		{
			var amf_responder:Responder	= new Responder(amfResult,amfFault);
			
			amf.connect(gateway_url);				
			amf.call(service,amf_responder,nickname,num);			
		}
		
		
		public function amfResult(amf_result:*):void
		{
			amf.close();
			result	=	amf_result;
			
			dispatchEvent(new Event('AMF_RESULT'));
		}
		
		
		private function amfFault(fault:Object):void
		{
			amf.close();
			for	(var faultItem:String in fault)
			{
				trace( faultItem+" = "+fault[faultItem] );
			}
		}
		
	}
}