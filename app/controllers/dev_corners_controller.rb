class DevCornersController < ApplicationController
  before_action :set_dev_corner, only: [:show, :edit, :update, :destroy]

# Rating Functions
  def voteone
    @dev_corner = DevCorner.find(params[:id])
    @dev_corner.vote_by :voter => current_user, :vote_weight => 1
    redirect_to dev_corners_path
  end

  def votetwo
    @dev_corner = DevCorner.find(params[:id])
    @dev_corner.vote_by :voter => current_user, :vote_weight => 2
    redirect_to dev_corners_path
  end

  def votethree
    @dev_corner = DevCorner.find(params[:id])
    @dev_corner.vote_by :voter => current_user, :vote_weight => 3
    redirect_to dev_corners_path
  end

  def votefour
    @dev_corner = DevCorner.find(params[:id])
    @dev_corner.vote_by :voter => current_user, :vote_weight => 4
    redirect_to dev_corners_path
  end

  def votefive
    @dev_corner = DevCorner.find(params[:id])
    @dev_corner.vote_by :voter => current_user, :vote_weight => 5
    redirect_to dev_corners_path
  end

  def unvote
    @dev_corner = DevCorner.find(params[:id])
    @dev_corner.unvote_by current_user
    redirect_to dev_corners_path
  end


  # GET /dev_corners
  # GET /dev_corners.json
  def index
    @dev_corners = DevCorner.all
  end

  # GET /dev_corners/1
  # GET /dev_corners/1.json
  def show
  end

  # GET /dev_corners/new
  def new
    @dev_corner = DevCorner.new
  end

  # GET /dev_corners/1/edit
  def edit
  end

  # POST /dev_corners
  # POST /dev_corners.json
  def create
    @dev_corner = DevCorner.new(dev_corner_params)
    @dev_corner.profile = current_user.profile if current_user
    respond_to do |format|
      if @dev_corner.save
        format.html { redirect_to @dev_corner, notice: 'Dev corner was successfully created.' }
        format.json { render :show, status: :created, location: @dev_corner }
      else
        format.html { render :new }
        format.json { render json: @dev_corner.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dev_corners/1
  # PATCH/PUT /dev_corners/1.json
  def update
    respond_to do |format|
      if @dev_corner.update(dev_corner_params)
        format.html { redirect_to @dev_corner, notice: 'Dev corner was successfully updated.' }
        format.json { render :show, status: :ok, location: @dev_corner }
      else
        format.html { render :edit }
        format.json { render json: @dev_corner.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dev_corners/1
  # DELETE /dev_corners/1.json
  def destroy
    @dev_corner.destroy
    respond_to do |format|
      format.html { redirect_to dev_corners_url, notice: 'Dev corner was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dev_corner
      @dev_corner = DevCorner.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dev_corner_params
      params.require(:dev_corner).permit(:profile_id, :skills, :experience, :strengths)
    end
end
