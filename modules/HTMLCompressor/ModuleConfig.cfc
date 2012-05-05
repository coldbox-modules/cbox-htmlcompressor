<!-----------------------------------------------------------------------
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


--->
<cfcomponent output="false" hint="My Module Configuration">
<cfscript>
	// Module Properties
	this.title 				= "HTMLCompressor";
	this.author 			= "Ortus Solutions, Corp";
	this.webURL 			= "http://www.ortussolutions.com";
	this.description 		= "An HTML Compressor";
	this.version			= "1.0";
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

	}

	/**
	* Compress layouts+views upon rendering.
	*/
	function preRender(event,interceptData){
		var settings 		= controller.getSetting("modules").HTMLCompressor.settings;
		var cacheResults 	= "";
		var cacheKey 		= "";

		// Only compress if enabled
		if( settings.renderCompressor ){
			// Caching?
			if( settings.renderCaching ){
				cacheKey 		= settings.renderCachePrefix & "-#hash( arguments.interceptData.renderedContent )#";
				cacheResults 	= controller.getCacheBox().getCache( settings.renderCacheProvider ).get( cacheKey );
				if( isDefined("cacheResults") ){ arguments.interceptData.renderedContent = cacheResults; return; }
			}

			// compress content
			controller.getPlugin(plugin="Compressor", module="HTMLCompressor")
				.compress( arguments.interceptData.renderedContent );

			// caching enabled
			if( settings.renderCaching ){
				controller.getCacheBox().getCache( settings.renderCacheProvider )
					.set( cacheKey, arguments.interceptData.renderedContent, settings.renderCacheTimeout, settings.renderCacheLastAccessTimeout );
			}
		}
	}

	/**
	* Fired when the module is registered and activated.
	*/
	function onLoad(){
		// There are more settings you can set on the compressor manually.
		var compressor = controller.getPlugin(plugin="Compressor", module="HTMLCompressor").getCompressor();
		// You can set them below if you need to manually http://htmlcompressor.googlecode.com/svn/trunk/doc/com/googlecode/htmlcompressor/compressor/HtmlCompressor.html
	}

	/**
	* Fired when the module is unregistered and unloaded
	*/
	function onUnload(){

	}

</cfscript>
</cfcomponent>