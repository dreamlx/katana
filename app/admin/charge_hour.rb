ActiveAdmin.register ChargeHour do
belongs_to :project
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
	controller do
    def permitted_params
      params.permit!
    end
  end

	form do |f|
		f. semantic_errors
		f.inputs do
			f.input :booking_id, as: :select, collection: Project.find(project).bookings.map{|b| [b.member.name, b.id]}, selected: current_user.id
			f.input :project, as: :select, collection: Project.all, :selected => project.id
			f.input :hours
			f.input :charge_date, as: :datepicker
			f.actions
		end
	end

		index do
	    selectable_column
	    id_column
	    column :project
	    column :booking
	    column :charge_rate
	    column :charge_fee do |hour|
	    	hour.charge_rate * hour.hours
	    end
	    column :state
	    actions
	end
end
