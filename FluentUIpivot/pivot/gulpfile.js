var gulp = require('gulp');
var concat = require('gulp-concat');
var cleanCss = require('gulp-clean-css');

const ControlAddInFolder = 'PivotControlAddIn';
const ControlAddInName = 'Pivot';

gulp.task('pack-js', function () {
    return gulp.src(['build/static/js/*.js'])
        .pipe(concat(`${ControlAddInName}.js`))
        .pipe(gulp.dest(`${ControlAddInFolder}/js`));
});

gulp.task('pack-css', function () {
    return gulp.src(['build/static/css/*.css'])
        .pipe(concat(`${ControlAddInName}.css`))
        .pipe(cleanCss())
        .pipe(gulp.dest(`${ControlAddInFolder}/css`));
});

gulp.task('default', gulp.series('pack-js', 'pack-css'));