const sign_in_btn = document.querySelector("#sign-in-btn");
const sign_up_btn = document.querySelector("#sign-up-btn");
const container = document.querySelector(".container");

sign_up_btn.addEventListener("click", () => {
  container.classList.add("sign-up-mode");
});

sign_in_btn.addEventListener("click", () => {
  container.classList.remove("sign-up-mode");
});

let username = document.getElementById("username_new");
let license = document.getElementById("license");


username.addEventListener('change',()=>{
	let users = document.getElementById("usernames").value;
	const input_username = document.getElementById('username_new');
	console.log(input_username)
	if(users.includes(input_username.value.toString()))
	{
		window.alert("Username already exist. Please choose another one...");
		input_username.value="";
	}	
})

license.addEventListener('change',()=>{
	let license_list = document.getElementById("licenses").value;
	const input_license = document.getElementById('license');
	console.log(input_license)
	if(license_list.includes(input_license.value.toString()))
	{
		window.alert("The lincense number alreday registered...")
		input_license.value="";
	}	
})




