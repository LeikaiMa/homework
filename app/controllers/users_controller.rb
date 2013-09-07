class UsersController < ApplicationController
	before_filter :authenticate_user!
	before_filter :only_allow_admin, :only => [ :destroy ]
	def index
		@users = User.all
	end

	def show
		@user = User.find(params[:id])
	end

	def destroy
		user = User.find(params[:id])
		unless user == current_user
			user.destroy
			redirect_to users_path, notice: "删除成功！"
		else
			redirect_to users_path, alert: "无法删除！"
		end
	end

	private
		def only_allow_admin
			redirect_to root_path, alert: "你没有足够的权限！" unless current_user.has_role? :admin
		end
end
