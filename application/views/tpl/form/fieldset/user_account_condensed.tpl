<div class="form-row[{if $aErrors.oxuser__oxpassword}] oxInValid[{/if}]">
    [{block name="user_account_password"}]
    <div class="form-group col">
        <label class="req" for="userPassword">[{oxmultilang ident="PASSWORD"}]</label>
        <input type="hidden" id="passwordLength" value="[{$oViewConf->getPasswordLength()}]">
        <input id="userPassword" class="form-control textbox js-oxValidate js-oxValidate_notEmpty js-oxValidate_length js-oxValidate_match" type="password" name="lgn_pwd" value="[{$lgn_pwd}]" required="required">
        <div class="help-block"></div>
    </div>
    [{/block}]
    [{block name="user_account_confirmpwd"}]
        <div class="form-group col">
            <label class="req">[{oxmultilang ident="CONFIRM_PASSWORD"}]</label>
            <input id="userPasswordConfirm" class="form-control textbox js-oxValidate js-oxValidate_notEmpty js-oxValidate_length js-oxValidate_match" type="password" name="lgn_pwd2" value="[{$lgn_pwd2}]" required="required">
            <div class="help-block"></div>
        </div>
    [{/block}]
    <div class="text-muted small col-12">[{oxmultilang ident="CHECKOUT_CONFIRM_CREATE_ACCOUNT"}]</div>
</div>
<div class="form-row mt-3 mb-3">
    [{block name="user_account_newsletter"}]
        <div class="form-group col">
            <div class="custom-control custom-checkbox">
                <input type="hidden" name="blnewssubscribed" value="0"/>
                <input class="custom-control-input" type="checkbox" class="blnewssubscribed" id="blnewssubscribed" value="1" [{if $oView->isNewsSubscribed()}]checked[{/if}]>
                <label class="custom-control-label" for="blnewssubscribed">[{oxmultilang ident="NEWSLETTER_SUBSCRIPTION"}]</label>

            </div>
            <span class="help-block text-muted small">
                [{oxifcontent ident="oxnewsletterinfoshort" object="oCont"}]
                    [{$oCont->oxcontents__oxcontent->value}]
                [{/oxifcontent}]
                [{if !$oCont}]
                    [{oxmultilang ident="MESSAGE_NEWSLETTER_SUBSCRIPTION"}]
                [{/if}]
            </span>
        </div>
    [{/block}]
</div>