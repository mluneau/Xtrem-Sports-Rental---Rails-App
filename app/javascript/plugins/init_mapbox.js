import mapboxgl from 'mapbox-gl';

const buildMap = (mapElement) => {
  mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
  return new mapboxgl.Map({
    container: 'map',
    style: 'mapbox://styles/mapbox/streets-v10'
  });
};

const addMarkersToMap = (map, markers) => {
  // mapMarkers = []
  markers.forEach((marker) => {
    const popup = new mapboxgl.Popup().setHTML(marker.infoWindow);

    // Create a HTML element for your custom marker
    const element = document.createElement('div');
    element.className = 'marker';
    element.style.backgroundImage = `url('${marker.image_url}')`;
    element.style.backgroundSize = 'contain';
    element.style.backgroundRepeat = 'no-repeat'
    element.style.width = '25px';
    element.style.height = '25px';

    // Pass the element as an argument to the new marker
    const newMarker = new mapboxgl.Marker(element)
      .setLngLat([marker.lng, marker.lat])
      .setPopup(popup)
      .addTo(map);
    // add event listener on newMarker
    newMarker.getElement().dataset.markerId = marker.id;
    newMarker.getElement().addEventListener('mousedown', (event) => toggleCardHighlighting(event))
    // newMarker.getElement().addEventListener('mouseleave', (event) => toggleCardHighlighting(event))
  });
};

const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
  map.fitBounds(bounds, { padding: 20, maxZoom: 15, duration: 0 });
};

const initMapbox = () => {
  const mapElement = document.getElementById('map');
  if (mapElement) {
    const map = buildMap(mapElement);
    const markers = JSON.parse(mapElement.dataset.markers);
    addMarkersToMap(map, markers);
    fitMapToMarkers(map, markers);
  }
};

const toggleCardHighlighting = (event) => {
  event.preventDefault()
  const card = document.querySelector(`[data-equipment-id="${event.currentTarget.dataset.markerId}"]`);
  const cards = document.querySelectorAll(".card-product");
  console.log(cards)
  cards.forEach(card => card.classList.remove('highlight'));
  card.classList.toggle('highlight');
  card.scrollIntoView({behavior: "smooth"});
}

export { initMapbox };
