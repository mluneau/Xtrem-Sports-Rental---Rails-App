import { Controller } from "stimulus"
import { csrfToken } from "@rails/ujs";

export default class extends Controller {
  static targets = [ "status", "button"]

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
          this.buttonTargets.forEach(button => button.classList.add("d-none"))
        }
      })
  }





}
