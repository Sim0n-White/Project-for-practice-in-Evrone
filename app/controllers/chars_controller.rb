class CharsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_char, only: [:show, :edit, :update, :destroy]
  # GET /chars
  # GET /chars.json
  def index
    @chars = Char.where('nick LIKE ?', current_user.nickname)
  end

  # GET /chars/1
  # GET /chars/1.json
  def show; end

  # GET /chars/new
  def new
    @char = Char.new
  end

  # GET /chars/1/edit
  def edit; end

  # POST /chars
  # POST /chars.json
  def create
    @char = Char.new(char_params)
    respond_to do |format|
      if @char.save
        format.html { redirect_to @char, notice: 'Char was successfully created.' }
        format.json { render :show, status: :created, location: @char }
      else
        format.html { render :new }
        format.json { render json: @char.errors, status: :unprocessable_entity }
        end
      end
  end

  # PATCH/PUT /chars/1
  # PATCH/PUT /chars/1.json
  def update
    respond_to do |format|
      if @char.update(char_params)
        format.html { redirect_to @char, notice: 'Char was successfully updated.' }
        format.json { render :show, status: :ok, location: @char }
      else
        format.html { render :edit }
        format.json { render json: @char.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chars/1
  # DELETE /chars/1.json
  def destroy
    @char.destroy
    respond_to do |format|
      format.html { redirect_to chars_url, notice: 'Char was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_char
      @char = Char.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def char_params
      params.require(:char).permit(:name, :strength, :perception, :endurance, :charisma, :intelligence, :agility, :luck, :nick)
    end

end
