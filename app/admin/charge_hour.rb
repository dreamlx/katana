ActiveAdmin.register ChargeHour do
belongs_to :project
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
	scope("is_owner") { |scop| scop.where('user_id = ?', current_user.id) }
	controller do
    def permitted_params
      params.permit!
    end
  end

	form do |f|
		f. semantic_errors
		f.inputs do
			f.input :user_id, as: :select, collection: Project.find(project).bookings.map{|b| [b.member.name, b.member.id]}, selected: current_user.id
			f.input :project, as: :select, collection: Project.all, :selected => project.id
			f.input :hours
			f.input :charge_date, as: :datepicker
			f.input :description
			f.actions
		end
	end

		index do
	    selectable_column
	    id_column
	    column :project
	    column :user
	    column :charge_rate
	    column :charge_fee do |hour|
	    	hour.charge_rate * hour.hours
	    end
	    column :state
	    actions
	end

	member_action :confirm, method: :get do
	  resource.state == '审核通过'
	  resource.save
	 #  if resource.confirm!
		#   #resource.send_message(current_user, "等待审核", "审核通过")
		# end
	  redirect_to resource_path, notice: "Confirm!"
	end

	member_action :unconfirm, method: :get do
		resource.state == '审核拒绝'
	  resource.save
	 #  if resource.unconfirm!
		#   #resource.send_message(current_user, "等待审核", "审核拒绝")
		# end
	  redirect_to resource_path, notice: "Not allow!"
	end

	action_item only: :show do
	  link_to t(:confirm), confirm_admin_project_charge_hour_path(project, charge_hour) if current_user == charge_hour.project.owner
	end

	action_item only: :show do
	  link_to t(:unconfirm), unconfirm_admin_project_charge_hour_path(project,charge_hour) if current_user == charge_hour.project.owner
	end

	after_update do |h|
		h.state == '等待审核'
		h.save
		#resource.send_message(current_user, "审核拒绝", "等待审核")
	end
end
