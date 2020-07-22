import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "toggle" ]

  get toggleClass() {
    return this.data.get('class')
  }

  toggle() {
    this.toggleTarget.classList.toggle(this.toggleClass)
  }
}
