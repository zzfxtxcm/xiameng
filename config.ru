# This file is used by Rack-based servers to start the application.

# require 'unicorn/oob_gc'
# require 'unicorn/worker_killer'
#
# use Unicorn::OobGC, 10
# use Unicorn::WorkerKiller::MaxRequests, 6072, 7096
# use Unicorn::WorkerKiller::Oom, (192*(1024**2)), (256*(1024**2))

require ::File.expand_path('../config/environment',  __FILE__)
run Rails.application
