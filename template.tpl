___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.


___INFO___

{
  "type": "MACRO",
  "id": "cvt_temp_public_id",
  "version": 1,
  "securityGroups": [],
  "displayName": "Shopify Plus Ecommerce Values",
  "categories": [
    "ANALYTICS",
    "CONVERSIONS",
    "SALES"
  ],
  "description": "Variable returns the specified value from the global Shopify object",
  "containerContexts": [
    "WEB"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "SELECT",
    "name": "dropDownMenu1",
    "displayName": "Desired Value",
    "selectItems": [
      {
        "value": "discount",
        "displayValue": "Discount"
      },
      {
        "value": "order_id",
        "displayValue": "Order ID"
      },
      {
        "value": "payment_due",
        "displayValue": "Payment Due"
      },
      {
        "value": "subtotal_price",
        "displayValue": "Subtotal Price"
      },
      {
        "value": "total_price",
        "displayValue": "Total Price"
      },
      {
        "value": "total_tax",
        "displayValue": "Total Tax"
      },
      {
        "value": "email",
        "displayValue": "Email"
      },
      {
        "value": "customer_id",
        "displayValue": "Customer ID"
      },
      {
        "value": "first_name",
        "displayValue": "First Name"
      },
      {
        "value": "last_name",
        "displayValue": "Last Name"
      },
      {
        "value": "city",
        "displayValue": "City"
      },
      {
        "value": "country_code",
        "displayValue": "Country"
      },
      {
        "value": "province_code",
        "displayValue": "State"
      },
      {
        "value": "zip",
        "displayValue": "Zip Code"
      }
    ],
    "simpleValueType": true,
    "valueValidators": [
      {
        "type": "NON_EMPTY"
      }
    ],
    "alwaysInSummary": false
  },
  {
    "type": "RADIO",
    "name": "radioButtonGroup1",
    "displayName": "Format value as",
    "radioItems": [
      {
        "value": "string",
        "displayValue": "String"
      },
      {
        "value": "number",
        "displayValue": "Number"
      }
    ],
    "simpleValueType": true,
    "help": "Select if you want the value returned as a number or a string",
    "valueValidators": [
      {
        "type": "NON_EMPTY"
      }
    ],
    "defaultValue": "string"
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

// Require necessary APIs & define const for user selection
const copyFromWindow = require('copyFromWindow');
const log = require('logToConsole');
const makeNumber = require('makeNumber');
const makeString = require('makeString');
let selection = data.dropDownMenu1;
let value;

// Copy Shopify object from window
const shopify = copyFromWindow('Shopify');

// Determine if selection is for a value in billing_address object, if not pull directly from .checkout
if(['first_name', 'last_name', 'city', 'province_code', 'country_code', 'zip'].indexOf(selection) >= 0){
  value = shopify.checkout.billing_address[selection];
} else {
  value = shopify.checkout[selection];
}
// Set value to string or number according to user selection
data.radioButtonGroup1 === 'string' ? value = makeString(value).toLowerCase() : value = makeNumber(value);
log(value);


// Return appropriate value, according to user selection.  Return undefined if not available
return value;


___WEB_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "access_globals",
        "versionId": "1"
      },
      "param": [
        {
          "key": "keys",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "key"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  },
                  {
                    "type": 1,
                    "string": "execute"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "Shopify"
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": false
                  },
                  {
                    "type": 8,
                    "boolean": false
                  }
                ]
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "logging",
        "versionId": "1"
      },
      "param": [
        {
          "key": "environments",
          "value": {
            "type": 1,
            "string": "debug"
          }
        }
      ]
    },
    "isRequired": true
  }
]


___TESTS___

scenarios: []


___NOTES___

Created on 12/9/2019, 12:03:08 PM
