$(function() {
  console.log("Loading page done!")
  if (window.location.pathname === "/beans") {
    listeningPageLoad()
  } else if (window.location.pathname === "/beans/new") {
    loadNewPage()
    clickRoasterForm()
  } else {
    displayShowPage()
  }
})

class Bean {
  constructor(data) {
    this.brand = data.brand;
    this.variety = data.variety;
    this.tasteNote = data.taste_note;
    this.description = data.description;
    this.organic = data.organic;
    this.fairtrade = data.fairtrade;
    this.origin_1 = data.origin_1;
    this.origin_2 = data.origin_2;
    this.origin_3 = data.origin_3;
    this.id = data.id;
    this.roasterName = data.roaster.roaster_name
    this.roaster_id = data.roaster.id
  }
  // static newCommentFrom() {
  //   return `
  //   <form method="post">
  //     <label for="comments"></label>
  //     <textarea type="text" value="comments"></textarea>
  //     <input type="submit" />
  //   </form>`
  // };
};

Bean.prototype.formatHTML = function() {
  return `<div class="bean-card-${this.id}">
          <h2>Brand: ${this.brand}</h2>
          <p>Variety: ${this.variety}</p>
          <p>Taste Note: ${this.tasteNote}</p>
        ` // Need </div> ->indexHTML or showHTML
}

Bean.prototype.indexHTML = function() {
  return `
    <p class="js-description-${this.id}">Description: ${this.description.substring(0, 20)}...</p>
    <button class="js-more" data-id="${this.id}" data-roasterid="${this.roaster_id}">Read more</button>
    <a href="/roasters/${this.roaster_id}/beans/${this.id}" class="js-show-page-btn" data-id="${this.id}">More about this bean</a>
    </div>
  `
}

Bean.prototype.showHTML = function() {
  return `
    <p class="js-description-${this.id}">Description: ${this.description}</p>
    <p>Organic: ${this.organic}</p>
    <p>Fair Trade: ${this.fairtrade}</p>
    <p>Origin: ${this.origin_1}</p>
    <p>Origin: ${this.origin_2}</p>
    <p>Origin: ${this.origin_3}</p>
    </div>
  `
}

class Comment {
  constructor(data) {
    this.id = data.id;
    this.favorite = data.favorite;
    this.comments = data.comments;
    this.username = data.user.username;
  }
}

Comment.prototype.commentHTML = function() {
  if (this.comments !== null) {
    return `
      <div>
      <h4>${this.username}</h4>
      <p>${this.comments}</p>
      </div>
    `
  }
}

// Index Page
function listeningPageLoad() {
  $.get('/beans' + '.json', function(res) {
    res.forEach(function(data) {
      const bean = new Bean(data);
      const formatHTML = bean.formatHTML();
      const indexHTML = bean.indexHTML();
      const beansWrapper = document.getElementById('beans-wrapper')
      beansWrapper.innerHTML += formatHTML + indexHTML;
      moreClick()
      //clickBeanForm()
    })
  })
}

//Click js-more (Read more)-> display whole description
function moreClick() {
  $('.js-more').on('click', function(e) {
    console.log("Read more clicked!")
    e.preventDefault();
    let id = this.dataset.id;
    let roasterId = this.dataset.roasterid;
    $.get("/roasters/" + roasterId + "/beans/" + id + ".json", function(beanData) {
      const postDescription = document.querySelector(`.js-description-${id}`)
      postDescription.innerText = `Desctiption:  ${beanData.description}`
    })
  })
}

// New Form (Ruby)
function loadNewPage() {
  console.log("new page now")
}

//Show Page
function displayShowPage() {
  console.log("Show called!")
  let div = document.getElementById("bean-wrapper");
  let beanId = div.dataset.beanid;
  let roasterId = div.dataset.roasterid;
  $.get("/roasters/" + roasterId + "/beans/" + beanId + ".json", function(res) {
    const bean = new Bean(res);
    const formatText = bean.formatHTML();
    const showText = bean.showHTML();

    div.innerHTML += formatText + showText;
    let commentText = res.favorite_and_comments.map(function(favCom) {
      return new Comment(favCom).commentHTML();
    }).join("")  // join("") removes comma in array
    document.getElementById("comments-wrapper").innerHTML += commentText;
    toggleCommentForm();
  })
}

//- toggle comment form
function toggleCommentForm() {
  document.getElementById("comment-btn").addEventListener("click", function() {
    const div= document.getElementById("comment-form")
    if (div.style.display === "none") {
      div.style.display = "block";
    } else {
      div.style.display = "none";
    }
  })
}


//New page - Roaster column show up
function clickRoasterForm() {
  $('#js-create-roaster-btn').on('click', function(e) {
    e.preventDefault();
    const divRoaster = document.getElementById('js-new-roaster');
    if (divRoaster.style.display === "none") {
      divRoaster.style.display = "block"
    } else {
      divRoaster.style.display = "none"
    }
  })
}

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
