require 'bundler/setup'
require 'alfred'

TITLE_REGEX = /title: "([^"]*)"/
PATHS_REGEX = /paths:[^"]+"([^"]*)"/m

def atom_projects
  projects = File.read("/Users/#{`whoami`.strip}/.atom/projects.cson")

  projects.split("}").inject({}) do |memo, section|
    if (title_match = section.match(TITLE_REGEX)) && (path_match = section.match(PATHS_REGEX))
      memo[title_match[1]] = path_match[1]
    end
    memo
  end
end

Alfred.with_friendly_error do |alfred|
  alfred.with_rescue_feedback = true
  alfred.with_help_feedback   = true
  feedback                    = alfred.feedback

  atom_projects.each do |k, v|
    feedback.add_item({
      uid:      k,
      title:    k,
      subtitle: v,
      arg:      v,
      match?:   :all_title_match?
    })
  end
end
