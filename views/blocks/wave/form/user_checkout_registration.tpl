[{oxscript include="js/libs/jqBootstrapValidation.min.js" priority=10}]

[{capture assign="sValidationJS"}]
    [{strip}]
        $('input,select,textarea').not('[type=submit]').jqBootstrapValidation(
        {
        filter: function()
        {
        if( $( '#shippingAddress' ).css( 'display' ) == 'block' )
        {
        return $(this).is(':visible, .selectpicker');
        }
        else
        {
        return $(this).is(':visible, #addressForm .selectpicker');
        }
        }
        }
        );
    [{/strip}]
[{/capture}]

[{oxscript add=$sValidationJS}]

[{assign var="aErrors" value=$oView->getFieldValidationErrors()}]


    <div class="row">
        <div class="col-12 col-sm-7 col-md-7 col-lg-offset-1 checkout-register-column order-1 order-sm-0 border-right">
            <form class="js-oxValidate" action="[{$oViewConf->getSslSelfLink()}]" name="order" method="post"
                  role="form" novalidate="novalidate">
                [{block name="user_checkout_registration_form"}]
                <div class="hidden">
                    [{$oViewConf->getHiddenSid()}]
                    [{$oViewConf->getNavFormParams()}]
                    <input type="hidden" name="cl" value="user">
                    <input type="hidden" name="option" value="3">
                    [{if !$oxcmp_user->oxuser__oxpassword->value}]
                        <input type="hidden" name="fnc" value="createuser">
                    [{else}]
                        <input type="hidden" name="fnc" value="changeuser">
                        <input type="hidden" name="lgn_cook" value="0">
                    [{/if}]
                    <input type="hidden" id="reloadAddress" name="reloadaddress" value="">
                    <input type="hidden" name="blshowshipaddress" value="1">
                </div>
                <h3 class="checkout-header mb-4">[{oxmultilang ident="CHECKOUT_USER_NEW_CUSTOMER"}][{ $oxcmp_shop->oxshops__oxname->value }]?</h3>
                [{include file="form/fieldset/user_billing_condensed.tpl" noFormSubmit=true blSubscribeNews=false blOrderRemark=true}]

                <h4 class="form-row checkout-sub-header mb-3">
                    <div class="col-auto">[{oxmultilang ident="CHECKOUT_OPEN_ACCOUNT_HEAD"}] <span class="text-muted small">[{oxmultilang ident="CHECKOUT_OPTIONAL_INFO"}]</span></div>
                    <div class="col my-auto">
                        <hr class="m-0"/>
                    </div>
                </h4>

                <div class="custom-control custom-checkbox">
                    <input type="hidden" name="option" value="1"/>
                    <input class="custom-control-input" value="3" type="checkbox" name="option" id="showRegistration">
                    <label class="custom-control-label" for="showRegistration">[{oxmultilang ident="CHECKOUT_OPEN_ACCOUNT"}]</label>
                </div>

                <div class="mt-3" id="registrationForm" [{if $oView->getLoginOption() !== 3}]style="display:none;"[{/if}]>
                    [{include file="form/fieldset/user_account_condensed.tpl"}]
                </div>

                <h4 class="form-row checkout-sub-header mb-3 mt-3">
                    <div class="col-auto">[{oxmultilang ident="CHECKOUT_SHIPPING_ADDRESS_HEAD"}]</div>
                    <div class="col my-auto">
                        <hr class="m-0"/>
                    </div>
                </h4>

                <div class="custom-control custom-checkbox mb-3">
                    <input class="custom-control-input" value="0" type="checkbox" name="blshowshipaddress" id="showShipAddress" [{if !$oView->showShipAddress()}]checked[{/if}]>
                    <label class="custom-control-label" for="showShipAddress">[{oxmultilang ident="USE_BILLINGADDRESS_FOR_SHIPPINGADDRESS"}]</label>
                </div>
                <div id="shippingAddress" [{if !$oView->showShipAddress()}]style="display: none;"[{/if}] class="mb-3">
                    [{include file="form/fieldset/user_shipping_condensed.tpl" noFormSubmit=true}]
                </div>

                [{block name="user_checkout_registration_next_step_bottom"}]
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

            </form>

        </div>
        <div class="col-12 col-sm-5 col-lg-5 checkout-login-column order-0 order-sm-1">
            [{block name="checkout_options_login"}]
                [{include file="form/login_condensed.tpl"}]
            [{/block}]
            <hr/>
            [{block name="checkout_trust_info"}]
                [{include file="widget/checkout/trustinfos.tpl"}]
            [{/block}]
        </div>
    </div>

    [{oxscript add="$('#showShipAddress').change( function() { $('#shippingAddress').toggle($(this).is(':not(:checked)'));});"}]
    [{oxscript add="$('#showRegistration').change( function() { $('#registrationForm').toggle($(this).is(':checked'));});"}]
    [{/block}]
[{include file="form/fieldset/delete_shipping_address_modal.tpl"}]
