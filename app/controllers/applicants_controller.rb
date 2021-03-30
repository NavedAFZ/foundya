class ApplicantsController < ApplicationController
  before_action :set_applicant, only: %i[show edit update destroy]
  before_action :authenticate_user!, except: %i[index show]
  before_action :correct_user, only: %i[edit update destroy]
  before_action :check, only: [:new]
  # GET /applicants or /applicants.json
  def index
    @applicants = Applicant.all
  end

  # GET /applicants/1 or /applicants/1.json
  def show; end

  def search
    @applicants = Applicant.where('name LIKE ?', '%' + params[:q] + '%')
  end

  def mine
    @applicants = Applicant.all
  end

  # GET /applicants/new
  def new
    # @applicant = Applicant.new
    @applicant = current_user.applicants.build
    # @applicant = current_user.build_applicant
  end

  # GET /applicants/1/edit
  def edit; end

  # POST /applicants or /applicants.json
  def create
    # @applicant = Applicant.new(applicant_params)
    # @applicant = current_user.build_applicant(applicant_params)
    @applicant = current_user.applicants.build(applicant_params)

    respond_to do |format|
      if @applicant.save
        format.html { redirect_to @applicant, notice: 'Applicant was successfully created.' }
        format.json { render :show, status: :created, location: @applicant }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @applicant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /applicants/1 or /applicants/1.json
  def update
    respond_to do |format|
      if @applicant.update(applicant_params)
        format.html { redirect_to @applicant, notice: 'Applicant was successfully updated.' }
        format.json { render :show, status: :ok, location: @applicant }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @applicant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /applicants/1 or /applicants/1.json
  def destroy
    @applicant.destroy
    respond_to do |format|
      format.html { redirect_to applicants_url, notice: 'Applicant was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def check
    @ct = current_user.applicants.count
    redirect_to applicants_path, notice: 'Allready created' if current_user.applicants.count >= 1
  end

  def correct_user
    @applicant = current_user.applicants.find_by(id: params[:id])

    redirect_to applicants_path, notice: 'Not authorised' if @applicant.nil?
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_applicant
    @applicant = Applicant.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def applicant_params
    params.require(:applicant).permit(:name, :email, :github_url, :linked_in, :cv_url, :description, :skill1,
                                      :skill2, :skill3, :project1, :project1_url, :project2, :project2_url, :project3, :project3_url, :experience1, :experience2, :experience3, :user_id)
  end
end
