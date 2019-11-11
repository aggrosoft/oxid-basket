[{if $oViewConf->getTopActiveClassName() == 'basket' || $oViewConf->getTopActiveClassName() == 'user' || $oViewConf->getTopActiveClassName() == 'payment' || $oViewConf->getTopActiveClassName() == 'order'}]
[{oxscript include=$oViewConf->getModuleUrl('agoxidbasket')|cat:'out/src/js/agoxidbasket.js'}]
[{/if}]
[{$smarty.block.parent}]