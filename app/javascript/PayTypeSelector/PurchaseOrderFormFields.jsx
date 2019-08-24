import React, { Component } from 'react'

class PurchaseOrderFormFields extends Component {
  render() {
    return(
      <div className="field">
        <label htmlFor="order_po_number">PO #</label>
        <input
          id="order_po_number"
          type="password"
          name="order[po_number]"
        />
      </div>
    )
  }
}

export default PurchaseOrderFormFields
