// app/javascript/controllers/artists_songs_controller.js
import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  static targets = [ 'featuringArtistsList' ]

  addFeaturingArtist() {
    const item = document.createElement('p')
    item.innerHTML = 'Hello' // thay ở đây là 1 cái template gì đó???
    this.featuringArtistsListTarget.appendChild(item);
  }
}
