// app/javascript/controllers/artists_songs_controller.js
import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  static targets = ['featuringArtistsList', 'featuringArtist']

  addFeaturingArtist(event) {
    event.preventDefault()
    const template = this.featuringArtistsListTarget.querySelector(".featuring-field-template")
    const newField = document.createElement('div')
    newField.innerHTML = template.innerHTML.replaceAll('disabled="disabled"', '')
    const newTemp = this.featuringArtistsListTarget.appendChild(newField)
    console.log(newTemp)
    const uuid = self.crypto.randomUUID()
    newTemp.id = uuid
    const removeBtn = newTemp.querySelector("button[type='button']")
    removeBtn.dataset.artistsSongsTemplateParam = uuid
  }

  removeFeaturingArtist(e) {
    const featuringArtist = document.getElementById(e.params.template)
    const input = featuringArtist.querySelector("input[name='song[artists_songs_attributes][][_destroy]']")
    input.value = '1'
    const idHiddenElement = featuringArtist.querySelector("input[name='song[artists_songs_attributes][][id]']")
    if (idHiddenElement) {
      featuringArtist.hidden = true
    } else {
      featuringArtist.remove()
    }
  }
}
