document.addEventListener('DOMContentLoaded', function(){
  // 新規投稿・編集ページのフォームを取得
  const learnForm = document.getElementById('new_learn');
  // プレビューを表示するためのスペースを取得
  const previewList = document.getElementById('previews');
  // 新規投稿・編集ページフォームがないならここで終了
  if (!learnForm) return null;
  console.log("preview.jsが読み込まれました");
});
