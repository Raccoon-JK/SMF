function insertDaumPostcodeBtn(){
    new daum.Postcode({
        oncomplete: function(data){

            var roadAddr = data.roadAddress;
            var extraRoadAddr = '';

            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }

            if(data.buildingName !== ''){
                extraRoadAddr += (extraRoadAddr !== '' ? ', '+data.buildingName : data.buildingName);
            }

            if(extraRoadAddr !== ''){
                extraRoadAddr = ' ('+extraRoadAddr+')';
            }
        
            document.getElementById("postcodeInsert").value = data.zonecode;
            document.getElementById("roadAddrInsert").value = roadAddr + extraRoadAddr;
            
        }
    }).open();
}

function updateDaumPostcodeBtn(){
    new daum.Postcode({
        oncomplete: function(data){

            var roadAddr = data.roadAddress;
            var extraRoadAddr = '';

            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }

            if(data.buildingName !== ''){
                extraRoadAddr += (extraRoadAddr !== '' ? ', '+data.buildingName : data.buildingName);
            }

            if(extraRoadAddr !== ''){
                extraRoadAddr = ' ('+extraRoadAddr+')';
            }
            
            document.getElementById("postcodeUpdate").value = data.zonecode;
            document.getElementById("roadAddrUpdate").value = roadAddr + extraRoadAddr;
            
        }
    }).open();
}