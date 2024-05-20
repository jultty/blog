const data = get_data()

const userLang = navigator.language || navigator.userLanguage
let lang = userLang.includes('pt') ? 'pt' : 'en'

function populate_posts() {
  data[lang].posts.forEach(post => {
    const posts = document.getElementById('nav-posts')
    posts.innerHTML = ''
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

function localize_menu() {
  const home = document.getElementById('nav-menu-home')
  const rss = document.getElementById('nav-menu-rss')

  if (lang == 'pt') {
    home.innerText='Início'
    rss.setAttribute('href', 'pt.rss')
  } else {
    home.innerText='Home'
    rss.setAttribute('href', 'en.rss')
  }
}

const en_lang_swapper = document.getElementById('lang-swap-en')
const pt_lang_swapper = document.getElementById('lang-swap-pt')

en_lang_swapper.addEventListener("click", () => {
  lang = 'en'
  populate_posts()
  localize_menu()
})

pt_lang_swapper.addEventListener("click", () => {
  lang = 'pt'
  populate_posts()
  localize_menu()
})

document.addEventListener('DOMContentLoaded', () => {
  populate_posts()
  localize_menu()
})
