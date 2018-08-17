import "bootstrap";
import "./subcategories";
import $ from 'jquery';
import { initUpdateNavbarOnScroll } from '../components/navbar.js';
import { initDropdownClick } from './dropdown';
import { bindSweetAlertButtonDemo } from '../components/sweetalert';
bindSweetAlertButtonDemo();
initUpdateNavbarOnScroll();
initDropdownClick();
window.$ = $;
window.jQuery = $;


