class SubsController < ApplicationController
  before_action :require_logged_in, except: [:index, :show]
  before_action :require_moderator_edit, only: [:edit, :update]

  def new
    @sub = Sub.new
  end

  def create
    @sub = current_user.subs.new(sub_params)

    if @sub.save
      redirect_to sub_url(@sub)
    else
      flash[:errors] = @sub.errors.full_messages
      render :new
    end
  end

  def update
    @sub = Sub.find(params[:id])

    if @sub.update_attributes(sub_params)
      redirect_to sub_url(@sub)
    else
      flash[:errors] = @sub.errors.full_messages
      render :new
    end
  end

  def index
    @subs = Sub.all
    render :index
  end

  def show
    @sub = Sub.find(params[:id])
  end

  def edit
    @sub = Sub.find(params[:id])
  end

  private
  def sub_params
    params.require(:sub).permit(:title, :description)
  end

  def require_moderator_edit
    if current_user.subs.find_by(id: params[:id])
      return
    else
      render json: 'Must be moderator', status: :forbidden
    end
  end
end
