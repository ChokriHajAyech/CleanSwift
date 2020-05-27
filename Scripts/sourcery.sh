#!/bin/sh

BASE_DIRECTORY="Zelty"

./Pods/Sourcery/bin/sourcery \
--sources $BASE_DIRECTORY \
--output ${BASE_DIRECTORY}Tests/Generated/Mocks.swift \
--templates ./SourceryTemplates/AutoMockable.stencil \
--args module="Zelty",import=Zelty 

# ./Pods/Sourcery/bin/sourcery \
# --sources $BASE_DIRECTORY \
# --output ${BASE_DIRECTORY}Tests/Generated/Mocks.swift \
# --templates ./Pods/Sourcery/Templates/AutoMockable.stencil \
# --args module="Zelty",import=Zelty 