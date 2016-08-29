ActiveAdmin.register Booking do
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
			f.input :member_id, as: :select, collection: User.all.map{|u| [u.name, u.id]}
			f.input :project
			f.input :charge_rate
			f.input :description
			f.input :state, as: :select, collection: [['actived','actived'],['blocked','blocked']]
			f.actions
		end
	end

	index do
	    selectable_column
	    id_column
	    column :project
	    column :member
	    column :state
	    actions
	end


end
