{* $Header: /cvsroot-fuse/tikiwiki/tiki/templates/modules/mod-forums_last_topics.tpl,v 1.7.10.2 2005/09/05 12:40:13 yonixxx Exp $ *}

{if $feature_forums eq 'y'}
{if $nonums eq 'y'}
{eval var="{tr}Last `$module_rows` forum topics{/tr}" assign="tpl_module_title"}
{else}
{eval var="{tr}Last forum topics{/tr}" assign="tpl_module_title"}
{/if}
{tikimodule title=$tpl_module_title name="forums_last_topics" flip=$module_params.flip decorations=$module_params.decorations}
  <table  border="0" cellpadding="1" cellspacing="0" width="100%">
    {section name=ix loop=$modForumsLastTopics}
      <tr>
        {if $nonums != 'y'}<td valign="top" class="module">{$smarty.section.ix.index_next})</td>{/if}
        <td class="module">
		  {if $absurl == 'y'}
          <a class="linkmodule" href="{$feature_server_name}{$modForumsLastTopics[ix].href}">
            {$modForumsLastTopics[ix].name}
          </a>
		  {else}
          <a class="linkmodule" href="{$modForumsLastTopics[ix].href}">
            {$modForumsLastTopics[ix].name}
          </a>
		  {/if}
        </td>
      </tr>
    {/section}
  </table>
{/tikimodule}
{/if}
