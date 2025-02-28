function view
    if test (count $argv) -ne 1
        echo "Error: Please provide exactly one file."
        return 1
    end

    set file $argv[1]

    switch (file --mime-type --brief --dereference $file)
        case 'audio/*'
            echo "This is a song."
        case 'video/*'
            echo "This is a video."
        case 'image/*'
            echo "This is a photo."
        case 'text/*'
            switch (basename $file)
                case "*.md"
                    glow --style ~/.config/glow/default.json $file
                case "*"
                    cat $file
            end
        case application/pdf
            zathura $file
        case application/zip
            echo "This is a zip archive."
        case application/x-tar
            echo "This is a tar archive."
        case application/x-rar
            echo "This is a rar archive."
        case 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet'
            echo "This is an Excel spreadsheet."
        case 'application/vnd.openxmlformats-officedocument.wordprocessingml.document'
            echo "This is a Word document."
        case '*'
            echo "Filetype is unknown or unsupported."
    end
end

function edit
    $EDITOR $argv
end

function plan
    if test -z "$argv"
        $PLANNER TODO.md
    else
        $PLANNER $argv
    end
end
