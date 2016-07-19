/**
* Copyright 2009 Ortus Solutions, Corp
* 
* Blocks that should be additionally preserved could be marked with:
* <!-- {{{ -->
*     ...
* <!-- }}} -->
* or any number of user defined patterns.
* 
* Compressor Google Code: http://code.google.com/p/htmlcompressor/
* Compressor API: http://htmlcompressor.googlecode.com/svn/trunk/doc/com/googlecode/htmlcompressor/compressor/HtmlCompressor.html
* 
* You can set automatically several setting by creating a 'htmlcompressor' setting structure in your parent application.
* The available keys are found
* 
* compressor.setEnabled(true);                   //if false all compression is off (default is true)
* compressor.setRemoveComments(true);            //if false keeps HTML comments (default is true)
* compressor.setRemoveMultiSpaces(true);         //if false keeps multiple whitespace characters (default is true)
* compressor.setRemoveIntertagSpaces(true);      //removes iter-tag whitespace characters
* compressor.setRemoveQuotes(true);              //removes unnecessary tag attribute quotes
* compressor.setSimpleDoctype(true);             //simplify existing doctype
* compressor.setRemoveScriptAttributes(true);    //remove optional attributes from script tags
* compressor.setRemoveStyleAttributes(true);     //remove optional attributes from style tags
* compressor.setRemoveLinkAttributes(true);      //remove optional attributes from link tags
* compressor.setRemoveFormAttributes(true);      //remove optional attributes from form tags
* compressor.setRemoveInputAttributes(true);     //remove optional attributes from input tags
* compressor.setSimpleBooleanAttributes(true);   //remove values from boolean tag attributes
* compressor.setRemoveJavaScriptProtocol(true);  //remove "javascript:" from inline event handlers
* compressor.setRemoveHttpProtocol(true);        //replace "http://" with "//" inside tag attributes
* compressor.setRemoveHttpsProtocol(true);       //replace "https://" with "//" inside tag attributes
* compressor.setPreserveLineBreaks(true);        //preserves original line breaks
* compressor.setRemoveSurroundingSpaces("br,p"); //remove spaces around provided tags
* 
**/
component accessors="true" singleton threadsafe{

	// Compressor Settings
	property name="settings" 		inject="coldbox:setting:HTMLCompressor";
	// JavaLoader
	property name="javaLoader"		inject="loader@cbjavaloader";
	// Compressor
	property name="compressor";

	/**
	* Constructor
	*/
	function init(){
		return this;
	}

	/**
	* Constructor 
	*/
	function onDIComplete(){
		// get compressor instance
		compressor = javaLoader.create( "com.googlecode.htmlcompressor.compressor.HtmlCompressor" );
		// Defaults
		compressor.setCompressCSS( javaCast( "Boolean", true ) );
		compressor.setCompressJavaScript( javaCast( "Boolean", true ) );

		// settings
		if( structkeyExists( variables.settings, "RemoveComments") ){
			compressor.setRemoveComments( javaCast("boolean", settings.RemoveComments) );	
		}
		if( structkeyExists( variables.settings, "RemoveMultiSpaces") ){
			compressor.setRemoveMultiSpaces( javaCast("boolean", settings.RemoveMultiSpaces) ); 
		}
		if( structkeyExists( variables.settings, "RemoveIntertagSpaces") ){
			compressor.setRemoveIntertagSpaces( javaCast("boolean", settings.RemoveIntertagSpaces) ); 
		}
		if( structkeyExists( variables.settings, "RemoveQuotes") ){
			compressor.setRemoveQuotes( javaCast("boolean", settings.RemoveQuotes)); 
		}
		if( structkeyExists( variables.settings, "SimpleDoctype") ){
			compressor.setSimpleDoctype( javaCast("boolean", settings.SimpleDoctype) ); 
		}
		if( structkeyExists( variables.settings, "RemoveScriptAttributes") ){
			compressor.setRemoveScriptAttributes( javaCast( "boolean", settings.RemoveScriptAttributes ) ); 
		}
		if( structkeyExists( variables.settings, "RemoveStyleAttributes") ){
			compressor.setRemoveStyleAttributes( javaCast( "boolean", settings.RemoveStyleAttributes ) ); 
		}
		if( structkeyExists( variables.settings, "RemoveLinkAttributes") ){
			compressor.setRemoveLinkAttributes( javaCast( "boolean", settings.RemoveLinkAttributes ) ); 
		}
		if( structkeyExists( variables.settings, "RemoveFormAttributes") ){
			compressor.setRemoveFormAttributes( javaCast( "boolean", settings.RemoveFormAttributes ) ); 
		}
		if( structkeyExists( variables.settings, "RemoveInputAttributes") ){
			compressor.setRemoveInputAttributes( javaCast( "boolean", settings.RemoveInputAttributes ) ); 
		}
		if( structkeyExists( variables.settings, "SimpleBooleanAttributes") ){
			compressor.setSimpleBooleanAttributes( javaCast( "boolean", settings.SimpleBooleanAttributes ) ); 
		}
		if( structkeyExists( variables.settings, "RemoveJavaScriptProtocol") ){
			compressor.setRemoveJavaScriptProtocol( javaCast( "boolean", settings.RemoveJavaScriptProtocol ) ); 
		}
		if( structkeyExists( variables.settings, "RemoveHttpProtocol") ){
			compressor.setRemoveHttpProtocol( javaCast( "boolean", settings.RemoveHttpProtocol ) ); 
		}
		if( structkeyExists( variables.settings, "PreserveLineBreaks") ){
			compressor.setPreserveLineBreaks( javaCast( "boolean", settings.PreserveLineBreaks ) ); 
		}
		if( structkeyExists( variables.settings, "CompressCss") ){
			compressor.setCompressCss( javaCast( "boolean", settings.CompressCss ) ); 
		}
		if( structkeyExists( variables.settings, "CompressJavaScript") ){
			compressor.setCompressJavaScript( javaCast( "boolean", settings.CompressJavaScript ) ); 
		}
		if( structkeyExists( variables.settings, "RemoveHttpsProtocol") ){
			compressor.setRemoveHttpsProtocol( javaCast( "boolean", settings.RemoveHttpsProtocol ) ); 
		}

		return this;
	}

	/**
	* The main method that compresses given HTML source and returns compressed result
	*/
	function compress( required html ){
		return compressor.compress( arguments.html );
	}

	/**
	* Compress XML
	*/
	function compressXML( required xmldata ){
		var xmlCompressor = javaLoader.create( "com.googlecode.htmlcompressor.compressor.XmlCompressor" );
		return xmlCompressor.compress( arguments.xmldata );
	}

}