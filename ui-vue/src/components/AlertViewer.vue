<script setup>

</script>

<script>
export default {
  props: {
    alert: Object
  },
  data () {
    return {
      
    }
  },
  methods: {
    timeSince(epoch) {
      const ahora = new Date();

      const fechaEpoch = new Date(epoch);

      const diferenciaMs = ahora - fechaEpoch;

      const minutos = Math.floor(diferenciaMs / 60000);

      return minutos;
    }
  }
  
}
</script>

<template>
  <div class="alert_viewer">
    <div v-if="alert != null" class="a_haveAlert">
      <div class="a_title">{{alert.title}}</div>
      <div style="text-align: justify; margin-bottom: .6rem;">{{alert.desc}}</div>

      <div v-if="alert.make != null" class="a_item">
        <i class="ph-fill ph-garage"></i>
        <div>{{alert.make}}</div>
      </div>
      <div v-if="alert.model != null" class="a_item">
        <i class="ph-fill ph-car-simple"></i>
        <div>{{alert.model}}</div>
      </div>
      <div v-if="alert.color != null" class="a_item">
        <i class="ph-fill ph-palette"></i>
        <div :style="'background-color: #' + alert.color + ';'" class="color_box"></div>
      </div>
      <div v-if="alert.plate != null" class="a_item">
        <i class="ph-fill ph-placeholder"></i>
        <div>{{alert.plate}}</div>
      </div>
      
      
      <div class="a_footer">
        <div class="a_footer_item">
          <i class="ph-fill ph-map-pin"></i>
          <div>{{alert.location}}</div>
        </div>
        <div class="a_footer_item">
          <i class="ph-fill ph-timer"></i>
          <div>{{timeSince(alert.date)}} min</div>
        </div>
      </div>
    </div>
    <div v-else class="a_haveAlert">
      <div>SIN ALERTAS</div>
    </div>

  </div>
</template>

<style scoped>
.a_footer {
  display: flex;
  justify-content: space-between;
  align-items: center;
  font-size: small;
  margin-top: .8rem;
  color: var(--textHigh);
}
.a_haveAlert {
  display: flex;
  flex-direction: column;
  gap: .2rem;
}
.a_item, .a_footer_item {
  display: flex;
  gap: .4rem;
  align-items: center;
}

.a_item>i:first-child {
  font-size: 1.2rem;
}
.a_title {
  font-size: 1.4rem;
  font-weight: bold;
}
.alert_viewer {
  margin: .6rem;
}
.color_box {
  height: 1.2rem;
  width: 4rem;
  box-sizing: border-box;
  border-radius: .2rem;
  box-shadow: 0 1px 6px rgba(0, 0, 0, 0.7);
}
</style>
