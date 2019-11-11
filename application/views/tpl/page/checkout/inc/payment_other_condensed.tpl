<div class="list-group-item d-flex flex-column  payment-option[{if $oView->getCheckedPaymentId() == $paymentmethod->oxpayments__oxid->value}] activePayment[{/if}]">
    <label for="payment_[{$sPaymentID}]" class="justify-content-between align-items-center d-flex w-100">
        <span>
            <input id="payment_[{$sPaymentID}]" type="radio" name="paymentid" value="[{$sPaymentID}]" [{if $oView->getCheckedPaymentId() == $paymentmethod->oxpayments__oxid->value}]checked[{/if}]>
            [{$paymentmethod->oxpayments__oxdesc->value}]
        </span>
        [{assign var="oPaymentPrice" value=$paymentmethod->getPrice() }]
        [{if $oPaymentPrice && $oPaymentPrice->getBruttoPrice() > 0 }]
            <span class="badge badge-info badge-pill">
                [{if $oViewConf->isFunctionalityEnabled('blShowVATForPayCharge') }]
                    [{strip}]
                        ([{oxprice price=$oPaymentPrice->getNettoPrice() currency=$currency}]
                        [{if $oPaymentPrice->getVatValue() > 0}]
                            [{oxmultilang ident="PLUS_VAT"}] [{oxprice price=$oPaymentPrice->getVatValue() currency=$currency}]
                        [{/if}])
                    [{/strip}]
                [{else}]
                    +[{oxprice price=$oPaymentPrice->getBruttoPrice() currency=$currency}]
                [{/if}]
            </span>
        [{/if}]
    </label>
    <div class="payment-option-details [{if $oView->getCheckedPaymentId() != $paymentmethod->oxpayments__oxid->value}]d-none[{/if}]">
        [{block name="checkout_payment_longdesc"}]
        [{if $paymentmethod->oxpayments__oxlongdesc->value|strip_tags|trim}]
        <div class="desc border-top mt-2 pt-2">
            [{$paymentmethod->oxpayments__oxlongdesc->getRawValue()}]
        </div>
        [{/if}]
        [{/block}]

        [{foreach from=$paymentmethod->getDynValues() item=value name=PaymentDynValues}]
        <div class="form-row">
            <div class="form-group mt-2 pt-2 col-12">
                <label class="control-label" for="[{$sPaymentID}]_[{$smarty.foreach.PaymentDynValues.iteration}]">[{$value->name}]</label>
                <input id="[{$sPaymentID}]_[{$smarty.foreach.PaymentDynValues.iteration}]" type="text" class="form-control textbox" size="20" maxlength="64" name="dynvalue[[{$value->name}]]" value="[{$value->value}]">
            </div>
        </div>
        [{/foreach}]
    </div>


</div>
