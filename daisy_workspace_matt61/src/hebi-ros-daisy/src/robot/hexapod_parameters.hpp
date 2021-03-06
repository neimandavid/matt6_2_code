#pragma once

#include <string>

namespace hebi {

struct HexapodParameters
{
  // Stance
  float stance_radius_;
  float default_body_height_;
  float min_z_;
  float max_z_;
  float max_r_; // max radius (for stance mode body weight shifting)

  // Step threshold
  float step_threshold_rotate_; // rad
  float step_threshold_shift_; // m

  // Resource location (e.g., HRDF, gains, etc)
  std::string resource_path_;

  // Logging
  bool logging_enabled_;
  float high_log_frequency_hz_;
  float low_log_frequency_hz_;

  // true on success, false on failure
  bool loadFromFile(const std::string& file);
  bool saveToFile(const std::string& file) const;
  void resetToDefaults();
};

} // namespace hebi
