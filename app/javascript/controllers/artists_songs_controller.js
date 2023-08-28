// app/javascript/controllers/artists_songs_controller.js
import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  static targets = ['featuringArtistsList', 'featuringArtist']

  addFeaturingArtist(event) {
    event.preventDefault()
    const template = this.featuringArtistsListTarget.querySelector(".featuring-field-template")
    const newField = document.createElement('div')
    // template.innerHTML.replace('disabled="disabled"', '')
    // template.getElementsByTagName('select').disabled = false
    // template.getElementsByTagName('input').disabled = false
    // console.log(template.getElementsByTagName('select'))
    newField.innerHTML = template.innerHTML
    this.featuringArtistsListTarget.appendChild(newField)
  }

  removeFeaturingArtist() {
    this.featuringArtistTarget.remove()
  }
}
