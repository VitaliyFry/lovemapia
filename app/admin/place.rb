ActiveAdmin.register Place do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

  member_action :approve, method: :patch do
    resource.update(active: true)
    redirect_to :back, notice: "Место подтвержено."
  end

  member_action :decline, method: :delete do
    resource.destroy!
    redirect_to :back, notice: "Место отклонено."
  end
end
