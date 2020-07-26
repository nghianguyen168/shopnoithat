<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/templates/tags/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<!-- Mirrored from htmldemo.magikcommerce.com/ecommerce/inspire-html-template/furniture/index.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 13 Aug 2015 08:01:35 GMT -->
	<!-- Added by HTTrack -->
	<meta http-equiv="content-type" content="text/html;charset=UTF-8" />
	<!-- /Added by HTTrack -->
<head>
<meta charset="utf-8">
<!--[if IE]>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<![endif]-->
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<title>&amp;</title>
<!-- Favicons Icon -->
<link rel="icon" href="http://demo.magikthemes.com/skin/frontend/base/default/favicon.ico" type="image/x-icon" />
<link rel="shortcut icon" href="http://demo.magikthemes.com/skin/frontend/base/default/favicon.ico" type="image/x-icon" />
<!-- Mobile Specific -->
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<!-- CSS Style -->

<link rel="stylesheet" href="<spring:url value="/resources/furniture/css/bootstrap.min.css"/>" type="text/css">
<link rel="stylesheet" href="<spring:url value="/resources/furniture/css/style.css"/>" type="text/css">
<link rel="stylesheet" href="<spring:url value="/resources/furniture/css/revslider.css"/>" type="text/css">
<link rel="stylesheet" href="<spring:url value="/resources/furniture/css/owl.carousel.css"/>" type="text/css">
<link rel="stylesheet" href="<spring:url value="/resources/furniture/css/owl.theme.css"/>" type="text/css">
<link rel="stylesheet" href="<spring:url value="/resources/furniture/css/font-awesome.css"/>" type="text/css">
<!-- Google Fonts -->
<link href='https://fonts.googleapis.com/css?family=Roboto:400,500,700' rel='stylesheet' type='text/css'>
</head>
<body class="cms-index-index">
	<div class="page">
		<!-- Header -->
		<tiles:insertAttribute name="header" />
		<!-- end header -->
		<!-- Navbar -->
		<tiles:insertAttribute name="nvarbar" />
		<!-- end nav -->
		<!-- Slider -->
		<tiles:insertAttribute name="content" />
		<!-- End Featured Slider -->
		<!-- Footer -->
		<tiles:insertAttribute name="footer" />
		<!-- End Footer -->
	</div>

	<!-- JavaScript -->
	<script type="text/javascript" src="<spring:url value="/resources/furniture/js/jquery.min.js"/>"></script>
	<script type="text/javascript" src="<spring:url value="/resources/furniture/js/bootstrap.min.js"/>"></script>

	<script type="text/javascript" src="<spring:url value="/resources/furniture/js/common.js"/>"></script>
	<script type="text/javascript" src="<spring:url value="/resources/furniture/js/revslider.js"/>"></script>
	<script type="text/javascript" src="<spring:url value="/resources/furniture/js/owl.carousel.min.js"/>"></script>
	<script type='text/javascript'>
		jQuery(document).ready(function() {
			jQuery('#rev_slider_4').show().revolution({
				dottedOverlay : 'none',
				delay : 5000,
				startwidth : 1170,
				startheight : 580,

				hideThumbs : 200,
				thumbWidth : 200,
				thumbHeight : 50,
				thumbAmount : 2,

				navigationType : 'thumb',
				navigationArrows : 'solo',
				navigationStyle : 'round',

				touchenabled : 'on',
				onHoverStop : 'on',

				swipe_velocity : 0.7,
				swipe_min_touches : 1,
				swipe_max_touches : 1,
				drag_block_vertical : false,

				spinner : 'spinner0',
				keyboardNavigation : 'off',

				navigationHAlign : 'center',
				navigationVAlign : 'bottom',
				navigationHOffset : 0,
				navigationVOffset : 20,

				soloArrowLeftHalign : 'left',
				soloArrowLeftValign : 'center',
				soloArrowLeftHOffset : 20,
				soloArrowLeftVOffset : 0,

				soloArrowRightHalign : 'right',
				soloArrowRightValign : 'center',
				soloArrowRightHOffset : 20,
				soloArrowRightVOffset : 0,

				shadow : 0,
				fullWidth : 'on',
				fullScreen : 'off',

				stopLoop : 'off',
				stopAfterLoops : -1,
				stopAtSlide : -1,

				shuffle : 'off',

				autoHeight : 'off',
				forceFullWidth : 'on',
				fullScreenAlignForce : 'off',
				minFullScreenHeight : 0,
				hideNavDelayOnMobile : 1500,

				hideThumbsOnMobile : 'off',
				hideBulletsOnMobile : 'off',
				hideArrowsOnMobile : 'off',
				hideThumbsUnderResolution : 0,

				hideSliderAtLimit : 0,
				hideCaptionAtLimit : 0,
				hideAllCaptionAtLilmit : 0,
				startWithSlide : 0,
				fullScreenOffsetContainer : ''
			});
		});
	</script>
</body>

<!-- Mirrored from htmldemo.magikcommerce.com/ecommerce/inspire-html-template/furniture/index.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 13 Aug 2015 08:03:59 GMT -->
</html>

