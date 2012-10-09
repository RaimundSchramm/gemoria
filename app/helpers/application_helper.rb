module ApplicationHelper
  def link_to_add_fields(name, form_builder, association)
    new_object  = form_builder.object.send(association).klass.new
    id          = new_object.object_id
    fields      = form_builder.fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize + "_fields", f: builder)
    end
    link_to(name, '#', class: 'add_fields', data: {id: id, fields: fields.gsub("\n", "")})
  end
end
