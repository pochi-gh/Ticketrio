$(function() {
  function searchHTML(data){
    var result =
    `<div class="wrapper__side_bar__result--artist">
      <a class="wrapper__side_bar__result--artist--name" href="/lives?id=${data.id}">${data.artist_name}</a>
    </div>`
    return result ;
  }

  function nodataResult(data){
    var nodata =
    `<div class="wrapper__side_bar__result--nodata">
     <p>該当するアーティストが見つかりません</p>
     <a class="wrapper__side_bar__result--artist--name" href="/artists/new">アーティスト追加画面へ</a>
     <p class="login__announce">（未ログイン時はログイン画面へ遷移します）</p>
    </div>`
    return nodata ;
  }

  $(document).on("keyup",".wrapper__side_bar__search--area", function() {
    let input = $(this).val();
    console.log(input)
    $.ajax({
      type: "GET",
      url: "/artists",
      data:{ keyword: input},
      dataType: "json"
    })
    .done(function(data){
      if ($(this).value =!""){
        $('.wrapper__side_bar__result').empty();
        let test =　data.lengt
        console.log(test)
        if(data.length >0){
          data.forEach(function(data){
          result = searchHTML(data)
          $('.wrapper__side_bar__result').append(result);
          });
        }else{
          result = nodataResult(data)
          $('.wrapper__side_bar__result').append(result);
        }
      }else{
      }
    })
    .fail(function() {
      console.log("失敗です");
    });
  });
});