#!/bin/bash

cd ..

# Run tests with coverage
dart pub global run coverage:test_with_coverage || { echo 'test with coverage failed' ; exit 1; }
genhtml coverage/lcov.info -o coverage/html || { echo 'failed to generate coverage report' ; exit 1; }

# Remove auto-generated files from coverage
#lcov --remove coverage/lcov.info '*.gen.dart' -o coverage/trace_lcov.info || { echo 'failed to exclude auto-generated files from coverage' ; exit 1; }

# Generate coverage report
#genhtml coverage/trace_lcov.info -o coverage/html || { echo 'failed to generate coverage report' ; exit 1; }


