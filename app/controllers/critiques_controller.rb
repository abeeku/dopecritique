class CritiquesController < ApplicationController
  before_action :set_critique, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, except: [:index, :show]
  respond_to :html

  def index
    @critiques = Critique.all
    respond_with(@critiques)
  end

  def show
    respond_with(@critique)
  end

  def new
    @critique = current_user.critiques.build
    respond_with(@critique)
  end

  def edit
  end

  def create
    @critique = current_user.critiques.build(critique_params)
    @critique.save
    respond_with(@critique)
  end

  def update
    @critique.update(critique_params)
    respond_with(@critique)
  end

  def destroy
    @critique.destroy
    respond_with(@critique)
  end

  private
    def set_critique
      @critique = Critique.find(params[:id])
    end

    def critique_params
      params.require(:critique).permit(:song, :description, :user_id)
    end
end
