{*
* 2007-2012 PrestaShop
*
* NOTICE OF LICENSE
*
* This source file is subject to the Academic Free License (AFL 3.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also available through the world-wide-web at this URL:
* http://opensource.org/licenses/afl-3.0.php
* If you did not receive a copy of the license and are unable to
* obtain it through the world-wide-web, please send an email
* to license@prestashop.com so we can send you a copy immediately.
*
* DISCLAIMER
*
* Do not edit or add to this file if you wish to upgrade PrestaShop to newer
* versions in the future. If you wish to customize PrestaShop for your
* needs please refer to http://www.prestashop.com for more information.
*
*  @author PrestaShop SA <contact@prestashop.com>
*  @copyright  2007-2012 PrestaShop SA
*  @version  Release: $Revision: 6844 $
*  @license    http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*}

{* include file="$tpl_dir./breadcrumb.tpl" *}
{include file="$tpl_dir./errors.tpl"}

{if isset($category)}
	{if $category->id AND $category->active}
		<h1>
			{strip}
				{$category->name|escape:'htmlall':'UTF-8'}
				{if isset($categoryNameComplement)}
					{$categoryNameComplement|escape:'htmlall':'UTF-8'}
				{/if}
			{/strip}
		</h1>
		
		{*
			<div class="resumecat category-product-count">
				{include file="$tpl_dir./category-count.tpl"}
			</div>
			
			{if $scenes || $category->description || $category->id_image}
			<div class="content_scene_cat">
				{if $scenes}
					<!-- Scenes -->
					{include file="$tpl_dir./scenes.tpl" scenes=$scenes}
				{else}
					<!-- Category image -->
					{if $category->id_image}
					<div class="align_center">
						<img src="{$link->getCatImageLink($category->link_rewrite, $category->id_image, 'category')}" alt="{$category->name|escape:'htmlall':'UTF-8'}" title="{$category->name|escape:'htmlall':'UTF-8'}" id="categoryImage" width="{$categorySize.width}" height="{$categorySize.height}" />
					</div>
					{/if}
				{/if}

				{if $category->description}
					<div class="cat_desc">
						<p>{$category->description}</p>
						<a href="#" class="lnk_more">{l s='More'}</a>
					</div>
				{/if}
			</div>
			{/if}
			{if isset($subcategories)}
			<!-- Subcategories -->
			<div id="subcategories">
				<h3>{l s='Subcategories'}</h3>
				<ul class="inline_list">
				{foreach from=$subcategories item=subcategory}
					<li class="clearfix">
						<a href="{$link->getCategoryLink($subcategory.id_category, $subcategory.link_rewrite)|escape:'htmlall':'UTF-8'}" title="{$subcategory.name|escape:'htmlall':'UTF-8'}" class="img">
							{if $subcategory.id_image}
								<img src="{$link->getCatImageLink($subcategory.link_rewrite, $subcategory.id_image, 'medium')}" alt="" width="{$mediumSize.width}" height="{$mediumSize.height}" />
							{else}
								<img src="{$img_cat_dir}default-medium.jpg" alt="" width="{$mediumSize.width}" height="{$mediumSize.height}" />
							{/if}
						</a>
						<a href="{$link->getCategoryLink($subcategory.id_category, $subcategory.link_rewrite)|escape:'htmlall':'UTF-8'}" class="cat_name">{$subcategory.name|escape:'htmlall':'UTF-8'}</a>
						{if $subcategory.description}
							<p class="cat_desc">{$subcategory.description}</p>
						{/if}
					</li>
				{/foreach}
				</ul>
				<br class="clear"/>
			</div>
			{/if}
		*}

		{if $products}
			{* 
				<div class="content_sortPagiBar">
					{include file="$tpl_dir./pagination.tpl"}
					<div class="sortPagiBar clearfix">
						{include file="./product-sort.tpl"}
						{include file="./product-compare.tpl"}
						{include file="./nbr-product-page.tpl"}
					</div>
				</div>
			*}
			
			{if ($category->id == 3)}
				<div class="bandeau_jeux"></div>
				{* include file="./filter-list.tpl" *}
			{/if}

			{if ($category->id == 5)}
				<div class="bandeau_packs"></div>
		    {/if}
			
			{include file="./product-list.tpl" products=$products}
			
			<div class="content_sortPagiBar">
				{*
				<div class="sortPagiBar clearfix">
					{include file="./product-sort.tpl"}
					{include file="./product-compare.tpl"}
					{include file="./nbr-product-page.tpl"}
				</div>
				*}
				{include file="./pagination.tpl"}
			</div>
			
		{elseif !isset($subcategories)}
			<p class="warning">{l s='There are no products in this category.'}</p>
		{/if}
	{elseif $category->id}
		<p class="warning">{l s='This category is currently unavailable.'}</p>
	{/if}
{/if}