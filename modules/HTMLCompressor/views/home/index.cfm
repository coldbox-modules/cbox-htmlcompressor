<cfoutput>
<!--============================Sidebar============================-->
<div class="sidebar">

	<!--- Info Box --->
	<div class="small_box expose">
		<div class="header">
			<img src="#prc.cbroot#/includes/images/info.png" alt="info" width="24" height="24" />Need Help?
		</div>
		<div class="body">
			<a href="http://www.ortussolutions.com" target="_blank" title="The Gurus behind ColdBox and ContentBox">
			<div class="center"><img src="#prc.cbroot#/includes/images/ortus-top-logo.png" alt="Ortus Solutions" border="0" /></a><br/></div>

			<p><strong>Ortus Solutions</strong> is the company behind anything ColdBox and ContentBox. Need professional support, architecture analysis,
			code reviews, custom development or anything ColdFusion, ColdBox, ContentBox related?
			<a href="mailto:help@ortussolutions.com">Contact us</a>, we are here
			to help!</p>

			<p>
				<h2>Resource Links</h2>
				<ul>
					<li>
						<a href="http://code.google.com/p/htmlcompressor/" target="_blank">HTML Compressor Google Code</a>
					</li>
					<li>
						<a href="http://htmlcompressor.googlecode.com/svn/trunk/doc/com/googlecode/htmlcompressor/compressor/HtmlCompressor.html" target="_blank">HTML Compressor Java Docs</a>
					</li>
				</ul>
			</p>
		</div>
	</div>

</div>
<!--End sidebar-->
<!--============================Main Column============================-->
<div class="main_column">
	<div class="box">
		<!--- Body Header --->
		<div class="header">
			HTML Compressor Tester
		</div>
		<!--- Body --->
		<div class="body" id="mainBody">
			<p>
				Paste any HTML content below to compress it.
				<a href="#prc.xehCompressor#"><button class="button2">Back To Settings</button></a>
			</p>

			#html.startForm(action=prc.xehManualCompressor,name="compressorForm")#
				#html.textarea(name="htmldata",label="HTML Data:",wrapper="div",rows="20",cols="100",value=event.getValue("htmldata",""))#
				<div class="actionBar center">
					#html.submitButton(value="Compress",class="buttonred")#
				</div>

				<cfif len( rc.htmlcompressed )>
					#html.textarea(name="compressed",label="HTML Compressed Data",wrapper="div",rows="20",cols="100",value=rc.htmlcompressed)#
				</cfif>
			#html.endForm()#

		</div>
	</div>
</div>
</cfoutput>