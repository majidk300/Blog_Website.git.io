function doLike(pid,uid){
    
    const d = {
        pid : pid,
        uid : uid,
        operation : 'like'
      
    };
            
            $.ajax({
                url: "likeServlet",
                data: d,
                
                success : function(data,textStatus,jqXHR){
                    console.log(data);
                    
                    if(data.trim()==='true'){
                        let c = $(".like-counter").html();
                        c++;
                        $(".like-counter").html(c);
                    }
                },
                error: function(jqXHR,textStatus,errorThrown){
                    console.log(data);
                }
       
            })
}