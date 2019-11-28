//選択されたゲームタイトルの配列を表示する
//参考URL https://www.flatflag.nir87.com/checkbox-1286
$(function() {
  // チェックボックスをチェックしたら発動
  $('input[name="search[machine_ids][]"]').change(function() {
    // ①空の配列を用意
    var machines = [];
    // ②チェックが入ったらループ処理
    $('input[name="search[machine_ids][]"]:checked').each(function() {
      // ③value値を配列に格納
      machines.push($(this).attr("mtitle"));
    });
    // 格納した配列を表示
    $('#machine_query').html("選択されたゲーム<br>" + machines.join("、 "));
  });
});
