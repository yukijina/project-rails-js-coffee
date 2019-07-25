$(function() {
  console.log("Loading page done!")
  //index.html.erb
  listeningPageLoad()
})

class Bean {
  constructor(data) {
    this.brand = data.brand;
    this.variety = data.variety;
    this.tasteNote = data.taste_note;
    this.description = data.description;
    this.id = data.id;
    this.roasterName = data.roaster.roaster_name

  }
}

Bean.prototype.formatHTML = function() {
  return `<div class="BeanCard-${this.id}">
          <h2>Brand: ${this.brand}</h2>
          <p>Variety: ${this.variety}</p>
          <p>Taste Note: ${this.tasteNote}</p>
          <p>Description: ${this.description.substring(0, 20)}...</p>
          <button class="js-more", data-id="${this.id}">More Info</button>
          </div>`
}

function listeningPageLoad() {
  $.get('/beans' + '.json', function(jsonData) {
    jsonData.forEach(function(data) {
      const beanData = new Bean(data)
      const formatHTML = beanData.formatHTML()
      const testDiv = document.getElementById('test')
      testDiv.innerHTML += formatHTML
      moreInfoClick()
    })
  })
}

function moreInfoClick() {
  $('.js-more').on('click', function(e) {
    console.log("fire!")
    e.preventDefault();
    let id = this.dataset.id;
    console.log(id)
    $.get("/beans/" + id + ".json", function(beanData) {
      console.log(beanData)
    })
  })
}


//**new.html.erb**
//Add origin
//Remove origin

//Create a new Roaster - column show up
// $('#create-roaster').on('click', function(e) {
//   e.preventDefault();
//   const divRoaster = document.getElementById('js-new-roaster')
//   if (divRoaster.style.display === "none") {
//     divRoaster.style.display = "block"
//   } else {
//     divRoaster.style.display = "none"
//   }
//
// })

//
// $("form").submit(function(e) {
//   e.preventDefault();
//   const values = $(this).serialize();
//   const posting = $.post('/beans', values)
//   posting.done(function(beanData) {
//     $('#brand').text(beanData["brand"])
//     $('#tasteNote').text(beanData["taste_note"])
//     $('#description').text(beanData["description"])
//     $('#organic').text(beanData["organic"])
//     $('#fairTrade').text(beanData["fairtrade"])
//     $('#origin_1').text(beanData["origin_1"])
//   })
// })
