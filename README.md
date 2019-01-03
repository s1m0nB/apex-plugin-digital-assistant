[![APEX Plugin](https://cdn.rawgit.com/Dani3lSun/apex-github-badges/b7e95341/badges/apex-plugin-badge.svg)](https://github.com/Dani3lSun/apex-github-badges)
APEX PlugIn: SBA.APEX.CHATBOT
=========================

This is a region plugin for use in Oracle Application Express. The region plugin will add the Oracle Digital Assistant widget for chatbot functionality to your APEX application. For use of this plugin you will need an Oracle Digital Assistant on the Oracle Cloud Service and enable a web channel for using your Digital Assistant in your APEX application. The plugin uses the OMCe Bots Client SDK for JavaScript and is preconfigured to run within apex, using plugin files for the all the sdk's javascript files. So no need to configure the sdk yourself, instead just simply import and configure this plugin.

## usage
Download the latest PlugIn SQL File from this repository and import it in your APEX application.

The plugin will display the chatbot widget in the lower right corner. And offers the chat functionality in your apex application for use with your Oracle Digital Assistant. 

The region plugin has multiple (optional) attributes defined;

* appId - Required unique reference to the Oracle Digital Assitant Web Channel
* name - Required name of your digital assistant to be displayed in the widget
* logo - Optional logo or avatar image of your digital assistant to use in the widget
* buttonIcon - Optional icon to change the widgets button icon in the lower right corner
* user - Optional reference to the APEX item containing the username
* userProperties - Optional JSON String for additional user properties for use in Oracle Digital Assistant
* locale - Optional sopecify a locale (eg. en-US) for localization of the chatbot
* customText - Optional JSON String for customizing systems text used in the widget
* customColors - Optional JSON String for customizing the look and colors used in the widget
* enableSound - YES|NO : indicator to enable sound notifications
* clearCache - YES|NO : indicator to clear the chat localcache on every page load
* imageUpload - YES|NO : to enable image and document upload functions in the widget

The customText and customColors are JSON String attributes which have a predefined list of entries. 

## references

https://eocoe.blogspot.com/2018/12/apex-plugin-for-digital-assistant.html

https://apex.oracle.com/pls/apex/f?p=35723:30

https://www.oracle.com/technetwork/topics/cloud/downloads/mobile-suite-3636471.html

https://www.oracle.com/technetwork/topics/cloud/downloads/amce-downloads-4478270.html

https://cloud.oracle.com/digital-assistant
