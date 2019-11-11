[{assign var="invadr" value=$oView->getInvoiceAddress()}]
[{assign var="blBirthdayRequired" value=$oView->isFieldRequired(oxuser__oxbirthdate)}]

[{if isset( $invadr.oxuser__oxbirthdate.month )}]
    [{assign var="iBirthdayMonth" value=$invadr.oxuser__oxbirthdate.month}]
[{elseif $oxcmp_user->oxuser__oxbirthdate->value && $oxcmp_user->oxuser__oxbirthdate->value != "0000-00-00"}]
    [{assign var="iBirthdayMonth" value=$oxcmp_user->oxuser__oxbirthdate->value|regex_replace:"/^([0-9]{4})[-]/":""|regex_replace:"/[-]([0-9]{1,2})$/":""}]
[{else}]
    [{assign var="iBirthdayMonth" value=0}]
[{/if}]

[{if isset( $invadr.oxuser__oxbirthdate.day )}]
    [{assign var="iBirthdayDay" value=$invadr.oxuser__oxbirthdate.day}]
[{elseif $oxcmp_user->oxuser__oxbirthdate->value && $oxcmp_user->oxuser__oxbirthdate->value != "0000-00-00"}]
    [{assign var="iBirthdayDay" value=$oxcmp_user->oxuser__oxbirthdate->value|regex_replace:"/^([0-9]{4})[-]([0-9]{1,2})[-]/":""}]
[{else}]
    [{assign var="iBirthdayDay" value=0}]
[{/if}]

[{if isset( $invadr.oxuser__oxbirthdate.year )}]
    [{assign var="iBirthdayYear" value=$invadr.oxuser__oxbirthdate.year}]
[{elseif $oxcmp_user->oxuser__oxbirthdate->value && $oxcmp_user->oxuser__oxbirthdate->value != "0000-00-00"}]
    [{assign var="iBirthdayYear" value=$oxcmp_user->oxuser__oxbirthdate->value|regex_replace:"/[-]([0-9]{1,2})[-]([0-9]{1,2})$/":""}]
[{else}]
    [{assign var="iBirthdayYear" value=0}]
[{/if}]
[{if isset( $invadr.oxuser__oxsal )}]
    [{assign var="oxuser__oxsal" value=$invadr.oxuser__oxsal}]
[{else}]
    [{assign var="oxuser__oxsal" value=$oxcmp_user->oxuser__oxsal->value}]
[{/if}]

<style>
    .floating-label{
        position: absolute;
        right: 0;
        top: -1.5em;
    }
</style>

<h4 class="form-row checkout-sub-header mb-3">
    <div class="col-auto">[{oxmultilang ident="CHECKOUT_USER_DATA"}]</div>
    <div class="col my-auto">
        <hr class="m-0"/>
        <small class="floating-label text-muted text-uppercase">[{oxmultilang ident="CHECKOUT_REQUIRED_FIELDS"}]</small>
    </div>
</h4>

<div class="form-row">
    <div class="form-group col-12 col-lg-4">
        <label class="w-100[{if $oView->isFieldRequired(oxuser__oxsal)}] req[{/if}]" for="invadr_oxuser__oxfname">[{oxmultilang ident="TITLE"}]</label>
        [{include file="form/fieldset/salutation_radios.tpl" name="invadr[oxuser__oxsal]" value=$oxuser__oxsal class="form-control" id="invadr_oxuser__oxfname"}]
    </div>
    <div class="form-group col">
        [{block name="user_account_username"}]
            <label class="req" for="userLoginName">[{oxmultilang ident="EMAIL_ADDRESS"}]</label>
            <input id="userLoginName" class="form-control js-oxValidate js-oxValidate_notEmpty js-oxValidate_email" type="email" name="lgn_usr" value="[{$oView->getActiveUsername()}]" required="required">
            <div class="help-block"></div>
        [{/block}]
    </div>
</div>
<div class="form-row">
    <div class="form-group col">
        <label class="[{if $oView->isFieldRequired(oxuser__oxfname)}] req[{/if}]">[{oxmultilang ident="FIRST_NAME"}]</label>
        <input class="form-control" type="text" maxlength="255" name="invadr[oxuser__oxfname]" value="[{if isset( $invadr.oxuser__oxfname )}][{$invadr.oxuser__oxfname}][{else}][{$oxcmp_user->oxuser__oxfname->value}][{/if}]"[{if $oView->isFieldRequired(oxuser__oxfname)}] required=""[{/if}]>
        [{include file="message/inputvalidation.tpl" aErrors=$aErrors.oxuser__oxfname}]
        <div class="help-block"></div>
    </div>
    <div class="form-group col">
        <label class="[{if $oView->isFieldRequired(oxuser__oxlname)}] req[{/if}]">[{oxmultilang ident="LAST_NAME"}]</label>
        <input class="form-control" type="text" maxlength="255" name="invadr[oxuser__oxlname]" value="[{if isset( $invadr.oxuser__oxlname )}][{$invadr.oxuser__oxlname}][{else}][{$oxcmp_user->oxuser__oxlname->value}][{/if}]"[{if $oView->isFieldRequired(oxuser__oxlname)}] required=""[{/if}]>
        [{include file="message/inputvalidation.tpl" aErrors=$aErrors.oxuser__oxlname}]
        <div class="help-block"></div>
    </div>
</div>


<h4 class="form-row checkout-sub-header mb-3">
    <div class="col-auto">[{oxmultilang ident="CHECKOUT_INVOICE_DATA"}]</div>
    <div class="col my-auto">
        <hr class="m-0"/>
    </div>
</h4>


<div class="form-row[{if $aErrors.oxuser__oxstreet}] text-danger[{/if}]">
    <label class="col-12 [{if $oView->isFieldRequired(oxuser__oxstreet) || $oView->isFieldRequired(oxuser__oxstreetnr)}] req[{/if}]">[{oxmultilang ident="STREET_AND_STREETNO"}]</label>

    <div class="form-group col-9">
        <input class="form-control" type="text" maxlength="255" name="invadr[oxuser__oxstreet]" value="[{if isset( $invadr.oxuser__oxstreet )}][{$invadr.oxuser__oxstreet}][{else}][{$oxcmp_user->oxuser__oxstreet->value}][{/if}]"[{if $oView->isFieldRequired(oxuser__oxstreet)}] required=""[{/if}]>
    </div>

    <div class="form-group col-3">
        <input class="form-control" type="text" maxlength="16" name="invadr[oxuser__oxstreetnr]" value="[{if isset( $invadr.oxuser__oxstreetnr )}][{$invadr.oxuser__oxstreetnr}][{else}][{$oxcmp_user->oxuser__oxstreetnr->value}][{/if}]"[{if $oView->isFieldRequired(oxuser__oxstreetnr)}] required=""[{/if}]>
    </div>

    <div class="col-12">
        [{include file="message/inputvalidation.tpl" aErrors=$aErrors.oxuser__oxstreet}]
        [{include file="message/inputvalidation.tpl" aErrors=$aErrors.oxuser__oxstreetnr}]
        <div class="help-block"></div>
    </div>
</div>


<div class="form-row[{if $aErrors.oxuser__oxaddinfo}] text-danger[{/if}]">
    <div class="form-group col">
        [{assign var="_address_addinfo_tooltip" value="FORM_FIELDSET_USER_BILLING_ADDITIONALINFO_TOOLTIP"|oxmultilangassign}]
        <label [{if $_address_addinfo_tooltip}]title="[{$_address_addinfo_tooltip}]"[{/if}] class="[{if $oView->isFieldRequired(oxuser__oxaddinfo)}] req[{/if}][{if $_address_addinfo_tooltip}] tooltip[{/if}]">[{oxmultilang ident="ADDITIONAL_INFO"}]</label>
        <input class="form-control" type="text" maxlength="255" name="invadr[oxuser__oxaddinfo]" value="[{if isset( $invadr.oxuser__oxaddinfo )}][{$invadr.oxuser__oxaddinfo}][{else}][{$oxcmp_user->oxuser__oxaddinfo->value}][{/if}]"[{if $oView->isFieldRequired(oxuser__oxaddinfo)}] required=""[{/if}]>
        [{include file="message/inputvalidation.tpl" aErrors=$aErrors.oxuser__oxaddinfo}]
        <div class="help-block"></div>
    </div>
</div>

<div class="form-row[{if $aErrors.oxuser__oxzip}] text-danger[{/if}]">
    <label class="col-12 [{if $oView->isFieldRequired(oxuser__oxzip) || $oView->isFieldRequired(oxuser__oxcity)}] req[{/if}]">[{oxmultilang ident="POSTAL_CODE_AND_CITY"}]</label>

    <div class="form-group col-3">
        <input class="form-control" type="text" maxlength="16" name="invadr[oxuser__oxzip]" value="[{if isset( $invadr.oxuser__oxzip )}][{$invadr.oxuser__oxzip}][{else}][{$oxcmp_user->oxuser__oxzip->value}][{/if}]"[{if $oView->isFieldRequired(oxuser__oxzip)}] required=""[{/if}]>
    </div>
    <div class="form-group col-9">
        <input class="form-control" type="text" maxlength="255" name="invadr[oxuser__oxcity]" value="[{if isset( $invadr.oxuser__oxcity )}][{$invadr.oxuser__oxcity}][{else}][{$oxcmp_user->oxuser__oxcity->value}][{/if}]"[{if $oView->isFieldRequired(oxuser__oxcity)}] required=""[{/if}]>
    </div>

    <div class="col-12">
        [{include file="message/inputvalidation.tpl" aErrors=$aErrors.oxuser__oxzip}]
        [{include file="message/inputvalidation.tpl" aErrors=$aErrors.oxuser__oxcity}]
        <div class="help-block"></div>
    </div>
</div>


<div class="form-row">
    <div class="form-group col[{if $aErrors.oxuser__oxcompany}] text-danger[{/if}]">
        <label class="[{if $oView->isFieldRequired(oxuser__oxcompany)}] req[{/if}]">[{oxmultilang ident="COMPANY"}]</label>
        <input class="form-control" type="text" maxlength="255" name="invadr[oxuser__oxcompany]" value="[{if isset( $invadr.oxuser__oxcompany )}][{$invadr.oxuser__oxcompany}][{else}][{$oxcmp_user->oxuser__oxcompany->value}][{/if}]"[{if $oView->isFieldRequired(oxuser__oxcompany)}] required=""[{/if}]>
        [{include file="message/inputvalidation.tpl" aErrors=$aErrors.oxuser__oxcompany}]
        <div class="help-block"></div>
    </div>
    <div class="form-group col-4[{if $aErrors.oxuser__oxustid}] text-danger[{/if}]">
        <label class="[{if $oView->isFieldRequired(oxuser__oxustid)}] req[{/if}]">[{oxmultilang ident="VAT_ID_NUMBER"}]</label>
        <input class="form-control" type="text" maxlength="255" name="invadr[oxuser__oxustid]" value="[{if isset( $invadr.oxuser__oxustid )}][{$invadr.oxuser__oxustid}][{else}][{$oxcmp_user->oxuser__oxustid->value}][{/if}]"[{if $oView->isFieldRequired(oxuser__oxustid)}] required=""[{/if}]>
        [{include file="message/inputvalidation.tpl" aErrors=$aErrors.oxuser__oxustid}]
        <div class="help-block"></div>
    </div>
</div>

[{block name="form_user_billing_country"}]
    <div class="form-row[{if $aErrors.oxuser__oxcountryid}] text-danger[{/if}]">
        <div class="form-group col">
            <label class="[{if $oView->isFieldRequired(oxuser__oxcountryid)}] req[{/if}]">[{oxmultilang ident="COUNTRY"}]</label>
            <select class="form-control" id="invCountrySelect" name="invadr[oxuser__oxcountryid]"[{if $oView->isFieldRequired(oxuser__oxcountryid)}] required=""[{/if}]>
                <option value="">-</option>
                [{assign var="blCountrySelected" value=false}]
                [{foreach from=$oViewConf->getCountryList() item=country key=country_id}]
                    [{assign var="sCountrySelect" value=""}]
                    [{if !$blCountrySelected}]
                        [{if (isset($invadr.oxuser__oxcountryid) && $invadr.oxuser__oxcountryid == $country->oxcountry__oxid->value) ||
                        (!isset($invadr.oxuser__oxcountryid) && $oxcmp_user->oxuser__oxcountryid->value == $country->oxcountry__oxid->value)}]
                            [{assign var="blCountrySelected" value=true}]
                            [{assign var="sCountrySelect" value="selected"}]
                        [{/if}]
                    [{/if}]
                    <option value="[{$country->oxcountry__oxid->value}]" [{$sCountrySelect}]>[{$country->oxcountry__oxtitle->value}]</option>
                [{/foreach}]
            </select>
            [{include file="message/inputvalidation.tpl" aErrors=$aErrors.oxuser__oxcountryid}]
            <div class="help-block"></div>
        </div>
    </div>
[{/block}]

<div class="form-row[{if $aErrors.oxuser__oxfon}] text-danger"[{/if}]">
    <div class="form-group col">
        <label class="[{if $oView->isFieldRequired(oxuser__oxfon)}] req[{/if}]">[{oxmultilang ident="PHONE"}]</label>
        <input class="form-control" type="text" maxlength="128" name="invadr[oxuser__oxfon]" value="[{if isset( $invadr.oxuser__oxfon )}][{$invadr.oxuser__oxfon}][{else}][{$oxcmp_user->oxuser__oxfon->value}][{/if}]"[{if $oView->isFieldRequired(oxuser__oxfon)}] required=""[{/if}]>
        [{include file="message/inputvalidation.tpl" aErrors=$aErrors.oxuser__oxfon}]
        <div class="help-block"></div>
        <div class="text-muted small">[{oxmultilang ident="CHECKOUT_PHONE_INFO"}]</div>
    </div>
</div>

[{if $oViewConf->showBirthdayFields()}]
    <div class="form-row oxDate[{if $aErrors.oxuser__oxbirthdate}] text-danger[{/if}]">

        <label class="col-12[{if $oView->isFieldRequired(oxuser__oxbirthdate)}] req[{/if}]">[{oxmultilang ident="BIRTHDATE"}]</label>
        <div class="form-group col-3">
            <input id="oxDay" class="oxDay form-control" name="invadr[oxuser__oxbirthdate][day]" type="text" maxlength="2" value="[{if $iBirthdayDay > 0}][{$iBirthdayDay}][{/if}]" placeholder="[{oxmultilang ident="DAY"}]"[{if $oView->isFieldRequired(oxuser__oxbirthdate)}] required=""[{/if}]>
        </div>
        <div class="form-group col-6">
            <select class="oxMonth form-control" name="invadr[oxuser__oxbirthdate][month]"[{if $oView->isFieldRequired(oxuser__oxbirthdate)}] required=""[{/if}]>
                <option value="" label="-">-</option>
                [{section name="month" start=1 loop=13}]
                    <option value="[{$smarty.section.month.index}]" label="[{$smarty.section.month.index}]" [{if $iBirthdayMonth == $smarty.section.month.index}] selected="selected" [{/if}]>
                        [{oxmultilang ident="MONTH_NAME_"|cat:$smarty.section.month.index}]
                    </option>
                [{/section}]
            </select>
        </div>
        <div class="form-group col-3">
            <input id="oxYear" class="oxYear form-control" name="invadr[oxuser__oxbirthdate][year]" type="text" maxlength="4" value="[{if $iBirthdayYear}][{$iBirthdayYear}][{/if}]" placeholder="[{oxmultilang ident="YEAR"}]"[{if $oView->isFieldRequired(oxuser__oxbirthdate)}] required=""[{/if}]>
        </div>
        <div class="col-12">
            [{include file="message/inputvalidation.tpl" aErrors=$aErrors.oxuser__oxbirthdate}]
            <div class="help-block"></div>
        </div>
    </div>
[{/if}]

[{if !$noFormSubmit}]
    <div class="form-row">
        <div class="col-12">
            <button id="accUserSaveTop" type="submit" name="save" class="btn btn-primary">[{oxmultilang ident="SAVE"}]</button>
        </div>
    </div>
[{/if}]
