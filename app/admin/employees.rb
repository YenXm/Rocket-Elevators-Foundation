ActiveAdmin.register Employee do
  menu parent: 'Users +'

  permit_params :first_name, :last_name, :function, :email, :user_id
end
