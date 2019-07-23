$(function() {
  $("form").submit(function(e) {
    e.preventDefault();
    const values = $(this).serialize();
    const posting = $.post('/beans', values)
    posting.done(function(beanData) {
      $('#brand').text(beanData["brand"])
      $('#tasteNote').text(beanData["taste_note"])
      $('#description').text(beanData["description"])
      $('#organic').text(beanData["organic"])
      $('#fairTrade').text(beanData["fairtrade"])
      $('#origin_1').text(beanData["origin_1"])
    })
  })
})
