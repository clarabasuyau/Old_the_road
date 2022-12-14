import { Controller } from "@hotwired/stimulus"
import Typed from "typed.js"

export default class extends Controller {
  connect() {
    new Typed(this.element, {
      strings: ["Hit the road with style"],
      typeSpeed: 60,
      loop: true
    })
  }
}
