ActiveAdmin.register User do

  permit_params :name, :email, :charge_rate, :password, :password_confirmation, :role

  scope("all"){|scop| scop.all}
  scope("superadmin") { |scop| scop.where('role = ?', 'superadmin') }
  scope("project_manager") { |scop| scop.where('role = ?', 'pm') }
  scope("staff") { |scop| scop.where('role = ?', 'staff') }
  
  index do
    selectable_column
    id_column
    column :email
    column :name
    column :role
    column :charge_rate
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  filter :email
  filter :name
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs "Admin Details" do
      f.input :email
      f.input :name
      f.input :role, as: :radio, collection: [['superadmin','superadmin'],['pm','pm'],['stff','stff']]
      f.input :charge_rate
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

  controller do

    def update
      if params[:user][:password].blank?
        params[:user].delete("password")
        params[:user].delete("password_confirmation")
      end
      super
    end

  end
end
