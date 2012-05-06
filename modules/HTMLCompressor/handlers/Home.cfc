component{

	// DI
	property name="settingService" inject="settingService@cb";
	property name="cb" inject="cbHelper@cb";

	function index(event,rc,prc){
		event.paramValue("htmldata","");
		event.paramvalue("htmlcompressed","");
		prc.xehManualCompressor = cb.buildModuleLink("HTMLCompressor","home.index");
		prc.xehCompressor = cb.buildModuleLink("HTMLCompressor","home.settings");
		if( len( rc.htmldata ) ){
			rc.htmlcompressed = getMyPlugin(plugin="Compressor", module="HTMLCompressor").compress( rc.htmldata );
		}

		event.setView("home/index");
	}

	function settings(event,rc,prc){
		// Exit handler
		prc.xehSave = cb.buildModuleLink("HTMLCompressor","home.saveSettings");
		prc.xehManualCompressor = cb.buildModuleLink("HTMLCompressor","home.index");
		prc.tabModules_HTMLCompressor = true;
		// compressor settings
		prc.settings = getModuleSettings("HTMLCompressor").settings;
		// caches
		prc.cacheNames = cachebox.getCacheNames();
		// view
		event.setView("home/settings");
	}

	function saveSettings(event,rc,prc){
		// Get compressor settings
		prc.settings = getModuleSettings("HTMLCompressor").settings;

		// iterate over settings
		for(var key in prc.settings){
			// save only sent in setting keys
			if( structKeyExists(rc, key) ){
				prc.settings[ key ] = rc[ key ];
			}
		}

		// Save settings
		var args = {name="cbox-htmlcompressor"};
		var setting = settingService.findWhere(criteria=args);
		setting.setValue( serializeJSON( prc.settings ) );
		settingService.save( setting );

		// Messagebox
		getPlugin("MessageBox").info("Settings Saved & Updated!");
		// Relocate via CB Helper
		cb.setNextModuleEvent("htmlcompressor","home.settings");
	}

}