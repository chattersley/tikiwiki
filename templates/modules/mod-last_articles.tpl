{* $Header: /cvsroot-fuse/tikiwiki/tiki/templates/modules/mod-last_articles.tpl,v 1.9.6.6 2005/10/25 04:15:27 dimaz-z Exp $ *}

{if $feature_articles eq 'y'}
{if $nonums eq 'y'}
{eval var="<a href=\"tiki-view_articles.php\">{tr}Last `$module_rows` articles{/tr}</a>" assign="tpl_module_title"}
{else}
{eval var="<a href=\"tiki-view_articles.php\">{tr}Last articles{/tr}</a>" assign="tpl_module_title"}
{/if}
{tikimodule title=$tpl_module_title name="last_articles" flip=$module_params.flip decorations=$module_params.decorations}
  <table  border="0" cellpadding="1" cellspacing="0" width="100%">
    {section name=ix loop=$modLastArticles}
      <tr>
        {if $nonums != 'y'}<td class="module">{$smarty.section.ix.index_next})</td>{/if}
        <td class="module">
		  {if $absurl == 'y'}
          <a class="linkmodule" href="{$feature_server_name}tiki-read_article.php?articleId={$modLastArticles[ix].articleId}" title="{$modLastArticles[ix].publishDate|tiki_short_datetime}, by {$modLastArticles[ix].author}">
            {$modLastArticles[ix].title}
          </a>
		  {else}
		  <a class="linkmodule" href="tiki-read_article.php?articleId={$modLastArticles[ix].articleId}" title="{$modLastArticles[ix].publishDate|tiki_short_datetime}, by {$modLastArticles[ix].author}">
            {$modLastArticles[ix].title}
          </a>
		  {/if}
        </td>
      </tr>
    {/section}
  </table>
{/tikimodule}
{/if}
