# a test class that accepts an Array of CatalogEntries, to pass on to notify attribute of my exec
class testdemo::test1 (
  Array[Type[CatalogEntry]] $notifications,
) {
  exec { 'sample-exec':
      provider => powershell,
      command  => "Get-ChildItem C:\\",
      notify   => $notifications,
    }
}
