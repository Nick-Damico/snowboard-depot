<template lang="html">
  <div id="app">
    <select class="pay-type" name="order[pay_type_id]">
      <option value="">Select A Pay Type</option>
      <option value="1">Check</option>
      <option value="2">Credit Card</option>
      <option value="3">Purchase Order</option>
    </select>
    <CreditCardFields />
  </div>
</template>

<script>
import CheckFields from './check_fields.vue'
import CreditCardFields from './credit_card_fields.vue'

export default {
  name: "PayType",
  components: {
    CheckFields,
    CreditCardFields
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
