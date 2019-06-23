import os

struct BuildFile {

}

fn readBuildFile() &BuildFile {
    mut build := BuildFile{}
}

fn main() {
    println('(c) Randy RAMDE 2019')
    println('\tVorac Build System 1.0')
    if !os.file_exists('Voracer') {
        error('Could not find \'Voracer\'')
    }
}
