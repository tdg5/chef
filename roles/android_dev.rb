name 'android_dev'
description 'Role for android development'
run_list [
  'role[java]',
  'recipe[android-sdk]',
  'recipe[ruboto]',
]
default_attributes({
  'android-sdk' => {
    :components => %w[
      platform-tools build-tools-19.0.0 android-19 sysimg-19
      android-18 sysimg-18 android-17 sysimg-17 android-16
      sysimg-16 android-15 sysimg-15 android-14 sysimg-14
      extra-android-support extra-google-google_play_services
      extra-google-m2repository extra-android-m2repository
    ],
  },
  :bash => {
    :bashrc => {
      :extra_sources => [
        '~/.rubotorc',
      ],
    },
  },
  :java => {
    :jdk_version => '7',
  },
})
