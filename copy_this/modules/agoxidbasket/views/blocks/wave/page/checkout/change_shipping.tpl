<div class="shipping-payment-row"> [{* this row will close in change_payment.tpl override *}]

    [{if $oView->getAllSets() && $oView->getAllSets()|@count > 1}]
        [{assign var="aErrors" value=$oView->getFieldValidationErrors()}]

            <h4 class="form-row checkout-sub-header mb-3 mt-3">
                <div class="col-auto">
                    [{if $oView->getAllSetsCnt() > 1}][{oxmultilang ident="SELECT_SHIPPING_METHOD"}][{else}][{oxmultilang ident="SELECTED_SHIPPING_CARRIER"}][{/if}]
                </div>
                <div class="col my-auto">
                    <hr class="m-0"/>
                </div>
            </h4>


        <form action="[{$oViewConf->getSslSelfLink()}]" name="shipping" id="shipping" method="post">
            <div class="hidden">
                [{$oViewConf->getHiddenSid()}]
                [{$oViewConf->getNavFormParams()}]
                <input type="hidden" name="cl" value="[{$oViewConf->getActiveClassName()}]">
                <input type="hidden" name="fnc" value="changeshipping">
            </div>


            <div class="list-group">
                [{block name="act_shipping"}]
                    [{foreach key=sShipID from=$oView->getAllSets() item=oShippingSet name=ShipSetSelect}]
                        <label for="sShipSet_[{$sShipID}]" class="list-group-item list-group-item-action [{if $oShippingSet->blSelected}]active[{/if}] d-flex justify-content-between align-items-center" [{$oShippingSet->oxdeliveryset__oxtitle->value}]>
                            <span>
                                <input value="[{$sShipID}]" type="radio" id="sShipSet_[{$sShipID}]" name="sShipSet" [{if $oShippingSet->blSelected}]checked[{/if}]>
                                [{$oShippingSet->oxdeliveryset__oxtitle->value}]
                            </span>
                            <span class="badge badge-info badge-pill">
                                [{assign var=oDelPrice value=$oxcmp_basket->getPriceForDelivery($sShipID)}]
                                [{if $oDelPrice->getBruttoPrice() > 0}]
                                    [{oxprice price=$oxcmp_basket->getPriceForDelivery($sShipID) currency=$currency}]
                                [{else}]
                                    [{oxmultilang ident="CHECKOUT_SHIPPING_FREE_SHIPPING"}]
                                [{/if}]
                            </span>
                        </label>
                    [{/foreach}]
                [{/block}]
            </div>

        </form>
    [{/if}]

[{capture assign=pageScript}]
$(function(){
    $('form#shipping input[type="radio"]').change(function(){
        $('.shipping-payment-row').css('opacity', '0.5');
        $('form#shipping').submit();
    });
});
[{/capture}]
[{oxscript add=$pageScript}]