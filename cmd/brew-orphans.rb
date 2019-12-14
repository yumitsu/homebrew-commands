#!/usr/bin/env ruby

module BrewOrphans
  class << self
    def run!
      homebrew!

      tracked_list, cellar_dir_list, orphaned_pkgs = Formula.installed
          .map(&:full_name),%x`ls $HOMEBREW_CELLAR`.strip.split("\n"), []

      unless (cellar_dir_list.nil? || cellar_dir_list.empty?)
        cellar_dir_list.each do |pkg|
          begin
            Formula[pkg]
          rescue
            orphaned_pkgs.push(pkg)
          end
        end
        return if orphaned_pkgs.empty?
        puts Formatter.columns(orphaned_pkgs)
      else
        puts "No orphaned packages found, exiting."
        exit(1)
      end

    end

    def homebrew!
      if defined?(HOMEBREW_LIBRARY_PATH)
        require 'formula'
      else
        puts "Not running in homebrew env"
        exit(1)
      end
    end
  end
end

BrewOrphans.run!
