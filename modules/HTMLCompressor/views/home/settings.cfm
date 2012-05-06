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
			HTML Compressor Settings
		</div>
		<!--- Body --->
		<div class="body" id="mainBody">
			#getPlugin("MessageBox").renderit()#

			<p>
				Below you can modify the settings used by the HTML Compressor
				<a href="#prc.xehManualCompressor#"><button class="button2">Open Manual Compressor</button></a>
			</p>

			#html.startForm(action="cbadmin.module.HTMLCompressor.home.saveSettings",name="settingsForm")#

			<div class="body_vertical_nav clearfix">
				<!--- Navigation Bar --->
				<ul class="vertical_nav">
					<li class="active"><a href="##general_options"><img src="#prc.cbRoot#/includes/images/settings_black.png" alt="modifiers"/> Compressor Tuning</a></li>
					<li><a href="##tuning_options"><img src="#prc.cbRoot#/includes/images/database_black.png" alt="modifiers"/> Compressor Caching</a></li>
				</ul>
				<div class="main_column">
				<!-- Content area that wil show the form and stuff -->
				<div class="panes_vertical">

				<!--- Compressor Settings --->
				<div>
				<fieldset>
				<legend><img src="#prc.cbRoot#/includes/images/settings_black.png" alt="modifiers"/> <strong>Compressor Tuning</strong></legend>
					<p>From here you can tune the HTML Compression Engine.</p>

					<!--- Activate --->
					#html.label(field="renderCompressor",content="Activate HTML Compression:")#
					<small>Turn on/off the HTML compression for layouts+views</small><br/>
					#html.radioButton(name="renderCompressor",checked=prc.settings.renderCompressor,value=true)# Yes
					#html.radioButton(name="renderCompressor",checked=not prc.settings.renderCompressor,value=false)# No

					<!--- Remove Comments --->
					#html.label(field="RemoveComments",content="Remove HTML Comments:")#
					#html.radioButton(name="RemoveComments",checked=prc.settings.RemoveComments,value=true)# Yes
					#html.radioButton(name="RemoveComments",checked=not prc.settings.RemoveComments,value=false)# No

					<!--- Remove RemoveMultiSpaces --->
					#html.label(field="RemoveMultiSpaces",content="Remove Multi Spaces:")#
					#html.radioButton(name="RemoveMultiSpaces",checked=prc.settings.RemoveMultiSpaces,value=true)# Yes
					#html.radioButton(name="RemoveMultiSpaces",checked=not prc.settings.RemoveMultiSpaces,value=false)# No

					<!--- RemoveIntertagSpaces --->
					#html.label(field="RemoveIntertagSpaces",content="Remove Inter Tag Spaces:")#
					#html.radioButton(name="RemoveIntertagSpaces",checked=prc.settings.RemoveIntertagSpaces,value=true)# Yes
					#html.radioButton(name="RemoveIntertagSpaces",checked=not prc.settings.RemoveIntertagSpaces,value=false)# No

					<!--- Remove RemoveQuotes --->
					#html.label(field="RemoveQuotes",content="Remove Unecessary Tag Attribute Quotes:")#
					#html.radioButton(name="RemoveQuotes",checked=prc.settings.RemoveQuotes,value=true)# Yes
					#html.radioButton(name="RemoveQuotes",checked=not prc.settings.RemoveQuotes,value=false)# No

					<!--- CompressCss --->
					#html.label(field="CompressCss",content="Compress Inline CSS:")#
					#html.radioButton(name="CompressCss",checked=prc.settings.CompressCss,value=true)# Yes
					#html.radioButton(name="CompressCss",checked=not prc.settings.CompressCss,value=false)# No

					<!--- CompressJavaScript --->
					#html.label(field="CompressJavaScript",content="Compress Inline JavaScript:")#
					#html.radioButton(name="CompressJavaScript",checked=prc.settings.CompressJavaScript,value=true)# Yes
					#html.radioButton(name="CompressJavaScript",checked=not prc.settings.CompressJavaScript,value=false)# No

					<!--- SimpleDocType --->
					#html.label(field="SimpleDocType",content="Change to HTML5 Doctype")#
					#html.radioButton(name="SimpleDocType",checked=prc.settings.SimpleDocType,value=true)# Yes
					#html.radioButton(name="SimpleDocType",checked=not prc.settings.SimpleDocType,value=false)# No

					<!--- RemoveScriptAttributes --->
					#html.label(field="RemoveScriptAttributes",content="Remove Optional Attributes From Script Tags:")#
					#html.radioButton(name="RemoveScriptAttributes",checked=prc.settings.RemoveScriptAttributes,value=true)# Yes
					#html.radioButton(name="RemoveScriptAttributes",checked=not prc.settings.RemoveScriptAttributes,value=false)# No

					<!--- RemoveStyleAttributes --->
					#html.label(field="RemoveStyleAttributes",content="Remove Optional Attributes From Style Tags:")#
					#html.radioButton(name="RemoveStyleAttributes",checked=prc.settings.RemoveStyleAttributes,value=true)# Yes
					#html.radioButton(name="RemoveStyleAttributes",checked=not prc.settings.RemoveStyleAttributes,value=false)# No

					<!--- RemoveLinkAttributes --->
					#html.label(field="RemoveLinkAttributes",content="Remove Optional Attributes From Link Tags:")#
					#html.radioButton(name="RemoveLinkAttributes",checked=prc.settings.RemoveLinkAttributes,value=true)# Yes
					#html.radioButton(name="RemoveLinkAttributes",checked=not prc.settings.RemoveLinkAttributes,value=false)# No

					<!--- RemoveFormAttributes --->
					#html.label(field="RemoveFormAttributes",content="Remove Optional Attributes From Form Tags:")#
					#html.radioButton(name="RemoveFormAttributes",checked=prc.settings.RemoveFormAttributes,value=true)# Yes
					#html.radioButton(name="RemoveFormAttributes",checked=not prc.settings.RemoveFormAttributes,value=false)# No

					<!--- RemoveInputAttributes --->
					#html.label(field="RemoveInputAttributes",content="Remove Optional Attributes From Input Tags:")#
					#html.radioButton(name="RemoveInputAttributes",checked=prc.settings.RemoveInputAttributes,value=true)# Yes
					#html.radioButton(name="RemoveInputAttributes",checked=not prc.settings.RemoveInputAttributes,value=false)# No

					<!--- SimpleBooleanAttributes --->
					#html.label(field="SimpleBooleanAttributes",content="Remove Values From Boolean Tags:")#
					#html.radioButton(name="SimpleBooleanAttributes",checked=prc.settings.SimpleBooleanAttributes,value=true)# Yes
					#html.radioButton(name="SimpleBooleanAttributes",checked=not prc.settings.SimpleBooleanAttributes,value=false)# No

					<!--- RemoveJavaScriptProtocol --->
					#html.label(field="RemoveJavaScriptProtocol",content="Remove 'javascript:' From Inline Event Handlers:")#
					#html.radioButton(name="RemoveJavaScriptProtocol",checked=prc.settings.RemoveJavaScriptProtocol,value=true)# Yes
					#html.radioButton(name="RemoveJavaScriptProtocol",checked=not prc.settings.RemoveJavaScriptProtocol,value=false)# No

					<!--- RemoveHttpProtocol --->
					#html.label(field="RemoveHttpProtocol",content="Replace 'http://' With '//' Inside Tag Attributes:")#
					#html.radioButton(name="RemoveHttpProtocol",checked=prc.settings.RemoveHttpProtocol,value=true)# Yes
					#html.radioButton(name="RemoveHttpProtocol",checked=not prc.settings.RemoveHttpProtocol,value=false)# No

					<!--- RemoveHttpsProtocol --->
					#html.label(field="RemoveHttpsProtocol",content="Replace 'https://' With '//' Inside Tag Attributes:")#
					#html.radioButton(name="RemoveHttpsProtocol",checked=prc.settings.RemoveHttpsProtocol,value=true)# Yes
					#html.radioButton(name="RemoveHttpsProtocol",checked=not prc.settings.RemoveHttpsProtocol,value=false)# No

					<!--- PreserveLineBreaks --->
					#html.label(field="PreserveLineBreaks",content="Preserve Original Line Break:")#
					#html.radioButton(name="PreserveLineBreaks",checked=prc.settings.PreserveLineBreaks,value=true)# Yes
					#html.radioButton(name="PreserveLineBreaks",checked=not prc.settings.PreserveLineBreaks,value=false)# No

				</fieldset>
				</div>

				<!--- Caching Settings --->
				<div>
				<fieldset>
				<legend><img src="#prc.cbRoot#/includes/images/database_black.png" alt="modifiers"/> <strong>Compressor Caching</strong></legend>
				<p>From here you can control the HTML Compression Caching Settings.</p>

				<!--- Render Caching --->
				#html.label(field="renderCaching",content="Activate Compression Caching:")#
				<small>This will store each unique HTML content compressed in the cache provider of your choice</small><br/>
				#html.radioButton(name="renderCaching",checked=prc.settings.renderCaching,value=true)# Yes
				#html.radioButton(name="renderCaching",checked=not prc.settings.renderCaching,value=false)# No

				<!--- Cache Provider --->
				<label for="renderCacheProvider">Cache Provider:</label>
				<small>Choose the CacheBox provider to cache the compressed HTML into.</small><br/>
				#html.select(name="renderCacheProvider",options=prc.cacheNames,selectedValue=prc.settings.renderCacheProvider)#

				<!--- Cache Timeouts --->
				<label for="renderCacheTimeout">Cache Timeouts:</label>
				<small>The number of minutes a compressed HTML content is cached for.</small><br/>
				<select name="renderCacheTimeout" id="renderCacheTimeout">
					<cfloop from="5" to="100" step="5" index="i">
						<option value="#i#" <cfif i eq prc.settings.renderCacheTimeout>selected="selected"</cfif>>#i#</option>
					</cfloop>
				</select>

				<!--- Last Access Timeouts --->
				<label for="renderCacheLastAccessTimeout">Cache Idle Timeouts:</label>
				<small>The number of idle minutes allowed for cached HTML to live if not used. Usually this is less than the timeout you selected above</small><br/>
				<select name="renderCacheLastAccessTimeout" id="renderCacheLastAccessTimeout">
					<cfloop from="5" to="100" step="5" index="i">
						<option value="#i#" <cfif i eq prc.settings.renderCacheLastAccessTimeout>selected="selected"</cfif>>#i#</option>
					</cfloop>
				</select>

				<label for="renderCachePrefix">Cache Key Prefix</label>
				<small>Each compressed HTML will have this key prefixed for you</small><br/>
				#html.textField(name="renderCachePrefix",value=prc.settings.renderCachePrefix,size=40,class="textfield",required=true)#

				</fieldset>
				</div>

				</div> <!--- end vertical panes --->
				</div> <!--- end main_column --->

			</div> <!--- End vertical nav --->

			<!--- Submit --->
			<div class="actionBar center">
				#html.submitButton(value="Save Settings",class="buttonred",title="Save the HTML Compressor settings")#
			</div>

			#html.endForm()#

		</div>
	</div>
</div>
</cfoutput>