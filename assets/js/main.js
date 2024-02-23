const data = get_data()
const post_list = document.getElementById("posts")

document.addEventListener("DOMContentLoaded", function() {
  data.posts.forEach(post => {
    const item = document.createElement("li")
    const anchor = document.createElement("a")
    anchor.innerText = post.title
    anchor.href = 'posts/html/' + post.slug + '.md.html'
    item.appendChild(anchor)
    post_list.appendChild(item)
  })
})
