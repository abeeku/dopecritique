ActiveAdmin.register Artist do


  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
   permit_params :name, :bio, :avatar, :created_at
   index do
     selectable_column
     id_column
     column :name
     column :tags
     column :bio
     column :avatar do |p|
               image_tag(p.avatar.url(:thumb))
             end
     
     column :created_at
     actions
   end
   show do |p|
      attributes_table_for |rtist do
        row :name
        row :bio
        row 'Tags' do
            artist.tag_list.map {|t| link_to t, tag_path(t)}.join(', ')
        end
        row :avatar do
          image_tag p.avatar.url
        end
        
        row :created_at
        
      end
      active_admin_comments
    end
    
    
   filter :name
   filter :bio

   filter :created_at
   

   form multipart: true do |f|
     f.inputs "Admin Details" do
       f.input :name
       f.input :bio
       f.collection_text_boxes :tags,:to_s,:to_s
       f.input :avatar
   #    f.input :category_id, :label => 'Category', :as => :select, :collection => Category.all.map{|c| ["#{c.name}", c.id]}
     end
     f.actions
   end
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end


end