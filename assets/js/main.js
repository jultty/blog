const data = get_data()

function populate_posts() {
  const posts = document.getElementById('nav-posts')
  posts.innerHTML = ''

  data.posts[lang].forEach(post => {
    const item = document.createElement('li')
    const anchor = document.createElement('a')
    const date = document.createElement('span')
    anchor.innerText = post.title
    anchor.href = 'posts/' + post.slug + '.html'
    date.innerText = `${parse_date(post.date)} - `
    item.appendChild(date)
    item.appendChild(anchor)
    posts.appendChild(item)
  })
}

function parse_date(date) {
  current_year = new Date().getFullYear()
  return date.replace(`, ${current_year}`, '')
    .replace(`/${current_year}`, '')
}

document.addEventListener('DOMContentLoaded', () => {
  populate_posts()
})
