component{

	// DI
	property name="settingService" 	inject="settingService@cb";
	property name="cb" 				inject="cbHelper@cb";
	property name="compressor" 		inject="compressor@HTMLCompressor";

	function index( event,rc,prc ){
		event.paramValue( "htmldata", "" );

		prc.xehManualCompressor = cb.buildModuleLink( "HTMLCompressor", "home.index" );
		prc.xehCompressor 		= cb.buildModuleLink( "HTMLCompressor", "home.settings" );

		if( len( rc.htmldata ) ){
			prc.HTMLCompressed = compressor.compress( rc.htmldata );
		} else {
			prc.HTMLCompressed = "";
		}

		event.setView( "home/index" );
	}

	function settings( event,rc,prc ){
		// Exit handler
		prc.xehSave 					= cb.buildModuleLink( "HTMLCompressor", "home.saveSettings" );
		prc.xehManualCompressor 		= cb.buildModuleLink( "HTMLCompressor", "home.index" );
		prc.tabModules_HTMLCompressor 	= true;
		// compressor settings
		prc.settings 	= getSetting( "HTMLCompressor" );
		// caches
		prc.cacheNames 	= cachebox.getCacheNames();
		// view
		event.setView( "home/settings" );
	}

	function saveSettings( event,rc,prc ){
		// Get compressor settings
		prc.settings 	= getSetting( "HTMLCompressor" );

		// iterate over settings
		for( var key in prc.settings ){
			// save only sent in setting keys
			if( structKeyExists( rc, key ) ){
				prc.settings[ key ] = rc[ key ];
			}
		}

		// Save settings
		var oSetting = settingService.findWhere( criteria={ name="cbox-htmlcompressor" } );
		oSetting.setValue( serializeJSON( prc.settings ) );
		settingService.save( oSetting );

		// Messagebox
		getInstance( "MessageBox@cbMessageBox" ).info( "Settings Saved & Updated!" );
		// Relocate via CB Helper
		cb.setNextModuleEvent( "HTMLCompressor", "home.settings" );
	}

}