resource "local_file" "demofile" {
  filename = "info.txt"
  content = "this is my first demo file creation from terraform ."
}