class AddApprovalDecisionAtToIpNeeds < ActiveRecord::Migration[5.0]
  def change
    add_column :ip_needs, :approval_decision_at, :datetime
  end
end
