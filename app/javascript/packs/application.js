import "bootstrap";
import "./subcategories";
import $ from 'jquery';
import { initUpdateNavbarOnScroll } from '../components/navbar.js';
import { initDropdownClick } from './dropdown';
initUpdateNavbarOnScroll();
initDropdownClick();
window.$ = $;
window.jQuery = $;
