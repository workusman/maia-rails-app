document.addEventListener("mouseout", onMouseOut);
var localStorage = window.localStorage;

function onMouseOut(event) {
  // Remove this event listener
  document.removeEventListener("mouseout", onMouseOut);
  // Show the popup
  if(isCandidateNew()){
    var modalElement = document.createElement('DIV');
    modalElement.innerHTML = createModalElem();
    document.body.appendChild(modalElement);
  }
}

//Setting candidate-email
function setCandidateEmail(email) {
  localStorage.setItem("maia_user_email", email)
}

//checks if candidate is new
function isCandidateNew() {
  var  result = localStorage.getItem("maia_user_email")
  if(result !== null){
    return false;
  }
  return true;
}

//submit button handler
function submitClickHandler(){
  addUserToDataBase()
}

//add users to database
function addUserToDataBase(){
  var email = document.getElementById("email").value;
  var xhr = new XMLHttpRequest();
  xhr.onreadystatechange = function(){
    if(xhr.status === 200){
      setCandidateEmail(email)
      document.getElementById("popup").style.display = "none";
    }
  }
  xhr.open('POST', "https://my-maia.herokuapp.com//api/v1/users" );
  xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
  xhr.send(`domain=${window.location.host}&email=${email}`);
}

function cancelClickHandler(){
  document.getElementById("popup").style.display = "none";
  document.removeEventListener("onmouseout", onMouseOut)
}

function onEmailChange(){
  var email = document.getElementById("email").value;
  if (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(email))
  {
    document.getElementById("popup__button").disabled = false;
    document.getElementById("popup__button").style.backgroundColor = "green";
  }
  else{
    document.getElementById("popup__button").disabled = true;
    document.getElementById("popup__button").style.backgroundColor = "grey";
  }
}
//returns candidate modal
function createModalElem(){
  return '<div id="popup" class="popup__wrapper">' +
  '<div class="popup__container">' +
  '<h1 class="popup__title">HEY! BEFORE YOU LEAVE!</h1>' +
  '<p class="popup__text">Please enter your email for future opportunities</p>' +
  '<div><input id="email" onkeyup="onEmailChange()" class="popup__input" type="text" name="email" /></div>' +
  '<div><button disabled id="popup__button" class="popup__button" onclick="submitClickHandler()" >Submit</button></div>'+
  '<div><button class="popup__button__cancel" onclick="cancelClickHandler()" >Cancel</button></div>'+
  '</div>' +
  '</div>'
}