#!/bin/bash

cd ..

# Run tests with coverage
dart pub global run coverage:test_with_coverage || { echo 'test with coverage failed' ; exit 1; }
genhtml coverage/lcov.info -o coverage/html || { echo 'failed to generate coverage report' ; exit 1; }
