<cfoutput>
	#html.startForm(action="htmlcompressor.home")#
		<h1>Compress HTML</h1>
		#html.textarea(name="htmldata",label="HTML Data:",wrapper="div",rows="20",cols="100",value=event.getValue("htmldata",""))#
		#html.submitButton(value="Compress!")#
	#html.endForm()#

	<cfif len( rc.htmlcompressed )>
		<hr/>
		#html.textarea(name="compressed",label="HTML Compressed Data",wrapper="div",rows="20",cols="100",value=rc.htmlcompressed)#
	</cfif>
</cfoutput>