class StockEntriesController < ApplicationController
  before_action :set_stock_entry, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: %i[index show]

  # GET /stock_entries or /stock_entries.json
  def index
    @stock_entries = StockEntry.all
  end

  # GET /stock_entries/1 or /stock_entries/1.json
  def show
  end

  # GET /stock_entries/new
  def new
    @stock_entry = StockEntry.new
  end

  # GET /stock_entries/1/edit
  def edit
  end

  # POST /stock_entries or /stock_entries.json
  def create
    @stock_entry = StockEntry.new(stock_entry_params)

    respond_to do |format|
      if @stock_entry.save
        format.html { redirect_to stock_entry_url(@stock_entry), notice: "Stock entry was successfully created." }
        format.json { render :show, status: :created, location: @stock_entry }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @stock_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stock_entries/1 or /stock_entries/1.json
  def update
    respond_to do |format|
      if @stock_entry.update(stock_entry_params)
        format.html { redirect_to stock_entry_url(@stock_entry), notice: "Stock entry was successfully updated." }
        format.json { render :show, status: :ok, location: @stock_entry }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @stock_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stock_entries/1 or /stock_entries/1.json
  def destroy
    @stock_entry.destroy!

    respond_to do |format|
      format.html { redirect_to stock_entries_url, notice: "Stock entry was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stock_entry
      @stock_entry = StockEntry.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def stock_entry_params
      params.require(:stock_entry).permit(:quantity, :location, :article_id)
    end
end
