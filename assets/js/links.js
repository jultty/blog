const data = get_data()

function populate_links() {
  data.links.forEach(link => {
    const links = document.getElementById('links')
    links.innerHTML = ''
    const item = document.createElement('li')
    const anchor = document.createElement('a')
    anchor.innerText = link.title
    anchor.href = link.url
    item.appendChild(anchor)
    links.appendChild(item)
  })
}

document.addEventListener('DOMContentLoaded', () => {
  populate_links()
})
