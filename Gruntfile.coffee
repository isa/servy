module.exports = (grunt) ->

   # -- Constants --
   TARGET_DIR = 'target'
   MODULES_BIN_DIR = 'node_modules/.bin'

   grunt.initConfig
      clean: [TARGET_DIR]

      coffee:
         options:
            sourceMap: true
            bare: true

         compile:
            expand: true
            src: ['app.coffee', 'controllers/**/*.coffee', 'helpers/**/*.coffee', 'conf/**/*.coffee', 'public/**/*.coffee']
            dest: TARGET_DIR
            ext: '.js'

      watch:
         coffee:
            files: ['app.coffee', 'controllers/**/*.coffee', 'helpers/**/*.coffee', 'conf/**/*.coffee', 'public/**/*.coffee']
            tasks: ['coffee', 'shell:unit', 'shell:integration']

      shell:
         options:
            stdout: true

         server:
            command: "coffee app.coffee"

         unit:
            command: "#{MODULES_BIN_DIR}/mocha test/unit"

         integration:
            command: "#{MODULES_BIN_DIR}/mocha test/integration"

         public:
            command: "cp -R public #{TARGET_DIR}/"


   grunt.loadNpmTasks 'grunt-contrib-watch'
   grunt.loadNpmTasks 'grunt-contrib-clean'
   grunt.loadNpmTasks 'grunt-contrib-coffee'
   grunt.loadNpmTasks 'grunt-shell'

   grunt.registerTask 'build', ['clean', 'coffee', 'shell:public']
   grunt.registerTask 'all', ['build', 'shell:unit', 'shell:integration']
   grunt.registerTask 'default', ['build', 'shell:unit', 'shell:integration', 'shell:public', 'watch']
