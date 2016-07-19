<cfoutput>
	<div class="row">
    <div class="col-md-12">
        <h1 class="h1"><i class="fa fa-compress fa-lg"></i> HTML Compressor Tester</h1>
    </div>
</div>


<div class="row">
	<div class="col-md-9">

		<div class="panel panel-default">
		    <div class="panel-body">
				<p>
					Paste any HTML content below to compress it.
					<a href="#prc.xehCompressor#"><button class="btn btn-default btn-sm">Back To Settings</button></a>
				</p>

				#html.startForm( action=prc.xehManualCompressor, name="compressorForm" )#
					#html.textarea(
						name="htmldata",
						label="HTML Data:",
						wrapper="div",
						rows="20",
						cols="100",
						class="form-control",
						value=event.getValue( "htmldata", "" )
					)#
					<div class="actionBar center">
						#html.submitButton( value="Compress", class="btn btn-danger" )#
					</div>

					<cfif len( prc.htmlcompressed )>
						#html.textarea(
							name="compressed",
							label="HTML Compressed Data",
							wrapper="div",
							rows="20",
							cols="100",
							class="form-control",
							value=prc.htmlcompressed
						)#
					</cfif>
				#html.endForm()#
		    </div>
		</div>
	</div>

	<div class="col-md-3">
		<!--- Info Box --->
		<div class="panel panel-primary">
		    <div class="panel-heading">
		        <h3 class="panel-title"><i class="fa fa-medkit"></i> Need Help?</h3>
		    </div>
		    <div class="panel-body">
		    	#renderview(view="_tags/needhelp", module="contentbox-admin" )#
		    </div>
		</div>
	</div>

</div>
</cfoutput>