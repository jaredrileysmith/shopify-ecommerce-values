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
        "value": "customer_id",
        "displayValue": "Customer ID"
      },
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
    "type": "CHECKBOX",
    "name": "checkbox1",
    "checkboxText": "Make Number?",
    "simpleValueType": true,
    "help": "If checked, the value returned will be a number and not a string",
    "alwaysInSummary": true
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

// Require necessary APIs & define const for user selection
const copyFromWindow = require('copyFromWindow');
const log = require('logToConsole');
const makeNumber = require('makeNumber');
let selection = data.dropDownMenu1;
let value;

// Copy Shopify object from window
const shopify = copyFromWindow('Shopify');

// Declare value (to return) and set it equal to selection 
data.checkbox1 === true ? value = makeNumber(shopify.checkout[selection]) : value = shopify.checkout[selection];
log(value);

// Return appropriate value, according to user selection
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
