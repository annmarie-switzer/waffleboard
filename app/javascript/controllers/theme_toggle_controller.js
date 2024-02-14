import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  static targets = ['icon'];

  static values = {
    theme: String
  };

  connect() {
    this.themeValue = localStorage.getItem('theme') || 'dark';
    this.changeTheme();
  }

  toggle() {
    this.themeValue = this.themeValue === 'light' ? 'dark' : 'light';
    localStorage.setItem('theme', this.themeValue);
    this.changeTheme();
  }

  changeTheme() {
    document.body.setAttribute('data-theme', this.themeValue);

    const iconSrc =
      this.themeValue === 'light'
        ? '/assets/sun.svg'
        : '/assets/moon.svg';

    this.iconTarget.src = iconSrc;
  }
}
