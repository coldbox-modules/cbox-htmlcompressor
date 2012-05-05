<!-----------------------------------------------------------------------
********************************************************************************
Copyright 2009 ColdBox Framework by Luis Majano and Ortus Solutions, Corp
www.coldboxframework.com | www.luismajano.com | www.ortussolutions.com
********************************************************************************
----------------------------------------------------------------------->
<cfcomponent extends="coldbox.system.testing.BasePluginTest" plugin="codedepot.cbox-htmlcompressor.modules.HTMLCompressor.plugins.Compressor">
<cfscript>

	function setup(){
		super.setup();

		mockSettings = {
			compresscss = true,
			compressJavascript = true
		};
		mockController.$("getAppHash", hash( getMetadata(this).path ) );
		javaLoader = getMockBox().createMock("coldbox.system.plugins.JavaLoader")
			.$("settingExists").$args("javaloader_libpath").$results(false)
			.init( mockController );
		plugin.$("getPlugin").$args("JavaLoader").$results( javaLoader )
			.$("settingExists").$args("htmlcompressor").$results( true )
			.$("getSetting").$args("htmlcompressor").$results( mockSettings );
		plugin.init( mockController );
	}

	function testCompress(){
		var testhtml = fileRead( getDirectoryFromPath( getMetadata(this).path ) & "resources/test.html" );
		compressed = plugin.compress( testhtml );
		assertNotEquals( compressed, testhtml);
		assertTrue( len(compressed) lte len(testhtml)  );
	}

</cfscript>
</cfcomponent>