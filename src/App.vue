
<script setup>
import { defineAsyncComponent, onMounted, reactive } from "vue";

import Logo from "./components/Logo.vue";
import Spinner from "./components/Spinner.vue";
const ProductCard = defineAsyncComponent(() =>
  import("./components/ProductCard.vue")
);

const state = reactive({
  products: null,
  endpoint: "products",
});

const fetchProducts = async () => {
  try {
    const response = await fetch(
      `${import.meta.env.VITE_APP_API_BASE_URL}/${state.endpoint}`
    );

    const data = await response.json();
    state.products = data;
  } catch (error) {
    console.log(error);
  }
};

onMounted(async () => await fetchProducts());
</script>

<template>
  <div class="min-h-screen bg-zinc-50">
    <div class="container py-8 mx-auto">
      <Logo />

      <div class="flex flex-col space-y-4">
        <div>
          <div
            class="grid grid-cols-12 gap-4"
            v-if="state.products?.length > 0"
          >
            <Suspense>
              <ProductCard
                v-for="product in state.products"
                :key="product.product_id"
                :data="product"
              />
              <template #fallback>
                <Spinner />
              </template>
            </Suspense>
          </div>

          <div v-else class="text-xs animate-pulse">no data response.</div>
        </div>
      </div>
    </div>
  </div>
</template>
