const { description } = require("../../package");

module.exports = {
  /**
   * Ref：https://v1.vuepress.vuejs.org/config/#title
   */
  title: "Álgebra Linear II",
  /**
   * Ref：https://v1.vuepress.vuejs.org/config/#description
   */
  description: description,
  base: '/Algebra-linear-II/',

  /**
   * Extra tags to be injected to the page HTML `<head>`
   *
   * ref：https://v1.vuepress.vuejs.org/config/#head
   */
  head: [
    ["meta", { name: "theme-color", content: "#3eaf7c" }],
    ["meta", { name: "apple-mobile-web-app-capable", content: "yes" }],
    [
      "meta",
      { name: "apple-mobile-web-app-status-bar-style", content: "black" },
    ],
  ],

  /**
   * Theme configuration, here is the default theme configuration for VuePress.
   *
   * ref：https://v1.vuepress.vuejs.org/theme/default-theme-config.html
   */
  theme: "default-prefers-color-scheme",
  themeConfig: {
    overrideTheme: "dark",
    repo: "carlosal1015/Algebra-linear-II",
    editLinks: false,
    docsDir: "",
    editLinkText: "",
    lastUpdated: false,
    nav: [
      {
        text: "Aulas",
        link: "/aulas/",
      },
      {
        text: "Videos",
        link: "/videos/",
      },
      {
        text: "Moodle",
        link: "https://moodle.mat.unb.br/20201",
      },
      {
        text: "XLIX Escola de Verão MAT/UnB",
        link: "https://www.mat.unb.br/verao2021/verao/verao_pt.html",
      },
      {
        text: "Ecloud",
        link: "https://ecloud.global/s/758fkTTNfjetfNd",
      },
    ],
    sidebar: {
      "/aulas/": [
        {
          title: "Aulas",
          collapsable: false,
          children: ["", "using-vue"],
        },
      ],
    },
  },

  /**
   * Apply plugins，ref：https://v1.vuepress.vuejs.org/zh/plugin/
   */
  plugins: [
    "@vuepress/plugin-back-to-top",
    "@vuepress/plugin-medium-zoom",
    "@maginapp/vuepress-plugin-katex",
    {
      delimiters: "dollars",
    },
  ],
};
