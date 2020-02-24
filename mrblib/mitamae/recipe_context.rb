module MItamae
  class RecipeContext
    NotFoundError = Class.new(StandardError)

    class << self
      def register_resource(klass)
        method_name = klass.to_s.split('::').last.gsub(/([a-z\d])([A-Z])/,'\1_\2').downcase
        define_method(method_name) do |name, &block|
          @recipe.children << klass.new(name, @recipe, @variables, &block)
        end
      end

      def included_paths
        @included_paths ||= []
      end
    end

    # @param [MItamae::Recipe,MItamae::RecipeFromDefinition] recipe
    # @param [Hash] variables
    def initialize(recipe, variables = {})
      @recipe = recipe
      @variables = variables
      @variables.each do |key, value|
        if value.is_a?(Proc)
          define_singleton_method(key, &value)
        else
          define_singleton_method(key) { value }
        end
      end
    end

    def directory(path, &block)
      @recipe.children << Resource::Directory.new(path, @recipe, @variables, &block)
    end

    def execute(command, &block)
      @recipe.children << Resource::Execute.new(command, @recipe, @variables, &block)
    end

    def file(path, &block)
      @recipe.children << Resource::File.new(path, @recipe, @variables, &block)
    end

    def gem_package(package_name, &block)
      @recipe.children << Resource::GemPackage.new(package_name, @recipe, @variables, &block)
    end

    def git(destination, &block)
      @recipe.children << Resource::Git.new(destination, @recipe, @variables, &block)
    end

    def http_request(path, &block)
      @recipe.children << Resource::HTTPRequest.new(path, @recipe, @variables, &block)
    end

    def link(link_path, &block)
      @recipe.children << Resource::Link.new(link_path, @recipe, @variables, &block)
    end

    def local_ruby_block(name, &block)
      @recipe.children << Resource::LocalRubyBlock.new(name, @recipe, @variables, &block)
    end

    def package(name, &block)
      @recipe.children << Resource::Package.new(name, @recipe, @variables, &block)
    end

    def group(group_name, &block)
      @recipe.children << Resource::Group.new(group_name, @recipe, @variables, &block)
    end

    def user(user_name, &block)
      @recipe.children << Resource::User.new(user_name, @recipe, @variables, &block)
    end

    def remote_directory(path, &block)
      @recipe.children << Resource::RemoteDirectory.new(path, @recipe, @variables, &block)
    end

    def remote_file(path, &block)
      @recipe.children << Resource::RemoteFile.new(path, @recipe, @variables, &block)
    end

    def service(name, &block)
      @recipe.children << Resource::Service.new(name, @recipe, @variables, &block)
    end

    def template(path, &block)
      @recipe.children << Resource::Template.new(path, @recipe, @variables, &block).tap do |r|
        r.node = @variables[:node]
      end
    end

    def define(name, params = {}, &block)
      variables    = @variables
      defined_path = @recipe.path
      klass = Resource::Definition.create_class(name, params)
      RecipeContext.send(:define_method, name) do |n, &b|
        @recipe.children << RecipeFromDefinition.new(File.dirname(defined_path), @recipe, name, n).tap do |recipe|
          recipe.definition = klass.new(n, recipe, variables, &b)
          recipe.definition.resource_type = name.to_s
          params = recipe.definition.attributes.merge(name: n)
          RecipeContext.new(recipe, variables.merge(params: params)).instance_exec(&block)
        end
      end
    end

    def include_recipe(target)
      path = ::File.expand_path(target, @recipe.dir)
      path = ::File.join(path, 'default.rb') if ::Dir.exists?(path)
      path.concat('.rb') unless path.end_with?('.rb')
      path = Plugin.find_recipe(target) unless File.exist?(path)

      if path.nil?
        raise NotFoundError, "Recipe not found. (#{target})"
      end

      if RecipeContext.included_paths.include?(path)
        MItamae.logger.debug "Recipe, #{path}, is skipped because it is already included"
        return
      end
      RecipeContext.included_paths << path

      @recipe.children << Recipe.new(path, @recipe).tap do |recipe|
        recipe.eval_file(path, @variables)
      end
    end
  end
end
