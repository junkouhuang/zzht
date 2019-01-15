function Conversion(status,statusmap){
	for(var i=0;i<statusmap.length;i++){
		if(status == statusmap[i].status){
			return statusmap[i].text; 
		}
	}	  
}