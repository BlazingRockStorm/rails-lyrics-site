// app/javascript/controllers/artists_songs_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["fields"];

  addFeaturingField(event) {
    event.preventDefault();
    const template = this.fieldsTarget.querySelector(".featuring-field-template");
    const newField = document.createElement("div");
    newField.innerHTML = template.innerHTML;
    this.fieldsTarget.appendChild(newField);
  }
}
