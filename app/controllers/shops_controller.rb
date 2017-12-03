class ShopsController < ApplicationController
  before_action :set_shop, only: [:show, :edit, :update, :destroy]

  # GET /shops
  # GET /shops.json
  def index
    @shops = Shop.all
  end

  # GET /shops/1
  # GET /shops/1.json
  def show
    bikes = Bike.where( 'shop_id = ?', @shop.id )
    @manufacturers = bikes.map{ |b| Manufacturer.find(b.manufacturer_id) }
  end

  # GET /shops/new
  def new
    @shop = Shop.new
    @manufacturers = Manufacturer.all
  end

  # GET /shops/1/edit
  def edit
    @manufacturers = Manufacturer.all
  end

  # POST /shops
  # POST /shops.json
  def create
    @shop = Shop.new(shop_params)

    # in case of form error:
    @manufacturers = Manufacturer.all

    respond_to do |format|
      if @shop.save

        @manufacturers = Manufacturer.all

        params[:shop][:manufacturer].each do |m|
          man = @manufacturers.find{ |mm|mm.name == m }
          Bike.create(shop_id: @shop.id, manufacturer_id: man.id)
        end

        format.html { redirect_to @shop, notice: 'Shop was successfully created.' }
        format.json { render :show, status: :created, location: @shop }
      else
        format.html { render :new }
        format.json { render json: @shop.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shops/1
  # PATCH/PUT /shops/1.json
  def update
    respond_to do |format|
      if @shop.update(shop_params)

      @manufacturers = Manufacturer.all
      @bikes = Bike.where( 'shop_id = ?', @shop.id )

      @bikes.each do |b|
        params[:shop][:manufacturer] ||= []
        unless params[:shop][:manufacturer].include?(b.shop.name)
          b.destroy
        end
      end

      params[:shop][:manufacturer].each do |m|
        man = @manufacturers.find{ |mm|mm.name == m }
        b = @bikes.select{ |bike| bike.shop_id == @shop_id && bike.manufacturer.name == man.id }

        if b.empty?
          Bike.create(shop_id: @shop.id, manufacturer_id: man.id)
        end
      end

        format.html { redirect_to @shop, notice: 'Shop was successfully updated.' }
        format.json { render :show, status: :ok, location: @shop }
      else
        format.html { render :edit }
        format.json { render json: @shop.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shops/1
  # DELETE /shops/1.json
  def destroy
    @shop.destroy
    respond_to do |format|
      format.html { redirect_to shops_url, notice: 'Shop was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shop
      @shop = Shop.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shop_params
      params.require(:shop).permit(:name, :location, :website, :street1, :street2, :city, :state, :phone, :zip, :email, :contact_name, :contact_email, :contact_phone, :description, :notes, :manufacturer)
    end
end
