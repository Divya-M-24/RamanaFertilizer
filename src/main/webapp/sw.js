const cacheName='caches-v1';
const resourcesToLoad=[
    "./",    "addStock.jsp",    "BIll.jsp",    "generateReports.jsp",    "home.jsp",    "navbar.jsp",    "newItem.jsp",    "reports.jsp",   
    "images/logo.png",
    //"sell.jsp",    
    "css/bill.css",    "css/generateReports.css",    "css/home.css",    "css/navbar.css",    "css/newItem.css",    "css/reports.css",
    "css/sell.css",    "css/stock.css",    "manifest.json",    "sw.js",
    //"js/regSW.js",
    "js/app.js",        "index.jsp"
];
self.addEventListener("install",e=>{
    console.log("Service Worker Installed ",e);

    caches.open(cacheName).then((cache)=>{
       return cache.addAll(resourcesToLoad);
    })
});
self.addEventListener("activate",e=>{
    console.log("Service Worker Activated ",e);
});

self.addEventListener("fetch",e=>{
    console.log("Service Worker Fetched",e);

    e.respondWith(caches.match(e.request)
    .then(cachesResponse=>{
        return cachesResponse || fetch(e.request);
    })
    );
});
