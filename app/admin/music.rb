ActiveAdmin.register Music do


  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
   permit_params :name, :link, :created_at, :artist_id
   index do
     selectable_column
     id_column
     column :name
     column :link
     column :artist
     
     column :created_at
     actions
   end
   show do |p|
      attributes_table do
        row :name
        row :link
        
        
        row :created_at
        
      end
      active_admin_comments
    end
    
    
   filter :name
   filter :link
   filter :created_at
   filter :artist

   form multipart: true do |f|
     f.inputs "Admin Details" do
       f.input :name
       f.input :link
       f.input :artist_id, :label => 'Artist', :as => :select, :collection => Artist.all.map{|c| ["#{c.name}", c.id]}
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