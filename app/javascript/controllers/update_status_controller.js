import { Controller } from "stimulus"
import { csrfToken } from "@rails/ujs";

export default class extends Controller {
  static targets = [ "status", "acceptButton", "denyButton"]

  connect() {
    console.log("Hello!")
  }

  update(event) {
    fetch(event.currentTarget.dataset.url,{
      headers: {"X-CSRF-Token": csrfToken()},
      method: 'PATCH'
    }).then(response => response.json())
      .then((data) => {
        if (data.status) {
          this.statusTarget.innerText = data.type
          this.acceptButtonTarget.classList.add("d-none")
          this.denyButtonTarget.classList.add("d-none")
        }
      })
  }





}
