name "golang"
description "Role for golang programming language"
run_list([
  "recipe[golang]",
])
default_attributes({
  :go => {
    :platform => "amd64",
    :version => "1.6",
  },
})
