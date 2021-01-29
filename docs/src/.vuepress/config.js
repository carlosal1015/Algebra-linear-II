const { description } = require("../../package");
const moment = require("moment");

const extendsNetworks = {
  email: {
    sharer: "mailto:alex@mat.unb.br",
    type: "popup",
    isPlain: true
  },
  telegram: {
    sharer: "https://t.me/joinchat/UtLfrvtie1G3qHLn"
  }
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
  locales: {
    "/": {
      lang: "pt-BR",
      title: "Álgebra linear II",
      description: "Notas das aulas na escola de verão"
    },
    "/en/": {
      lang: "en-US",
      title: "Linear algebra II",
      description: "Summer school class notes"
    },
    "/de/": {
      lang: "de-DE",
      title: "Lineare algebra II",
      description: "Notizen zur Sommerschulklasse"
    }
  },
  /**
   * Theme configuration, here is the default theme configuration for VuePress.
   *
   * ref：https://v1.vuepress.vuejs.org/theme/default-theme-config.html
   */
  head: [
    ["meta", { name: "theme-color", content: "#3eaf7c" }],
    ["meta", { name: "apple-mobile-web-app-capable", content: "yes" }],
    [
      "meta",
      { name: "apple-mobile-web-app-status-bar-style", content: "black" }
    ]
  ],
  theme: "default-prefers-color-scheme",
  themeConfig: {
    overrideTheme: "dark",
    repo: "carlosal1015/Algebra-linear-II",
    editLinks: true,
    smoothScroll: true,
    docsDir: "docs/src",
    docsBranch: "main",
    editLinkText: "Ajude-nos a melhorar esta página!",
    logo: "/img/escola_pt.svg",
    searchPlaceholder: "Pesquisa...",
    search: true,
    searchMaxSuggestions: 10,
    displayAllHeaders: true,
    locales: {
      "/": {
        label: "Português 🇧🇷",
        selectText: "Linguagens",
        ariaLabel: "Selecione o linguagem",
        editLinkText: "Edite esta página no GitHub",
        lastUpdated: "Ultima atualização",
        serviceWorker: {
          updatePopup: {
            message: "Novo conteúdo disponível.",
            buttonText: "Atualizar"
          }
        },
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
                  "https://carlosal1015.github.io/Algebra-linear-II/pdf/main.pdf"
              }
            ]
          },
          {
            text: "Links",
            ariaLabel: "Links Menu",
            items: [
              { text: "Moodle 🌐", link: "https://moodle.mat.unb.br/20201" },
              {
                text: "XLIX Escola de Verão MAT/UnB 🏫",
                link: "https://www.mat.unb.br/verao2021/verao/verao_pt.html"
              },
              {
                text: "Ecloud ☁️",
                link: "https://ecloud.global/s/fMPD4eBEL4G6CWQ"
              },
              { text: "JuliaLang 🏎️", link: "https://julialang.org" }
            ]
          }
        ],
        sidebar: {
          "/notas/": [
            {
              title: "Notas das aulas",
              collapsable: false,
              children: [
                "",
                "corpos-e-sistemas lineares",
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
                "polinômio-sobre-um-corpo-F",
                "determinantes",
                "formas-canônicas-operadores-diagonalizáveis",
                "operadores-diagonalizáveis",
                "polinômio-minimal",
                "formas-de-jordan_parte1",
                "formas-de-jordan_parte2"
              ]
            }
          ]
        }
      },
      "/en/": {
        label: "English 🇺🇸",
        selectText: "Languages",
        editLinkText: "Edit this page on GitHub",
        lastUpdated: "Last update",
        serviceWorker: {
          updatePopup: {
            message: "New content available.",
            buttonText: "Update"
          }
        },
        nav: [
          {
            text: "Lessons",
            ariaLabel: "Lessons Menu",
            items: [
              { text: "Notes 🗒️", link: "/en/notas/" },
              { text: "Videos 📹", link: "/en/videos/" },
              {
                text: "PDF 📖",
                link:
                  "https://carlosal1015.github.io/Algebra-linear-II/pdf/main.pdf"
              }
            ]
          },
          {
            text: "Links",
            ariaLabel: "Links Menu",
            items: [
              { text: "Moodle 🌐", link: "https://moodle.mat.unb.br/20201" },
              {
                text: "XLIX Summer School MAT/UnB 🏫",
                link: "https://www.mat.unb.br/verao2021/verao/verao_pt.html"
              },
              {
                text: "Ecloud ☁️",
                link: "https://ecloud.global/s/fMPD4eBEL4G6CWQ"
              },
              { text: "JuliaLang 🏎️", link: "https://julialang.org" }
            ]
          }
        ],
        sidebar: {
          "/en/notes/": [
            {
              title: "Notas das aulas",
              collapsable: false,
              children: [
                "",
                "fields-and-linear-systems",
                "system-of-linear-equations",
                "matrices",
                "matrices-and-linear-systems",
                "vector-spaces",
                "finite-dimensional-vector-spaces",
                "linear-map",
                "vector-space-of-linear-maps",
                "matrix-of-a-linear-transformation",
                "linear-functional",
                "polynomials",
                "polynomial-over-a-field-F",
                "determinants",
                "canonical-form-diagonalizable-operator",
                "diagonalizable-operator",
                "minimal-polynomial",
                "jordan-form-part-1",
                "jordan-form-part-2"
              ]
            }
          ]
        }
      },
      "/de/": {
        label: "Deutsch 🇩🇪",
        selectText: "Sprachen",
        editLinkText: "Bearbeiten Sie diese Seite auf GitHub",
        lastUpdated: "Letztes Update",
        serviceWorker: {
          updatePopup: {
            message: "Neuer Inhalt verfügbar.",
            buttonText: "Aktualisieren"
          }
        },
        nav: [
          {
            text: "Lektionen",
            ariaLabel: "Unterrichtsmenü",
            items: [
              { text: "Anmerkungen 🗒️", link: "/de/anmerkungen/" },
              { text: "Videos 📹", link: "/de/videos/" },
              {
                text: "PDF 📖",
                link:
                  "https://carlosal1015.github.io/Algebra-linear-II/pdf/main.pdf"
              }
            ]
          },
          {
            text: "Links",
            ariaLabel: "Links Menü",
            items: [
              { text: "Moodle 🌐", link: "https://moodle.mat.unb.br/20201" },
              {
                text: "XLIX Summer School MAT/UnB 🏫",
                link: "https://www.mat.unb.br/verao2021/verao/verao_pt.html"
              },
              {
                text: "Ecloud ☁️",
                link: "https://ecloud.global/s/fMPD4eBEL4G6CWQ"
              },
              { text: "JuliaLang 🏎️", link: "https://julialang.org" }
            ]
          }
        ],
        sidebar: {
          "/de/anmerkungen/": [
            {
              title: "Notizen zur Klasse",
              collapsable: false,
              children: [
                "",
                "körpers-und-lineares-gleichungssystem",
                "system-of-linear-equations",
                "matrices",
                "matrices-and-linear-systems",
                "vector-spaces",
                "finite-dimensional-vector-spaces",
                "linear-map",
                "vector-space-of-linear-maps",
                "matrix-of-a-linear-transformation",
                "linear-functional",
                "polynomials",
                "polynom-über-einem-F-körper",
                "determinants",
                "canonical-form-diagonalizable-operator",
                "diagonalizable-operator",
                "minimal-polynomial",
                "jordansche-form-teil-1",
                "jordansche-form-teil-2"
              ]
            }
          ]
        }
      }
    }
  },
  markdown: {
    lineNumbers: true
  },
  /**
   * https://vuepress.vuejs.org/guide/i18n.html#site-level-i18n-config
   */
  /**
   * Apply plugins，ref：https://v1.vuepress.vuejs.org/zh/plugin/
   */
  plugins: [
    "@vuepress/plugin-back-to-top",
    "@vuepress/active-header-links",
    {
      sidebarLinkSelector: ".sidebar-link",
      headerAnchorSelector: ".header-anchor"
    },
    "@vuepress/medium-zoom",
    {
      selector: "img.zoom-custom-imgs",
      // medium-zoom options here
      // See: https://github.com/francoischalifour/medium-zoom#options
      options: {
        margin: 16
      }
    },
    "@maginapp/vuepress-plugin-katex",
    {
      delimiters: "dollars"
    },
    "social-share",
    {
      networks: ["telegram", "whatsapp", "email"],
      autoQuote: true,
      extendsNetworks
    },
    "vuepress-plugin-code-copy",
    {
      selector: String,
      align: String,
      color: String,
      backgroundTransition: Boolean,
      backgroundColor: String,
      successText: String
    },
    "@vuepress/plugin-nprogress",
    "@vuepress/search",
    {
      searchMaxSuggestions: 10
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
        hour12: false
      }
    },
    "vuepress-plugin-reading-time",
    {
      excludes: ["/about", "/tag/.*"]
    }
  ]
};
