ActiveAdmin.register Project do
menu priority: 2 # so it's on the very left
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or

	#actions :index, :show, :create, :edit, :update, :destroy
	sidebar "Project Details", only: [:show, :edit] do
    ul do
    	li link_to 'Booking team', 		admin_project_bookings_path(project) if current_user == project.owner
      if project.bookings.map{|member| member.member_id}.include?(current_user.id)
      	li link_to "Charge Hours",    admin_project_charge_hours_path(project)
      	li link_to "Expense", 				admin_project_expenses_path(project)
      end
    end
  end

	index do
	    selectable_column
	    id_column

	    column :title
	    column :client do |project|
	      project.client.title if project.client
	    end
	    column :project_owner do |project|
	    	project.owner.name if project.owner
	    end
	    column :contract_number do |project|
	    	project.contract.contract_number if project.contract
	    end

	    column :start_date
	    column :close_date

	    column do |project|
	    	link_to 'View', admin_project_path(project)
	    end
	end

	show do
    attributes_table do
      row :title
      row :client
      row :owner
      row :description
      if current_user == project.owner
	      row :contract_number do |project|
		    	project.contract.contract_number if project.contract
		    end
	      row :contract_amount do |project|
		    	project.contract.contract_amount if project.contract
		    end
		    row :attachment do |project|
		    	project.contract.attachment.url if project.contract && project.contract.attachment
		    end
		    row :collection_risk
		    row :start_date
		    row :close_date
		    row :estimated_commision
		    row :estimated_outsourcing
		    row :budgeted_expense
		    row :budgeted_service_fee
		    row :billing_responsibility_user
	  	end
    end
    active_admin_comments
  end

	form do |f|
		f. semantic_errors
		f.inputs :owner, :title, :description

		f.inputs "Contract Information", for: [:contract, f.object.contract || Contract.new] do |s|
      s.input :contract_amount
      s.input :contract_number
      s.input :attachment, as: :file

      s.actions
    end

		f.inputs "More detail" do
			f.input :client
			#f.input :job_code, as: :select, :collection => JobCode.all.map{|j| [j.title, j.id]}

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

		f.inputs 'State' do
			f.input :state, as: :select, collection: [['项目开始','项目开始'],['项目关闭','项目关闭']]
		end
		f.actions
	end

	controller do
    def permitted_params
      params.permit!
    end
  end
end
