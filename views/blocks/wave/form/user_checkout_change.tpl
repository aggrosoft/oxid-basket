<style>
    .floating-label{
        position: absolute;
        right: 0;
        top: -1.5em;
    }
</style>
<form class="form" action="[{$oViewConf->getSslSelfLink()}]" name="order" method="post" novalidate="novalidate">
    [{block name="user_checkout_change_form"}]
        [{assign var="aErrors" value=$oView->getFieldValidationErrors()}]
        [{$oViewConf->getHiddenSid()}]
        [{$oViewConf->getNavFormParams()}]
        <input type="hidden" name="cl" value="user">
        <input type="hidden" name="option" value="[{$oView->getLoginOption()}]">
        <input type="hidden" name="fnc" value="changeuser">
        <input type="hidden" name="lgn_cook" value="0">
        <input type="hidden" name="blshowshipaddress" value="1">

        [{block name="user_checkout_change_next_step_top"}]

        [{/block}]

    <div class="row">
        <div class="col-12 col-sm-7 col-md-7 col-lg-offset-1 checkout-register-change-column border-right">
            <h3 class="mt-2">[{oxmultilang ident="CHECKOUT_ALREADY_LOGGED_IN"}]</h3>
            <h4 class="form-row checkout-sub-header mb-3 mt-3">
                <div class="col-auto">[{oxmultilang ident="CHECKOUT_MY_CUSTOMER_INFO"}]</div>
                <div class="col my-auto">
                    <hr class="m-0"/>
                    <span class="floating-label text-muted text-uppercase"><a id="userChangeAddress" class="btn btn-link btn-sm">[{oxmultilang ident="CHECKOUT_CHANGE"}]</a></span>
                </div>
            </h4>
            [{oxscript add="$('#userChangeAddress').click( function() { $('#addressForm, #addressText').toggle();return false;});"}]

            [{block name="user_checkout_billing_form"}]
                <div [{if !$aErrors|@count }]style="display: none;"[{/if}] id="addressForm">
                    [{if not $oxcmp_user->oxuser__oxpassword->value}]
                        [{include file="form/fieldset/user_email.tpl"}]
                    [{/if}]
                    [{include file="form/fieldset/user_billing.tpl" noFormSubmit=true blSubscribeNews=true blOrderRemark=true}]
                </div>
            [{/block}]
            [{block name="user_checkout_billing_feedback"}]
                <div class="address-text" id="addressText">
                    [{include file="widget/address/billing_address.tpl" noFormSubmit=true blSubscribeNews=true blOrderRemark=true}]
                </div>
            [{/block}]

            <h4 class="form-row checkout-sub-header mb-3 mt-3">
                <div class="col-auto">[{oxmultilang ident="CHECKOUT_MY_DELIVERY_ADDRESS"}]</div>
                <div class="col my-auto">
                    <hr class="m-0"/>
                </div>
            </h4>

            <div class="custom-control custom-checkbox mb-3">
                <input class="custom-control-input" value="0" type="checkbox" name="blshowshipaddress" id="showShipAddress" [{if !$oView->showShipAddress()}]checked[{/if}]>
                <label class="custom-control-label" for="showShipAddress">[{oxmultilang ident="USE_BILLINGADDRESS_FOR_SHIPPINGADDRESS"}]</label>
            </div>

            <div id="shippingAddress" [{if !$oView->showShipAddress()}]style="display: none;"[{/if}] class="mb-3">
                [{include file="form/fieldset/user_shipping_condensed.tpl" noFormSubmit=true onChangeClass='user'}]
                [{oxscript add="$('#showShipAddress').change( function() { $('#shippingAddress').toggle($(this).is(':not(:checked)'));});"}]
            </div>


            [{block name="user_checkout_change_next_step_bottom"}]
                <div class="cart-buttons-bottom form-row">
                    <div class="col-12 col-lg-4 order-1 order-lg-0">
                        <a href="[{oxgetseourl ident=$oViewConf->getBasketLink()}]" class="btn btn-outline-secondary btn-lg btn-block"
                           id="userBackStepBottom">[{oxmultilang ident="PREVIOUS_STEP"}]</a>
                    </div>
                    <div class="col-12 col-lg-8 mb-2 mb-lg-0 order-0 order-lg-1">
                        <button id="userNextStepBottom" class="btn btn-primary btn-lg btn-block" name="userform"
                                type="submit">[{oxmultilang ident="CHECKOUT_CONTINUE_TO_SHIPPING_PAYMENT"}]</button>
                    </div>
                </div>
            [{/block}]

        </div>
        <div class="col-12 col-sm-5 col-lg-5 checkout-login-info-column">
            <hr class="d-sm-none"/>

            [{block name="checkout_trust_info"}]
                [{include file="widget/checkout/trustinfos.tpl"}]
            [{/block}]
        </div>
    </div>

    [{/block}]
</form>
[{include file="form/fieldset/delete_shipping_address_modal.tpl"}]