class AdminController < ApplicationController
    before_action :authenticate_user!
    before_action :deny_access
    layout 'admin'

    private

    def deny_access
        if current_user.user?
            flash[:error] = t('deny_access')
            redirect_to root_path
        end
    end
end
