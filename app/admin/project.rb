ActiveAdmin.register Project do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
permit_params do
  permitted = [:permitted, :attributes]
#  permitted << :other if params[:action] == 'create' && current_user.admin?
  permitted
end

index do
    selectable_column
    id_column
    column :client do |project|
      project.client.title if project.client
    end
    column :job_code
    column :contract_number do |project|
    	project.contract.contract_number if project.contract
    end
    column :contract_amount do |project|
    	project.contract.contract_amount if project.contract
    end
    column :start_date
    column :close_date
    column :project_owner do |project|
    	project.owner.name if project.owner
    end
    actions
  end


end
