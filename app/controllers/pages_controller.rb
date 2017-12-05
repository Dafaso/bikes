class PagesController < ApplicationController
  def search
    @manufacturers = Manufacturer.all.order(:name)
    @shops = []

    if params[:commit] && params[:commit]=="Search" && params[:manufacturer].present?

      @shops = Shop.all

      if params[:match] == "All"
        @shops = @shops.select do |s|
          (s.manufacturers.map(&:name) & params[:manufacturer]).sort == params[:manufacturer].sort
        end
      else
        @shops = @shops.select do |s|
          (s.manufacturers.map(&:name) & params[:manufacturer]).size > 0
        end
      end
    end

  end
end
