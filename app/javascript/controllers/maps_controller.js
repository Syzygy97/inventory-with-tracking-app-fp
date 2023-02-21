import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["latitude", "longitude"];

  connect() {
    var map = new window.Microsoft.Maps.Map("#myMap", {
      credentials: "<%= Rails.application.credentials[:bing_maps_key]%>",
      center: new window.Microsoft.Maps.Location(14.582919, 120.979683),
      zoom: 12,
    });

    // NOTE: Presently, Business entities are only available in the following countries: US, CA, AU, IN, DE, ES, IT and BR. These are irrespective of the culture parameter.

    Microsoft.Maps.loadModule("Microsoft.Maps.AutoSuggest", function () {
      var manager = new Microsoft.Maps.AutosuggestManager({ map: map });
      manager.attachAutosuggest(
        "#searchBox",
        "#searchBoxContainer",
        selectedSuggestion
      );
    });

    function selectedSuggestion(result) {
      map.entities.clear();
      // Center map over it.
      map.setView({ bounds: result.bestView });
      document.getElementById("marker_latitude").value =
        result.location.latitude;
      document.getElementById("marker_longitude").value =
        result.location.longitude;
    }
  }
}
