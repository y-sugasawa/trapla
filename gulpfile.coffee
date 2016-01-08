gulp = require 'gulp'
coffee = require 'gulp-coffee'
gulpif = require 'gulp-if'
concat = require 'gulp-concat'
uglify = require 'gulp-uglify'
minifyCSS = require 'gulp-minify-css'
filter = require 'gulp-filter'
mainBowerFiles = require 'main-bower-files'
webserver = require 'gulp-webserver'

gulp.task 'vendor', ->
  jsFilter = filter('**/*.js', {restore: true})
  cssFilter = filter('**/*.css', {restore: true})

  gulp.src(mainBowerFiles())
    .pipe(jsFilter)
    .pipe(uglify())
    .pipe(concat('vendor.js'))
    .pipe(jsFilter.restore)
    .pipe(cssFilter)
    .pipe(minifyCSS())
    .pipe(concat('vendor.css'))
    .pipe(cssFilter.restore)
    .pipe(gulp.dest('public/dist'))

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
    }))

gulp.task('default', ['watch', 'server'])
