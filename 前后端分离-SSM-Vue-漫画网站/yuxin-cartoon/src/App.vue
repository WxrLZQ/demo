<template>
  <div id="app">
    <router-view></router-view>
  </div>
</template>

<script>
export default {
  name: 'App'
}
</script>

<style>
#app {
    width:100%;
      display: flex;
      flex-direction: column;
      align-items: center;
}
</style>
