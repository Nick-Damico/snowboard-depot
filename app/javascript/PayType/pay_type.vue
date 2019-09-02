<template lang="html">
  <div id="app">
    <select @change="selectType($event.target.value)" id="pay_type" class="pay-type" name="order[pay_type_id]">
      <option value="">Select A Pay Type</option>
      <option value="1">Check</option>
      <option value="2">Credit Card</option>
      <option value="3">Purchase Order</option>
    </select>

    <div v-if="selectedType === 1">
      <CheckFields />
    </div>
    <div v-else-if="selectedType === 2">
      <CreditCardFields />
    </div>
    <div v-else-if="selectedType === 3">
      <PurchaseOrderFields />
    </div>
    <div v-else>
    </div>

  </div>
</template>

<script>
import CheckFields from './check_fields.vue'
import CreditCardFields from './credit_card_fields.vue'
import PurchaseOrderFields from './purchase_order_fields.vue'

export default {
  name: "PayType",
  data() {
    return {
      selectedType: null
    }
  },
  components: {
    CheckFields,
    CreditCardFields,
    PurchaseOrderFields
  },
  methods: {
    selectType(id) {
      this.selectedType = parseInt(id)
    }
  }
}
</script>

<style lang="css" scoped>
#app {
  margin-top: 1rem;
}
p {
  font-size: 2em;
  text-align: center;
}
</style>
