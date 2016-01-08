gulp = require 'gulp'
gulpif = require 'gulp-if'
concat = require 'gulp-concat'
uglify = require 'gulp-uglify'
minifyCSS = require 'gulp-minify-css'
filter = require 'gulp-filter'
mainBowerFiles = require 'main-bower-files'

gulp.task 'sample', ->
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
    .pipe(gulp.dest('.'))

