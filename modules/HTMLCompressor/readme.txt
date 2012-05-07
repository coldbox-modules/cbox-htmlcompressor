<!-----------------------------------------------------------------------
********************************************************************************
Copyright 2009 ColdBox Framework by Luis Majano and Ortus Solutions, Corp
www.coldboxframework.com | www.luismajano.com | www.ortussolutions.com
********************************************************************************

Author 	 :	Luis Majano
Description :

This compressor can work with any ColdBox application or as a Module for ContentBox as well.
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


======================================================================
CHANGELOG
======================================================================

Version 1.0
# Initial Release