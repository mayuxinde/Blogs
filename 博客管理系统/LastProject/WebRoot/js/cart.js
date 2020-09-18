function submitCart() {
	if(confirm("确认结算么")){
		var cForm = document.getElementById("cartForm");
		cForm.submit();
	}
}

//创建我们的XMLHTTPRequest对象
function getXmlHttpRequest(){

var myxmlhttp;

if(window.XMLHttpRequest){

    //针对FireFox ,Mozillar,opera,safari,ie8,ie8

    myxmlhttp=new XMLHttpRequest();

    //针对某些特定版本的mozillar浏览器的bug进行修正

    if(myxmlhttp.overrideMimeType){

        myxmlhttp.overrideMimeType("text/xml");

    }

}

//IE6.IE5.5,IE5

//为什么我们把ie的这个判断放在这里

//1，上边可以尽可能应付多种浏览器

//2,现在大多数浏览器为上边

else if(window.ActiveXObject){

    //两个可以用于创建XMLHTTPRequest对象的控件名称，保存在一个Js数组中

    //排在前面的版本较新

    var activeName=["MSXML2.XMLHTTP","MICROSOFT.XMLHTTP"];

    for(var i=0;i<activeName.length;i++){

        try{

            //取出一个空间进行创建，如果成功终止循环

            //创建失败，抛出异常继续循环

            myxmlhttp=new ActiveXObject(activeName[i]);

            break;

        }

        catch(e){



        }

    }

}

return myxmlhttp;

}