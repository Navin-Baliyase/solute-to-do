class TodolistsController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_todolist, only: [:show, :update, :destroy]

  # GET /todolists
  def index
    @todolists = Todolist.all
  end

  # GET /todolists/1
  def show
  end

  # POST /todolists
  def create
    @todolist = Todolist.new(todolist_params)
    if @todolist.save
      render json: @todolist, status: :created, location: @todolist
    else
      render json: @todolist.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /todolists/1
  def update
    if @todolist.user_id == current_user.id
      if @todolist.update(todolist_params)
        render json: @todolist
      else
        render json: @todolist.errors, status: :unprocessable_entity
      end
    else
      render json: {
        status: 401,
        message: "Unauthorized to perform action",
      }.to_json
    end
  end

  # DELETE /todolists/1
  def destroy
    if @todolist.user_id == current_user.id
     @todolist.destroy
   else
    render json: {
      status: 401,
      message: "Unauthorized to perform action",
    }.to_json
  end
end

private
    def set_todolist
      @todolist = Todolist.find(params[:id])
    end

    def todolist_params
      params.require(:todolist).permit(:title, :description)
    end
  end
