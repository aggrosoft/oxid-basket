[{oxscript include="js/libs/jqBootstrapValidation.min.js" priority=10}]
[{oxscript add="$('input,select,textarea').not('[type=submit]').jqBootstrapValidation();"}]
<div class="login-condensed">
    <form class="js-oxValidate" id="optionLogin" name="login" action="[{$oViewConf->getSslSelfLink()}]" method="post" role="form" novalidate="novalidate">

        <h3 class="checkout-header mb-4">[{oxmultilang ident="CHECKOUT_ALREADY_CUSTOMER_AT" args=$oxcmp_shop->oxshops__oxname->value }]</h3>

            <div class="hidden">
                [{$oViewConf->getHiddenSid()}]
                [{$oViewConf->getNavFormParams()}]
                <input type="hidden" name="fnc" value="login_noredirect">
                <input type="hidden" name="cl" value="[{$oViewConf->getActiveClassName()}]">
            </div>
            [{block name="checkout_options_login_text"}]

            [{/block}]
            [{assign var="aErrors" value=$oView->getFieldValidationErrors()}]
            <div class="form-group [{if $aErrors}]oxInValid[{/if}]">
                <label for="lgn_usr">[{oxmultilang ident="EMAIL_ADDRESS"}]</label>
                <input type="text" id="lgn_usr" name="lgn_usr" autocomplete="email" class="form-control textbox js-oxValidate js-oxValidate_notEmpty" placeholder="[{oxmultilang ident="EMAIL_ADDRESS"}]" required="required">
                <div class="help-block"></div>
            </div>
            <div class="form-group [{if $aErrors}]oxInValid[{/if}]">
                <label for="lgn_pwd">[{oxmultilang ident="PASSWORD"}]</label>
                <input type="password" id="lgn_pwd" name="lgn_pwd" autocomplete="current-password" class="form-control js-oxValidate js-oxValidate_notEmpty textbox stepsPasswordbox" placeholder="[{oxmultilang ident="PASSWORD"}]" required="required">
                <div class="help-block"></div>
                <div class="text-muted small"><a class="forgotPasswordOpener" id="step2PswdOpener" href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=forgotpwd"}]" title="[{oxmultilang ident="FORGOT_PASSWORD"}]">[{oxmultilang ident="FORGOT_PASSWORD"}]</a></div>
            </div>
            <button type="submit" class="btn btn-primary btn-block submitButton">[{oxmultilang ident="LOGIN"}]&nbsp;<i class="fas fa-lock"></i></button>
    </form>

    [{capture assign="sCustomLoginMethods"}][{strip}]
        [{block name="checkout_custom_login"}]
        [{if $oViewConf->isModuleActive('aspaypal') && $oViewConf->isExpressCheckoutActive()}]
            <div class="text-muted text-center mb-2">
                [{oxmultilang ident="CHECKOUT_LOGIN_PAYPAL"}]
            </div>
            <form action="[{ $oViewConf->getSelfLink() }]" class="paypal-express-checkout-button w-100 text-center">
                [{ $oViewConf->getHiddenSid() }]
                <input type="hidden" name="cl" value="aspaypal_express_checkout">
                <input type="image" name="submit" src="[{$oViewConf->getImageUrl()}][{ $oViewConf->getCurrentLanguage() }]-btn-expresscheckout.gif" />
            </form>
        [{/if}]
        [{/block}]
    [{/strip}][{/capture}]

    [{if $sCustomLoginMethods}]
    <h4 class="login-sub-header d-flex mb-3 mt-3">
        <div class="col my-auto p-0">
            <hr class="m-0"/>
        </div>
        <div class="col-auto"><span class="text-muted small">[{oxmultilang ident="CHECKOUT_LOGIN_OR"}]</span></div>
        <div class="col my-auto p-0">
            <hr class="m-0"/>
        </div>
    </h4>
    [{$sCustomLoginMethods}]
    [{/if}]
</div>
