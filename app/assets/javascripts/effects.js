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
