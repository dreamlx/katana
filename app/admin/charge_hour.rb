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
			f.input :user_id, as: :select, collection: User.all.map{|u| [u.name, u.id]}, selected: current_user.id
			f.input :project
			f.input :hours
			f.input :charge_rate
			f.input :charge_date, as: :datepicker
			f.actions
		end
	end
end
