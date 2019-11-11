<div class="trustinfos payments d-flex">
    [{if $oViewConf->isModuleActive('aspaypal') }]
        <div class="trustinfo-paypal">
            <a href="https://www.paypal.com/de/webapps/mpp/paypal-popup" onclick="window.open('https://www.paypal.com/de/webapps/mpp/paypal-popup', 'WIPaypal','toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes,width=715,height=539'); return false;">
                <img src="[{$oViewConf->getModuleUrl('agoxidbasket')|cat:'out/img/de-pp_plus-logo-quer_ohne_PUI_365x60px.jpg'}]" class="img-fluid" />
            </a>
        </div>
    [{/if}]
    [{if $oViewConf->isModuleActive('su')}]
        <div class="trustinfo-sofort">
            <a href="https://documents.sofort.com/sue/kundeninformationen/" onclick="window.open('https://documents.sofort.com/sue/kundeninformationen/', 'WIPaypal','toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes,width=715,height=539'); return false;">
                <img src="https://cdn.klarna.com/1.0/shared/image/generic/badge/de_de/pay_now/standard/pink.svg" height="40" class="visible" />
            </a>
        </div>
    [{/if}]
</div>