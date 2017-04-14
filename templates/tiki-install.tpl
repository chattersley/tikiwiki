<div style="margin-left:180px;margin-right:180px;">
<h1>Tiki installer v1.9.5 (CVS)<a title='help' href='http://doc.tikiwiki.org/Installation' target="help"><img
border='0' src='img/icons/help.gif' alt="{tr}help{/tr}" /></a></h1>

{if $tikifeedback}
<br />{section name=n loop=$tikifeedback}<div class="simplebox {if $tikifeedback[n].num > 0} highlight{/if}">{$tikifeedback[n].mes}</div>{/section}
{/if}

{* multitiki ----------------------------- *}
{if $virt}
<table><tr><td width="180">
<div class="box">
<div class="box-title">
<a title='help' href='http://tikiwiki.org/MultiTiki19' target="help"><img border='0' src='img/icons/help.gif' alt="{tr}help{/tr}" /></a>
MultiTiki setup</div>
<div class="box-data">
<div><a href="tiki-install.php">default</a></div><br />
{foreach key=k item=i from=$virt}
<div>
<tt>{if $i eq 'y'}<b style="color:#00CC00;">DBok</b>{else}<b style="color:#CC0000;">NoDB</b>{/if}</tt>
{if $k eq $multi}
<b>{$k}</b>
{else}
<a href="tiki-install.php?multi={$k}" class='linkmodule'>{$k}</a>
{/if}
</div>
{/foreach}
</div></div>

<div class="box">
<div class="box-title">To add a new virtual host</div>
<div class="box-data">
To add a new virtual host run the setup.sh with the domain name of the new host as a last parameter.
</div>
</td>
<td valign="top">
{/if}

{if $multi} <h2> (MultiTiki) {$multi|default:"default"} </h2> {/if}
{* / multitiki --------------------------- *}

<a href="tiki-install.php?restart=1{if $multi}&amp;multi={$multi}{/if}" class="link">reload</a><br /><br />

{* we do not have a valid db connection or db reset is requested *}

{if $dbcon eq 'n' or $resetdb eq 'y'}
<b>Tiki cannot find a database connection</b><br />
Please enter your database connection info<br /><br />
<form action="tiki-install.php" method="post">
{if $multi}<input type="hidden" name="multi" value="{$multi}" />{/if}
<table class="normal"><tr class="formcolor">
<td>Database type:</td>
<td>
<select name="db">
{section name=dbnames loop=$dbservers}
<option value="{$dbservers[dbnames]}">{$dbservers[dbnames]}</option>
{/section}
</select>
</td>
<td>The type of database you intend to use</td>
</tr>

<tr class="formcolor">
<td>Host:</td>
<td>
<input type="text" name="host" value="localhost" />
</td><td>
Hostname or IP for your MySQL database, example: localhost if running in the same machine as tiki<br />
If you use SQLite, insert the path and filename to your database file
</td>
</tr>

<tr class="formcolor">
<td>User:</td>
<td>
<input type="text" name="user" />
</td><td>
Database user
</td>
</tr>

<tr class="formcolor">
<td>Password:</td>
<td>
<input type="password" name="pass" />
</td><td>
Database password
</td>
</tr>

<tr class="formcolor">
<td>Database name:</td>
<td>
<input type="text" name="name" />
</td><td>
The name of the database where tiki will create tables. You can create the database using mysqladmin, or PHPMyAdmin or ask your
hosting service to create a MySQL database.  Normally Tiki tables won't conflict with other product names.<br />
If you use Oracle, you can put your TNS Name here and leave hostname empty
or you override tnsnames.ora and put your SID here and fill your hostname:port above.
</td>
</tr>
			
<tr class="formcolor">
<td>&nbsp;</td>
<td><input type="hidden" name="resetdb" value="{$resetdb}" />
<input type="submit" name="dbinfo" /></td>
<td>&nbsp;</td>
</tr>
	  	
	  </table>
	  </form>
	{else}
	  {* we do have a database connection *}
	  {if $dbdone eq 'n'}
		  {if $logged eq 'y'}
		    {* we are logged if no admin account is found or if he user logged in*}
		    <b>Welcome to the installation & upgrade script!</b><br />
		    <br /><br />
			
		    <form method="post" action="tiki-install.php">
				{if $multi}<input type="hidden" name="multi" value="{$multi}" />{/if}
				<hr>
		    <table>
		    <tr><td style="text-align: center;" colspan="2"
 rowspan="1" height="26"><font size="5"><b>Install</b></font>
 			</td></tr>
			<tr><td>
			Create database (clean install) with profile:
			</td><td>
			<select name="profile">
			{section name=ix loop=$profiles}
			<option value="{$profiles[ix].name|escape}">{$profiles[ix].desc}</option>
			{/section}
			</select>
			<input type="submit" name="scratch" value="create" />	    
		    </td></tr>
			<td height="100" valign="top">
			</td><td height="100" valign="top">
			<a target="_new" href="http://tikiwiki.org/tiki-index.php?page=TikiProfiles" class="link">Descriptions of the available profiles</a>
			<p>
		    </td>
		    <tr><td colspan="2">

			<hr>
			<tr><td style="text-align: center;" colspan="2"
 rowspan="1" height="26"><font size="5"><b>Upgrade</b></font>
 			</td></tr>
		    <tr><td colspan="2">				
			Important: <b>backup your database</b> with mysqldump or phpmyadmin before you proceed. <br>
			</td></tr>
		    <tr><td>			
			Update database using script: 
			</td><td>
			<select name="file">
			{section name=ix loop=$files}
			<option value="{$files[ix]|escape}">{$files[ix]}</option>
			{/section}
			</select>
			<input type="submit" name="update" value="update" />
		    </td></tr>
		    <tr><td colspan="2">
			For database update from 1.8 or later:
			<ol>
				<li>If you upgrade from 1.8.x you <b>MUST</b> run tiki_1.8to1.9 and don't need an additional script.</li>
				<li>If you upgrade from a previous 1.9.x version, use tiki_1.8to1.9, too. (ex.: 1.9.2 to 1.9.5)</li>
			</ol>
		    <tr><td colspan="2">
		    	For database update from 1.7.x, please visit <a target="help" href="http://tikiwiki.org/UpgradeTo18">Tiki database 1.7.x to 1.8x instructions</a>

			
		</td></tr>
		    <tr><td colspan="2">
		    	For information about tiki-secdb_*.sql files, please see <a target="help" href="http://tikiwiki.org/AdminSecurity">http://tikiwiki.org/AdminSecurity</a>

			
		</td></tr>		
		
		
		
		
		    </table>
		    </form><br />
			<hr>
			<br /><br /><br />
			<a href="tiki-index.php" class="link">Do nothing and enter Tiki</a><br />
			<a href="tiki-install.php?reset=yes" class="link">Reset database connection settings</a>
		  {else}
			{* we are not logged then no admin account found and user not logged*}
			<b>This site has an admin account configured</b><br />
		    Please enter your admin password to continue<br /><br />

     <form name="loginbox" action="tiki-install.php" method="post"> 
			{if $multi}<input type="hidden" name="multi" value="{$multi}" />{/if}
          <table>
          <tr><td class="module">{tr}user{/tr}:</td></tr>
          <tr><td>admin</td></tr>
          <tr><td class="module">{tr}pass{/tr}:</td></tr>
          <tr><td><input type="password" name="pass" size="20" /></td></tr>
          <tr><td><input type="submit" name="login" value="{tr}login{/tr}" /></td></tr>
          </table>
      </form>

		  {/if}
    	{else}
    		<b>Print operations executed successfully</b><br />
    		<textarea rows="15" cols="80">
    		{section loop=$succcommands name=ix}
    		{$succcommands[ix]}
    		{/section}
    		</textarea><br /><br />
    		<b>Print operations failed</b><br />
    		<textarea rows="15" cols="80">
    		{section loop=$failedcommands name=ix}
    		{$failedcommands[ix]}
    		{/section}
    		</textarea><br /><br />
    		Your database has been configured and Tiki is ready to run, if
    		this is your first install your admin password is 'admin'. You can
    		now log in into Tiki as 'admin' - 'admin' and start configuring
    		the application.<br />
    		Note: This install script may be potentially harmful so we strongly
    		recommend you to disable the script and then proceed into Tiki. If
    		you decide to reuse later, just follow the instructions in
		tiki-install.php to restore.<br /><br />

    		READ THE FOLLOWING NOTES BEFORE ENTERING TIKI USING THE LINKS BELOW!
    		
    		<div class="rbox" name="tip">
            <div class="rbox-title" name="tip">Note</div>  
            <div class="rbox-data" name="tip">Make sure tiki gets more than 8 MB of memory for script execution. 
See file php.ini, the relevant key is memory_limit. Use something like memory_limit = 16M and restart your 
webserver. Too little memory will cause blank pages!</div>
            </div>
			
	{if $php_memory_limit eq ''}
		<div style="border-style: solid; border-width: 1; padding: 4">
		  <p align="center">
		  <span style="padding: 2px; background-color: #00FF00">
		  Tiki has not detected your PHP memory_limit. This probably means you have no set limit (all is well). 
		  </span>
		</div>	
	
	{elseif $php_memory_limit eq '8M'}
		<div style="border-style: solid; border-width: 1; padding: 4">
		  <p align="center">
		  <span style="text-decoration: blink; font-size: x-large; padding: 4px; background-color: #FF0000">
		  Tiki has detected your PHP memory limit at only 8 Megs
		  </span>
		</div>

	{else}
		<div style="border-style: solid; border-width: 1; padding: 4">
		  <p align="center">
		  <span style="font-size: large; padding: 4px;">
Tiki has detected your PHP memory_limit at: {$php_memory_limit}. 
		  </span>
		</div>	
	{/if}			
			
            <br />

    		<div class="rbox" name="tip">
            <div class="rbox-title" name="tip">Note</div>  
            <div class="rbox-data" name="tip">If this is a first time installation, go to tiki-admin.php after login to start configuring your new Tiki installation.</div>
            </div>
            <br />

    		<div class="rbox" name="tip">
            <div class="rbox-title" name="tip">Note</div>  
            <div class="rbox-data" name="tip">If you did a Tiki upgrade, make sure to clean the caches (templates_c/) manually or by using the feature on admin / system.</div>
            </div>
            <br />
            <br />
            Now you may proceed by clicking one of these links:<br /><br />

    		<a href="tiki-install.php?kill=1" class="link">Click here to disable the install script and proceed into tiki.</a><br /><br />
    		<a href="tiki-index.php" class="link">Click here to proceed into tiki without disabling the script.</a><br /><br />
    		<a href="tiki-install.php?reset=yes{if $multi}&amp;multi={$multi}{/if}" class="link">Reset database connection settings.</a><br /><br />
    		<a href="tiki-install.php{if $multi}?multi={$multi}{/if}" class="link">Go back and run another install/upgrade script</a> - do not use your Back button in your browser!<br /><br />
    	{/if}
	{/if}
</div>

{* multitiki ----------------------------- *}
{if $virt}
</td></tr></table>
{/if}
{* / multitiki --------------------------- *}
