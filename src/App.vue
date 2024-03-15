
<script setup>
import { defineAsyncComponent, reactive } from "vue";

import Logo from "./components/Logo.vue";
import Spinner from "./components/Spinner.vue";
const ProductCard = defineAsyncComponent(() =>
  import("./components/ProductCard.vue")
);

const state = reactive({
  products: [
    {
      product_name: "Akıllı Telefon",
      description: "Yüksek performanslı akıllı telefon",
      price: 2500,
      stock_quantity: 15,
    },
    {
      product_name: "Kablosuz Kulaklık",
      description: "Bluetooth bağlantılı kablosuz kulaklık",
      price: 200,
      stock_quantity: 8,
    },
    {
      product_name: "Laptop Bilgisayar",
      description: "Yüksek kapasiteli dizüstü bilgisayar",
      price: 4000,
      stock_quantity: 3,
    },
    {
      product_name: "Akıllı Saat",
      description: "Spor ve sağlık özellikleriyle akıllı saat",
      price: 700,
      stock_quantity: 0,
    },
    {
      product_name: "Oyun Konsolu",
      description: "En yeni oyunları oynamak için oyun konsolu",
      price: 3000,
      stock_quantity: 10,
    },
    {
      product_name: "Kamera",
      description: "Profesyonel fotoğraf ve video çekimleri için kamera",
      price: 1500,
      stock_quantity: 6,
    },
    {
      product_name: "Bluetooth Hoparlör",
      description: "Taşınabilir bluetooth hoparlör",
      price: 100,
      stock_quantity: 25,
    },
    {
      product_name: "Tablet",
      description: "Eğlence ve iş için tablet bilgisayar",
      price: 800,
      stock_quantity: 12,
    },
    {
      product_name: "Kulaklık",
      description: "Yüksek kaliteli kablolu kulaklık",
      price: 50,
      stock_quantity: 18,
    },
    {
      product_name: "Harici Hard Disk",
      description: "Yüksek kapasiteli harici hard disk",
      price: 300,
      stock_quantity: 7,
    },
    // Diğer ürünler buraya eklenebilir
  ],
  // endpoint: "products",
});

// const fetchProducts = async () => {
//   try {
//     const response = await fetch(
//       `${import.meta.env.VITE_APP_API_BASE_URL}/${state.endpoint}`
//     );

//     const data = await response.json();
//     state.products = data;
//   } catch (error) {
//     console.log(error);
//   }
// };

// onMounted(async () => await fetchProducts());
</script>

<template>
  <div class="min-h-screen bg-zinc-50 dark:bg-slate-900">
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
