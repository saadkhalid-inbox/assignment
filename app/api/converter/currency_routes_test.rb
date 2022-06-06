module Converter
    class CurrencyRoutesTest < Grape::API
        include Utility
        version 'v1', using: :path
        format :json
        rescue_from :all

        resource '/currency' do
            params do
                requires :title, type: String
                requires :usd_value, type: Float
            end
            post :add do
                resp = Converter::addCurrency(params)
            end
            get :all do
                resp = Converter::all()
                return resp
            end
            params do
                requires :currency, type: String
                requires :amount, type: Float
            end
            get :convert do
                resp = params[:amount] * Converter.convert_eur_to_usd(params)
                return {
                    status: 200,
                    converted: "$#{resp}"
                }
            end
        end
        resource :test do
            get :check do
                params
            end
        end
    end
end