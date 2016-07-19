## Introduction

This compressor can work with any ColdBox application or as a Module for ContentBox as well.
Class that compresses given HTML source by removing comments, extra spaces and line breaks while preserving content within certain content tags.

Blocks that should be additionally preserved could be marked with:
```
<!-- {{{ -->
    ...
<!-- }}} -->
```
or any number of user defined patterns.

* Compressor Google Code: http://code.google.com/p/htmlcompressor/
* Compressor API: http://htmlcompressor.googlecode.com/svn/trunk/doc/com/googlecode/htmlcompressor/compressor/HtmlCompressor.html


## LICENSE
Apache License, Version 2.0.

## IMPORTANT LINKS
- https://github.com/coldbox-modules/cbox-htmlcompressor

## SYSTEM REQUIREMENTS
- Lucee 4.5+
- ContentBox 3+
- ColdBox 4+

## INSTRUCTIONS

Just drop into your modules folder or use [CommandBox](http://www.ortussolutions.com/products/commandbox) to install

`box install html-compressor`

### SETTINGS

You can modify the module's settings so you can configure the HTML java compressor and YUI compressor.
You can also enable caching of the compressed content for added performance in your CacheBox provider of your choice.  
Just add a `HTMLCompressor` in the `variables` scope in your ColdBox `config/Coldbox.cfc` configuration file.

```js
// Compressor Settings
HTMLCompressor = {
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
```

********************************************************************************
Copyright Since 2005 ColdBox Framework by Luis Majano and Ortus Solutions, Corp
www.ortussolutions.com
********************************************************************************
####HONOR GOES TO GOD ABOVE ALL
Because of His grace, this project exists. If you don't like this, then don't read it, its not for you.

>"Therefore being justified by faith, we have peace with God through our Lord Jesus Christ:
By whom also we have access by faith into this grace wherein we stand, and rejoice in hope of the glory of God.
And not only so, but we glory in tribulations also: knowing that tribulation worketh patience;
And patience, experience; and experience, hope:
And hope maketh not ashamed; because the love of God is shed abroad in our hearts by the 
Holy Ghost which is given unto us. ." Romans 5:5

###THE DAILY BREAD
 > "I am the way, and the truth, and the life; no one comes to the Father, but by me (JESUS)" Jn 14:1-12