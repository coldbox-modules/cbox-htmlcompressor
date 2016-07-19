component extends="coldbox.system.Interceptor"{

	// DI
	property name="settings" 	inject="coldbox:configSettings";
	property name="compressor" 	inject="provider:Compressor@HTMLCompressor";

	/**
	* Compress layouts+views upon rendering.
	*/
	function preRender( event, interceptData ){
		// Only compress if enabled
		if( !settings.HTMLCompressor.renderCompressor ){
			return;
		}

		// Caching?
		if( settings.HTMLCompressor.renderCaching ){
			var cacheKey 		= settings.HTMLCompressor.renderCachePrefix & "#cgi.http_host#-#hash( arguments.interceptData.renderedContent )#";
			var cacheResults 	= cacheBox.getCache( settings.HTMLCompressor.renderCacheProvider ).get( cacheKey );
			if( !isNull( cacheResults ) ){
				// get cached results
				arguments.interceptData.renderedContent = cacheResults;
				return;
			}
		}

		// compress content
		arguments.interceptData.renderedContent = compressor.compress( arguments.interceptData.renderedContent );

		// caching enabled
		if( settings.HTMLCompressor.renderCaching ){
			cacheBox.getCache( settings.HTMLCompressor.renderCacheProvider )
				.set( 
					cacheKey, 
					arguments.interceptData.renderedContent, 
					settings.HTMLCompressor.renderCacheTimeout, 
					settings.HTMLCompressor.renderCacheLastAccessTimeout 
				);
		}
	}

}