function getNum(id,tagname,target){
	var obj = document.getElementById(id).getElementsByTagName(tagname);
    check_id = [];
    for(k in obj){
        if(obj[k].checked)
            check_id.push(obj[k].getAttribute(target));
         
    }
    return check_id.join();
}
function getNum2(id,tagname,target){
	var obj = document.getElementById(id).getElementsByTagName(tagname);
    check_id = [];
    for(k in obj){
        if(obj[k].checked)
            check_id.push(obj[k].getAttribute(target));
         
    }
    return check_id;
}
