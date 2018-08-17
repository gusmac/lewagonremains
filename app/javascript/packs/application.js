import "bootstrap";
import "./subcategories";
import $ from 'jquery';
import { initUpdateNavbarOnScroll } from '../components/navbar.js';
import { initDropdownClick } from './dropdown';
import { changeSoldToBuy } from '../components/sweetalert';
import { bindSweetAlertButtonDemo } from '../components/sweetalert';
changeSoldToBuy();
bindSweetAlertButtonDemo();
initUpdateNavbarOnScroll();
initDropdownClick();
window.$ = $;
window.jQuery = $;


