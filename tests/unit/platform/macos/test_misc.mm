/**
 * @file tests/unit/platform/macos/test_misc.mm
 * @brief Unit tests for src/platform/macos/misc.*.
 */

// Only compile these tests on macOS
#ifdef __APPLE__

  #include "../../../tests_common.h"
  #include "../../../tests_log_checker.h"

  #include <src/platform/macos/misc.h>

TEST(MacosMiscTests, ReportInputPermissionReturnsTrustedState) {
  EXPECT_TRUE(platf::macos::report_input_permission(true));
}

TEST(MacosMiscTests, ReportInputPermissionWarnsWhenUntrusted) {
  EXPECT_FALSE(platf::macos::report_input_permission(false));

  EXPECT_TRUE(log_checker::line_equals("test_sunshine.log", "Warning: No Accessibility permission, remote mouse and keyboard input will be ignored!"));
  EXPECT_TRUE(log_checker::line_equals("test_sunshine.log", "Warning: Please activate it in 'System Settings' -> 'Privacy & Security' -> 'Accessibility'"));
}

#endif
