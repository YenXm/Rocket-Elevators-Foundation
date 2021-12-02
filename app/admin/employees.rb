ActiveAdmin.register Employee do
    permit_params :first_name, :last_name, :function, :email, :user_id
end
