import "material-components-web/index";
import "bootstrap";
import { switch_tabs } from './switch_tabs';
import { loadDynamicBannerText } from '../components/banner';
import { bindSweetAlertButtonDemo } from '../components/sweetalert';

if (document.getElementById("tab_left")) {
  switch_tabs();
}

if (document.getElementById("banner-typed-text")) {
  loadDynamicBannerText();
}

if (document.querySelector("#rum-order")){
  bindSweetAlertButtonDemo();
}
