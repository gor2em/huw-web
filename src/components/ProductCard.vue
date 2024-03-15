
<script setup>
const props = defineProps({
  data: Object,
});
</script>

<template>
  <div
    class="flex flex-col justify-center col-span-3 p-6 space-y-2 transition-all duration-300 bg-white rounded shadow cursor-pointer dark:bg-slate-800 dark:text-white ProductCard hover:bg-red-100 dark:hover:bg-slate-700"
  >
    <div class="text-xl font-bold text-zinc-800 dark:text-white">
      {{ props.data.product_name }}
    </div>
    <div class="text-xs text-justify text-zinc-400">
      {{ props.data.description }}
    </div>
    <span class="font-semibold text-zinc-600 dark:text-zinc-200">{{ props.data.price }}₺</span>
    <span
      :class="{ '!line-through': props.data.stock_quantity < 1 }"
      class="text-xs text-zinc-400"
      >{{ props.data.stock_quantity }} adet</span
    >
  </div>
</template>

<style scoped>
</style>