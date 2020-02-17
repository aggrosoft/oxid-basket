<div class="row">
    <div class="col-12 col-sm-7 col-md-7 col-lg-offset-1 checkout-register-change-column border-right">
        [{$smarty.block.parent}]
    </div>
    <div class="col-12 col-sm-5 col-lg-5 checkout-login-info-column">
        <hr class="d-sm-none"/>

        [{block name="checkout_trust_info"}]
        [{include file="widget/checkout/trustinfos.tpl"}]
        [{/block}]
    </div>
</div>