import React, { Component } from 'react'
import NoPayType from './NoPayType'
import CreditCardFormFields from './CreditCardFormFields'
import CheckFormFields from './CheckFormFields'
import PurchaseOrderFormFields from './PurchaseOrderFormFields'

class PayTypeSelector extends Component {
  state = { selectedId: null }

  handleChange = (event) => {
    const selectedId = parseInt(event.target.value)
    this.setState({
      selectedId
    })
  }

  selectComponent = () => {
    let component
    switch (this.state.selectedId) {
      case 1:
        component = CheckFormFields
        break
      case 2:
        component = CreditCardFormFields
        break
      case 3:
        component = PurchaseOrderFormFields
        break
      default:
        component = NoPayType
    }
    return component
  }
  
  render() {
    let PayTypeCustomComponent = this.selectComponent()

    return(
      <div>
        <div className="field">
         <label htmlFor="order_pay_type">Pay Type</label>
         <select
          id="pay_type"
          name="order[pay_type_id]"
          onChange={this.handleChange}
          >
          <option value="">Select a Payment Method</option>
          <option value="1">Check</option>
          <option value="2">Credit Card</option>
          <option value="3">Purchase Order</option>
         </select>
        </div>
        <PayTypeCustomComponent />
      </div>
    )
  }
}

export default PayTypeSelector
