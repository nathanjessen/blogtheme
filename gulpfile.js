import autoprefixer from "autoprefixer";
import browserSync from "browser-sync";
import spawn from "cross-spawn";
import cssnano from "cssnano";
import gulp from "gulp";
import postcss from "gulp-postcss";
import atimport from "postcss-import";
import tailwindcss from "tailwindcss";

const { dest, series, src, watch } = gulp;

// Fix for Windows compatibility
const jekyll = process.platform === "win32" ? "jekyll.bat" : "jekyll";
const isDevelopmentBuild = process.env.NODE_ENV === "development";

const SITE_ROOT = "./_site";
const PRE_BUILD_STYLESHEET = "./_styles/blogtheme.css";
const POST_BUILD_STYLESHEET = isDevelopmentBuild ? `${SITE_ROOT}/assets/css/`: "./assets/css/";
const TAILWIND_CONFIG = "./tailwind.config.js";

async function buildJekyll() {
  browserSync.notify("Building Jekyll site...");

  const args = ["exec", jekyll, "build"];

  if (isDevelopmentBuild) {
    args.push("--incremental");
  }

  return new Promise((resolve, reject) => {
    const process = spawn("bundle", args, { stdio: "inherit" });
    process.on("exit", (code) => {
      if (code === 0) {
        resolve();
      } else {
        reject(new Error(`Jekyll build failed with code ${code}`));
      }
    });
  });
}

async function processStyles() {
  browserSync.notify("Compiling styles...");

  return src(PRE_BUILD_STYLESHEET)
    .pipe(
      postcss([
        atimport(),
        tailwindcss(TAILWIND_CONFIG),
        ...(isDevelopmentBuild ? [] : [autoprefixer(), cssnano()]),
      ])
    )
    .pipe(dest(POST_BUILD_STYLESHEET));
}

// Define buildSite before it's used in startServer
const buildSite = series(buildJekyll, processStyles);

async function startServer() {
  browserSync.init({
    files: [SITE_ROOT + "/**"],
    open: "local",
    port: 4000,
    server: {
      baseDir: SITE_ROOT,
      serveStaticOptions: {
        extensions: ["html"],
      },
    },
  });

  // Watch for changes with improved patterns
  const watchPatterns = [
    "**/*.css",
    "**/*.html",
    "**/*.js",
    "**/*.md",
    "**/*.markdown",
    "!_site/**/*",
    "!node_modules/**/*",
  ];

  watch(watchPatterns, { interval: 500 }, buildSite);
}

export const serve = series(buildSite, startServer);
export default buildSite;
