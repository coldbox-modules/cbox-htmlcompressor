<cfoutput>
	<div class="row">
    <div class="col-md-12">
        <h1 class="h1"><i class="fa fa-compress fa-lg"></i> HTML Compressor Settings</h1>
    </div>
</div>

<div class="row">
	<div class="col-md-9">

		<div class="panel panel-default">
		    <div class="panel-body">

		    	#getInstance( "MessageBox@cbMessagebox" ).renderit()#
				
				<p>
					Below you can modify the settings used by the HTML Compressor
					<a href="#prc.xehManualCompressor#"><button class="btn btn-default btn-sm">Open Manual Compressor</button></a>
				</p>

				#html.startForm( action="cbadmin.module.HTMLCompressor.home.saveSettings", name="settingsForm" )#

				<div>
					<!--- Navigation Bar --->
					<ul class="nav nav-tabs" role="tablist">
						<li role="presentation" class="active">
							<a href="##general_options" aria-controls="general_options" role="tab" data-toggle="tab">
								Compressor Tuning
							</a>
						</li>
						<li role="presentation">
							<a href="##caching" aria-controls="caching" role="tab" data-toggle="tab">
								Compressor Caching
							</a>
						</li>
					</ul>

					<div class="tab-content margin10">

						<!--- Compressor Settings --->
						<div id="general_options" role="tabpanel" class="tab-pane active">
						<fieldset>
							<p>From here you can tune the HTML Compression Engine.</p>

							<!--- Activate --->
							#html.label(field="renderCompressor",content="Activate HTML Compression:")#
							<small>Turn on/off the HTML compression for layouts+views</small><br/>
							<div class="checkbox">
							#html.radioButton(name="renderCompressor",checked=prc.settings.renderCompressor,value=true)# Yes
							#html.radioButton(name="renderCompressor",checked=not prc.settings.renderCompressor,value=false)# No
							</div>

							<!--- Remove Comments --->
							#html.label(field="RemoveComments",content="Remove HTML Comments:")#
							<div class="checkbox">
							#html.radioButton(name="RemoveComments",checked=prc.settings.RemoveComments,value=true)# Yes
							#html.radioButton(name="RemoveComments",checked=not prc.settings.RemoveComments,value=false)# No
							</div>

							<!--- Remove RemoveMultiSpaces --->
							#html.label(field="RemoveMultiSpaces",content="Remove Multi Spaces:")#
							<div class="checkbox">
							#html.radioButton(name="RemoveMultiSpaces",checked=prc.settings.RemoveMultiSpaces,value=true)# Yes
							#html.radioButton(name="RemoveMultiSpaces",checked=not prc.settings.RemoveMultiSpaces,value=false)# No
							</div>

							<!--- RemoveIntertagSpaces --->
							#html.label(field="RemoveIntertagSpaces",content="Remove Inter Tag Spaces:")#
							<div class="checkbox">
							#html.radioButton(name="RemoveIntertagSpaces",checked=prc.settings.RemoveIntertagSpaces,value=true)# Yes
							#html.radioButton(name="RemoveIntertagSpaces",checked=not prc.settings.RemoveIntertagSpaces,value=false)# No
							</div>

							<!--- Remove RemoveQuotes --->
							#html.label(field="RemoveQuotes",content="Remove Unecessary Tag Attribute Quotes:")#
							<div class="checkbox">
							#html.radioButton(name="RemoveQuotes",checked=prc.settings.RemoveQuotes,value=true)# Yes
							#html.radioButton(name="RemoveQuotes",checked=not prc.settings.RemoveQuotes,value=false)# No
							</div>

							<!--- CompressCss --->
							#html.label(field="CompressCss",content="Compress Inline CSS:")#
							<div class="checkbox">
							#html.radioButton(name="CompressCss",checked=prc.settings.CompressCss,value=true)# Yes
							#html.radioButton(name="CompressCss",checked=not prc.settings.CompressCss,value=false)# No
							</div>

							<!--- CompressJavaScript --->
							#html.label(field="CompressJavaScript",content="Compress Inline JavaScript:")#
							<div class="checkbox">
							#html.radioButton(name="CompressJavaScript",checked=prc.settings.CompressJavaScript,value=true)# Yes
							#html.radioButton(name="CompressJavaScript",checked=not prc.settings.CompressJavaScript,value=false)# No
							</div>

							<!--- SimpleDocType --->
							#html.label(field="SimpleDocType",content="Change to HTML5 Doctype")#
							<div class="checkbox">
							#html.radioButton(name="SimpleDocType",checked=prc.settings.SimpleDocType,value=true)# Yes
							#html.radioButton(name="SimpleDocType",checked=not prc.settings.SimpleDocType,value=false)# No
							</div>

							<!--- RemoveScriptAttributes --->
							#html.label(field="RemoveScriptAttributes",content="Remove Optional Attributes From Script Tags:")#
							<div class="checkbox">
							#html.radioButton(name="RemoveScriptAttributes",checked=prc.settings.RemoveScriptAttributes,value=true)# Yes
							#html.radioButton(name="RemoveScriptAttributes",checked=not prc.settings.RemoveScriptAttributes,value=false)# No
							</div>

							<!--- RemoveStyleAttributes --->
							#html.label(field="RemoveStyleAttributes",content="Remove Optional Attributes From Style Tags:")#
							<div class="checkbox">
							#html.radioButton(name="RemoveStyleAttributes",checked=prc.settings.RemoveStyleAttributes,value=true)# Yes
							#html.radioButton(name="RemoveStyleAttributes",checked=not prc.settings.RemoveStyleAttributes,value=false)# No
							</div>

							<!--- RemoveLinkAttributes --->
							#html.label(field="RemoveLinkAttributes",content="Remove Optional Attributes From Link Tags:")#
							<div class="checkbox">
							#html.radioButton(name="RemoveLinkAttributes",checked=prc.settings.RemoveLinkAttributes,value=true)# Yes
							#html.radioButton(name="RemoveLinkAttributes",checked=not prc.settings.RemoveLinkAttributes,value=false)# No
							</div>

							<!--- RemoveFormAttributes --->
							#html.label(field="RemoveFormAttributes",content="Remove Optional Attributes From Form Tags:")#
							<div class="checkbox">
							#html.radioButton(name="RemoveFormAttributes",checked=prc.settings.RemoveFormAttributes,value=true)# Yes
							#html.radioButton(name="RemoveFormAttributes",checked=not prc.settings.RemoveFormAttributes,value=false)# No
							</div>

							<!--- RemoveInputAttributes --->
							#html.label(field="RemoveInputAttributes",content="Remove Optional Attributes From Input Tags:")#
							<div class="checkbox">
							#html.radioButton(name="RemoveInputAttributes",checked=prc.settings.RemoveInputAttributes,value=true)# Yes
							#html.radioButton(name="RemoveInputAttributes",checked=not prc.settings.RemoveInputAttributes,value=false)# No
							</div>

							<!--- SimpleBooleanAttributes --->
							#html.label(field="SimpleBooleanAttributes",content="Remove Values From Boolean Tags:")#
							<div class="checkbox">
							#html.radioButton(name="SimpleBooleanAttributes",checked=prc.settings.SimpleBooleanAttributes,value=true)# Yes
							#html.radioButton(name="SimpleBooleanAttributes",checked=not prc.settings.SimpleBooleanAttributes,value=false)# No
							</div>

							<!--- RemoveJavaScriptProtocol --->
							#html.label(field="RemoveJavaScriptProtocol",content="Remove 'javascript:' From Inline Event Handlers:")#
							<div class="checkbox">
							#html.radioButton(name="RemoveJavaScriptProtocol",checked=prc.settings.RemoveJavaScriptProtocol,value=true)# Yes
							#html.radioButton(name="RemoveJavaScriptProtocol",checked=not prc.settings.RemoveJavaScriptProtocol,value=false)# No
							</div>

							<!--- RemoveHttpProtocol --->
							#html.label(field="RemoveHttpProtocol",content="Replace 'http://' With '//' Inside Tag Attributes:")#
							<div class="checkbox">
							#html.radioButton(name="RemoveHttpProtocol",checked=prc.settings.RemoveHttpProtocol,value=true)# Yes
							#html.radioButton(name="RemoveHttpProtocol",checked=not prc.settings.RemoveHttpProtocol,value=false)# No
							</div>

							<!--- RemoveHttpsProtocol --->
							#html.label(field="RemoveHttpsProtocol",content="Replace 'https://' With '//' Inside Tag Attributes:")#
							<div class="checkbox">
							#html.radioButton(name="RemoveHttpsProtocol",checked=prc.settings.RemoveHttpsProtocol,value=true)# Yes
							#html.radioButton(name="RemoveHttpsProtocol",checked=not prc.settings.RemoveHttpsProtocol,value=false)# No
							</div>

							<!--- PreserveLineBreaks --->
							#html.label(field="PreserveLineBreaks",content="Preserve Original Line Break:")#
							<div class="checkbox">
							#html.radioButton(name="PreserveLineBreaks",checked=prc.settings.PreserveLineBreaks,value=true)# Yes
							#html.radioButton(name="PreserveLineBreaks",checked=not prc.settings.PreserveLineBreaks,value=false)# No
							</div>

						</fieldset>
						</div>

						<!--- Caching Settings --->
						<div id="caching" role="tabpanel" class="tab-pane">
						<fieldset>
							<p>From here you can control the HTML Compression Caching Settings.</p>

							<!--- Render Caching --->
							#html.label(field="renderCaching",content="Activate Compression Caching:")#
							<small>This will store each unique HTML content compressed in the cache provider of your choice</small><br/>
							<div class="checkbox">
								#html.radioButton(name="renderCaching",checked=prc.settings.renderCaching,value=true)# Yes
								#html.radioButton(name="renderCaching",checked=not prc.settings.renderCaching,value=false)# No
							</div>

							<!--- Cache Provider --->
							<div class="form-group">
								<label for="renderCacheProvider">Cache Provider:</label><br>
								<small>Choose the CacheBox provider to cache the compressed HTML into.</small><br/>
								#html.select(name="renderCacheProvider",options=prc.cacheNames,selectedValue=prc.settings.renderCacheProvider)#
							</div>

							<!--- Cache Timeouts --->
							<div class="form-group">
								<label for="renderCacheTimeout">Cache Timeouts:</label><br>
								<small>The number of minutes a compressed HTML content is cached for.</small><br/>
								<select name="renderCacheTimeout" id="renderCacheTimeout">
									<cfloop from="5" to="100" step="5" index="i">
										<option value="#i#" <cfif i eq prc.settings.renderCacheTimeout>selected="selected"</cfif>>#i#</option>
									</cfloop>
								</select>
							</div>

							<!--- Last Access Timeouts --->
							<div class="form-group">
								<label for="renderCacheLastAccessTimeout">Cache Idle Timeouts:</label><br>
								<small>The number of idle minutes allowed for cached HTML to live if not used. Usually this is less than the timeout you selected above</small><br/>
								<select name="renderCacheLastAccessTimeout" id="renderCacheLastAccessTimeout">
									<cfloop from="5" to="100" step="5" index="i">
										<option value="#i#" <cfif i eq prc.settings.renderCacheLastAccessTimeout>selected="selected"</cfif>>#i#</option>
									</cfloop>
								</select>
							</div>

							<div class="form-group">
								<label for="renderCachePrefix">Cache Key Prefix</label><br>
								<small>Each compressed HTML will have this key prefixed for you</small><br/>
								#html.textField(name="renderCachePrefix",value=prc.settings.renderCachePrefix,size=40,class="form-control",required=true)#
							</div>

						</fieldset>
						</div>

					</div> <!--- panes --->	

				</div> <!--- End nav container --->

				<!--- Submit --->
				<div class="actionBar center">
					#html.submitButton( value="Save Settings",class="btn btn-danger",title="Save the HTML Compressor settings")#
				</div>

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