import { type Build } from 'xbuild';

const build: Build = {
    common: {
        project: 'libmongoc',
        archs: ['x64'],
        variables: [],
        copy: {},
        defines: [],
        options: [
            ['ENABLE_SHARED', false],
            ['BUILD_TESTING', false]
        ],
        subdirectories: ['mongo-c-driver'],
        libraries: {
            'mongoc_static': {
                name: 'libmongoc'
            }
        },
        buildDir: 'build',
        buildOutDir: '../../../libs',
        buildFlags: []
    },
    platforms: {
        win32: {
            windows: {},
            // android: {
            //     archs: ['x86', 'x86_64', 'armeabi-v7a', 'arm64-v8a'], // needs crypto library 
            // }
        },
        linux: {
            linux: {}
        },
        darwin: {
            macos: {}
        }
    }
}

export default build;