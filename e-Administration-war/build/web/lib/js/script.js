function update_class_attr(cname, attr, val) {
  cname = document.getElementsByClassName(cname);
  if (cname) {
    for (var i = 0; i < cname.length; i++) {
      cname[i].setAttribute(attr, val);
    }
  }
}

/**
*---------------------------------------------------------
* [START] SLIDESHOW SCRIPT
*---------------------------------------------------------
* @author Osunrinde Adebayo Stephen aka YoungFox
* Slide show script cam be used on any element
* attributes needed:
* 1. data-path
* 2. data-slideprefix
* 3. data-type
* 4. data-maxslide
* 5. data-current
**/

function fade_bg(div, url) {
  div.style.opacity = 0;
  setTimeout(function() {
    $(div).css('background-image', 'url(' + url + ')');
  }, 500);
  setTimeout(function() {
    div.style.opacity = 1;
  }, 700);
}

function div_slide_show(speed) {
  setInterval(function() {
    var slideDiv = document.getElementsByClassName('anim-bg');
    // loop through slide array of div
    for (var i = 0; i < slideDiv.length; i++) {
      // needed variables to change the image
      var img_path = slideDiv[i].getAttribute('data-path');
      var img_prefix = slideDiv[i].getAttribute('data-slideprefix');
      var img_ext = slideDiv[i].getAttribute('data-type');

      // check current slide and max
      var max_slide = slideDiv[i].getAttribute('data-maxslide');
      var curnt_slide = slideDiv[i].getAttribute('data-current');
          curnt_slide = parseInt(curnt_slide);
      if (curnt_slide < max_slide) {
        curnt_slide += 1;
        slideDiv[i].setAttribute('data-current', curnt_slide);

        // update the background image
        fade_bg(slideDiv[i], img_path + img_prefix + curnt_slide + "." + img_ext);

      } else {
        curnt_slide = 1;
        slideDiv[i].setAttribute('data-current', curnt_slide);
      }
    }
  }, speed);
}

/**
*---------------------------------------------------------
* [END] SLIDESHOW SCRIPT
*---------------------------------------------------------
**/

/**
*---------------------------------------------------------
* [START] LOGIN SCRIPT
*---------------------------------------------------------
* @author Osunrinde Adebayo Stephen aka YoungFox
* login animation script can be used on any element
**/

function crt_login_listner() {
  var loginBtn = document.getElementsByClassName('tb-nv-btn');
  if (loginBtn) {
    loginBtn = loginBtn[4];
    $(loginBtn).on("click", function() {
      console.log("login clicked");
      $('.sign-in-container').fadeIn();
      setTimeout(function() {
        $('.sign-in-banner').animate({width: '60%'});
        $('.sign-in-form-div').animate({width: '100%'});
        cls_login_listner();
      }, 1500);
    });
  }
}

function cls_login_listner() {
  var closeBtn = document.getElementsByClassName('sif-top-bar-close');
  if (closeBtn) {
    closeBtn = closeBtn[0];
    $(closeBtn).on("click", function() {
      console.log("login close modal clicked");
      $('.sign-in-form-div').animate({width: '0%'});
      $('.sign-in-banner').animate({width: '100%'});
      setTimeout(function() {
        $('.sign-in-container').fadeOut();
      }, 1500);
    });
  }
}

/**
*---------------------------------------------------------
* [END] LOGIN SCRIPT
*---------------------------------------------------------
**/

// INITIALIZER
function init() {
  var location = window.location.href;
  console.log(location);
  switch (location) {
    case "http://localhost:43597/e-Administration-war/index.jsp":
      // start login listener
      crt_login_listner();
      break;

    case "http://localhost:43597/e-Administration-war/":
      // start login listener
      crt_login_listner();
      break;

    case "http://localhost:43597/e-Administration-war/p/dashboard.jsp":
      // alertify.success("Welcome back!");
      // fetch labs into designated element
      fetch_labs_button();
      break;

    case "http://localhost:43597/e-Administration-war/p/users.jsp":
      // alertify.success("Welcome back!");
      // fetch users into designated element
      fetch_users_button();
      break;

    default:
      break;
  }
}

/**
*---------------------------------------------------------
* [START] AJAX MULTI-USE SCRIPT
*---------------------------------------------------------
* @author Osunrinde Adebayo Stephen aka YoungFox
* reusable ajax method
**/
function async(method, url, parm, success, complt, error) {
  $.ajax({
    type: method,
    url: url,
    data: parm,
    success: function(x){success(x);},
    complete: function(){if (complt != undefined) {complt();}},
    error: function(x){if (error != undefined) {error(x);}}
  });
}
/**
*---------------------------------------------------------
* [END] AJAX MULTI-USE SCRIPT
*---------------------------------------------------------
**/

/**
*---------------------------------------------------------
* [BEGINNING] OVERLAY SCRIPT
*---------------------------------------------------------
**/
function overlay(option) {
  var overlayDiv = document.querySelector(".overlay-div");
  var title = document.querySelector("#overlay-title");
  var body = document.querySelector("#overlay-body");
  switch (option) {
    case 1: // show overlay
      overlayDiv.classList.remove('unsee');
      break;

    case 0: // hide overlay
      overlayDiv.classList.add('unsee');
      title.innerHTML = "";
      body.innerHTML = "";
      break;

    default:
      break;
  }
}
/**
*---------------------------------------------------------
* [END] OVERLAY SCRIPT
*---------------------------------------------------------
**/

/**
*---------------------------------------------------------
* [BEGINNING] LAB FORM SCRIPT
*---------------------------------------------------------
**/
function crt_lab() {
  overlay(1);
  var title = document.querySelector("#overlay-title");
  var body = document.querySelector("#overlay-body");
  title.innerHTML = "Add Lab";
  var parm = {type: 'lab',action: 'add',request: 'form',uID: uID};
  var func = function(result) {
    body.innerHTML = result;
  };
  var error = function () {
    body.innerHTML = "<div class=\"fill-bg-msg\">";
    body.innerHTML += "<a class=\"fill-msg\">An unknown error occured</a>";
    body.innerHTML += "</div>";
  };
  // AJAX: fetch the form
  async('POST', '../section/forms/lab.jsp', parm, func, undefined, error);
}

function crt_user() {
  overlay(1);
  var title = document.querySelector("#overlay-title");
  var body = document.querySelector("#overlay-body");
  title.innerHTML = "Add User";
  var parm = {type: 'user',action: 'add',request: 'form',uID: uID};
  var func = function(result) {
    body.innerHTML = result;
  };
  var error = function () {
    body.innerHTML = "<div class=\"fill-bg-msg\">";
    body.innerHTML += "<a class=\"fill-msg\">An unknown error occured</a>";
    body.innerHTML += "</div>";
  };
  // AJAX: fetch the form
  async('POST', '../section/forms/user.jsp', parm, func, undefined, error);
}
/**
*---------------------------------------------------------
* [END] LAB FORM SCRIPT
*---------------------------------------------------------
**/

/**
*---------------------------------------------------------
* [BEGINNING] AJAX FORM SCRIPT
*---------------------------------------------------------
**/
function submitform(e, form) {
  e.preventDefault();
  try {
    var methodName = form.getAttribute('data-function');
    var url = form.getAttribute('action');
    var parm = {};
      // Get form inputs
      var formData  = $(form).serializeArray();
      for (var i = 0; i < formData.length; i++) {
        parm[formData[i].name] = formData[i].value;
      }
    var func = function(result) {
      form.reset();
      overlay(0);
      if (result == true) {
        alertify.success('success'); /// EVENT SUCCESS NOTIFICATION
      }
    };
    var complt = function() {
      // execute method by name
      window[methodName]();
      console.log("executed form method");
    };
    var err = function(result) {
      overlay(0);
      alertify.alert().set({'startMaximized':true, 'message':result.responseText}).show();
    };
    // DEBUG: checking the form values
    async('POST', url, parm, func, complt, err);
  } catch (ex) {
    throw new Error (ex.message);
  } finally {
    return false;
  }
}
/**
*---------------------------------------------------------
* [END] AJAX FORM SCRIPT
*---------------------------------------------------------
**/

/**
*---------------------------------------------------------
* [BEGINNING] METHODS IN ALERTIFY
*---------------------------------------------------------
**/
// alertify.alert('Ready!'); ///// ALERT NOTIFICATION
// alertify.notify('sample', 'success', 5, function(){console.log('dismissed');}); //// EVENT NOTIFICATION
// alertify.success('Success notification message.'); /// EVENT SUCCESS NOTIFICATION
// alertify.warning('Warning notification message.');  /// EVENT WARNING NOTIFICATION
// alertify.error('Error notification message.');   /// EVENT ERROR NOTIFICATION
/////////////////////////////////////////////////////////////////////
//  EVENT MESSAGE NOTIFICATION
/////////////////////////////////////////////////////////////////////
// alertify.message('Standard notification message.');
// a delay value of 0 will keep this open
// alertify.message('Will stay open till clicked.', 0);
/////////////////////////////////////////////////////////////////////
/**
*---------------------------------------------------------
* [END] METHODS IN ALERTIFY
*---------------------------------------------------------
**/

/**
*---------------------------------------------------------
* [BEGINNING] FETCH BUTTONS
*---------------------------------------------------------
**/

////////////////////////////////////////////////////////////////////////////////
// dashboard lab buttons

function fetch_labs_button() {
 // element container
 var container = document.querySelector('.ib-labs-side-container');
 container.innerHTML = ""; // empty the container

 var url = '../section/html/dashboard.lab.jsp';
 var parm = {
  section: "ib-labs-side",
  request: "lab_name",
  type: "button"
 };
 var func = function(result) {
   console.log(result);
   if (JSON.parse(result)) {
     var array = JSON.parse(result);

     for (var i = 0; i < array.length; i++) {
       // button icon div
       var anchor_1 = document.createElement("A");
       anchor_1.classList.add("icon-monitor");
        var buttonIcon = document.createElement("DIV");
        buttonIcon.classList.add("ibls-button-icon");
        buttonIcon.append(anchor_1);

       // button name div
       var anchor_2 = document.createElement("A");
       anchor_2.append(document.createTextNode(array[i]));
        var buttonName = document.createElement("DIV");
        buttonName.classList.add("ibls-button-name");
        buttonName.append(anchor_2);

        // button div
        var button = document.createElement("DIV");
        button.classList.add("ibls-button");
        button.setAttribute("data-name", array[i]);
        button.setAttribute("onclick", "view_lab(this);");
        button.append(buttonIcon);
        button.append(buttonName);

        // element container
        container.append(button);
     }
   }
 };
 var err = function(result) {
   alertify.alert().set({'startMaximized':true, 'message':result.responseText}).show();
 };
 async('POST', url, parm, func, undefined, err);
}

//
////////////////////////////////////////////////////////////////////////////////


function fetch_users_button() {
 // element container
 var container = document.querySelector('.ib-labs-side-container');
 container.innerHTML = ""; // empty the container

 var url = '../section/html/dashboard.users.jsp';
 var parm = {
  section: "ib-labs-side",
  request: "user_email",
  type: "button"
 };
 var func = function(result) {
   console.log(result);
   if (JSON.parse(result)) {
     var array = JSON.parse(result);

     for (var i = 0; i < array.length; i++) {
       // button icon div
       var anchor_1 = document.createElement("A");
       anchor_1.classList.add("icon-user");
        var buttonIcon = document.createElement("DIV");
        buttonIcon.classList.add("ibls-button-icon");
        buttonIcon.append(anchor_1);

       // button name div
       var anchor_2 = document.createElement("A");
       anchor_2.append(document.createTextNode(array[i]));
        var buttonName = document.createElement("DIV");
        buttonName.classList.add("ibls-button-name");
        buttonName.append(anchor_2);

        // button div
        var button = document.createElement("DIV");
        button.classList.add("ibls-button");
        button.setAttribute("data-name", array[i]);
        // button.setAttribute("onclick", "view_lab(this);");
        button.append(buttonIcon);
        button.append(buttonName);

        // element container
        container.append(button);
     }
   }
 };
 var err = function(result) {
   alertify.alert().set({'startMaximized':true, 'message':result.responseText}).show();
 };
 async('POST', url, parm, func, undefined, err);
}

/**
*---------------------------------------------------------
* [END] FETCH BUTTONS
*---------------------------------------------------------
**/


/**
*---------------------------------------------------------
* [BEGINNING] VIEW LAB
*---------------------------------------------------------
**/
function view_lab(e) {
  var body = document.querySelector('.ib-labs-body');
  var labName = e.getAttribute("data-name");
  var url = '../section/html/view.lab.jsp';
  var parm = {
    name: labName,
    uID: uID
  };
  var func = function (result) {
    body.innerHTML = result;
    exec_nodecloner();
    // console.log(result);
  };

  var err = function(result) {
    alertify.alert().set({'startMaximized':true, 'message':result.responseText}).show();
  };
  async('POST', url, parm, func, undefined, err);
}

function exec_nodecloner() {
  var parent = document.querySelector('.map-container');
  for (var i = 0; i < 50; i++) {
    console.log("add");
    var node = document.querySelector('.iblb-qd-tiles');
    var clone = node.cloneNode(true);
    for (var x = 0, itr = 0; x < clone.children.length; x++, itr++) {
      if (clone.children[x].classList.contains('iblb-qd-tiles-txt')) {
        clone.children[x].innerHTML = "#0"+i;
      }
    }
    document.querySelector('.map-container').appendChild(clone);
    // if ((i%5) == 0) {
    //   var a = document.createElement("DIV");
    //   a.classList.add("flex-break");
    //   document.querySelector('.map-container').appendChild(a);
    // }
  }
}

function navigate(location) {
  switch (location) {
    case "labs":
      window.location.assign("http://localhost:43597/e-Administration-war/p/dashboard.jsp");
      break;

    case "users":
      window.location.assign("http://localhost:43597/e-Administration-war/p/users.jsp");
      break;

    case "complaint":
      window.location.assign("http://localhost:43597/e-Administration-war/p/complaint.jsp");
      break;

    default:
      break;
  }
}

///////////////////////////////////////////////
//// THIS PROJECT IS A DEATH SENTENCE T_T /////
///////////////////////////////////////////////
