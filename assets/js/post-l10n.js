const userLang = navigator.language || navigator.userLanguage
let lang = userLang.includes('pt') ? 'pt' : 'en'

console.log('post-l10n.js loaded:', lang)

if (lang == 'pt') {
  const footer_back = document.getElementById('footer-back-link')
  const author_pre = document.getElementById('author-pre-text')
  const date_pre = document.getElementById('date-pre-text')
  footer_back.innerText = 'Voltar'
  author_pre.innerText = 'Postado por'
  date_pre.innerText = 'em'
}
