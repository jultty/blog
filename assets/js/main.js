const data = get_data()
const post_list = document.getElementById('posts')

const userLang = navigator.language || navigator.userLanguage
let lang = userLang.includes('pt') ? 'pt' : 'en'

document.addEventListener('DOMContentLoaded', function() {
  data[lang].posts.forEach(post => {
    const item = document.createElement('li')
    const anchor = document.createElement('a')
    const date = document.createElement('span')
    anchor.innerText = post.title
    anchor.href = 'posts/' + post.slug + '.html'
    date.innerText = `${parse_date(post.date)} - `
    item.appendChild(date)
    item.appendChild(anchor)
    post_list.appendChild(item)
  })
})

function parse_date(date) {
  current_year = new Date().getFullYear()
  return date.replace(`, ${current_year}`, '')
    .replace(`/${current_year}`, '')
}

