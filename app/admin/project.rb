ActiveAdmin.register Project do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
	sidebar "Project Details", only: [:show, :edit] do
    ul do
      li link_to "Charge Hours",    admin_project_charge_hours_path(project)
      li link_to "Expense", admin_project_expenses_path(project)
    end
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

	form do |f|
		f. semantic_errors
		f.inputs :title, :description

		f.inputs "Contract Information", for: [:contract, f.object.contract || Contract.new] do |s|
      s.input :contract_amount
      s.input :contract_number
      s.input :attachment, as: :file

      s.actions
    end
		
		f.inputs "More detail" do 
			f.input :client
			f.input :job_code, as: :select, :collection => JobCode.all.map{|j| [j.title, j.id]}
			f.input :owner
			f.input :collection_risk, as: :select, :collection => [['Low','Low'], ['Normal','Normal'],['High','High']]
			f.input :start_date, as: :datepicker
			f.input :close_date, as: :datepicker
		end
		f.inputs 'Estimated' do
			f.input :estimated_commision
			f.input :estimated_outsourcing
		end
		f.inputs 'Budgeted' do
			f.input :budgeted_expense
			f.input :budgeted_service_fee
		end
		f.inputs 'Billing' do
			f.input :billing_responsibility_user
		end
		f.actions
	end

	controller do
    def permitted_params
      params.permit!
    end
  end
end
