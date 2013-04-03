require 'rack'
require 'mongo'

@db = Mongo::MongoClient.new.db('test')
@grid = Mongo::GridFileSystem.new(@db)

run Proc.new {|env| [200, {"Content-Type" => "image/png"}, [@grid.open(env["REQUEST_PATH"].gsub('/', ''), 'r'){|a| a.read}]]}
