import "bootstrap";
import "./subcategories";
import "./subcategories_buy";
import $ from 'jquery';
import { initUpdateNavbarOnScroll } from '../components/navbar.js';
import { initDropdownClick } from './dropdown';
import { changeSoldToBuy } from '../components/sweetalert';
import { categorySelector } from './categoryselector';
import { bindSweetAlertButtonDemo } from '../components/sweetalert';
import { initFlatpickr } from './flatpickr';

const sellAdvertShow = document.querySelector(".sell_adverts.show");

if (sellAdvertShow) {
  changeSoldToBuy();
bindSweetAlertButtonDemo();
}


initUpdateNavbarOnScroll();
initDropdownClick();
window.$ = $;
window.jQuery = $;
categorySelector();
initFlatpickr();
