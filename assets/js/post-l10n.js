const userLang = navigator.language || navigator.userLanguage
let lang = userLang.includes('pt') ? 'pt' : 'en'
console.log('loaded post-l10n.js', lang)

if (lang != 'pt') {
  const footer_back = document.getElementById('footer-back-link')
  console.log(footer_back)
  footer_back.innerText = 'Back'
}
