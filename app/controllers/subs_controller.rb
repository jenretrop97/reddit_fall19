class SubsController < ApplicationController
  # M odel - All the logic on the table or record, database 
  # restraints, associations
  # V iew - user interaction, front end. keep logic to a minimum
  # C ontrollers/routes - directs traffic, actions - what 
  # you can do on the website
              # HTTP VERBS
  # C create -> POST
  # R read -> GET
  # U update -> PUT/PATCH
  # D destroy -> DELETE

  # ALL Actions must return a response
    # HTML, XML, JSON or redirect to an action that does
    # HTML by Default, html page of the action name action.html.erb

  #Callbacks - perform logic at certain actions
  # before_action
  # after_action
  # skip_before_action
  # skip_after_action

  # before_action :method_to_call - all methods
  # before_action :method_to_call, only: OR except: [:index, :show, :new]

  # Partials are common/shared views

  # READ - GET
    # Pages user will see and interact with
    # Shows record fromt he db onto the pages

    # index action - see all of the record for the table
      # @model_names = Mondel_name.all
      # gets all the records and se them to a variable

    # show action - see a single record, id 
      # @model_name = Model_name.find(params[:id])

    # new action - display the new record form, and creates it in memory
    # record inmemory
      # @model_name = Model_name.new

    # edit action - displays the edit record form, id
      # @model_name = Model_name.find(params[:id])

  # CREATE/POST
    # create action -  create a record from the new action
    #@model_name = Model_name.new(model_name_params)
    # if @model_name.save
      # do something
    # else
      # render :new 
    # end

  # UPDATE/PUT or PATCH
    # update action - edit a record, edit form, id
    # @model_name = Model_name.find(params[:id])
    # if @model_name.update(model_name_params)
      # do something
    # else
      # render :edit
    #end

  # DESTROY/DELETE
    # destroy action - delece a record, id
    # Model_name.find(params[:id]).destroy
    # do something

  # model_name_params
    # - pass certain attr

  # private
  #   def model_name_params
  #     params.require(:model_name).permit(:attr, :everything that table has)
  #   end



  def index
    @subs = Sub.all
  end

  def show
    @sub = Sub.find(params[:id])
  end

  def new
    @sub = Sub.new
  end

  def create
    @sub = Sub.new(sub_params)
    
    if  @sub.save
      redirect_to_subs_path
    else
      render :new
    end
  end

  def edit
  @sub = Sub.find(params[:id])
  render partial: 'form'
  end

  def update
  @sub = Sub.find(parasm[:id])
  
  if sub.update(sub_params)
    redirect_to redirect_to_subs_path
  else
    render :edit
  end

  def destroy
    Sub.find(Params[:id]).destroy
    redirect_to subs_path
  end

  private
  def sub_params
  params.require(:sub).permit (:name)
  end 
end
