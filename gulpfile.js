/**
 * Created by themoroccan09 on 05/10/17.
 */

var gulp = require('gulp'),
    ts = require('gulp-typescript'),
    tsProject = ts.createProject("tsconfig.json"),
    nodemon = require('gulp-nodemon'),
    clean = require('gulp-clean');



gulp.task("default", ["server"], function() {});

// - LAST STEP WATCH FILES JS AFTER COMPILING A NEW CHANGED FILES
gulp.task('server',['compile'],function(){
    return nodemon({
        script: "dist/src/main.js",
        watch: ["src","env.ts"],
        ext: "ts",
        tasks: ["compile"],
        env: { "DEBUG": "Application,Request,Response" }
    });
});

// 3- COMPILE TS FILES
gulp.task('compile',['assets'],function(){
    return tsProject
        .src()
        .pipe(tsProject()).js
        .pipe(gulp.dest('dist/src'));
});

// 2- COPY STATIC FILES
gulp.task('assets',['clean'],function(){
    gulp.src('storage/**/*').pipe(gulp.dest('dist/storage'));
});

// 1- DELETE DIST FOLDER
gulp.task('clean',function(){
    return gulp.src('dist', {read: false})
        .pipe(clean());
});

