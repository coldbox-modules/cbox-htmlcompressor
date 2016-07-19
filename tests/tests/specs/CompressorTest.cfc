component extends="coldbox.system.testing.BaseTestCase" appMapping="/root"{

	function beforeAll(){
		reset();
	}

	function run( testResults, testBox ){
		
		// all your suites go here.
		describe( "My First Suite", function(){
			
			beforeEach(function( currentSpec ){
				setup();
			});
			
			it( "can compress HTML", function(){
				var testHTML = fileRead(  expandPath( "/tests/resources/test.html" ) );
				var compressed = getModel( "Compressor@HTMLCompressor" ).compress( testhtml );

				expect(	testHTML ).notToBe( compressed );
				expect(	len( compressed ) ).toBeLT( len( testHTML ) );
			});

		});
	}

}