{* $Header: /cvsroot-fuse/tikiwiki/tiki/templates/categobjects.tpl,v 1.1.2.4 2006/02/22 02:20:21 luciash Exp $ *}

<div class="catblock">
<div class="cattitle">
{foreach name=for key=id item=title from=$titles}
<a href="tiki-browse_categories.php?parentId={$id}">{$title}</a>
{if !$smarty.foreach.for.last} &amp; {/if}
{/foreach}
</div>
<div class="catlists">
{foreach key=t item=i from=$listcat}
<b>{tr}{$t}{/tr}:</b>
{if $one eq 'y'}<br />{/if}
{section name=o loop=$i}
<a href="{$i[o].href}" class="link">{$i[o].name}</a>
{if $one eq 'y'}<br />{else !$smarty.section.o.last} &middot; {/if}
{/section}<br />
{/foreach}
</div>
</div>
