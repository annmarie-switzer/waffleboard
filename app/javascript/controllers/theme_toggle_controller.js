import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  static targets = ['icon'];

  static values = {
    theme: String
  };

  initialize() {
    this.themeValue = localStorage.getItem('theme') || 'dark';
  }

  toggle() {
    this.themeValue = this.themeValue === 'light' ? 'dark' : 'light';
    localStorage.setItem('theme', this.themeValue);
  }

  themeValueChanged(curr, prev) {
    document.body.setAttribute('data-theme', curr);

    this.iconTarget.src =
      curr === 'light' ? '/assets/moon.svg' : '/assets/sun.svg';
  }
}
