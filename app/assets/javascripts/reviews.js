var new_review = "<%= raw escape_javascript(render :partial => 'products/review', :locals => {:review => @review}) %>";

$('.product_Review').append(new_review);

$('.newComment').val(""); 

// review.message
// review.rating