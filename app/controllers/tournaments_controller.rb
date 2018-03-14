class TournamentsController < ApplicationController
  before_action :set_tournament, only: [:edit, :update, :destroy]

  # GET /tournaments
  # GET /tournaments.json
  def index
    @tournaments = Tournament.all
  end

  # GET /tournaments/1
  # GET /tournaments/1.json
  def show
     @tournament = Tournament.find(params[:id])
     @users = @tournament.users
  end

  # GET /tournaments/new
  def new
    @tournament = Tournament.new
  end

  # GET /tournaments/1/edit
  def edit
  end

  # POST /tournaments
  # POST /tournaments.json
  def create
    @tournament = Tournament.new(tournament_params)
    @tournament.user_id_owner = current_user.id
    @tournament.qtde_users = 0
    
    respond_to do |format|
      if @tournament.save
        format.html { redirect_to @tournament, notice: 'Tournament was successfully created.' }
        format.json { render :show, status: :created, location: @tournament }
      else
        format.html { render :new }
        format.json { render json: @tournament.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tournaments/1
  # PATCH/PUT /tournaments/1.json
  def update
    respond_to do |format|
      if @tournament.update(tournament_params)
        format.html { redirect_to @tournament, notice: 'Tournament was successfully updated.' }
        format.json { render :show, status: :ok, location: @tournament }
      else
        format.html { render :edit }
        format.json { render json: @tournament.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def registrate_user
    @tournament = Tournament.find(params[:id])
    @tournament.users << current_user
    if @tournament.qtde_users >= 23
      redirect_to tournament_path(@tournament)
      flash[:error] = 'Não adianta, torneio lotado otário!'
    else  
      @tournament.qtde_users += 1
      @tournament.save
      redirect_to tournament_path(@tournament)
      flash[:notice] = 'Registrado com Sucesso'
    end
  end  

  # DELETE /tournaments/1
  # DELETE /tournaments/1.json
  def destroy
    @tournament.destroy
    respond_to do |format|
      format.html { redirect_to tournaments_url, notice: 'Tournament was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tournament
      @tournament = Tournament.find(params[:id])
      if current_user.id == @tournament.user_id_owner || current_user.type_user == 2
        # Do nothing
      else  
        flash[:error] = 'Acesso Negado'
        redirect_to home
      end  
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tournament_params
      params.require(:tournament).permit(:name, :date, user_ids: [])
    end
    
    def tournament_params_registrate
      params.require(:tournament).permit(user_ids: [])
    end
end
