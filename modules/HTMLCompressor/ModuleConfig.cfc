/**
********************************************************************************
Copyright 2009 ColdBox Framework by Luis Majano and Ortus Solutions, Corp
www.coldboxframework.com | www.luismajano.com | www.ortussolutions.com
********************************************************************************

Author 	 :	Luis Majano
Description :

Class that compresses given HTML source by removing comments, extra spaces and line breaks while preserving content within <pre>, <textarea>, <script> and <style> tags.

Blocks that should be additionally preserved could be marked with:
<!-- {{{ -->
    ...
<!-- }}} -->
or any number of user defined patterns.

Compressor Google Code: http://code.google.com/p/htmlcompressor/
Compressor API: http://htmlcompressor.googlecode.com/svn/trunk/doc/com/googlecode/htmlcompressor/compressor/HtmlCompressor.html

You can modify the module's settings so you can configure the HTML java compressor and YUI compressor.
You can also enable caching of the compressed content for added performance in your CacheBox provider of your choice:

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


**/
component {

	// Module Properties
	this.title 				= "HTMLCompressor";
	this.author 			= "Ortus Solutions, Corp";
	this.webURL 			= "http://www.ortussolutions.com";
	this.description 		= "An HTML Compressor for your layouts + views";
	this.version			= "1.1";
	// If true, looks for views in the parent first, if not found, then in the module. Else vice-versa
	this.viewParentLookup 	= true;
	// If true, looks for layouts in the parent first, if not found, then in module. Else vice-versa
	this.layoutParentLookup = true;
	// Module Entry Point
	this.entryPoint			= "HTMLCompressor";

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
			{pattern="/", handler="home",action="index"},
			// Convention Route
			{pattern="/:handler/:action?"}
		];

		// Interceptors
		interceptors = [
			{ class="#moduleMapping#.interceptors.Compressor", name="HTMLCompressor" }
		];

	}

	/**
	* Fired when the module is registered and activated.
	*/
	function onLoad(){
		// There are more settings you can set on the compressor manually.
		var compressor = controller.getPlugin(plugin="Compressor", module="HTMLCompressor").getCompressor();
		// You can set them below if you need to manually http://htmlcompressor.googlecode.com/svn/trunk/doc/com/googlecode/htmlcompressor/compressor/HtmlCompressor.html

		// ContentBox loading
		if( structKeyExists( controller.getSetting("modules"), "contentbox" ) ){
			// Let's add ourselves to the main menu in the Modules section
			var menuService = controller.getWireBox().getInstance("AdminMenuService@cb");
			// Add Menu Contribution
			menuService.addSubMenu(topMenu=menuService.MODULES,name="HTMLCompressor",label="HTML Compressor",href="#menuService.buildModuleLink('HTMLCompressor','home.settings')#");
			// Override settings?
			var settingService = controller.getWireBox().getInstance("SettingService@cb");
			var args = {name="cbox-htmlcompressor"};
			var setting = settingService.findWhere(criteria=args);
			if( !isNull(setting) ){
				// override settings from contentbox custom setting
				controller.getSetting("modules").HTMLCompressor.settings = deserializeJSON( setting.getvalue() );
			}
		}
	}

	/**
	* Fired when the module is activated by ContentBox Only
	*/
	function onActivate(){
		var settingService = controller.getWireBox().getInstance("SettingService@cb");
		// store default settings
		var args = {name="cbox-htmlcompressor", value=serializeJSON( settings )};
		var compressorSettings = settingService.new(properties=args);
		settingService.save( compressorSettings );
	}

	/**
	* Fired when the module is unregistered and unloaded
	*/
	function onUnload(){
		// ContentBox unloading
		if( structKeyExists( controller.getSetting("modules"), "contentbox" ) ){
			// Let's remove ourselves to the main menu in the Modules section
			var menuService = controller.getWireBox().getInstance("AdminMenuService@cb");
			// Remove Menu Contribution
			menuService.removeSubMenu(topMenu=menuService.MODULES,name="HTMLCompressor");
		}
	}

	/**
	* Fired when the module is deactivated by ContentBox Only
	*/
	function onDeactivate(){
		var settingService = controller.getWireBox().getInstance("SettingService@cb");
		var args = {name="cbox-htmlcompressor"};
		var setting = settingService.findWhere(criteria=args);
		if( !isNull(setting) ){
			settingService.delete( setting );
		}
	}
}