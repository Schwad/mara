task test_mara: :environment do
  HardWorker.perform_async
end
