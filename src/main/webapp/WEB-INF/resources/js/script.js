$(".deleteTask").click(function (e) {
    const taskid = e.target.getAttribute("value");
    Swal.fire({
        icon: 'question',
        title: '是否刪除此項目',
        showCancelButton: true,
        confirmButtonText: '確認',
        cancelButtonText: '取消',
    })
        .then((result) => {
            if (result.isConfirmed) { 
                $.ajax({
                    type: 'get',
                    url: '/CloudService/myTasks/delete/' + taskid,
                    async: 'true',
                    success: function(){
                        window.location.reload();                        
                    }
                });
                
            } 
        });
});

$("#addTask").click(function(e){
    e.preventDefault();
    $("#errMsg").text("");
    $("#inputContent").removeClass("is-invalid");
    let inputContent = $("#inputContent").val();

    if (inputContent == "" || inputContent.length == 0){
        $("#inputContent").addClass("is-invalid");
        $("#errMsg").text("不得空白，請輸入內容後送出");
    }else{
        $("#addTask").text("loading").attr('disabled', true);
        $("#inputContent").attr('disabled', true);
        var newTask = {
            'content': inputContent
        }
        $.ajax({
            type: 'post',
            url: '/CloudService/myTasks/insertTask',
            contentType: 'application/json',
			data: JSON.stringify(newTask),
			async: 'true',
            dataType: "json",
            success: function(data){
            	if (data != null) {
	                Swal.fire({
	                    icon: 'success',
	                    title: '新增待辦事項: ' + data.content ,
	                    showCancelButton: false,
	                    confirmButtonText: '知道了',
	                })
	                .then(function(){
			            $("#addTask").text("新增").attr('disabled', false);
			            $("#inputContent").attr('disabled', false);
			            window.location.reload();
			        })
			    }
            }
        }); 
    }
})

$("#inputForm").on('keypress', disabledEnter);

function disabledEnter(e){
    let inputContent = $("#inputContent").val();
    if (inputContent == "" || inputContent.length == 0 || $("#addTask").attr('disabled') == 'disabled'){
        if (e.keyCode === 13 || e.which === 13) {
            e.preventDefault();
            return false;
        }
    }
}