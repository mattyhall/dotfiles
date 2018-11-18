define-command switch-header-source -docstring "Switch between C(++) header and source" %{
    evaluate-commands %sh{
        header_re="s/\.h(pp)?$/\.c(pp|c)?/g"
        source_re="s/\.c(pp)?$/\.h(pp)?/g"
	filename=$(echo ${kak_buffile} | awk -F "/" '{print $NF}')
	matches_header=$(echo ${kak_buffile} | egrep "\.h(pp)?$")
	matches_source=$(echo ${kak_buffile} | egrep "\.c(pp)?$")
	pwd_re="s:$PWD/::g"
        if [ ! -z "$matches_header" ]; then
            re=$header_re
        elif [ ! -z "$matches_source" ]; then
            re=$source_re
        fi
        path_re=$(echo ${kak_buffile} | sed -r ${re} | sed -r ${pwd_re})
        filename_re=$(echo ${filename} | sed -r ${re})
        path_matches=$(find -regextype egrep -regex "\./${path_re}" -print)
        if [ ! -z "$path_matches" ]; then
            printf "edit ${path_matches}"
            exit
        fi
        filename_matches=$(find -regextype egrep -regex ".*${filename_re}" -print)
        # printf "echo ${filename_matches}"
        if [ ! -z "filename_matches" ]; then
            printf "edit ${filename_matches}"
            exit
        fi
        printf 'echo "no file found"'
    }
}
