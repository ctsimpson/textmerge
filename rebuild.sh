gem uninstall textmerge
rm -rf pkg/*.gem
rake build textmerge.gemspec
rake install pkg/textmerge*.gem
