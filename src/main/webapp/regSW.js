if('serviceWorker' in navigator)
{
    navigator.serviceWorker
    .register('/sw.js')
    .then((reg)=>console.log("Registered",reg))
    .catch((error)=>console.log("Error",error));

}
else
{
    console.log("No service worker support in this browser");
}