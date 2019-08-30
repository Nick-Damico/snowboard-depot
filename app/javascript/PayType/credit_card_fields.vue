<template lang="html">

  <div class="credit-card__fields">
    <div class="field">
      <label for="order_credit_card_number">CC #</label>
      <input id="order_credit_card_number"
             size="40"
             type="password"
             name="order[credit_card_number]">
    </div>

    <div class="field cc-exp__field">
      <label for="order_expiration_date">Exp Date</label>
      <select name='expireMM' id='expireMM'>
          <option value=''>Month</option>
          <option value='01'>01 - January</option>
          <option value='02'>02 - February</option>
          <option value='03'>03 - March</option>
          <option value='04'>04 - April</option>
          <option value='05'>05 - May</option>
          <option value='06'>06 - June</option>
          <option value='07'>07 - July</option>
          <option value='08'>08 - August</option>
          <option value='09'>09 - September</option>
          <option value='10'>10 - October</option>
          <option value='11'>11 - November</option>
          <option value='12'>12 - December</option>
      </select>
      <select name='expireYY' id='expireYY'>
          <option value=''>Year</option>
          <option value='19'>2019</option>
          <option value='20'>2020</option>
          <option value='21'>2021</option>
          <option value='22'>2022</option>
          <option value='23'>2023</option>
          <option value='24'>2024</option>
      </select>
    </div>
    </div>
  </div>

</template>

<script>

  export default {
    name: 'CreditCardFields'
  }

</script>

<style lang="css" scoped>
  .cc-exp__field {
    display: table;
    clear: both;
  }
  select {
    width: 50%;
    float: left;
  }
</style>
