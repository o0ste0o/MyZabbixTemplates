param (
    [string] $name = 0
)
$siteState = Get-WebsiteState -name "$name"

$ResultText = $siteState.Value
$ResultNumber = 99
#Valid values are Starting, Started, Stopping, Stopped, and Unknown.
$ResultNumber = switch ($ResultText) {
    Starting { 0 }
    Started { 1 }
    Stopping { 2 }
    Stopped { 3 }
    Unknown { 4 }
    Default { 99 }
}
$ResultNumber
