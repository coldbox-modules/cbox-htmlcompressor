/**
********************************************************************************
Copyright 2009 ColdBox Framework by Luis Majano and Ortus Solutions, Corp
www.coldboxframework.com | www.luismajano.com | www.ortussolutions.com
********************************************************************************

Author 	 :	Luis Majano
Description :
*/
component extends="coldbox.system.Interceptor"{

	// DI
	property name="settings" 	inject="coldbox:modulesettings:HTMLCompressor";
	property name="compressor" 	inject="coldbox:myplugin:Compressor@HTMLCompressor";

	/**
	* Compress layouts+views upon rendering.
	*/
	function preRender(event,interceptData){
		var cacheResults 	= "";
		var cacheKey 		= "";

		// Only compress if enabled
		if( settings.renderCompressor ){
			// Caching?
			if( settings.renderCaching ){
				cacheKey 		= settings.renderCachePrefix & "-#hash( arguments.interceptData.renderedContent )#";
				cacheResults 	= cacheBox.getCache( settings.renderCacheProvider ).get( cacheKey );
				if( !isNull("cacheResults") ){ arguments.interceptData.renderedContent = cacheResults; return; }
			}

			// compress content
			arguments.interceptData.renderedContent = compressor.compress( arguments.interceptData.renderedContent );

			// caching enabled
			if( settings.renderCaching ){
				cacheBox.getCache( settings.renderCacheProvider )
					.set( cacheKey, arguments.interceptData.renderedContent, settings.renderCacheTimeout, settings.renderCacheLastAccessTimeout );
			}
		}
	}

}