class StorageSpacesController < ApplicationController
  before_action :set_storage_space, only: [:show, :destroy, :edit, :update]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    if params[:query].present?
      sql_query = " \
        storage_space.title @@ :query \
        OR storage_space.description @@ :query \
      "
      @storage_spaces = StorageSpace.where(sql_query, query: "%#{params[:query]}%")
    else
      @storage_spaces = StorageSpace.all
    end
    # @storage_spaces = policy_scope(StorageSpace).order(created_at: :desc)
  end

  def show
  end

  def new
    @storage_space = StorageSpace.new
    # authorize @storage_space
  end

  def create
    # authorize @storage_space
    @storage_space = StorageSpace.new(storage_space_params)
    @storage_space.user = current_user

    if @storage_space.save
      redirect_to storage_space_path(@storage_space), notice: 'Storage Space was successfully created.'
    else
      render :new, alert: 'Could not create the storage_space'
    end
  end

  def edit
  end

  def update
    # authorize @storage_space
    if @storage_space.update(storage_space_params)
      redirect_to @storage_space, notice: 'Storage Space was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    # authorize @storage_space
    @storage_space.destroy
    # redirect
  end

  private

  def set_storage_space
    @storage_space = StorageSpace.find(params[:id])
    # authorize @storage_space
  end

  def storage_space_params
    params.require(:storage_space).permit(
      :title,
      :description,
      :address,
      :price_cents,
      :photo)
  end

end
