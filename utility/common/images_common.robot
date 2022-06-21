*** Settings ***
Library   String
Library   OperatingSystem

*** Variables ***
${IMAGE_COMPARATOR_COMMAND}   /usr/local/Cellar/imagemagick/7.1.0-23/bin/convert __REFERENCE__ __TEST__ -metric RMSE -compare -format  "%[distortion]" info:

*** Keywords ***
Compare Images
   [Arguments]      ${Reference_Image_Path}    ${Test_Image_Path}    ${Allowed_Threshold}
   ${TEMP}=         Replace String     ${IMAGE_COMPARATOR_COMMAND}    __REFERENCE__     ${Reference_Image_Path}
   ${COMMAND}=      Replace String     ${TEMP}    __TEST__     ${Test_Image_Path}
   ${RC}            ${OUTPUT}=     Run And Return Rc And Output     ${COMMAND}
   ${RESULT}        Evaluate    ${OUTPUT} < ${Allowed_Threshold}
   Run Keyword And Continue On Failure    Should be True   ${RESULT}