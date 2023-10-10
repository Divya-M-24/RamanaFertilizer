 
 function addItem()
 {
	let sel = document.getElementById("itemName");
	let item = sel.options[sel.selectedIndex].text;
	let priceQty = sel.value.split(" ",2);
	let price = parseFloat(priceQty[0]);
	let qty = parseInt(priceQty[1]);
	let qtyIn = parseInt(document.getElementById("qty").value);
 
    if(qtyIn>qty ||qtyIn<=0 || isNaN(qtyIn))
    {
		window.alert("Current stock is "+qty+"\nEnter Valid Quantity..!");
	}
    else
    {
		qty = qty - qtyIn;
		price = price + (price*0.05);
		tbody = document.getElementById("tbody");
	    let total = price*qtyIn;
	    content = '<tr id="addItems"><td class="items">'+item+'</td><td class="price">'+price+'</td><td class="qnty">'+qtyIn+'</td><td class="desc">'+total.toFixed(2)+'</td><td class="desc"><input type="button" value="DeleteItem" onclick="deleteItem()"></td></tr>';
	    tbody.innerHTML += content;
	    
	    document.getElementById("qty").value = null;
	    sel.selectedIndex=0;
	    
	    let sum =  parseFloat(document.getElementById("sumTotal").value);
    	sum += price*qtyIn;
     	document.getElementById("sumTotal").value = sum.toFixed(2);     	
	   	document.getElementById('fertilizers').value += item + " ";
     	document.getElementById('quantity').value += qtyIn + " ";
    	document.getElementById('price').value += price + " ";
		
	}
     
}