$ ->
  $("a[data-remove-link]").click (e) -> 
    # alert "in remove link"
    e.preventDefault()
 
    $(this).prev("input[type=hidden]").val(true)
    $(this).parent(".fields").hide()
    # alert "val=" + $("input[type=hidden]").val()


$ ->
  $("a[data-add-fields]").click (e) -> 
    e.preventDefault()
 
    association = $(this).data("add-fields")
    content = $(this).data("html-str")
    # alert "add-fields: " + association + "\n\n" + "html-str: " + content
    
    new_id = new Date().getTime()
    regexp = new RegExp("new_" + association, "g");
    # alert content.replace(regexp, new_id)

    $(this).after(content.replace(regexp, new_id))
