import os
import json
import term

struct BuildFileSource {
    directory string
    entry string
}

struct BuildFileBinaries {
    target string
    output string
    build string
}

struct BuildFileEnvironment {
    version []string
    compiler string
}

struct BuildFile {
    // Source
    source BuildFileSource
    binaries BuildFileBinaries
    environment BuildFileEnvironment
}

fn read_build_file() ?BuildFile {
    s := os.read_file('Voracer') or {
        return error('Voracer not found')
    }
    build := json.decode(BuildFile, s) or {
        eprintln('[ERROR] Could not parse JSON')
        exit(1)
    }
    return build
}

fn get_version() string {
    // TODO: generalise to any other supported compiler (which for now is: none)
    out := os.exec('v --version') or {
        exit(1)
    }
    str := out.output
    arr := str.split(' ')
    if arr[0] != 'V' {
        return '0.2' // probably a version we can't detect
    }
    return arr[1]
}

fn main() {
    args := os.args
    if !os.file_exists('Voracer') {
        eprintln('[ERROR] Could not find \'Voracer\'')
        exit(1)
    }
    println('Parsing \'Voracer\' file')
    mut do_run := false
    if 'run' in args {
        do_run = true
    }
    build := read_build_file() or {
        return
    }
    println('    Building ' + build.binaries.build + ' from \'' + build.source.directory + '\'..')
    println('    Compiler: ' + build.environment.compiler)
    
    if build.environment.compiler == 'vc' {
        version := get_version()
        println('    Version: ' + version)
        println('Building ' + build.source.entry + '..')
        mut cmd := ''
        if (build.binaries.build == 'executable') {
            cmd = 'v -o ' + build.binaries.target + '/' + build.binaries.output + ' ' + build.source.directory + '/' + build.source.entry
        }
        else if (build.binaries.build == 'library') {
            cmd = 'v -lib -o ' + build.binaries.target + '/' + build.binaries.output + ' ' + build.source.directory + '/' + build.source.entry
        }
        println(cmd)
        out := os.exec(cmd) or {
            exit(1)
        }
        println(out.output)
        if (out.exit_code == 0) {
             println('Compilation ' + term.bright_green('OK') + '!')
        } else {
            println('Compilation ' + term.red('errored') + '!')
        }

        // TODO: delete vc cache files like '.vorac.c' when compilation fails (but will probably be fixed soon by V team)
    } else {
        eprintln('Unknown compiler ' + build.environment.compiler)
        exit(1)
    }
    if do_run {
        cmd := build.binaries.target + '/' + build.binaries.output
        out := os.exec(cmd) or {
            exit(1)
        }
        println(out.output)
    }
}
