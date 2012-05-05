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

You can set automatically several setting by creating a 'htmlcompressor' setting structure in your parent application.
The available keys are found

compressor.setEnabled(true);                   //if false all compression is off (default is true)
compressor.setRemoveComments(true);            //if false keeps HTML comments (default is true)
compressor.setRemoveMultiSpaces(true);         //if false keeps multiple whitespace characters (default is true)
compressor.setRemoveIntertagSpaces(true);      //removes iter-tag whitespace characters
compressor.setRemoveQuotes(true);              //removes unnecessary tag attribute quotes
compressor.setSimpleDoctype(true);             //simplify existing doctype
compressor.setRemoveScriptAttributes(true);    //remove optional attributes from script tags
compressor.setRemoveStyleAttributes(true);     //remove optional attributes from style tags
compressor.setRemoveLinkAttributes(true);      //remove optional attributes from link tags
compressor.setRemoveFormAttributes(true);      //remove optional attributes from form tags
compressor.setRemoveInputAttributes(true);     //remove optional attributes from input tags
compressor.setSimpleBooleanAttributes(true);   //remove values from boolean tag attributes
compressor.setRemoveJavaScriptProtocol(true);  //remove "javascript:" from inline event handlers
compressor.setRemoveHttpProtocol(true);        //replace "http://" with "//" inside tag attributes
compressor.setRemoveHttpsProtocol(true);       //replace "https://" with "//" inside tag attributes
compressor.setPreserveLineBreaks(true);        //preserves original line breaks
compressor.setRemoveSurroundingSpaces("br,p"); //remove spaces around provided tags

----------------------------------------------------------------------->
<cfcomponent hint="This is a plugin that uses the HTML Compressor project to compress HTML"
			 extends="coldbox.system.Plugin"
			 output="false"
			 singleton>

	<!--- Compressor Settings --->
	<cfproperty name="settings" inject="coldbox:moduleSettings:HTMLCompressor">

<!------------------------------------------- CONSTRUCTOR ------------------------------------------->

	<cffunction name="init" access="public" returntype="Compressor" output="false" hint="Constructor.">
		<!--- ************************************************************* --->
		<cfargument name="controller" type="any" required="true" hint="coldbox.system.web.Controller">
		<!--- ************************************************************* --->
		<cfscript>
			var loader 		= "";
			var settings 	= {};

			super.init(arguments.controller);

			setpluginName("HTMLCompressor");
			setpluginVersion("1.0");
			setpluginDescription("This is a plugin that uses the HTML Compressor project to compress HTML");
			setpluginAuthor("Ortus Solutions, Corp");
			setpluginAuthorURL("http://www.ortussolutions.com");

			//load jars
			loader = getPlugin("JavaLoader");
			loader.appendPaths( getDirectoryFromPath( getMetaData(this).path ) & "lib");

			// get compressor instance
			compressor = loader.create("com.googlecode.htmlcompressor.compressor.HtmlCompressor");
			// Defaults
			compressor.setCompressCSS( javaCast("Boolean", true) );
			compressor.setCompressJavaScript( javaCast("Boolean", true) );

			// Configuration using settings
			if( settingExists("htmlcompressor") ){
				settings = getSetting("htmlcompressor");
				// settings
				if( structkeyExists(settings, "RemoveComments") ){ compressor.setRemoveComments( javaCast("boolean", settings.RemoveComments) );	}
				if( structkeyExists(settings, "RemoveMultiSpaces") ){ compressor.setRemoveMultiSpaces( javaCast("boolean", settings.RemoveMultiSpaces) ); }
				if( structkeyExists(settings, "RemoveIntertagSpaces") ){ compressor.setRemoveIntertagSpaces( javaCast("boolean", settings.RemoveIntertagSpaces) ); }
				if( structkeyExists(settings, "RemoveQuotes") ){ compressor.setRemoveQuotes( javaCast("boolean", settings.RemoveQuotes)); }
				if( structkeyExists(settings, "SimpleDoctype") ){ compressor.setSimpleDoctype( javaCast("boolean", settings.SimpleDoctype) ); }
				if( structkeyExists(settings, "RemoveScriptAttributes") ){ compressor.setRemoveScriptAttributes(javaCast("boolean", settings.RemoveScriptAttributes) ); }
				if( structkeyExists(settings, "RemoveStyleAttributes") ){ compressor.setRemoveStyleAttributes(javaCast("boolean", settings.RemoveStyleAttributes) ); }
				if( structkeyExists(settings, "RemoveLinkAttributes") ){ compressor.setRemoveLinkAttributes(javaCast("boolean", settings.RemoveLinkAttributes) ); }
				if( structkeyExists(settings, "RemoveFormAttributes") ){ compressor.setRemoveFormAttributes(javaCast("boolean", settings.RemoveFormAttributes) ); }
				if( structkeyExists(settings, "RemoveInputAttributes") ){ compressor.setRemoveInputAttributes(javaCast("boolean", settings.RemoveInputAttributes) ); }
				if( structkeyExists(settings, "SimpleBooleanAttributes") ){ compressor.setSimpleBooleanAttributes(javaCast("boolean", settings.SimpleBooleanAttributes) ); }
				if( structkeyExists(settings, "RemoveJavaScriptProtocol") ){ compressor.setRemoveJavaScriptProtocol(javaCast("boolean", settings.RemoveJavaScriptProtocol) ); }
				if( structkeyExists(settings, "RemoveHttpProtocol") ){ compressor.setRemoveHttpProtocol(javaCast("boolean", settings.RemoveHttpProtocol) ); }
				if( structkeyExists(settings, "PreserveLineBreaks") ){ compressor.setPreserveLineBreaks(javaCast("boolean", settings.PreserveLineBreaks) ); }
				if( structkeyExists(settings, "CompressCss") ){ compressor.setCompressCss(javaCast("boolean", settings.CompressCss) ); }
				if( structkeyExists(settings, "CompressJavaScript") ){ compressor.setCompressJavaScript(javaCast("boolean", settings.CompressJavaScript) ); }
				if( structkeyExists(settings, "RemoveHttpsProtocol") ){ compressor.setRemoveHttpsProtocol(javaCast("boolean", settings.RemoveHttpsProtocol) ); }
			}

			return this;
		</cfscript>
	</cffunction>

<!------------------------------------------- PUBLIC ------------------------------------------->

	<!--- Get --->
	<cffunction name="getCompressor" access="public" returntype="any" output="false" hint="Get the compressor java class: com.googlecode.htmlcompressor.compressor.HtmlCompressor">
    	<cfreturn compressor>
    </cffunction>

	<!--- compress --->
	<cffunction name="compress" output="false" access="public" returntype="string" hint="The main method that compresses given HTML source and returns compressed result">
		<cfargument name="html"  required="true" hint="The HTML Content to compress"/>
		<cfscript>
			return compressor.compress( arguments.html );
		</cfscript>
	</cffunction>

	<!--- compressXML --->
	<cffunction name="compressXML" output="false" access="public" returntype="string" hint="Compresses XML">
		<cfargument name="xmldata"  required="true" hint="The XML Content to compress"/>
		<cfscript>
			var xmlCompressor = loader.create("com.googlecode.htmlcompressor.compressor.XmlCompressor");
			return xmlCompressor.compress( arguments.xmldata );
		</cfscript>
	</cffunction>

<!------------------------------------------- PRIVATE ------------------------------------------>

</cfcomponent>