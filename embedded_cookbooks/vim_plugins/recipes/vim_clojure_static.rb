git "/home/#{node.user.username}/#{node.vim_plugins.user_bundle_dir}/vim-clojure-static" do
  group node.user.group
  repository "https://github.com/guns/vim-clojure-static.git"
  revision "1897d3b5342659ebaf737a723d476f6e86bc3b67"
  user node.user.username
end
