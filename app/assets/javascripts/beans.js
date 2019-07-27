$(function() {
  console.log("Loading page done!")
  if (window.location.pathname === "/beans") {
    listeningPageLoad()
  }
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
          <p class="js-description-${this.id}">Description: ${this.description.substring(0, 20)}...</p>
          <button class="js-more", data-id="${this.id}">Read more</button>
          <a href="/beans/${this.id}" class="js-bean" data-id="${this.id}">More about this bean</a>
          </div>`
}

function listeningPageLoad() {
  $.get('/beans' + '.json', function(jsonData) {
    jsonData.forEach(function(data) {
      const beanInstance = new Bean(data)
      const formatHTML = beanInstance.formatHTML()
      const beansWrapper = document.getElementById('beans-wrapper')
      beansWrapper.innerHTML += formatHTML
      moreClick()
    })
  })
}

//Click js-more (Read more)-> display whole description
function moreClick() {
  $('.js-more').on('click', function(e) {
    console.log("fire!")
    e.preventDefault();
    let id = this.dataset.id;
    //let beanData = getBeanData(id)
    $.get("/beans/" + id + ".json", function(beanData) {
      const postDescription = document.querySelector(`.js-description-${id}`)
      postDescription.innerText = `Desctiption:  ${beanData.description}`
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
