<%
  String domain = new String("http://localhost:43597/e-Administration-war");
  String siteName = new String("Institute of technology - eAdministration");
  String siteDesc = new String("eAdministration for the Institute of technology, used to maintain, track and solve issues regarding computing labs in the Institute of technology...");
%>
<meta charset="utf-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><% out.print(siteName); %></title>
<link rel="icon" type="image/x-icon" href="favicon.ico">
<meta name="application-name" content="<% out.print(siteName); %> ">
<%-- <meta property="og:image" content="../media/icons/icon_270x270.png"> --%>
<meta property="og:title" content="<% out.print(siteName); %> ">
<meta property="og:site_name" content="<% out.print(siteName); %> ">
<meta propety="og:locale" content="en-GB">
<meta property="og:type" content="website">
<meta propety="og:description" content="<% out.print(siteDesc); %> ">
<meta propety="twitter:description" content="<% out.print(siteDesc); %> ">
<meta name="description" content="<% out.print(siteDesc); %> ">
<meta name="keywords" content="">
<meta name="MobileOptimized" content="width">
<meta name="HandheldFriendly" content="true">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="nosnippet">
<%-- START ALERTIFY PLUGIN --%>
<link rel="stylesheet" href="<% out.print(domain); %>/lib/plugin/alertify/css/alertify.min.css" />
<link rel="stylesheet" href="<% out.print(domain); %>/lib/plugin/alertify/css/themes/default.min.css" />
<script src="<% out.print(domain); %>/lib/plugin/alertify/alertify.min.js"></script>
<%-- END ALERTIFY PLUGIN --%>
<link rel="stylesheet" href="//use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
<link rel="stylesheet/less" type="text/css" href="<% out.print(domain); %>/lib/less/style.less" />
<%-- <link rel="stylesheet" type="text/css" href="<% out.print(domain); %>/lib/css/style.css" /> --%>
<link rel="stylesheet" href="<% out.print(domain); %>/lib/css/fontello/animation.css">
<link rel="stylesheet" href="<% out.print(domain); %>/lib/css/fontello/fontello.css">
<link rel="stylesheet" href="<% out.print(domain); %>/lib/css/fontello/fontello-codes.css">
<script src="//cdnjs.cloudflare.com/ajax/libs/less.js/3.9.0/less.min.js" ></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js" ></script>
<script type="text/javascript" src="<% out.print(domain); %>/lib/js/script.js"></script>
