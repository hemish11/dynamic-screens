import 'package:flutter/material.dart';
import 'dart:convert';

import 'models/models.dart';
import 'screen/screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  final String jsonString = '''
{
  "name": "personal-details-unified",

  "sections": [
    {
      "name": "basic",
      "sectionId": "e4fdcf0c-2733-4d20-a8d4-f27bc8c91732",
      "status": "Pending",
      "version": "8.0",
      "properties": {
        "headerIconUrl": "https://assets.zestmoney.in/assets/customers/UnifiedFlow/personal_details.png",
        "headerSubtitle": "Tell us a little about you to start your credit journey",
        "headerTitle": "Welcome!",
        "type": "form"
      },
      "additionalData": {
        "redirectUrl": "",
        "data": null,
        "isIframe": false,
        "isExternalProvider": false
      },
      "fields": [
        {
          "name": "fullname",
          "fieldId": "2d6b1c62-478c-414f-baf5-7e52e6364335",
          "status": "Pending",
          "value": "",
          "properties": {
            "errorText": "Please enter a valid name",
            "inputType": "text-name",
            "isEditable": true,
            "maxLength": 100,
            "minLength": 2,
            "subtitle": "As mentioned on your PAN card",
            "title": "Full name"
          },
          "version": "2.0"
        },
        {
          "name": "dob",
          "fieldId": "95e97986-fcd3-4341-8e84-057f156d46d5",
          "status": "Pending",
          "value": "",
          "properties": {
            "errorText": "Please enter a valid date",
            "hint": "DD/MM/YYYY",
            "inputType": "date",
            "isEditable": true,
            "title": "Date of birth"
          },
          "version": "2.0"
        },
        {
          "name": "gender",
          "fieldId": "1ae172a3-0efd-4557-b3a9-7d997de286bf",
          "status": "Pending",
          "value": "",
          "properties": {
            "inputType": "single-selection",
            "isEditable": true,
            "selections": [
              {
                "name": "Male",
                "iconUrl": "https://zestlife.s3.ap-south-1.amazonaws.com/cjm_onboarding/pd-gender-male_icon.png",
                "selectionModule": null,
                "fields": null,
                "title": "Male",
                "subtitle": null,
                "ctaText": null,
                "suggestionTextStartIconUrl": null,
                "suggestionText": null,
                "deeplink": null,
                "additionalData": null
              },
              {
                "name": "Female",
                "iconUrl": "https://zestlife.s3.ap-south-1.amazonaws.com/cjm_onboarding/pd-gender-female_icon.png",
                "selectionModule": null,
                "fields": null,
                "title": "Female",
                "subtitle": null,
                "ctaText": null,
                "suggestionTextStartIconUrl": null,
                "suggestionText": null,
                "deeplink": null,
                "additionalData": null
              },
              {
                "name": "Others",
                "iconUrl": "https://zestlife.s3.ap-south-1.amazonaws.com/cjm_onboarding/pd-gender-other_icon.png",
                "selectionModule": null,
                "fields": null,
                "title": "Rather not say",
                "subtitle": null,
                "ctaText": null,
                "suggestionTextStartIconUrl": null,
                "suggestionText": null,
                "deeplink": null,
                "additionalData": null
              }
            ],
            "title": "Gender"
          },
          "version": "2.0"
        }
      ]
    },
    {
      "name": "address",
      "sectionId": "206de69e-d9a3-45f1-9bc7-3eef15773a5d",
      "status": "Pending",
      "version": "8.0",
      "properties": {
        "headerIconUrl": "https://assets.zestmoney.in/assets/customers/UnifiedFlow/address_header.png",
        "headerSubtitle": "We call Bengaluru our home, what about you?",
        "headerTitle": "Hop onboard",
        "type": "form"
      },
      "additionalData": {
        "redirectUrl": "",
        "data": null,
        "isIframe": false,
        "isExternalProvider": false
      },
      "fields": [
        {
          "name": "pincode",
          "fieldId": "90829caf-66cc-4ff6-a191-1e46f70a8521",
          "status": "Pending",
          "value": "",
          "properties": {
            "errorText": "Please enter a valid pincode",
            "inputType": "pincode",
            "isEditable": true,
            "maxLength": 6,
            "minLength": 1,
            "subtitle": "Ensure it is your current address, it can be different than your permanent address",
            "title": "Pincode"
          },
          "version": "2.1"
        },
        {
          "name": "address",
          "fieldId": "e6114600-46a1-11ec-81d3-0242ac130003",
          "status": "Pending",
          "value": "",
          "properties": {
            "isEditable": true,
            "title": "Address"
          },
          "version": "8.0"
        },
        {
          "name": "locality",
          "fieldId": "4eec389c-46a2-11ec-81d3-0242ac130003",
          "status": "Pending",
          "value": "",
          "properties": {
            "isEditable": true,
            "title": "Locality"
          },
          "version": "8.0"
        },
        {
          "name": "city",
          "fieldId": "6154a931-2249-41af-8a4d-4d8a218841ea",
          "status": "Pending",
          "value": "",
          "properties": {
            "isEditable": true,
            "title": "City / District"
          },
          "version": "6.0"
        }
      ],
      "typeOfDataRequired": 1,
      "requestExpectedStatus": 0
    }
  ]
}

  ''';

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final formModel = FormModel.fromJson(json.decode(jsonString));

    return MaterialApp(
      title: 'Dynamic Form App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DynamicFormScreen(formModel: formModel),
    );
  }
}
