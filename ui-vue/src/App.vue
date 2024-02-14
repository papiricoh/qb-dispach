<script setup>

</script>

<script>
export default {
  setup () {
    return {
      dispatch_list: [],
      index: -1,
      exampleAlert: {
        
      }
    }
  },
  methods: {
    addAlert() {

    }
  },
  computed: {

  }
}
</script>

<template>
  <main>
    <div class="header">
      <i class="ph-fill ph-warning"></i>
      <div class="header_list">
        <div>EMERGENCIAS</div>
        <div><i class="ph-bold ph-cell-signal-high"></i>Conectado</div>
      </div>
    </div>
    <div class="footer_selector">
      <div><i class="ph-bold ph-arrow-left"></i></div>
      <div>{{index + 1}}/{{dispatch_list.length}}</div>
      <div><i class="ph-bold ph-arrow-right"></i></div>
    </div>
  </main>
</template>

<style scoped>
.footer_selector {
  display: flex;
  align-items: center;
  justify-content: center;
  background-color: var(--color2);
  width: fit-content;
  align-self: center;
  margin: 1rem;
  padding: .2rem .6rem;
  color: var(--textLow);
  gap: .6rem;
}
.footer_selector:first-child, .footer_selector:last-child {
  cursor: pointer;
}
.header_list {
  display: flex;
  flex-direction: column;
  width: 100%;
  color: var(--textLow);
}
.header_list>div:first-child {
  text-transform: uppercase;
  font-size: 1.4rem;
  font-weight: 900;
  color: white;
}
.header_list>div:last-child {
  display: flex;
  align-items: center;
}
</style>
