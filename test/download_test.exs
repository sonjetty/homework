defmodule DownloadTest do
  # Import helpers
  use Hound.Helpers
  use ExUnit.Case

  Code.require_file("reuseableCode/reuseables.exs")

  # Start hound session and destroy when tests are run
  hound_session(driver: %{
    browserName: "chrome",
    chromeOptions: %{
        "prefs" => %{ "download" => %{
          "prompt_for_download" => false,
          "directory_upgrade" => true,
          "default_directory" => Path.join(System.cwd, "downloads")
        }}
    }}
  )

  test "download and verify file exists" do

    navigate_to "https://the-internet.herokuapp.com/download"
    file = find_element(:xpath, "//*[text() ='SampleUpload.txt']")
    click(file)
    #time to download
    :timer.sleep(3000)

    #verifies existence of downloaded file and clears directory so ready for next test
    File.read!("downloads/SampleUpload.txt")
    File.rm_rf("downloads")

  end

end
