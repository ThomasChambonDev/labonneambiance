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
*  @version  Release: $Revision: 6594 $
*  @license    http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*}

{if isset($orderby) AND isset($orderway)}

{* On 1.5 the var request is setted on the front controller. The next lines assure the retrocompatibility with some modules *}
{if !isset($request)}
	<!-- Sort products -->
	{if isset($smarty.get.id_category) && $smarty.get.id_category}
		{assign var='request' value=$link->getPaginationLink('category', $category, false, true)}
	{elseif isset($smarty.get.id_manufacturer) && $smarty.get.id_manufacturer}
		{assign var='request' value=$link->getPaginationLink('manufacturer', $manufacturer, false, true)}
	{elseif isset($smarty.get.id_supplier) && $smarty.get.id_supplier}
		{assign var='request' value=$link->getPaginationLink('supplier', $supplier, false, true)}
	{else}
		{assign var='request' value=$link->getPaginationLink(false, false, false, true)}
	{/if}
{/if}

<script type="text/javascript">
//<![CDATA[
$(document).ready(function()
{
	$('#selectPrductSort').change(function()
	{
		var requestSortProducts = '{$request}';
		var splitData = $(this).val().split(':');
		document.location.href = requestSortProducts + ((requestSortProducts.indexOf('?') < 0) ? '?' : '&') + 'orderby=' + splitData[0] + '&orderway=' + splitData[1];
	});
});
//]]>
</script>

<form id="productsSortForm" action="{$request|escape:'htmlall':'UTF-8'}">
	<p class="select">
		<label for="selectPrductSort">{l s='Sort by'}</label>
		<select id="selectPrductSort">
			<option value="{$orderbydefault|escape:'htmlall':'UTF-8'}:{$orderwaydefault|escape:'htmlall':'UTF-8'}" {if $orderby eq $orderbydefault}selected="selected"{/if}>{l s='--'}</option>
			{if !$PS_CATALOG_MODE}
				<option value="price:asc" {if $orderby eq 'price' AND $orderway eq 'asc'}selected="selected"{/if}>{l s='Price: lowest first'}</option>
				<option value="price:desc" {if $orderby eq 'price' AND $orderway eq 'desc'}selected="selected"{/if}>{l s='Price: highest first'}</option>
			{/if}
			<option value="name:asc" {if $orderby eq 'name' AND $orderway eq 'asc'}selected="selected"{/if}>{l s='Product Name: A to Z'}</option>
			<option value="name:desc" {if $orderby eq 'name' AND $orderway eq 'desc'}selected="selected"{/if}>{l s='Product Name: Z to A'}</option>
			{if !$PS_CATALOG_MODE}
				<option value="quantity:desc" {if $orderby eq 'quantity' AND $orderway eq 'desc'}selected="selected"{/if}>{l s='In-stock first'}</option>
			{/if}
		</select>
	</p>
</form>
<!-- /Sort products -->
{/if}
