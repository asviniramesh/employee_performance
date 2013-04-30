// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require autocomplete-rails
//= require_tree.


$(document).ready(function() {
	$('.expnd').click(function(){
	var superior_id = $(this).attr('id');
	$('.superior_'+superior_id).toggle();
});

	$("#frontlayer").click(function(){
	$("#frontlayer").hide();
});
});


// JavaScript Document
function showFrontLayer() {
				document.getElementById('bg_mask').style.visibility='visible';
				document.getElementById('frontlayer').style.visibility='visible';
		    }
			function hideFrontLayer() {
				document.getElementById('bg_mask').style.visibility='hidden';
				document.getElementById('frontlayer').style.visibility='hidden';
		    }
			
function showFrontLayerone() {
				document.getElementById('em_list').style.visibility='visible';
				document.getElementById('em_listem_list').style.visibility='visible';
		    }
			function hideFrontLayerone() {
				document.getElementById('em_list').style.visibility='hidden';
				document.getElementById('em_listem_list').style.visibility='hidden';
		    }

function hideDiv() { 
				if (document.getElementById) { 
				document.getElementById('close').style.display = 'none'; 
			} 
			} 
function showDiv() { 
				if (document.getElementById) { 
				document.getElementById('close').style.display = 'block'; 
			} 
			}
			
			
function hideTeam() { 
	if (document.getElementById) { 
	document.getElementById('mngr').style.display = 'none'; 
			} 
			} 
function showTeam() { 
	if (document.getElementById) { 
	document.getElementById('mngr').style.display = 'block'; 
			} 
			}
			
function hidemng() { 
				if (document.getElementById) { 
				document.getElementById('mng').style.display = 'none'; 
			} 
			} 
function showmng() { 
				if (document.getElementById) { 
				document.getElementById('mng').style.display = 'block';
			} 
			}

function hideself(id) { 
				if (document.getElementById) { 
				document.getElementById('self_'+id).style.display = 'none'; 
			} 
			} 
function showself(id) { 
				if (document.getElementById) { 
				document.getElementById('self_'+id).style.display = 'block';
			} 
			}
		
function hidemanager(id) { 
				if (document.getElementById) { 
				document.getElementById('manager_'+id).style.display = 'none'; 
			} 
			} 
function showmanager(id) { 
				if (document.getElementById) { 
				document.getElementById("manager_"+id).style.display = 'block';
			} 
			}
			
function hideemployee(id) { 
				if (document.getElementById) { 
				document.getElementById('employee_'+id).style.display = 'none'; 
			} 
			} 
function showemployee(id) { 
				if (document.getElementById) { 
				document.getElementById("employee_"+id).style.display = 'block';
			} 
			}
			
			
        function ClearPlaceHolder (input) {
            if (input.value == input.defaultValue) {
                input.value = "";
            }
        }
        function SetPlaceHolder (input) {
            if (input.value == "") {
                input.value = input.defaultValue;
            }
        }

