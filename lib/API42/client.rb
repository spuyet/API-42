require "rest-client"
require "json"

module API42
  class Client
    attr_accessor :token

    def initialize token
      @host = RestClient::Resource.new('https://api.intrav2.42.fr')
      @token = token
    end

    def cursus(options = {})
      cursus = @host['cursus']
      id = cursus[options[:id]]
      get id[options[:resource]]
    end

    def groups(id = nil)
      groups = @host['groups']
      get groups[id.to_s]
    end

    def projects(options = {})
      project = @host['projects']
      slug = project[(options[:slug] || options[:id]).to_s]
      get slug[options[:resource]]
    end

    def team id
      teams = @host['teams']
      get teams[id.to_s]
    end

    def users(login, options = {})
      users = @host['users']
      login = users[login]
      get login[options[:resource]]
    end

    def topic id
      topics = @host['topics']
      get topics[id.to_s]
    end

    def scale_team id
      scale = @host['scale_teams']
      get scale[id.to_S]
    end

    private

    def get(resource, params = {})
      res = resource.get(params: {token: @token}, accept: 'application/json')
      parse_response res
    rescue RestClient::ExceptionWithResponse => err
      err.response
    end

    def parse_response res
      case res.code
      when *[200..226]
        parse_body res.body
      else
        raise ServerError, http_error(res.code)
      end
    end

    def parse_body body
      JSON.parse body
    rescue
      raise JsonError, 'Bad content returned by server. Check your params.'
    end

    def http_error code
      "HTTP Error code: #{res.code}."
    end

  end
end