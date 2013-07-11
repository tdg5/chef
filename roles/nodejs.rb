name 'nodejs'
description 'Role for nodejs related tools'
run_list [
	'recipe[nodejs]',
	'recipe[nodejs::npm]',
	'recipe[npm]',
	'recipe[grunt]',
]
default_attributes({
	:npm => {
		:version => '1.2.14',
	}
})
