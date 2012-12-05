<div id="newsletter">
	{if isset($msg) && $msg}
		<p class="{if $nw_error}warning_inline{else}success_inline{/if}">{$msg}</p>
	{/if}
	<form method="post" action="{$link->getPageLink('index')}">
		<input type="text" name="email" placeholder="Votre adresse mail"/>
		<input type="hidden" name="action" value="0" />
		<input type="submit" value="" name="submitNewsletter" />
	</form>
</div>


<!-- Block Newsletter module

<div id="newsletter_block_left" class="block">
	<h4>{l s='Newsletter' mod='blocknewsletter'}</h4>
	<div class="block_content">
	{if isset($msg) && $msg}
		<p class="{if $nw_error}warning_inline{else}success_inline{/if}">{$msg}</p>
	{/if}
		<form action="{$link->getPageLink('index')}" method="post">
			<p>
				{* @todo use jquery (focusin, focusout) instead of onblur and onfocus *}
				<input type="text" name="email" size="18" 
					value="{if isset($value) && $value}{$value}{else}{l s='your e-mail' mod='blocknewsletter'}{/if}" 
					onfocus="javascript:if(this.value=='{l s='your e-mail' mod='blocknewsletter'}')this.value='';" 
					onblur="javascript:if(this.value=='')this.value='{l s='your e-mail' mod='blocknewsletter'}';" 
					class="inputNew" />
					<input type="submit" value="ok" class="button_mini" name="submitNewsletter" />
				<input type="hidden" name="action" value="0" />
			</p>
		</form>
	</div>
</div>
 /Block Newsletter module -->
