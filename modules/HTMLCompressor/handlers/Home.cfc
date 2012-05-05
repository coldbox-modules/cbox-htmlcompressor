<cfcomponent output="false" hint="A normal ColdBox event handler">
<cfscript>

	function index(event,rc,prc){
		event.paramValue("htmldata","");
		event.paramvalue("htmlcompressed","");

		if( len( rc.htmldata ) ){
			rc.htmlcompressed = getMyPlugin(plugin="Compressor", module="HTMLCompressor").compress( rc.htmldata );
		}

		event.setView("home/index");
	}

</cfscript>
</cfcomponent>