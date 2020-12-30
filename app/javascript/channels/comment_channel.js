import consumer from "./consumer"

consumer.subscriptions.create("CommentChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    //表示させる場所のdivのIDをとってくる
    const comments = document.getElementById('comments');
    // 表示するテキストを生成
    const html = `<p>${data.content.text}</p>`;
    const userName = `<p>${data.nickname}</p>`;
    const time = `<p>${data.time}</p>`;
    comments.insertAdjacentHTML('afterbegin', html);
    comments.insertAdjacentHTML('afterbegin', userName);
    comments.insertAdjacentHTML('afterbegin', time);
    //コメントを送った後、コメント欄をからにする
    const newComment = document.getElementById('comment_text');
    newComment.value='';
    //何度もボタンを押せるようにする
    const inputElement = document.querySelector('input[name="commit"]');
    inputElement.disabled = false;
  }
});
