<?php

class agoxidbasket_oxbasket extends agoxidbasket_oxbasket_parent
{

    public function getPriceForDelivery($shipid)
    {
        try {

            $myConfig = $this->getConfig();
            $oDeliveryPrice = oxNew('oxprice');
            $oDeliveryPrice->setBruttoPriceMode();

            // don't calculate if not logged in
            $oUser = $this->getBasketUser();

            if (!$oUser && !$myConfig->getConfigParam('blCalculateDelCostIfNotLoggedIn')) {
                return $oDeliveryPrice;
            }

            // VAT for delivery ?
            $fDelVATPercent = 0;
            if ($myConfig->getConfigParam('blCalcVATForDelivery')) {
                $fDelVATPercent = $this->getMostUsedVatPercent();
                $oDeliveryPrice->setVat($fDelVATPercent);
            }

            // list of active delivery costs
            if ($myConfig->getConfigParam('bl_perfLoadDelivery')) {
                $tmp = $this->getShippingId();
                $this->setShipping(null);
                $aDeliveryList = oxNew("oxDeliveryList")->getDeliveryList($this,
                    $oUser,
                    $this->_findDelivCountry(),
                    $shipid
                );
                $this->setShipping($tmp);

                if (count($aDeliveryList) > 0) {
                    foreach ($aDeliveryList as $oDelivery) {
                        $oDeliveryPrice->setPrice($oDelivery->oxdelivery__oxaddsum->value);
                    }
                }
            }

            return $oDeliveryPrice;
        } catch (Exception $ex) {
            return null;
        }
    }
}