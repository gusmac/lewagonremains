import "bootstrap";
import "./subcategories";
import $ from 'jquery';
import { initUpdateNavbarOnScroll } from '../components/navbar.js';
import { initDropdownClick } from './dropdown';
import { categorySelector } from './categoryselector';
import { bindSweetAlertButtonDemo } from '../components/sweetalert';
import { initFlatpickr } from './flatpickr'
bindSweetAlertButtonDemo();
initUpdateNavbarOnScroll();
initDropdownClick();
window.$ = $;
window.jQuery = $;
categorySelector();
initFlatpickr();
