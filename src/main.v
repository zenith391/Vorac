import os

struct BuildFile {
    mut:
        // Source
        source_directory string
        entry_point string
        
        // Binaries
        target string
        output string
        
        // Environment
        minimum_version string
        maximum_version string
        compiler string
}

fn read_build_file() BuildFile {
    mut build := BuildFile{}
    // TODO: Actually read the JSON
    build.source_directory = 'src'
    build.entry_point = 'main.v'
    build.target = 'bin'
    build.output = 'vorac'
    build.minimum_version = '0.0.0.0'
    build.maximum_version = '9.9.9.9'
    build.compiler = 'vc'
    return build
}

fn main() {
    if !os.file_exists('Voracer') {
        println('[ERROR] Could not find \'Voracer\'')
        exit(1)
    }
    println('[VORAC/0] Parsing \'Voracer\'')
    mut build := read_build_file()
    println('[VORAC] Building \'' + build.source_directory + '\'..')
    println('        Compiler: ' + build.compiler)
    
    if build.compiler == 'vc' {
        println('[VORAC] Building ' + build.entry_point + '..')
        out := os.system('v -o ' + build.target + '/' + build.output + ' ' + build.source_directory + '/' + build.entry_point)
        print(out)
        //binName := build.entry_point.substr(0, build.entry_point.)
        //bin_content = os.read_file(build.source_directory + '/' + build.entry_point)
    } else {
        println('[ERROR] Unknown compiler ' + build.compiler)
    }
}
