fs = require 'fs'

{print} = require 'sys'
{spawn} = require 'child_process'

run = (method, args, cb) ->
  runner = spawn method, args
  runner.stderr.on 'data', (data) ->
    process.stderr.write data.toString()
  runner.stdout.on 'data', (data) ->
    print data.toString()
  runner.on 'exit', (code) ->
    cb?() if code is 0

uglify = () ->
  to_uglify = fs.readdirSync 'lib'
  to_uglify = ('lib/' + file for file in to_uglify when file.match(/jasmine\.arguments\..*\.js/))
  run 'uglifyjs', to_uglify.concat(['-c', '-b', '-o', 'lib/jasmine-arguments.js'])
  run 'uglifyjs', to_uglify.concat(['-c', '-m', '-o', 'lib/jasmine-arguments.min.js'])

build = () ->
  run 'coffee', ['-c', '-o', 'lib', 'src']
  run 'coffee', ['-c', '-o', 'spec/lib', 'spec/src']


task 'build', 'Build lib/ and spec/lib from src/ and spec/src', ->
  build()

task 'uglify', 'Uglify scripts (build required prior to this', ->
  uglify()

task 'watch', 'Watch src/ and spec/src for changes', ->
    run 'coffee', ['-w', '-c', '-o', 'lib', 'src']
    run 'coffee', ['-w', '-c', '-o', 'spec/lib', 'spec/src']
