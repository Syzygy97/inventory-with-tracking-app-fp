import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = [];

  connect() {
    // var map = new Microsoft.Maps.Map("#myMap");
  }

  // static targets = ["myMap", "latitude", "longitude"];

  // connect() {
  //   if (document.getElementById("map_latitude").value.length === 0) {
  //     var center = [14.599512, 120.984222];
  //   } else {
  //     var center = [this.latitudeTarget.value, this.longitudeTarget.value];
  //   }
  //   const map = new Microsoft.Maps.Map(this.myMapTarget, {
  //     center: new Microsoft.Maps.Location(center[0], center[1]),
  //     zoom: 10,
  //   });
  // }
}
