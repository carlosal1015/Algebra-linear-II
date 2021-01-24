const { description } = require("../../package");
const moment = require("moment");

const extendsNetworks = {
  email: {
    sharer: "mailto:alex@mat.unb.br",
    type: "popup",
    isPlain: true,
  },
  telegram: {
    sharer: "https://t.me/joinchat/UtLfrvtie1G3qHLn",
  },
};

module.exports = {
  /**
   * Ref：https://v1.vuepress.vuejs.org/config/#title
   */
  title: "Álgebra Linear II",
  /**
   * Ref：https://v1.vuepress.vuejs.org/config/#description
   */
  description: description,
  base: "/Algebra-linear-II/",

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
    smoothScroll: true,
    docsDir: "",
    docsBranch: "main",
    editLinkText: "",
    logo: "/img/escola_pt.svg",
    lastUpdated: false,
    nav: [
      {
        text: "Aulas",
        ariaLabel: "Aulas Menu",
        items: [
          { text: "Notas 🗒️", link: "/notas/" },
          { text: "Videos 📹", link: "/videos/" },
          {
            text: "PDF 📖",
            link:
              "https://carlosal1015.github.io/Algebra-linear-II/pdf/main.pdf",
          },
        ],
      },
      {
        text: "Links",
        ariaLabel: "Links Menu",
        items: [
          { text: "Moodle 🌐", link: "https://moodle.mat.unb.br/20201" },
          {
            text: "XLIX Escola de Verão MAT/UnB 🏫",
            link: "https://www.mat.unb.br/verao2021/verao/verao_pt.html",
          },
          {
            text: "Ecloud ☁️",
            link: "https://ecloud.global/s/fMPD4eBEL4G6CWQ",
          },
          { text: "JuliaLang 🏎️", link: "https://julialang.org" },
        ],
      },
      {
        text: "Languages",
        ariaLabel: "Language Menu",
        items: [
          { text: "Português 🇧🇷", link: "" },
          { text: "English 🇺🇸", link: "" },
          { text: "Deutsch 🇩🇪", link: "" },
        ],
      },
    ],
    sidebar: {
      "/notas/": [
        {
          title: "Notas das aulas",
          collapsable: false,
          children: [
            "",
            "corpos",
            "sistemas-lineares",
            "matrizes",
            "matrizes-e-sistemas-lineares",
            "espaços-vetoriais",
            "espaços-vetoriais-de-dimensão-finita",
            "transformações-lineares",
            "espaço-vetorial-LVW",
            "matriz-de-uma-transformação-linear",
            "funcionais-lineares",
            "polinômios",
            "fatoração-única",
            "determinantes",
          ],
        },
      ],
    },
  },

  /**
   * Apply plugins，ref：https://v1.vuepress.vuejs.org/zh/plugin/
   */
  plugins: [
    "@vuepress/plugin-back-to-top",
    "@vuepress/active-header-links",
    {
      sidebarLinkSelector: ".sidebar-link",
      headerAnchorSelector: ".header-anchor",
    },
    "@vuepress/medium-zoom",
    {
      selector: "img.zoom-custom-imgs",
      // medium-zoom options here
      // See: https://github.com/francoischalifour/medium-zoom#options
      options: {
        margin: 16,
      },
    },
    "@maginapp/vuepress-plugin-katex",
    {
      delimiters: "dollars",
    },
    "social-share",
    {
      networks: ["telegram", "whatsapp", "email"],
      autoQuote: true,
      extendsNetworks,
    },
    "vuepress-plugin-code-copy",
    {
      selector: String,
      align: String,
      color: String,
      backgroundTransition: Boolean,
      backgroundColor: String,
      successText: String,
    },
    "@vuepress/plugin-nprogress",
    "@vuepress/search",
    {
      searchMaxSuggestions: 10,
    },
    "@vuepress/last-updated",
    {
      transformer: (timestamp, lang) => {
        // Don't forget to install moment yourself
        const moment = require("moment");
        moment.locale(lang);
        return moment(timestamp).fromNow();
      },
      dateOptions: {
        hour12: false,
      },
    },
    "vuepress-plugin-reading-time",
    {
      excludes: ["/about", "/tag/.*"],
    },
  ],
};
