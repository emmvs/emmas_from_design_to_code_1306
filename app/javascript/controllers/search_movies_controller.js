import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search-movies"
export default class extends Controller {
  static targets = [
    "form",
    "input",
    "list"
  ]

  connect() {
    // console.log("🥸")
    // console.log(this.formTarget.action) // => http://localhost:3000/movies
    console.log(this.inputTarget.value)
    // console.log(this.listTarget)
  }

  update() {
    // console.log("🔮")
    const currentQuery = "this.formTarget.action"
    const currentValue = "this.formTarget.value"
    const url = `${this.formTarget.action}'?query=${this.formTarget.value}`

    // AJAX request
    fetch(url, {
      headers: {
        "Accept": "text/plain"
      }}) // Returns a promise (takes a while)
      .then(response => response.text())
      .then(data => {
        console.log(data) // HTML Code of page
      })
  };
}
