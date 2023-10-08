import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["frame"];

  refresh(event) {
    event.preventDefault();
    event.stopImmediatePropagation();

    this.frameTarget.innerHTML = "";

    fetch(event.detail.fetchResponse.url)
      .then(response => response.text())
      .then(html => {
        this.frameTarget.innerHTML = html;
      });
  }
}
