var yoxviewPath = '/assets/exclusions/';

var cssLink = top.document.createElement("link");
cssLink.setAttribute("rel", "Stylesheet");
cssLink.setAttribute("type", "text/css");
cssLink.setAttribute("href", yoxviewPath + "yoxview.css");
top.document.getElementsByTagName("head")[0].appendChild(cssLink);

function LoadScript(url)
{
	document.write( '<scr' + 'ipt type="text/javascript" src="' + url + '"><\/scr' + 'ipt>' ) ;
}

var jQueryIsLoaded = typeof jQuery != "undefined";

if (!jQueryIsLoaded)
    LoadScript("http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js");
    
LoadScript(yoxviewPath + "jquery.yoxview-2.21.min.js");
