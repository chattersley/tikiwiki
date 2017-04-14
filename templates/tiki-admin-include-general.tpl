{* $Header: /cvsroot-fuse/tikiwiki/tiki/templates/tiki-admin-include-general.tpl,v 1.35.2.34 2006/07/17 15:33:24 marclaporte Exp $ *}

<script type="text/javascript">
{literal}

  function previous_site_style() {
	var select = document.getElementById('general-theme');
	if (select.selectedIndex > 0) {
		select.selectedIndex--;
	}
  }

  function next_site_style() {
	var select = document.getElementById('general-theme');
	if (select.selectedIndex < select.length-1) {
		select.selectedIndex++;
	}
  }

{/literal}
</script>
<div class="cbox">
  <div class="cbox-title">
    {tr}{$crumbs[$crumb]->description}{/tr}
    {help crumb=$crumbs[$crumb]}
  </div>
  <div class="cbox-data">
    <form action="tiki-admin.php?page=general" method="post">
      <table class="admin"><tr>
        <td class="heading" colspan="2"
            align="center">{tr}General Preferences{/tr}</td>
      </tr><tr>
        <td class="form" ><label for="general-theme">{tr}Theme{/tr}:</label></td>
        <td width="67%"><select name="site_style" id="general-theme">
            {section name=ix loop=$styles}
              <option value="{$styles[ix]|escape}"
                {if $style_site eq $styles[ix]}selected="selected"{/if}>
                {$styles[ix]}</option>
            {/section}
            </select>
            &nbsp;<a href="javascript:previous_site_style();" title="{tr}prev{/tr}"><img src="img/icons2/nav_dot_right.gif" alt="&#9665;" height="11" width="8" border="0" /></a>
            <a href="javascript:next_site_style();" title="{tr}next{/tr}"><img src="img/icons2/nav_dot_left.gif" alt="&#9655" height="11" width="8" border="0" /></a>&nbsp;
            <input type="submit" name="style" value="{tr}Change style only{/tr}" />
        </td>
      </tr><tr>
        <td class="form"><label for="general-slideshows">{tr}Slideshows theme{/tr}:</label></td>
        <td><select name="slide_style" id="general-slideshows">
            {section name=ix loop=$slide_styles}
              <option value="{$slide_styles[ix]|escape}"
                {if $slide_style eq $slide_styles[ix]}selected="selected"{/if}>
                {$slide_styles[ix]}</option>
            {/section}
            </select>
        </td>
	</tr><tr>
	<td class="form" >&nbsp;</td><td>{if $feature_editcss eq 'y' and $tiki_p_create_css eq 'y'}<a href="tiki-edit_css.php" class="link" title="{tr}Edit CSS{/tr}">{tr}Edit CSS{/tr}</a>{/if}</td>
      </tr>
      
      <tr><td colspan="2"><hr/></td></tr>      
      
      <tr>
        <td class="form"><label for="general-homepages">{tr}Use group homepages{/tr}:</label></td>
        <td><input type="checkbox" name="useGroupHome" id="general-homepages"
              {if $useGroupHome eq 'y'}checked="checked"{/if}/>
        </td>
      </tr>
	<tr>
		<td class="form"><label for="general-gogrouphome">{tr}Go to group homepage only if login from default homepage{/tr}:</label></td>
		<td><input type="checkbox" name="limitedGoGroupHome" id="general-gogrouphome"{if $limitedGoGroupHome eq 'y'}checked="checked"{/if}/>
        </td>
	</tr>
      <tr>
        <td class="form"><label for="general-uri">{tr}Use URI as Home Page{/tr}:</label></td>
        <td><input type="checkbox" name="useUrlIndex" id="general-uri"
              {if $useUrlIndex eq 'y'}checked="checked"{/if}/>
            <input type="text" name="urlIndex" value="{$urlIndex|escape}" size="50" />
        </td>
      </tr><tr>
        <td class="form"><label for="general-homepage">{tr}Home page{/tr}:</label></td>
        <td><select name="tikiIndex" id="general-homepage">
            <option value="tiki-index.php"
              {if $tikiIndex eq 'tiki-index.php'}selected="selected"{/if}>
              {tr}Wiki{/tr}</option>
            <option value="tiki-view_articles.php"
              {if $tikiIndex eq 'tiki-view_articles.php'}selected="selected"{/if}>
              {tr}Articles{/tr}</option>
            {if $home_blog_name}
              <option value="{$home_blog_url|escape}"
                {if $tikiIndex eq $home_blog_url}selected="selected"{/if}>
                {tr}Blog{/tr}: {$home_blog_name}</option>
            {/if}
            {if $home_gal_name}
              <option value="{$home_gallery_url|escape}"
                {if $tikiIndex eq $home_gallery_url}selected="selected"{/if}>
                {tr}Image Gallery{/tr}: {$home_gal_name}</option>
            {/if}
            {if $home_fil_name}
              <option value="{$home_file_gallery_url|escape}"
                {if $tikiIndex eq $home_file_gallery_url}selected="selected"{/if}>
                {tr}File Gallery{/tr}: {$home_fil_name}</option>
            {/if}
            {if $home_forum_name}
              <option value="{$home_forum_url|escape}"
                {if $tikiIndex eq $home_forum_url}selected="selected"{/if}>
                {tr}Forum{/tr}: {$home_forum_name}</option>
            {/if}
            {if $feature_custom_home eq 'y'}
              <option value="tiki-custom_home.php"
                {if $tikiIndex eq 'tiki-custom_home.php'}selected="selected"{/if}>{tr}Custom home{/tr}</option>
            {/if}
            </select>
        </td>
      </tr><tr><td colspan="2"><hr/></td></tr><tr>
        <td class="form"><label for="general-lang">{tr}Language{/tr}:</label></td>
        <td>
        <select name="language" id="general-lang">
        {section name=ix loop=$languages}
        <option value="{$languages[ix].value|escape}"
          {if $language eq $languages[ix].value}selected="selected"{/if}>{$languages[ix].name}</option>
        {/section}
        </select>
        </td>
      </tr><tr>
	<td class="form"><label for="general-detect_language">{tr}Detect browser language{/tr}:</label></td>
        <td><input type="checkbox" name="feature_detect_language" id="general-detect_language"
              {if $feature_detect_language eq 'y'}checked="checked"{/if}/></td>
      </tr><tr>
        <td class="form"><label for="general-db_translation">{tr}Use database for translation{/tr}:</label></td>
        <td><input type="checkbox" name="lang_use_db" id="general-db_translation"
              {if $lang_use_db eq 'y'}checked="checked"{/if}/></td>
        {if $lang_use_db eq 'y'}
          </tr><tr>
            <td class="form"><label for="general-untranslated">{tr}Record untranslated{/tr}:</label></td>
            <td><input type="checkbox" name="record_untranslated" id="general-untranslated"
                  {if $record_untranslated eq 'y'}checked="checked"{/if}/></td>
        {/if}
      </tr><tr>
        <td class="form"><label for="general-os">{tr}OS{/tr}:</label></td>
        <td><select name="system_os" id="general-os">
            <option value="unix"
              {if $system_os eq 'unix'}selected="selected"{/if}>{tr}Unix{/tr}</option>
            <option value="windows"
              {if $system_os eq 'windows'}selected="selected"{/if}>{tr}Windows{/tr}</option>
            <option value="unknown"
              {if $system_os eq 'unknown'}selected="selected"{/if}>{tr}Unknown/Other{/tr}</option>
            </select>
        </td>
      </tr><tr>
      <td class="form"><label for="general-error">{tr}PHP error reporting level for non-admin:{/tr}</label></td>
      <td><select name="error_reporting_level" id="general-error">
            <option value="0" {if $error_reporting_level eq 0}selected="selected"{/if}>{tr}No error reporting{/tr}</option>
            <option value="2047" {if $error_reporting_level eq 2047}selected="selected"{/if}>{tr}Report all PHP errors{/tr}</option>
            <option value="2039" {if $error_reporting_level eq 2039}selected="selected"{/if}>{tr}Report all errors except notices{/tr}</option>
		<option value="1" {if $error_reporting_level eq 1}selected="selected"{/if}>{tr}Report PHP errors only for admin{/tr}</option>
            </select>
      </td>
      </tr><tr>
      <td class="form"><label for="general-charset">{tr}Default charset for sending mail:{/tr}</label></td>
      <td><select name="default_mail_charset" id="general-charset">
            <option value="utf-8" {if $default_mail_charset eq "utf-8"}selected="selected"{/if}>utf-8</option>
            <option value="iso-8859-1" {if $default_mail_charset eq "iso-8859-1"}selected="selected"{/if}>iso-8859-1</option>
            </select>
      </td>
	</tr><tr>
      <td class="form"><label for="mail_crlf">{tr}Mail end of line:{/tr}</label></td>
      <td><select name="mail_crlf" id="mail_crlf">
            <option value="CRLF" {if $mail_crlf eq "CRLF"}selected="selected"{/if}>CRLF {tr}(standard){/tr}</option>
            <option value="LF" {if $mail_crlf eq "LF"}selected="selected"{/if}>LF {tr}(some Unix MTA){/tr}</option>
            </select>
      </td>
	</tr>
      </table>
      <table class="admin"><tr>
        <td class="heading" colspan="2"
            align="center">{tr}General Settings{/tr}</td>
      </tr><tr>
        <td class="form" >
          <label for="general-access">{tr}Disallow access to the site (except for those with permission){/tr}:</label></td>
        <td ><input type="checkbox" name="site_closed" id="general-access"
              {if $site_closed eq 'y'}checked="checked"{/if}/>
        </td>
      </tr><tr>
        <td class="form">
            <label for="general-site_closed">{tr}Message to display when site is closed{/tr}:</label></td>
        <td><input type="text" name="site_closed_msg" id="general-site_closed"
             value="{$site_closed_msg}" size="60"/></td>
      </tr>
      </table>
      <table class="admin"><tr>
        <td colspan="2"><hr/></td>
      </tr><tr>
        <td class="form" >
          <label for="general-load">{tr}Disallow access when load is above the threshold (except for those with permission){/tr}:</label></td>
        <td ><input type="checkbox" name="use_load_threshold" id="general-load"
              {if $use_load_threshold eq 'y'}checked="checked"{/if}/>
      </td>
      </tr><tr>
        <td class="form"><label for="general-max_load">{tr}Max average server load threshold in the last minute{/tr}:</label></td>
        <td><input type="text" name="load_threshold" id="general-max_load" value="{$load_threshold}" size="5" /></td>
      </tr><tr>
        <td class="form"><label for="general-load_mess">{tr}Message to display when server is too busy{/tr}:</label></td>
        <td><input type="text" name="site_busy_msg" id="general-load_mess" value="{$site_busy_msg}" size="60" /></td>
      </tr>
      </table>
      <table class="admin"><tr>
        <td colspan="5"><hr/></td></tr>
        <tr>
        <td class="form" >
          <label for="general-ext_links">{tr}Open external links in new window{/tr}:</label></td>
        <td ><input type="checkbox" name="popupLinks" id="general-ext_links"
              {if $popupLinks eq 'y'}checked="checked"{/if}/>
        </td>
        <td >&nbsp;</td>
        <td class="form" >
          <label for="general-modules">{tr}Display modules to all groups always{/tr}:</label></td>
        <td ><input type="checkbox" name="modallgroups" id="general-modules"
              {if $modallgroups eq 'y'}checked="checked"{/if} {popup text="Hint: If you lose your login module, use tiki-login_scr.php to be able to login!" textcolor=red}/>
        </td>
      </tr><tr>
        <td class="form"><label for="general-cache_ext_pages">{tr}Use cache for external pages{/tr}:</label></td>
        <td><input type="checkbox" name="cachepages" id="general-cache_ext_pages"
              {if $cachepages eq 'y'}checked="checked"{/if}/>
        </td>
        <td>&nbsp;</td>
        <td class="form"><label for="general-cache_ext_imgs">{tr}Use cache for external images{/tr}:</label></td>
        <td><input type="checkbox" name="cacheimages" id="general-cache_ext_imgs"
              {if $cacheimages eq 'y'}checked="checked"{/if}/>
        </td>
      </tr><tr>
        <td class="form"><label for="general-pagination">{tr}Use direct pagination links{/tr}:</label></td>
        <td><input type="checkbox" name="direct_pagination" id="general-pagination"
              {if $direct_pagination eq 'y'}checked="checked"{/if}/>
        </td>
        <td>&nbsp;</td>
        <td class="form"><label for="general-menu_folders">{tr}Display menus as folders{/tr}:</label></td>
        <td><input type="checkbox" name="feature_menusfolderstyle" id="general-menu_folders"
              {if $feature_menusfolderstyle eq 'y'}checked="checked"{/if}/>
        </td>
      </tr><tr>
        <td class="form"><label for="general-gzip">
        {if $feature_help eq 'y'}<a href="http://tikiwiki.org/Compression" 
target="tikihelp" class="tikihelp" title="{tr}Tikiwiki.org help{/tr}:" >{/if}
        {tr}Use gzipped output{/tr}
        {if $feature_help eq 'y'}</a>{/if}
        :</label>
          {if $gzip_handler ne 'none'}
          <br /><div class="highlight">
          {tr}output compression is active.{/tr}<br />
          {tr}compression is handled by{/tr}: {$gzip_handler}
          </div>{/if}
        </td>
        <td><input type="checkbox" name="feature_obzip" id="general-gzip"
              {if $feature_obzip eq 'y'}checked="checked"{/if}/>


        </td>
        <td>&nbsp;</td>
        <td class="form"><label for="general-pageviews">{tr}Count admin pageviews{/tr}:</label></td>
        <td><input type="checkbox" name="count_admin_pvs" id="general-pageviews"
              {if $count_admin_pvs eq 'y'}checked="checked"{/if}/>
        </td>
      </tr><tr>
        <td class="form"><label for="general-anon_modules">{tr}Hide anonymous-only modules from registered users{/tr}:</label></td>
        <td><input type="checkbox" name="modseparateanon" id="general-anon_modules"
              {if $modseparateanon eq 'y'}checked="checked"{/if}/>
        </td>
        <td>&nbsp;</td>
      </tr></table>

      <table class="admin"><tr>
        <td colspan="2"><hr/></td>
      </tr><tr>
        <td class="form" >
          <label for="general-server_name">{tr}Server name (for absolute URIs){/tr}:</label></td>
        <td ><input type="text" name="feature_server_name" id="general-server_name"
                               value="{$feature_server_name|escape}" size="40" /></td>
      </tr><tr>
        <td class="form" >
          <label for="general-https">{tr}HTTPS Server{/tr}:</label></td>
        <td ><select name="https" id="general-https">
             <option value="auto" {if $https=="auto"}selected="selected"{/if}>{tr}Automatic (uses HTTPS variable){/tr}</option>
             <option value="http" {if $https=="http"}selected="selected"{/if}>{tr}No{/tr}</option>
             <option value="https" {if $https=="https"}selected="selected"{/if}>{tr}Yes{/tr}</option>
              </select>
                               </td>
      </tr><tr>
        <td class="form"><label for="general-browser_title">{tr}Browser title{/tr}:</label></td>
        <td><input type="text" name="siteTitle" id="general-browser_title" value="{$siteTitle|escape}" size="40" /></td>
      </tr><tr>
<!--
        <td class="form"><label for="general-tiki_title">{tr}Wiki_Tiki_Title{/tr}: </label></td>
        <td><input type="text" size="5" name="title" id="general-tiki_title" value="{$title|escape}" size="40" /></td>
      </tr><tr>
-->
        <td class="form"><label for="general-temp">{tr}Temporary directory{/tr}:</label></td>
        <td><input type="text" name="tmpDir" id="general-temp" value="{$tmpDir|escape}" size="50" /></td>
      </tr><tr>
        <td class="form"><label for="general-send_email">{tr}Sender Email{/tr}:</label></td>
        <td><input type="text" name="sender_email" id="general-send_email" value="{$sender_email|escape}" size="50" /></td>
      </tr>
			<tr>
        <td class="form"><label for="general-contact">{tr}Contact user{/tr}:</label></td>
{if $feature_contact eq 'y'}
        <td><input type="text" name="contact_user" id="general-contact" value="{$contact_user|escape}" size="40" /></td>
      </tr><tr>
        <td class="form"><label for="contact_anon">{tr}Allow anonymous users to "Contact Us"{/tr}:</label></td>
        <td><input type="checkbox" name="contact_anon" id="contact_anon"
              {if $contact_anon eq 'y'}checked="checked"{/if}/>
        </td>
{else}
        <td>{tr}contact feature disabled{/tr}</td>
{/if}
      </tr><tr>
        <td class="form"><label for="general-session_db">{tr}Store session data in database{/tr}:</label></td>
        <td><input type="checkbox" name="session_db" id="general-session_db"
              {if $session_db eq 'y'}checked="checked"{/if}/>
        </td>
      </tr><tr>
        <td class="form"><label for="general-session_life">{tr}Session lifetime in minutes{/tr}:</label></td>
        <td><input size="5" type="text" name="session_lifetime" id="general-session_life" value="{$session_lifetime|escape}" /></td>
      </tr><tr>
        <td class="form"><label for="general-proxy">{tr}Use proxy{/tr}:</label></td>
        <td><input type="checkbox" name="use_proxy" id="general-proxy"
              {if $use_proxy eq 'y'}checked="checked"{/if}/>
        </td>
      </tr><tr>
        <td class="form"><label for="general-proxy_host">{tr}Proxy Host{/tr}:</label></td>
        <td><input type="text" name="proxy_host" id="general-proxy_host" value="{$proxy_host|escape}" size="40" /></td>
      </tr><tr>
        <td class="form"><label for="general-proxy_port">{tr}Proxy port{/tr}:</label></td>
        <td><input size="5" type="text" name="proxy_port" id="general-proxy_port" value="{$proxy_port|escape}" /></td>
      </tr><tr>
        <td class="form"><label for="general-max_records">{tr}Maximum number of records in listings{/tr}:</label></td>
        <td><input size="5" type="text" name="maxRecords" id="general-max_records"
                   value="{$maxRecords|escape}" /></td>
      </tr><tr>
        <td class="form"><label for="general-helpurl">{tr}Help URL{/tr}:</label></td>
        <td><input type="text" name="helpurl" id="general-helpurl" value="{$helpurl|escape}" size="40" /></td>

      </tr><tr>
        <td class="form"></td>
        <td>{tr}Please expect not found help-pages with the default-URL.{/tr}<br />
	    {tr}Any help with the documentation is welcome.{/tr}</td>

      </tr></table>
      <table class="admin"><tr>
        <td class="heading" colspan="2" align="center">{tr}Date and Time Formats{/tr}</td>
      </tr><tr>
        <td class="form" ><label for="general-long_date">{tr}Long date format{/tr}:</label></td>
        <td ><input type="text" name="long_date_format" id="general-long_date"
             value="{$long_date_format|escape}" size="40"/></td>
      </tr><tr>
        <td class="form"><label for="general-short_date">{tr}Short date format{/tr}:</label></td>
        <td><input type="text" name="short_date_format" id="general-short_date"
             value="{$short_date_format|escape}" size="40"/></td>
      </tr><tr>
        <td class="form"><label for="general-long_time">{tr}Long time format{/tr}:</label></td>
        <td><input type="text" name="long_time_format" id="general-long_time"
             value="{$long_time_format|escape}" size="40"/></td>
      </tr><tr>
        <td class="form"><label for="general-short_time">{tr}Short time format{/tr}:</label></td>
        <td><input type="text" name="short_time_format" id="general-short_time"
             value="{$short_time_format|escape}" size="40"/></td>
      </tr><tr>
        {assign var="fcnlink" value="http://www.php.net/manual/en/function.strftime.php"}
        <td colspan="2" align="center">
          <a class="link" target="strftime" href="{$fcnlink}">
            {tr}Date and Time Format Help{/tr}</a></td>
      </tr>
		</table>
			
			<table class="admin">
				<tr>
					<td class="heading" colspan="2" align="center">{tr}Other{/tr}</td>
				</tr>
				<tr>
				<tr>
					<td class="form"><label for="site_favicon">{tr}Favicon icon file name:{/tr}</label></td>
					<td><input type="text" name="site_favicon" id="site_favicon" value="{$site_favicon}" size="12" maxlength="32" /></td>
				</tr>
				<tr>
					<td class="form"><label for="site_favicon_type">{tr}Favicon icon MIME type:{/tr}</label></td>
					<td>
						<select name="site_favicon_type" id="site_favicon_type">
							<option value="image/png" {if $site_favicon_type eq 'image/png'}selected="selected"{/if}>{tr}image/png{/tr}</option>
							<option value="image/bmp" {if $site_favicon_type eq 'image/bmp'}selected="selected"{/if}>{tr}image/bmp{/tr}</option>
							<option value="image/x-icon" {if $site_favicon_type eq 'image/x-icon'}selected="selected"{/if}>{tr}image/x-icon{/tr}</option>
						</select>
					</td>
				</tr>
				
				<tr>
					<td colspan="2"><hr/></td>
				</tr>
				      
				<tr>
					<td class="form"><label for="site_crumb_seper">{tr}Locations separator{/tr}:</label></td>
					<td>
						<div style="float: left"><input type="text" name="site_crumb_seper" id="site_crumb_seper" value="{$site_crumb_seper}" size="5" maxlength="8" /></div>
						<div>
							&nbsp; <small><em>{tr}Example{/tr}</em>: &nbsp; &raquo; &nbsp; / &nbsp; &gt; &nbsp; : &nbsp; -> &nbsp; &#8594;</small>
						</div>
					</td>
				</tr>
			
      <tr>
        <td class="button" colspan='2'>
          <input type="submit" name="prefs" value="{tr}Change preferences{/tr}" />
        </td>
      </tr></table>
    </form>
  </div>
</div>
<br />
<div class="cbox">
  <div class="cbox-title">
    {tr}Register this site at tikiwiki.org{/tr}
  </div>
  <div class="cbox-data">
  <a class="link" href="tiki-register_site.php">{tr}Click here for more details.{/tr}</a>
  </div>
</div>
<br />
<div class="cbox">
  <div class="cbox-title">
    {tr}Change admin password{/tr}
  </div>
  <div class="cbox-data">
    <form method="post" action="tiki-admin.php?page=general">
      <table class="admin"><tr>
        <td class="form" ><label for="general-new_pass">{tr}New password{/tr}:</label></td>
        <td ><input type="password" name="adminpass" id="general-new_pass" /></td>
      </tr><tr>
        <td class="form"><label for="general-repeat_pass">{tr}Repeat password{/tr}:</label></td>
        <td><input type="password" name="again" id="general-repeat_pass" /></td>
      </tr><tr>
        <td colspan="2" class="button">
          <input type="submit" name="newadminpass" value="{tr}Change password{/tr}" />
        </td>
      </tr></table>
    </form>
  </div>
</div>
