name "golang"
description "Role for golang programming language"
run_list([
  "recipe[chef-golang]",
])
default_attributes({
  :go => {
    :platform => "amd64",
    :version => "1.10.3",
  },
})
