class Roaster {
  constructor(data) {
    this.roaster_name = data.roaster_name;
    this.city = data.city;
    this.state = data.state;
    this.description = data.description;
    this.url = data.url;
    this.id = data.id;
  }
}

Roaster.prototype.indexHTML = function() {
  return `
    <div>
    <h2>${this.roaster_name}</h2>
    <p>${this.city}, ${this.state}</p>
    <p>${this.url}</p>
    <p class="js-roaster-description-${this.id}">${this.description.substring(0,20)}...</p>
    <button class="js-more" data-id="${this.id}">Read more</button>
    </div>
    `
}

function displayRoasters() {
  console.log("roasters!")
  const roasterWrapper = document.getElementById("js-roasters")
  $.get("/roasters" + ".json", function(res) {
    res.forEach(function(data) {
      roaster = new Roaster(data)
      roasterWrapper.innerHTML += roaster.indexHTML()
      clickReadMore()
    })
  })
}
