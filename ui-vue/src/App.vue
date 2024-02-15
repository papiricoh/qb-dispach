<script setup>
import AlertViewer from './components/AlertViewer.vue';
</script>

<script>
export default {
  data() {
    return {
      isVisible: true,
      onDuty: false,
      isRight: true,
      isFoward: true,
      dispatch_list: [],
      index: -1,
      exampleAlerts: [
        {
          //Robo coche
          id: 1,
          title: "Robo de vehiculo",
          desc: "robo de vehiculo",
          location: "Del Perro, Downtown",
          date: 372194720,
          type: "carjacking",
          make: "Porsche",
          model: "Cayene",
          color: "fdaa24",
          plate: "72842DWK"

        }
      ]
    }
  },
  methods: {
    handleNuiMessage(event) {
      console.log(event);
      if (event.data.action === "toggleUI") {
        this.onDuty = event.data.sendData.onDuty;
      }
      if (event.data.action === "pauseMenu") {
        this.isVisible = event.data.value;
      }
      if (event.data.action === "addAlert") {
        this.addAlert(event.data.value);
      }
    },
    addAlert(alert) {
      if(alert.type == "car") {
        this.dispatch_list.push({
          id: this.dispatch_list.length,
          title: alert.title,
          desc: alert.desc,
          location: alert.location,
          date: new Date(),
          type: alert.type,
          make: alert.make,
          model: alert.model,
          color: alert.color,
          plate: alert.plate
        })
      }else {
        this.dispatch_list.push({
          id: this.dispatch_list.length,
          title: alert.title,
          desc: alert.desc,
          location: alert.location,
          date: new Date(),
          type: alert.type,
        })
      }
      

      this.index = this.dispatch_list.length - 1

    },
    foward() {
      if (this.index + 1 < this.dispatch_list.length) {
        this.isFoward = true;
        this.index = this.index + 1;
      }
    },
    backwards() {
      if (this.index - 1 >= 0) {
        this.isFoward = false;
        this.index = this.index - 1;
      }
    }
  },
  mounted() {
    window.addEventListener('message', this.handleNuiMessage);
  },

  unmounted() {
    window.removeEventListener('message', this.handleNuiMessage);
  },
}
</script>

<template>
  <Transition mode="out-in" :enter-active-class="isRight ? 'slide-fade-enter-active' : 'no-slide-fade-enter-active'"
  :leave-active-class="isRight ? 'no-slide-fade-leave-active' : 'slide-fade-leave-active'"
  :enter-class="isRight ? 'slide-fade-enter' : 'no-slide-fade-enter'"
  :leave-to-class="isRight ? 'no-slide-fade-leave-to' : 'slide-fade-leave-to' ">
    <main v-if="isVisible && onDuty">
      <div class="header">
        <i @click="addAlert(null)" class="ph-fill ph-warning"></i>
        <div class="header_list">
          <div>EMERGENCIAS</div>
          <div><i class="ph-bold ph-cell-signal-high"></i>Conectado</div>
        </div>
      </div>
      <Transition mode="out-in" :enter-active-class="isFoward ? 'slide-fade-enter-active' : 'no-slide-fade-enter-active'"
      :leave-active-class="isFoward ? 'slide-fade-leave-active' : 'no-slide-fade-leave-active'"
      :enter-class="isFoward ? 'slide-fade-enter' : 'no-slide-fade-enter'"
      :leave-to-class="isFoward ? 'slide-fade-leave-to' : 'no-slide-fade-leave-to'">
        <AlertViewer v-if="dispatch_list.length > 0" :key="index" :alert="dispatch_list[index]"></AlertViewer>
        <div v-else class="no_alert">SIN ALERTAS</div>
      </Transition>
      <div class="footer_selector">
        <div @click="backwards()"><i class="ph-bold ph-arrow-left"></i></div>
        <div>{{index + 1}}/{{dispatch_list.length}}</div>
        <div @click="foward()"><i class="ph-bold ph-arrow-right"></i></div>
      </div>
    </main>
  </Transition>
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
.no_alert {
  display: flex;
  align-items: center;
  justify-content: center;
  margin-top: .8rem;
}
</style>
