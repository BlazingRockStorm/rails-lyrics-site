import { Controller } from '@hotwired/stimulus'

const SOUND = 'https://daveceddia.com/freebies/react-metronome/click1.wav'

export default class MetronomeController extends Controller {
  static targets = ['bpm', 'tempoButton']

  connect() {
    this.bpm = parseInt(this.bpmTarget.value)
    this.playing = false
    this.tempoButtonTarget.textContent = this.tempoButtonTarget.innerHTML
    this.beat = new Audio(SOUND)
  }

  handleClick() {
    this.playing = !this.playing

    if (this.playing) {
      this.start()
    } else {
      this.stop()
    }
  }

  start() {
    console.log(this.bpm)
    this.timer = setInterval(this.beat.play(), (60 / this.bpm) * 1000)
    this.tempoButtonTarget.textContent = 'Stop metronome for the song'
  }

  stop() {
    clearInterval(this.timer)
    this.tempoButtonTarget.textContent = 'Start metronome for the song'
  }
}
