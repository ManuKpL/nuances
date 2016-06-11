ActiveAdmin.register User do

permit_params :email, :first_name, :last_name, :nickname, :twitter, :facebook, :admin, :editor, :photo, :celeb
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

index do
  selectable_column
  column :id
  column :nickname
  column :email
  column :admin
  column :editor
  column :celeb
  column :first_name
  column :last_name
  column :twitter
  column :facebook
  column :photo
  actions
end

form do |f|
  f.inputs "Identity" do
    f.input :email
    f.input :first_name
    f.input :last_name
    f.input :nickname
  end
  f.inputs "Photo" do
    f.input :photo
  end
  f.inputs "Accounts" do
    f.input :twitter
    f.input :facebook
  end
  f.inputs "Admin" do
    f.input :admin
    f.input :editor
    f.input :celeb
  end
  f.actions
end


end
