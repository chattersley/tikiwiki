{* $Header: /cvsroot-fuse/tikiwiki/tiki/templates/modules/mod-last_modif_tracker_items.tpl,v 1.8.10.2 2005/04/23 23:30:32 ohertel Exp $ *}

{if $feature_trackers eq 'y'}
{if $nonums eq 'y'}
{eval var="{tr}Last `$module_rows` Modified Items{/tr}" assign="tpl_module_title"}
{else}
{eval var="{tr}Last Modified Items{/tr}" assign="tpl_module_title"}
{/if}
{tikimodule title=$tpl_module_title name="last_modif_tracker_items" flip=$module_params.flip decorations=$module_params.decorations}
  <table  border="0" cellpadding="0" cellspacing="0">
    {section name=ix loop=$modLastModifItems}
      <tr>
        {if $nonums != 'y'}<td class="module" >{$smarty.section.ix.index_next})</td>{/if}
        <td class="module">
          <a class="linkmodule" href="tiki-view_tracker_item.php?itemId={$modLastModifItems[ix].itemId}&amp;trackerId={$modLastModifItems[ix].trackerId}">
              {$modLastModifItems[ix].subject}
          </a>
        </td>
      </tr>
    {/section}
  </table>
{/tikimodule}
{/if}
