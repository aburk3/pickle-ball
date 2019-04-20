$(() => {
  bindClickHandlers();
})

const bindClickHandlers = () => {
  // Prevents Default and updates URL
  $('.all_posts').on('click', (e) => {
    e.preventDefault()
    history.pushState(null, null, "/posts")
    getPosts()
  })


  $(document).on('click', ".show_link", function(e) {
    e.preventDefault()
    $('#app-container').html('')
    let id = $(this).attr('data-id')
    fetch(`/posts/${id}.json`)
    .then(res => res.json())
    .then(post => {
      let newPost = new Post(post)

      let postHtml = newPost.formatShow()

      $('#app-container').append(postHtml)
    })
  })

  $(document).on('click', '.next-post', function() {
    nextId = parseInt($(".next-post").attr("data-id")) + 1;

    $.get("/posts/" + nextId + ".json", function(data) {
      $(".postTitle").text(data["title"]);
      $(".postContent").text(data["content"]);
      $(".js-next").attr("data-id", data["id"]);
    });
  });

  /**
   * Hijacks the 'Create Post' submit form
   */
  $('#new_post').on('submit', function(e) {
    e.preventDefault();
    const values = $(this).serialize();

    /**
     * Makes AJAX post, clears container html, creates Post object, formats HTML, and appends HTML to container
     */
    $.post('/posts', values).done(function(data) {
      $('#app-container').html('');
      const newPost = new Post(data)
      const htmlToAdd = newPost.formatShow()

      $('#app-container').html(htmlToAdd);
    })
  })

  $('#new_comment').on('submit', function(e) {
    e.preventDefault()
    let id = $(this).attr('data')
    const values = $(this).serialize()
    $('#comment_content').val('');

    $.post(`/posts/${id}/comments`, values).done(function(data) {
      let newComment = new Comment(data)
      let commentHtml = newComment.formatComment()
      $(':input[type="submit"]').prop('disabled', false);
      $('#comment-container').append(commentHtml)
    })
  })
}

const getPosts = () => {
  fetch (`/posts.json`)
    .then(res => res.json())
    .then(posts => {
      $('#app-container').html('')
      posts.forEach(post => {
        let newPost = new Post(post)
        let postHtml = newPost.formatIndex()

        $('#app-container').append(postHtml)
      })
    })
}

/**
 * Post Constructor for creating a new Post object
 */
function Post(post) {
  this.id = post.id
  this.title = post.title
  this.content = post.content
  this.user = post.user
  this.comments = post.comments
  this.likes = post.likes
}

Post.prototype.formatIndex = function() {
  let postHtml = `
    <a href="/posts/${this.id}" data-id="${this.id}" class="show_link"><h1>${this.title}</h1></a>
  `
  return postHtml
}
/**
 * Used to format the HTML for the Post show page
 */
Post.prototype.formatShow = function() {
  let commentHtml = "";
  let postHtml = `
    <h2 class="postTitle">${this.title}</h2>
    <p class="postContent">${ this.content }</p>
    <ul>`
  for (i = 0; i < this.comments.length; i++) {
    postHtml += `
      <li>${ this.comments[i].content }</li>
    `
  }
  postHtml += `
    </ul>
    <button class="next-post" data-id="${this.id}">Next</button>
    <a href="/posts/${this.id}/comments/new">Create Comment</a>`
  return postHtml
}

function Comment(comment) {
  this.content = comment.content
  this.user = comment.user
}

Comment.prototype.formatComment = function() {
  let commentHtml = `
  <p>
    <strong>${ this.user.first_name } ${ this.user.last_name }:</strong>
      ${ this.content }<br>
  </p>
  `
  return commentHtml
}

// This is the JS for the next button on the old show page
$(function () {
  $(".js-next").on("click", function() {
    var nextId = parseInt($(".js-next").attr("data-id")) + 1;
    $.get("/posts/" + nextId + ".json", function(data) {

      console.log(data);
      $(".postTitle").text(data["title"]);
      $(".postLikes").text(data["likes"].length);
      $(".postContent").text(data["content"]);
      $(".postUser").text(data.user.first_name + data.user.last_name);
      $(".postCreated").text(data.user.created_at);
      // re-set the id to current on the link
      $(".js-next").attr("data-id", data["id"]);
    });
  });
});
