const data = get_data()

function populate_links() {
  data.links.forEach(link => {
    const links = document.getElementById('links')
    links.innerHTML = ''
    const item = document.createElement('li')
    const anchor = document.createElement('a')
    const date = document.createElement('span')
    anchor.innerText = link.title
    anchor.href = link.url
    date.innerText = `${parse_date(link.date)} - `
    item.appendChild(date)
    item.appendChild(anchor)
    links.appendChild(item)
  })
}

function parse_date(date) {
  current_year = new Date().getFullYear()
  return date.replace(`/${current_year}`, '')
}

document.addEventListener('DOMContentLoaded', () => {
  populate_links()
})
