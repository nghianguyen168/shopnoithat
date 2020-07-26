<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/templates/tags/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta charset="utf-8" />
<title>Page Admin</title>

<meta name="description" content="" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />

<link rel="stylesheet" href="<spring:url value="/resources/admin/css/bootstrap.min.css"/>" />
<link rel="stylesheet" href="<spring:url value="/resources/admin/font-awesome/4.5.0/css/font-awesome.min.css"/>" />
<link rel="stylesheet" href="<spring:url value="/resources/admin/css/fonts.googleapis.com.css"/>" />
<link rel="stylesheet" href="<spring:url value="/resources/admin/css/ace.min.css"/>" class="ace-main-stylesheet" id="main-ace-style" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="<spring:url value="/resources/admin/css/ace-skins.min.css"/>" />
<link rel="stylesheet" href="<spring:url value="/resources/admin/css/ace-rtl.min.css"/>" />
<script src="<spring:url value="/resources/admin/js/ace-extra.min.js"/>"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="<spring:url value="/resources/admin/ckeditor/ckeditor.js"/>"></script>

</head>

<body class="no-skin">
	<tiles:insertAttribute name="navbar" />

	<div class="main-container ace-save-state" id="main-container">
		<script type="text/javascript">
			try {
				ace.settings.loadState('main-container')
			} catch (e) {
			}
		</script>

		<tiles:insertAttribute name="leftbar" />

		<div class="main-content">
			<div class="page-content">
				<div class="main-content-inner">

					<tiles:insertAttribute name="content" />
				</div>
			</div>
		</div>
		<!-- /.main-content -->

		<tiles:insertAttribute name="footer" />

		<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse"> <i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
		</a>
	</div>


	<script src="<spring:url value="/resources/admin/js/jquery-2.1.4.min.js"/>"></script>

	<script type="text/javascript">
		if ('ontouchstart' in document.documentElement)
			document
					.write("<script src='<spring:url value='/resources/admin/js/jquery.mobile.custom.min.js'/>'>"
							+ "<"+"/script>");
	</script>
	<script src="<spring:url value="/resources/admin/paging/jquery.twbsPagination.js"/>"></script>
	<script src="<spring:url value="/resources/admin/js/bootstrap.min.js"/>"></script>
	<script src="<spring:url value="/resources/admin/js/jquery-ui.custom.min.js"/>"></script>
	<script src="<spring:url value="/resources/admin/js/jquery.ui.touch-punch.min.js"/>"></script>
	<script src="<spring:url value="/resources/admin/js/moment.min.js"/>"></script>
	<script src="<spring:url value="/resources/admin/js/fullcalendar.min.js"/>"></script>
	<script src="<spring:url value="/resources/admin/js/bootbox.js"/>"></script>
	<script src="<spring:url value="/resources/admin/js/ace-elements.min.js"/>"></script>
	<script src="<spring:url value="/resources/admin/js/ace.min.js"/>"></script>
	<script type="text/javascript">
		jQuery(function($) {

			/* initialize the external events
			 -----------------------------------------------------------------*/

			$('#external-events div.external-event').each(function() {

				// create an Event Object (http://arshaw.com/fullcalendar/docs/event_data/Event_Object/)
				// it doesn't need to have a start or end
				var eventObject = {
					title : $.trim($(this).text())
				// use the element's text as the event title
				};

				// store the Event Object in the DOM element so we can get to it later
				$(this).data('eventObject', eventObject);

				// make the event draggable using jQuery UI
				$(this).draggable({
					zIndex : 999,
					revert : true, // will cause the event to go back to its
					revertDuration : 0
				//  original position after the drag
				});

			});

			/* initialize the calendar
			-----------------------------------------------------------------*/

			var date = new Date();
			var d = date.getDate();
			var m = date.getMonth();
			var y = date.getFullYear();

			var calendar = $('#calendar')
					.fullCalendar(
							{
								//isRTL: true,
								//firstDay: 1,// >> change first day of week 

								buttonHtml : {
									prev : '<i class="ace-icon fa fa-chevron-left"></i>',
									next : '<i class="ace-icon fa fa-chevron-right"></i>'
								},

								header : {
									left : 'prev,next today',
									center : 'title',
									right : 'month,agendaWeek,agendaDay'
								},
								events : [
										{
											title : 'All Day Event',
											start : new Date(y, m, 1),
											className : 'label-important'
										},
										{
											title : 'Long Event',
											start : moment()
													.subtract(5, 'days')
													.format('YYYY-MM-DD'),
											end : moment().subtract(1, 'days')
													.format('YYYY-MM-DD'),
											className : 'label-success'
										},
										{
											title : 'Some Event',
											start : new Date(y, m, d - 3, 16, 0),
											allDay : false,
											className : 'label-info'
										} ],

								/**eventResize: function(event, delta, revertFunc) {

									alert(event.title + " end is now " + event.end.format());

									if (!confirm("is this okay?")) {
										revertFunc();
									}

								},*/

								editable : true,
								droppable : true, // this allows things to be dropped onto the calendar !!!
								drop : function(date) { // this function is called when something is dropped

									// retrieve the dropped element's stored Event Object
									var originalEventObject = $(this).data(
											'eventObject');
									var $extraEventClass = $(this).attr(
											'data-class');

									// we need to copy it, so that multiple events don't have a reference to the same object
									var copiedEventObject = $.extend({},
											originalEventObject);

									// assign it the date that was reported
									copiedEventObject.start = date;
									copiedEventObject.allDay = false;
									if ($extraEventClass)
										copiedEventObject['className'] = [ $extraEventClass ];

									// render the event on the calendar
									// the last `true` argument determines if the event "sticks" (http://arshaw.com/fullcalendar/docs/event_rendering/renderEvent/)
									$('#calendar').fullCalendar('renderEvent',
											copiedEventObject, true);

									// is the "remove after drop" checkbox checked?
									if ($('#drop-remove').is(':checked')) {
										// if so, remove the element from the "Draggable Events" list
										$(this).remove();
									}

								},
								selectable : true,
								selectHelper : true,
								select : function(start, end, allDay) {

									bootbox
											.prompt(
													"New Event Title:",
													function(title) {
														if (title !== null) {
															calendar
																	.fullCalendar(
																			'renderEvent',
																			{
																				title : title,
																				start : start,
																				end : end,
																				allDay : allDay,
																				className : 'label-info'
																			},
																			true // make the event "stick"
																	);
														}
													});

									calendar.fullCalendar('unselect');
								},
								eventClick : function(calEvent, jsEvent, view) {

									//display a modal
									var modal = '<div class="modal fade">\
			  <div class="modal-dialog">\
			   <div class="modal-content">\
				 <div class="modal-body">\
				   <button type="button" class="close" data-dismiss="modal" style="margin-top:-10px;">&times;</button>\
				   <form class="no-margin">\
					  <label>Change event name &nbsp;</label>\
					  <input class="middle" autocomplete="off" type="text" value="' + calEvent.title + '" />\
					 <button type="submit" class="btn btn-sm btn-success"><i class="ace-icon fa fa-check"></i> Save</button>\
				   </form>\
				 </div>\
				 <div class="modal-footer">\
					<button type="button" class="btn btn-sm btn-danger" data-action="delete"><i class="ace-icon fa fa-trash-o"></i> Delete Event</button>\
					<button type="button" class="btn btn-sm" data-dismiss="modal"><i class="ace-icon fa fa-times"></i> Cancel</button>\
				 </div>\
			  </div>\
			 </div>\
			</div>';

									var modal = $(modal).appendTo('body');
									modal.find('form').on(
											'submit',
											function(ev) {
												ev.preventDefault();

												calEvent.title = $(this).find(
														"input[type=text]")
														.val();
												calendar
														.fullCalendar(
																'updateEvent',
																calEvent);
												modal.modal("hide");
											});
									modal
											.find('button[data-action=delete]')
											.on(
													'click',
													function() {
														calendar
																.fullCalendar(
																		'removeEvents',
																		function(
																				ev) {
																			return (ev._id == calEvent._id);
																		})
														modal.modal("hide");
													});

									modal.modal('show').on('hidden',
											function() {
												modal.remove();
											});

									//console.log(calEvent.id);
									//console.log(jsEvent);
									//console.log(view);

									// change the border color just for fun
									//$(this).css('border-color', 'red');

								}

							});

		})
	</script>
</body>
</html>
