class FunsController < ApplicationController
  # GET /funs
  # GET /funs.json
  def index
    @funs = Fun.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @funs }
    end
  end

  # GET /funs/1
  # GET /funs/1.json
  def show
    @fun = Fun.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @fun }
    end
  end

  # GET /funs/new
  # GET /funs/new.json
  def new
    @fun = Fun.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @fun }
    end
  end

  # GET /funs/1/edit
  def edit
    @fun = Fun.find(params[:id])
  end

  # POST /funs
  # POST /funs.json
  def create
    @fun = Fun.new(params[:fun])

    respond_to do |format|
      if @fun.save
        format.html { redirect_to @fun, notice: 'Fun was successfully created.' }
        format.json { render json: @fun, status: :created, location: @fun }
      else
        format.html { render action: "new" }
        format.json { render json: @fun.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /funs/1
  # PUT /funs/1.json
  def update
    @fun = Fun.find(params[:id])

    respond_to do |format|
      if @fun.update_attributes(params[:fun])
        format.html { redirect_to @fun, notice: 'Fun was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @fun.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /funs/1
  # DELETE /funs/1.json
  def destroy
    @fun = Fun.find(params[:id])
    @fun.destroy

    respond_to do |format|
      format.html { redirect_to funs_url }
      format.json { head :no_content }
    end
  end
end
