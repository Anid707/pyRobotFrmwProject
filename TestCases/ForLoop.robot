*** Settings ***
Library         SeleniumLibrary


*** Test Cases ***
ForLoop1
    FOR     ${i}    IN RANGE    1   11
        log to console     ${\n}Num=${i}
    END

ForLoop2
    FOR     ${i}    IN    1     2   3   4   5   6   7   8
        log to console     ${\n}Num_list=${i}
    END

ForLoop3WithList
    @{items}=   create list    1   2   3   4   5
    FOR     ${i}    IN    @{items}
        log to console     ${\n}Num_list=${i}
    END

ForLoop4Str
    FOR     ${i}    IN    John  David   Smith   Helen
        log to console     ${\n}Name_list=${i}
    END

ForLoop5WithExit
    @{items}=   create list     John    David       Smith       Helen
    FOR     ${i}    IN      @{items}
        log to console     ${\n}Name_list_created=${i}
        exit for loop if    "${i}" == "David"
    END


