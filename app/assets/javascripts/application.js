// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require jquery.ui.all
//= require autocomplete-rails
//= require bootstrap
//= require dataTables/jquery.dataTables
//= require bootstrap-datepicker
//= require chosen-jquery
//= require chosenrails
//= require turbolinks
//= require_tree .



$(document).ready(function () {  

});
 	
 	

// // //===================== datepicker ======================= 
// // $(function(){
// 			window.prettyPrint && prettyPrint();
// 			$('#dp1').datepicker({
// 				format: 'mm-dd-yyyy'
// 			});
// 			$('#dp2').datepicker();
// 			$('#dp3').datepicker();
// 			$('#dp3').datepicker();
// 			$('#dpYears').datepicker();
// 			$('#dpMonths').datepicker();
			
			
// 			var startDate = new Date(2012,1,20);
// 			var endDate = new Date(2012,1,25);
// 			$('#dp4').datepicker()
// 				.on('changeDate', function(ev){
// 					if (ev.date.valueOf() > endDate.valueOf()){
// 						$('#alert').show().find('strong').text('The start date can not be greater then the end date');
// 					} else {
// 						$('#alert').hide();
// 						startDate = new Date(ev.date);
// 						$('#startDate').text($('#dp4').data('date'));
// 					}
// 					$('#dp4').datepicker('hide');
// 				});
// 			$('#dp5').datepicker()
// 				.on('changeDate', function(ev){
// 					if (ev.date.valueOf() < startDate.valueOf()){
// 						$('#alert').show().find('strong').text('The end date can not be less then the start date');
// 					} else {
// 						$('#alert').hide();
// 						endDate = new Date(ev.date);
// 						$('#endDate').text($('#dp5').data('date'));
// 					}
// 					$('#dp5').datepicker('hide');
// 				});

//         // disabling dates
//         var nowTemp = new Date();
//         var now = new Date(nowTemp.getFullYear(), nowTemp.getMonth(), nowTemp.getDate(), 0, 0, 0, 0);

//         var checkin = $('#dpd1').datepicker({
//           onRender: function(date) {
//             return date.valueOf() < now.valueOf() ? 'disabled' : '';
//           }
//         }).on('changeDate', function(ev) {
//           if (ev.date.valueOf() > checkout.date.valueOf()) {
//             var newDate = new Date(ev.date)
//             newDate.setDate(newDate.getDate() + 1);
//             checkout.setValue(newDate);
//           }
//           checkin.hide();
//           $('#dpd2')[0].focus();
//         }).data('datepicker');
//         var checkout = $('#dpd2').datepicker({
//           onRender: function(date) {
//             return date.valueOf() <= checkin.date.valueOf() ? 'disabled' : '';
//           }
//         }).on('changeDate', function(ev) {
//           checkout.hide();
//         }).data('datepicker');
// 		});
