import React, { Component } from 'react'

class PayTypeSelector extends Component {
  render() {
    return(
      <div className="field">
       <label htmlFor="order_pay_type">Pay Type</label>
       <select id="pay_type" name="order[pay_type_id]">
        <option value="">Select a Payment Method</option>
        <option value="1">Check</option>
        <option value="2">Credit Card</option>
        <option value="3">Purchase Order</option>
       </select>
      </div>
    )
  }
}

export default PayTypeSelector
