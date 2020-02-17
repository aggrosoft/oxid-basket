[{if !$oxcmp_user }]
    [{include file="form/user_checkout_registration.tpl"}]
[{/if}]

[{block name="checkout_user_change"}]
    [{if $oxcmp_user}]
        [{include file="form/user_checkout_change.tpl"}]
    [{/if}]
[{/block}]