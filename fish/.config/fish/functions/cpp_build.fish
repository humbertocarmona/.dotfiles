function cpp_build -d "Clean up build, run cmake and make"

    function USAGE
        echo "Usage: cpp_build [-h|--help] [-p|--project <project_dir>]"
        echo ""
        echo "Options:"
        echo "  -h, --help         Show this help message and exit"
        echo "  -p, --project      Specify the project directory (default: current directory)"
    end

    set -l options (fish_opt -s h -l help)
    set options $options (fish_opt -s p -l project --required-val)

    argparse $options -- $argv
    or return 1

    if set -q _flag_help
        USAGE
        return 0
    end

    set -l project_dir "."
    if set -q _flag_project
        set project_dir $_flag_project
    end

    while true
        read -l -P 'Do you want to delete the build directory? [y/N] ' confirm

        switch $confirm
            case Y y
                echo "Cleaning build directory..."
                rm -rf build
                mkdir build

                cmake -B build -S $project_dir
                cmake --build build -j4
                return 0
            case '' N n
                echo "Okay then..."
                cmake --build build -j4
                return 1
        end
    end

    return 0
end
