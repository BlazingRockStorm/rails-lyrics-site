// app/javascript/controllers/artists_songs_controller.js
import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  static targets = [ "featuringArtistsList" ]

  addFeaturingArtist() {
    this.featuringArtistsListTarget.textContent =
      `Hello, Quan!`
  }
}
