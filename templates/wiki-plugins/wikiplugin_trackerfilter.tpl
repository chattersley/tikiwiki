{strip}
{if $msgTrackerFilter}
<div class="simplebox highlight">{$msgTrackerFilter|escape}</div>
{/if}
<form method="post">
<input type="hidden" name="trackerId" value="{$trackerId}" />
<table class="normal">
{cycle values="even,odd" print=false}
{section name=if loop=$filters}
	<tr class="{cycle}">
		<td>{$filters[if].name|escape}</td>
		<td>
		{if $filters[if].format eq "d" or $filters[if].format eq "m"}
			<select name="f_{$filters[if].fieldId}[]" size="5"{if $filters[if].format eq "m"} multiple="multiple"{/if}> 
			<option value=""{if !$filters[if].selected} selected="selected"{/if}>{tr}Any{/tr}</option>
			{section name=io loop=$filters[if].opts}
				<option value="{$filters[if].opts[io].id|escape}"{if $filters[if].opts[io].selected eq "y"} selected="selected"{/if}>{$filters[if].opts[io].name}</option>
			{/section}
			</select>
			{if $filters[if].format eq "m"} {tr}Tip: hold down CTRL to select multiple{/tr}{/if}
		{else}
			<input {if $filters[if].format eq "c"}type="checkbox"{else}type="radio"{/if} name="f_{$filters[if].fieldId}[]" value=""{if !$filters[if].selected} checked="checked"{/if} />{tr}Any{/tr}</input><br />
			{section name=io loop=$filters[if].opts}
				<input {if $filters[if].format eq "c"}type="checkbox"{else}type="radio"{/if} name="f_{$filters[if].fieldId}[]" value="{$filters[if].opts[io].id|escape}"{if $filters[if].opts[io].selected eq "y"} checked="checked"{/if} /> {$filters[if].opts[io].name}</input><br />
			{/section}
		{/if}
		</td>
	</tr>
{/section}
<tr><td>&nbsp;</td><td><input type="submit" name="filter" value="{tr}filter{/tr}" /></td></tr>
</table>
</form>
{/strip}
