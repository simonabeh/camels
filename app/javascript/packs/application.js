import "bootstrap";
import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!
import { initMapbox } from '../plugins/init_mapbox';
import "../plugins/flatpickr";

import '@mapbox/mapbox-gl-geocoder/dist/mapbox-gl-geocoder.css';
initMapbox();

import { initDropdownMenu } from '../components/dropdown';

if (document.getElementById('bookings-title')) {
  initDropdownMenu();
}

