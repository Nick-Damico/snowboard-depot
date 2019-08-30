<template lang="html">

  <div class="field">
    <div class="field">
      <label for="order_routing_number">Routing #</label>
      <input id="order_routing_number" size="40" type="text" name="order[routing_number]">
    </div>

    <div class="field">
      <label for="order_account_number">Acct #</label>
      <input id="order_account_number" size="40" type="text" name="order[account_number]">
    </div>
  </div>

</template>

<script>
export default {
  name: 'CheckFields'
}
</script>

<style lang="css" scoped>
</style>
