import { defineConfig } from "vite";
import { ViteEjsPlugin } from 'vite-plugin-ejs'; // 这里改为解构导入

export default defineConfig({
    plugins: [
        // Without Data
        ViteEjsPlugin(),
        
        // With Data
        ViteEjsPlugin({
          domain: "example.com",
          title: "My vue project!"
        }),
        
        // Or With Vite Config
        ViteEjsPlugin((viteConfig) => {
          // viteConfig is the current viteResolved config.
          return {
            root: viteConfig.root,
            domain: "example.com",
            title: "My vue project!"
          }
        }),
      ],
    server: {
        open: true,
    },
});
