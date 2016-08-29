ActiveAdmin.register Expense do
belongs_to :project
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
	scope("is_owner") { |scop| scop.where('user_id = ?', current_user.id) }
	sidebar "Details", only: [:show, :edit, :new] do
    ul do
      li link_to "Expense Category", 				admin_expense_categories_path
    end
  end

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
			f.input :amount
			f.input :expense_category
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
	    column :expense_category
	    column :amount
	    column :state
	    column :created_at
	    column :updated_at
	    actions
	end
end
