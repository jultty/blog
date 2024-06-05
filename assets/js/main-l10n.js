const userLang = navigator.language || navigator.userLanguage
let lang = userLang.includes('pt') ? 'pt' : 'en'

function localize_menu() {
  const home = document.getElementById('nav-menu-home')
  const rss = document.getElementById('nav-menu-rss')

  if (lang == 'pt') {
    if (home) home.innerText = 'Início'
    if (rss) rss.setAttribute('href', 'assets/rss/pt.rss')
  } else {
    if (home) home.innerText = 'Home'
    if (rss) rss.setAttribute('href', 'assets/rss/en.rss')
  }
}

function localize_navigation() {
  const skip = document.getElementById('a11y-skip')
  const post_list = document.getElementById('nav-posts')

  if (lang == 'pt') {
    if (skip) skip.innerText = 'Saltar para o conteúdo principal'
    if (post_list) post_list.ariaLabel = 'Listagem de todas as postagens'
  } else {
    if (skip) skip.innerText = 'Skip to main content'
    if (post_list) post_list.ariaLabel = 'Listing of all posts'
  }
}

function localize_footer() {
  const footer_back = document.getElementById('footer-back-link')

  if (footer_back) {
    if (lang == 'pt') {
      footer_back.innerText = 'Voltar'
    } else {
      footer_back.innerText = 'Back'
    }
  }
}

const en_lang_swapper = document.getElementById('lang-swap-en')
const pt_lang_swapper = document.getElementById('lang-swap-pt')

if (en_lang_swapper) {
  en_lang_swapper.addEventListener("click", () => {
    lang = 'en'
    populate_posts()
    localize_navigation()
    localize_menu()
  })
}

if (pt_lang_swapper) {
  pt_lang_swapper.addEventListener("click", () => {
    lang = 'pt'
    populate_posts()
    localize_navigation()
    localize_menu()
  })
}

document.addEventListener('DOMContentLoaded', () => {
  localize_navigation()
  localize_menu()
  localize_footer()
})
