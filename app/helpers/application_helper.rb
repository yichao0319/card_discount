module ApplicationHelper

  ## yichao: dynamically remove a form
  def link_to_remove_fields(name, f)
    f.hidden_field(:_destroy) + link_to(name, "#", :'data-remove-link' => '')
  end

  ## yichao: dynamically add a form
  def link_to_add_fields(name, f, association)
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
      render(association.to_s.singularize + "_form", :f => builder)
    end
    # link_to_function(name, h("add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\")"))
    link_to(name, "#", :'data-add-fields' => "#{association}", :'data-html-str' => h("#{fields}"))
    # flash.now[:alert] = "#{association} 'a' === " + h("#{association} 'a'")
    # link_to(name, "#", :onclick => h("add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\")"))
  end


end
