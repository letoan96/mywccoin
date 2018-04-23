// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
// = require jquery
// = require rails-ujs
// = require turbolinks
// = require_tree .
// = require owl.carousel2

import web3 from './web3'
import WCCArtifact from './contracts/WCC.json'

var wccContract

var x = document.getElementsByClassName("date_time");
for (i = 0; i < x.length; i++) {
  a = x[i].innerText
  var date = new Date(a).toLocaleString()
  x[i].innerText = date
}

var rscarousel = $('.rs-carousel');
if (rscarousel.length) {
  $('.rs-carousel').each(function () {
    var owlCarousel = $(this),
      loop = owlCarousel.data('loop'),
      items = owlCarousel.data('items'),
      margin = owlCarousel.data('margin'),
      stagePadding = owlCarousel.data('stage-padding'),
      autoplay = owlCarousel.data('autoplay'),
      autoplayTimeout = owlCarousel.data('autoplay-timeout'),
      smartSpeed = owlCarousel.data('smart-speed'),
      dots = owlCarousel.data('dots'),
      nav = owlCarousel.data('nav'),
      navSpeed = owlCarousel.data('nav-speed'),
      xsDevice = owlCarousel.data('mobile-device'),
      xsDeviceNav = owlCarousel.data('mobile-device-nav'),
      xsDeviceDots = owlCarousel.data('mobile-device-dots'),
      smDevice = owlCarousel.data('ipad-device'),
      smDeviceNav = owlCarousel.data('ipad-device-nav'),
      smDeviceDots = owlCarousel.data('ipad-device-dots'),
      smDevice2 = owlCarousel.data('ipad-device2'),
      smDeviceNav2 = owlCarousel.data('ipad-device-nav2'),
      smDeviceDots2 = owlCarousel.data('ipad-device-dots2'),
      mdDevice = owlCarousel.data('md-device'),
      mdDeviceNav = owlCarousel.data('md-device-nav'),
      mdDeviceDots = owlCarousel.data('md-device-dots');

    owlCarousel.owlCarousel({
      loop: (loop ? true : false),
      items: (items ? items : 4),
      lazyLoad: true,
      margin: (margin ? margin : 0),
      //stagePadding: (stagePadding ? stagePadding : 0),
      autoplay: (autoplay ? true : false),
      autoplayTimeout: (autoplayTimeout ? autoplayTimeout : 1000),
      smartSpeed: (smartSpeed ? smartSpeed : 250),
      dots: (dots ? true : false),
      nav: (nav ? true : false),
      navText: ["<i class='fa fa-angle-left'></i>", "<i class='fa fa-angle-right'></i>"],
      navSpeed: (navSpeed ? true : false),
      responsiveClass: true,
      responsive: {
        0: {
          items: (xsDevice ? xsDevice : 1),
          nav: (xsDeviceNav ? true : false),
          dots: (xsDeviceDots ? true : false)
        },
        768: {
          items: (smDevice ? smDevice : 3),
          nav: (smDeviceNav ? true : false),
          dots: (smDeviceDots ? true : false)
        },
        480: {
          items: (smDevice2 ? smDevice : 2),
          nav: (smDeviceNav2 ? true : false),
          dots: (smDeviceDots2 ? true : false)
        },
        992: {
          items: (mdDevice ? mdDevice : 4),
          nav: (mdDeviceNav ? true : false),
          dots: (mdDeviceDots ? true : false)
        }
      }
    });

  });
}
var owl5 = $('#slider-five');
if (owl5.length) {
  // Carousel initialization
  owl5.owlCarousel({
    animateIn: 'fadeIn',
    items: 1,
    autoplay: false,
    loop: true,
    dots: true,
    autoplayTimeout: 8000,
  });
}
// add animate.css class(es) to the elements to be animated
function setAnimation(_elem, _InOut) {
  // Store all animationend event name in a string.
  // cf animate.css documentation
  var animationEndEvent = 'webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend';

  _elem.each(function () {
    var $elem = $(this);
    var $animationType = 'animated ' + $elem.data('animation-' + _InOut);

    $elem.addClass($animationType).one(animationEndEvent, function () {
      $elem.removeClass($animationType); // remove animate.css Class at the end of the animations
    });
  });
}

// Fired before current slide change
owl5.on('change.owl.carousel', function (event) {
  var $currentItem = $('.owl-item', owl5).eq(event.item.index);
});

// Fired after current slide has been changed
owl5.on('changed.owl.carousel', function (event) {
  var $currentItem = $('.owl-item', owl5).eq(event.item.index);
})

// var web3 = window.web3
// var contract = fetch('/contracts/WorldcupBetting.json').then(resp => resp.json())
// var networkId = new Promise((resolve, reject) => {
//   web3.version.getNetwork((error, result) => {
//     error ? reject(error) : resolve(result)
//   })
// })

// Promise.all([contract, networkId])
//   .then(([{ abi, bytecode, networks }, networkId]) => {
//     var WorldcupBetting = web3.eth.contract(abi)

//     WorldcupBetting.at(networks[networkId].address, (error, contract) => {
//       if (error) return

//       contract.owner(console.log)
//     })
//   })

// function hello(){
//   alert('Hello!')
//   return false
// }

function initContract() {
  var contract = new web3.eth.Contract(WCCArtifact.abi)

  contract
    .deploy({
      data: WCCArtifact.bytecode
    })
    .send({
      from: account.address
    })
    .then((contractInstance) => {
      wccContract = contractInstance
    })

    
}

function createAccount() {
  var account = web3.eth.accounts.create()

  wccContract.methods.
}
