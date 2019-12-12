$(document).on('turbolinks:load', function(){

  $(".employee__box__list__name").click(function(){

    let time = new Date
    let hour = time.getHours();
    let minute = time.getMinutes();
    let second = time.getSeconds();
    let schedule = hour+":"+minute+":"+second

    let user_id = $(this).data('user-id');
    let url = '/users/' + user_id + '/schedules';
    console.log("user-id取得", user_id)

    if($(this).prop('id') == 'leave'){    
       $(this).prop('id', 'attend');
       $(this).addClass('employee__box__list__name_select');

        $.ajax({
        url: url,
        type: "POST",
        data: {sch: schedule},
        dataType: 'json'
        })

        .done(function(data){
          var data_id = data.id
          $(".employee__box__list__name").attr('data-id', data_id)
          console.log("jsonからのデータ",data_id)
        })
        
        .fail(function(data){
          alert('出勤できてません');
        })

      }else{
        let schedule_id = $(this).data('schedule-id');
        console.log("data取れてる？",schedule_id)
        let update_url = '/users/' + user_id + '/schedules/' + schedule_id;
        console.log("schedule-id取得",schedule_id)
        $(this).prop('id', 'leave');
        $(this).removeClass('employee__box__list__name_select');
     
        $.ajax({
          url: update_url,
          type: "PATCH",
          cache: false,
          data: {sch: schedule},
          dataType: 'json'
        })
    }

})

});

function showtime(){
  var today = new Date();
  $weekday = ['日','月','火','水','木','金','土'];
  month = today.getMonth() + 1 ;
  $('#datetime').html(month + "月"+ today.getDate() + "日（" + $weekday[today.getDay()] +"） " +today.getHours() + ":" + ('0'+today.getMinutes()).slice(-2) + ":" + ('0' +today.getSeconds()).slice(-2));
}
setInterval(showtime,1000);
