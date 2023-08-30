import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="edit-movie"
export default class extends Controller {
  static targets = ["infos", "form", "card"]

  connect() {
    // console.log(this.formTarget.action)
  }

  revealForm() {
    // console.log(this.editTarget)
    this.infosTarget.classList.add("d-none")
    this.formTarget.classList.remove("d-none")
  }

  update(event) {
    event.preventDefault();
    const url = this.formTarget.action

    fetch(url,{
      // PATCH REQUEST/UPDATE
      method: "PATCH",
      headers: {"Accept": "text/plain"},
      body: new FormData(this.formTarget)
    })
    .then(response => response.text())
    .then((data) => {
      // const something = new FormData(this.formTarget)
      // console.log(something);
      this.cardTarget.outerHTML = data;
    })
  }
}
