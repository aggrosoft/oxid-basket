[{oxscript include="js/widgets/oxpayment.min.js" priority=10}]
[{oxscript include="js/libs/jqBootstrapValidation.min.js" priority=10}]
[{oxscript add="$( '#payment' ).oxPayment();"}]
[{oxscript add="$('input,select,textarea').not('[type=submit]').jqBootstrapValidation();"}]

<form action="[{$oViewConf->getSslSelfLink()}]" class="form js-oxValidate payment" id="payment" name="order" method="post" novalidate="novalidate">
    <div class="hidden">
        [{$oViewConf->getHiddenSid()}]
        [{$oViewConf->getNavFormParams()}]
        <input type="hidden" name="cl" value="[{$oViewConf->getActiveClassName()}]">
        <input type="hidden" name="fnc" value="validatepayment">
    </div>

    <h4 class="form-row checkout-sub-header mb-3 mt-3">
        <div class="col-auto">
            [{oxmultilang ident="PAYMENT_METHOD"}]
        </div>
        <div class="col my-auto">
            <hr class="m-0"/>
        </div>
    </h4>

    [{if $oView->getPaymentList()}]
        <div class="list-group mb-3">
            [{assign var="inptcounter" value="-1"}]
            [{foreach key=sPaymentID from=$oView->getPaymentList() item=paymentmethod name=PaymentSelect}]
                [{assign var="inptcounter" value="`$inptcounter+1`"}]
                [{block name="select_payment"}]
                    [{include file="page/checkout/inc/payment_other_condensed.tpl"}]
                [{/block}]
            [{/foreach}]
        </div>


        [{block name="checkout_payment_nextstep"}]
            [{if $oView->isLowOrderPrice()}]
                <div class="alert alert-info">
                    <b>[{oxmultilang ident="MIN_ORDER_PRICE"}] [{$oView->getMinOrderPrice()}] [{$currency->sign}]</b>
                </div>
            [{else}]

                <div class="cart-buttons-bottom form-row">
                    <div class="col-12 col-lg-4 order-1 order-lg-0">
                        <a href="[{oxgetseourl ident=$oViewConf->getOrderLink()}]" class="btn btn-outline-secondary btn-lg btn-block"
                           id="userBackStepBottom">[{oxmultilang ident="PREVIOUS_STEP"}]</a>
                    </div>
                    <div class="col-12 col-lg-8 mb-2 mb-lg-0 order-0 order-lg-1">
                        <button id="userNextStepBottom" class="btn btn-primary btn-lg btn-block" name="userform"
                                type="submit">[{oxmultilang ident="CHECKOUT_CONTINUE_TO_ORDER"}]</button>
                    </div>
                </div>

            [{/if}]
        [{/block}]

    [{elseif $oView->getEmptyPayment()}]
        [{block name="checkout_payment_nopaymentsfound"}]
            <div class="lineBlock"></div>
            <h3 id="paymentHeader" class="blockHead">[{oxmultilang ident="PAYMENT_INFORMATION"}]</h3>
            [{oxifcontent ident="oxnopaymentmethod" object="oCont"}]
            [{$oCont->oxcontents__oxcontent->value}]
            [{/oxifcontent}]
            <input type="hidden" name="paymentid" value="oxempty">
            <div class="lineBox clear">
                <div class="card bg-light cart-buttons">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-12 col-md-6">
                                <a href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=user"}]" class="btn btn-outline-dark float-left prevStep submitButton largeButton"><i class="fa fa-caret-left"></i> [{oxmultilang ident="PREVIOUS_STEP"}]</a>
                            </div>
                            <div class="col-12 col-md-6 text-right">
                                <button type="submit" name="userform" class="btn btn-primary pull-right submitButton nextStep largeButton" id="paymentNextStepBottom">[{oxmultilang ident="CONTINUE_TO_NEXT_STEP"}] <i class="fa fa-caret-right"></i></button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        [{/block}]
    [{/if}]
</form>

</div>[{* this row was opened in change_shipping.tpl override *}]