name 'tmux_wrapper'
maintainer 'Danny Guinther'
maintainer_email  'dannyguinther@gmail.com'
license           'MIT'
description       'Wrapper around tmux source recipe'
long_description  'Wrapper that handles symlinks and other evironment configuration and setup.'
version           '0.0.1'

recipe 'tmux_wrapper', 'Install tmux and perform auxilliary actions.'

depends 'tmux'

supports 'debian'
supports 'ubuntu'
