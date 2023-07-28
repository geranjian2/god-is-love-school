import './bootstrap';
import '../css/app.css'; 
import { createApp } from "vue";
import Welcome from "./components/Welcome.vue";
import HelloWorld from "./components/HelloWorld.vue"
const app = createApp({
    components: {
        // Welcome,
        HelloWorld
    },
}).mount("#app");