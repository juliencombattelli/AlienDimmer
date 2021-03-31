add_executable(math-test test.cpp)
target_link_libraries(math-test 
    PRIVATE
        math GTest::GTest
)
gtest_discover_tests(math-test)