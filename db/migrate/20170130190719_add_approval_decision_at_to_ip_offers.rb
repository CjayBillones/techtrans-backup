class AddApprovalDecisionAtToIpOffers < ActiveRecord::Migration[5.0]
  def change
    add_column :ip_offers, :approval_decision_at, :datetime
  end
end
