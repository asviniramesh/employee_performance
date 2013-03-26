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

function hidevldts() { 
				if (document.getElementById) { 
				document.getElementById('vldts').style.display = 'none'; 
			} 
			} 
function showvldts() { 
				if (document.getElementById) { 
				document.getElementById('vldts').style.display = 'block';
			} 
			}
		
function hidemanager() { 
				if (document.getElementById) { 
				document.getElementById('manager').style.display = 'none'; 
			} 
			} 
function showmanager() { 
				if (document.getElementById) { 
				document.getElementById('manager').style.display = 'block';
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