class TaskingsController < ApplicationController
  # GET /taskings
  # GET /taskings.json
  def index
    @taskings = Tasking.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @taskings }
    end
  end

  # GET /taskings/1
  # GET /taskings/1.json
  def show
    @tasking = Tasking.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tasking }
    end
  end

  # GET /taskings/new
  # GET /taskings/new.json
  def new
    @tasking = Tasking.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tasking }
    end
  end

  # GET /taskings/1/edit
  def edit
    @tasking = Tasking.find(params[:id])
  end

  # POST /taskings
  # POST /taskings.json
  def create
    @tasking = Tasking.new(params[:tasking])

    respond_to do |format|
      if @tasking.save
        format.html { redirect_to @tasking, notice: 'Tasking was successfully created.' }
        format.json { render json: @tasking, status: :created, location: @tasking }
      else
        format.html { render action: "new" }
        format.json { render json: @tasking.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /taskings/1
  # PUT /taskings/1.json
  def update
    @tasking = Tasking.find(params[:id])

    respond_to do |format|
      if @tasking.update_attributes(params[:tasking])
        format.html { redirect_to @tasking, notice: 'Tasking was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tasking.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /taskings/1
  # DELETE /taskings/1.json
  def destroy
    @tasking = Tasking.find(params[:id])
    @tasking.destroy

    respond_to do |format|
      format.html { redirect_to taskings_url }
      format.json { head :no_content }
    end
  end
end
