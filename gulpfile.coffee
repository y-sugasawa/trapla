gulp = require 'gulp'
coffee = require 'gulp-coffee'
gulpif = require 'gulp-if'
concat = require 'gulp-concat'
uglify = require 'gulp-uglify'
minifyCSS = require 'gulp-minify-css'
filter = require 'gulp-filter'
rename = require 'gulp-rename'
mainBowerFiles = require 'main-bower-files'
less = require 'gulp-less'
webserver = require 'gulp-webserver'

gulp.task 'bowerCSS', ->
  cssLibDir = 'public/dist/css/' # cssを出力するディレクトリ
  cssFilter  = filter('**/*.css', {restore: true})
  lessFilter = filter('**/*.less', {restore: true}) # Bootstrapのコアがlessなのでlessをファイルを抽出するフィルター

  gulp.src( mainBowerFiles({
      paths: {
        bowerJson: 'bower.json'
      }
    }) )
    .pipe( cssFilter )
    .pipe( rename({
      prefix: '_',
      extname: '.css'
    }) )
    .pipe( gulp.dest(cssLibDir) )
    .pipe( cssFilter.restore )
    .pipe( lessFilter ) # lessファイルを抽出
    .pipe( less() ) # lessをコンパイル
    .pipe( rename({
      prefix: '_',
      extname: '.css'
    }) )
    .pipe( gulp.dest(cssLibDir) )
    .pipe( lessFilter.restore )

gulp.task 'bowerCSS.concat', ['bowerCSS'] , ->
  cssDir = 'public/dist/css/' # 結合したcssを出力するディレクトリ
  cssLibDir = 'public/dist/css/' # ライブラリのCSSが置いてあるディレクトリ
  gulp.src(cssLibDir + '_*.css')
    .pipe( concat('vendor.css') )
    .pipe( gulp.dest(cssDir) ) # CSSを1つにしたものを出力
    .pipe( minifyCSS() )
    .pipe( rename({
      extname: '.min.css'
    }) )
    .pipe( gulp.dest(cssDir) ) # CSSを1つにしてmin化したものを出力

gulp.task 'bowerJS', ->
  jsDir = 'public/dist/js/' # jsを出力するディレクトリ
  jsFilter = filter('**/*.js', {restore: true}) # jsファイルを抽出するフィルター
  gulp.src( mainBowerFiles({
      paths: {
        bowerJson: 'bower.json'
      }
    }) )
    .pipe( jsFilter )
    .pipe( concat('vendor.js') )
    .pipe( gulp.dest(jsDir) ) # jsを1つにしたものを出力
    .pipe( uglify({
      preserveComments: 'some' # !から始まるコメントを残す
    }) )
    .pipe( rename({
      extname: '.min.js'
    }) )
    .pipe( gulp.dest(jsDir) ) # jsを1つにしてmin化したものを出力
    .pipe( jsFilter.restore )

gulp.task 'bower.init', ['bowerCSS.concat', 'bowerJS']

gulp.task 'js', ->
  gulp.src('public/js/**/*.coffee')
    .pipe coffee()
    .pipe concat('trapla.js')
    .pipe gulp.dest('public/dist')

gulp.task 'watch', ->
  gulp.watch('public/js/**/*.coffee', ['js'])

gulp.task 'server', ->
  gulp.src('public')
    .pipe(webserver({
      host: '0.0.0.0',
      port: 8000,
      livereload: true,
      proxies: [
        {
          source: '/api',
          target: 'http://localhost:3000/api'
        }
      ],
    }))

gulp.task('default', ['watch', 'server'])
