ActiveAdmin.register Region do

  permit_params :name, :client_id

  index do
    selectable_column
    column :name
    actions
  end
  
end
