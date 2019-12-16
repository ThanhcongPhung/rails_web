document.addEventListener("turbolinks:load",function(){
    $input=$("[data-behaviour='autocomplete]")
    var options= {
        getValue: "title",
        url: function(phrase){
            return "/search.json?q="+phrase;
        },
        categories:[
            {
                listLocation: "disscussions",
                header: "<strong>Discussions</strong>",
            }

        ],
        list:{
            onChooseEvent: function(){
                var url=$input.getSelectedItemData().url
                console.log(url)
                // $input.val("")
                // Tuborlinks.visit(url) 

            }
        }
    }
    $input.easyAutocomplete(options);
})