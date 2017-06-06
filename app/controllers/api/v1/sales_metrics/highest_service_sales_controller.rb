class Api::V1::SalesMetrics::HighestServiceSalesController < ApplicationController

  def index
   render json: Bid.highest_service_sales
 end

end

i want to get all the bids "where(bid.last.project.status = :completed)"
&&
sum up their amounts in silos of service_id



find the service with the highest revenue

(project)   status of :completed
(bid)       amount (summed up)
(project)   service_id
