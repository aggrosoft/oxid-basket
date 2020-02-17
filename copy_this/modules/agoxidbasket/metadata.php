<?php

$sMetadataVersion = '2.0';

$aModule = array(
    'id'           => 'agoxidbasket',
    'title'        => 'Aggrosoft Warenkorb',
    'description'  => 'Verbessert Optik und Usability des standard Warenkorbs',
    'version'      => '1.0',
    'author'       => 'Aggrosoft GmbH',
    'controllers'  => [

    ],
    'extend' => [
        'oxbasket' => 'agoxidbasket/extensions/model/agoxidbasket_oxbasket'
    ],
    'templates' => [
        'form/fieldset/user_billing_condensed.tpl' => 'agoxidbasket/application/views/tpl/form/fieldset/user_billing_condensed.tpl',
        'form/fieldset/user_shipping_condensed.tpl' => 'agoxidbasket/application/views/tpl/form/fieldset/user_shipping_condensed.tpl',
        'form/fieldset/user_account_condensed.tpl' => 'agoxidbasket/application/views/tpl/form/fieldset/user_account_condensed.tpl',
        'form/fieldset/salutation_radios.tpl' => 'agoxidbasket/application/views/tpl/form/fieldset/salutation_radios.tpl',
        'form/login_condensed.tpl' => 'agoxidbasket/application/views/tpl/form/login_condensed.tpl',
        'widget/checkout/trustinfos.tpl' => 'agoxidbasket/application/views/tpl/widget/checkout/trustinfos.tpl',
        'widget/checkout/trustinfos_payment.tpl' => 'agoxidbasket/application/views/tpl/widget/checkout/trustinfos_payment.tpl',
        'widget/checkout/trustinfos_phone.tpl' => 'agoxidbasket/application/views/tpl/widget/checkout/trustinfos_phone.tpl',
        'widget/checkout/trustinfos_trustedshops.tpl' => 'agoxidbasket/application/views/tpl/widget/checkout/trustinfos_trustedshops.tpl',
        'page/checkout/inc/payment_other_condensed.tpl' => 'agoxidbasket/application/views/tpl/page/checkout/inc/payment_other_condensed.tpl'
    ],
    'blocks' => [
        [
            'theme' => 'wave',
            'template' => 'page/checkout/user.tpl',
            'block' => 'checkout_user_main',
            'file' => '/views/blocks/wave/page/checkout/checkout_user_main.tpl',
        ],
        [
            'theme' => 'wave',
            'template' => 'form/user_checkout_registration.tpl',
            'block' => 'user_checkout_registration',
            'file' => '/views/blocks/wave/form/user_checkout_registration.tpl',
        ],
        [
            'theme' => 'wave',
            'template' => 'form/user_checkout_change.tpl',
            'block' => 'user_checkout_change',
            'file' => '/views/blocks/wave/form/user_checkout_change.tpl',
        ],
        [
            'theme' => 'wave',
            'template' => 'widget/breadcrumb.tpl',
            'block' => 'dd_widget_breadcrumb',
            'file' => '/views/blocks/wave/widget/dd_widget_breadcrumb.tpl',
        ],
        [
            'theme' => 'wave',
            'template' => 'page/checkout/payment.tpl',
            'block' => 'change_shipping',
            'file' => '/views/blocks/wave/page/checkout/change_shipping.tpl',
        ],
        [
            'theme' => 'wave',
            'template' => 'page/checkout/payment.tpl',
            'block' => 'change_payment',
            'file' => '/views/blocks/wave/page/checkout/change_payment.tpl',
        ],
        [
            'theme' => 'wave',
            'template' => 'page/checkout/payment.tpl',
            'block' => 'checkout_payment_main',
            'file' => '/views/blocks/wave/page/checkout/checkout_payment_main.tpl',
        ],
        [
            'theme' => 'wave',
            'template' => 'layout/base.tpl',
            'block' => 'base_js',
            'file' => '/views/blocks/wave/layout/base_js.tpl',
        ],
    ],
    'settings' => [
        array('group' => 'agoxidbasket_main', 'name' => 'blUsePaypalInvoice', 'type' => 'bool', 'value' => false ),
    ]
);