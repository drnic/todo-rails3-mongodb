#
# Cookbook Name:: imagemagick
# Recipe:: install
#

enable_package 'media-gfx/imagemagick' do
  version node[:imagemagick_version]
end

package 'media-gfx/imagemagick' do
  version node[:imagemagick_version]
  action :install
end
