import { Controller } from "stimulus"
import Sortable from "sortablejs"
import Rails from "@rails/ujs"

export default class extends Controller {
  static targets = [ ]

  get handleClass(){
    return this.data.get('handle')
  }

  connect() {
    this.sortableList = Sortable.create(this.element, {
      handle: this.handleClass,
      onEnd: (event) => {
        Rails.fire(event.item, 'dinnerWorks:sortable:onEnd')
      }
    })
  }

}
