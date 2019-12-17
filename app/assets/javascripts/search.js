document.addEventListener('turbolinks:load',function(){
    input= $( ".search" )
    var options = []
  
    
    options = {

        url: function(phrase){
            return "/search.json?q="+phrase;
        },
        categories: [{
            listLocation: "discussions",
            // maxNumberOfElements: 4,
            // header: "Marvel - heroes"
            header: "<strong>Discussions</strong>"
        }, 
        ],
        
        getValue: function(elements) {
            console.log(elements.title)
            return elements.title
        },
        list:{
            onChooseEvent: function(){
            var url=input.getSelectedItemData().url
            console.log(url)
            input.val("")
            Turbolinks.visit(url) 
        
            }
        }
        
    }
    
 
      
    // console.log(input)
    // console.log(options)
    // input.css("background-color", "yellow");
    // $( ".search" ).css( "border", "3px solid red" );
    $( ".search" ).easyAutocomplete(options);
})