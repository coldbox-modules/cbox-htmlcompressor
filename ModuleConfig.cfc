component {

	// Module Properties
	this.title 				= "HTMLCompressor";
	this.author 			= "Ortus Solutions, Corp";
	this.webURL 			= "http://www.ortussolutions.com";
	this.description 		= "An HTML Compressor for your layouts + views";
	this.version			= "2.0.0";
	// If true, looks for views in the parent first, if not found, then in the module. Else vice-versa
	this.viewParentLookup 	= true;
	// If true, looks for layouts in the parent first, if not found, then in module. Else vice-versa
	this.layoutParentLookup = true;
	this.modelNamespace 	= "HTMLCompressor";
	this.entryPoint			= "HTMLCompressor";
	this.alias 				= "HTMLCompressor";
	this.dependencies 		= [ "cbjavaloader" ];

	function configure(){

		// Compressor Settings
		settings = {
			// Compress on preRender before ColdBox outputs
			renderCompressor = true,
			// Enable caching of the unique content instead of compressing on demand, done via content hashes
			renderCaching = true,
			// The CacheBox provider to store the compressed content
			renderCacheProvider = "template",
			// The default timeout of the cached templates
			renderCacheTimeout = 60,
			// The idle timeout of the cached templates
			renderCacheLastAccessTimeout = 15,
			// The rendering cache key prefix
			renderCachePrefix = "cbox-compressor",
			// Java Compressor settings
			RemoveComments = true,
			RemoveMultiSpaces = true,
			RemoveIntertagSpaces = false,
			RemoveQuotes = false,
			CompressCss = true,
			CompressJavaScript = true,
			SimpleDocType = false,
			RemoveScriptAttributes = false,
			RemoveStyleAttributes = false,
			RemoveLinkAttributes = false,
			RemoveFormAttributes = false,
			RemoveInputAttributes = false,
			SimpleBooleanAttributes = false,
			RemoveJavaScriptProtocol = false,
			RemoveHttpProtocol = false,
			RemoveHttpsProtocol = false,
			PreserveLineBreaks = false
		};

		// SES Routes
		routes = [
			// Module Entry Point
			{ pattern="/", handler="home", action="index" },
			// Convention Route
			{ pattern="/:handler/:action?" }
		];

		// Interceptors
		interceptors = [
			{ class="#moduleMapping#.interceptors.Compressor", name="Compressor@HTMLCompressor" }
		];

	}

	/**
	* Fired when the module is registered and activated.
	*/
	function onLoad(){
		var settings = controller.getConfigSettings();
		// parse parent settings
		parseParentSettings();

		// Class load jars
		wirebox.getInstance( "loader@cbjavaloader" ).appendPaths( modulePath & "/models/lib" );

		// ContentBox loading
		if( structKeyExists( controller.getSetting( "modules" ), "contentbox" ) ){
			// Let's add ourselves to the main menu in the Modules section
			var menuService = wirebox.getInstance( "AdminMenuService@cb" );
			// Add Menu Contribution
			menuService.addSubMenu(
				topMenu = menuService.MODULES,
				name 	= "HTMLCompressor",
				label 	= "HTML Compressor",
				href 	= "#menuService.buildModuleLink( 'HTMLCompressor','home.settings' )#"
			);
			// Override settings?
			var settingService = wirebox.getInstance( "SettingService@cb" );
			var oSetting = settingService.findWhere( criteria={ name="cbox-htmlcompressor" } );
			if( !isNull( oSetting ) ){
				// override settings from contentbox custom setting
				controller.getConfigSettings().HTMLCompressor = deserializeJSON( oSetting.getvalue() );
			}
		}
	}

	/**
	* Fired when the module is activated by ContentBox Only
	*/
	function onActivate(){
		var settingService = wirebox.getInstance( "SettingService@cb" );
		// store default settings
		var compressorSettings = settingService.new( properties={ name="cbox-htmlcompressor", value=serializeJSON( variables.settings ) } );
		settingService.save( compressorSettings );
	}

	/**
	* Fired when the module is unregistered and unloaded
	*/
	function onUnload(){
		// ContentBox unloading
		if( structKeyExists( controller.getSetting( "modules" ), "contentbox" ) ){
			// Let's remove ourselves to the main menu in the Modules section
			var menuService = wirebox.getInstance( "AdminMenuService@cb" );
			// Remove Menu Contribution
			menuService.removeSubMenu( topMenu=menuService.MODULES, name="HTMLCompressor" );
		}
	}

	/**
	* Fired when the module is deactivated by ContentBox Only
	*/
	function onDeactivate(){
		var settingService = wirebox.getInstance( "SettingService@cb" );
		var oSetting = settingService.findWhere( criteria={ name="cbox-htmlcompressor" } );
		if( !isNull( oSetting ) ){
			settingService.delete( oSetting );
		}
	}

	/**
	* parse parent settings
	*/
	private function parseParentSettings(){
		var oConfig 			= controller.getSetting( "ColdBoxConfig" );
		var configStruct 		= controller.getConfigSettings();
		var HTMLCompressorDSL 	= oConfig.getPropertyMixin( "HTMLCompressor", "variables", structnew() );

		// Defaults		
		if( !structKeyExists( configStruct, "HTMLCompressor" ) ){ configStruct.HTMLCompressor = {}; }
		structAppend( configStruct.HTMLCompressor, variables.settings );

		// incorporate custom settings
		structAppend( configStruct.HTMLCompressor, HTMLCompressorDSL, true );

	}
}