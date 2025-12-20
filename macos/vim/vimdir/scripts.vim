if getline(1) =~ '^#!.*/bin/env\s\+bash\>'
    setfiletype bash
elseif getline(1) =~? '\<drawing\>'
    setfiletype sh
endif
