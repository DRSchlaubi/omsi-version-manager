if($args.Count -lt 1) {
    Write-Host 'Please enter a folder name'
    return
}

$folderName=$args[0]
$pathName="..\$folderName"

function adaptPath {
    [OutputType([string])]
    param([string] $oldPath)

    return "$pathName\$oldPath"
}

if (Test-Path -Path $pathName) {
    Write-Host 'Path already exists'
    return
}

New-Item -Path $pathName -ItemType directory


#Get all files but not directories
$files = Get-ChildItem . -File
foreach ($item in $files) {
    $oldPath = $item.Name
    $newPath = adaptPath -oldPath $oldPath

    New-Item -Path $newPath -ItemType SymbolicLink -Value $oldPath
}

# Get all directories and create symlinks for all of their child items
$directories = Get-ChildItem . -Directory
foreach ($directory in $directories) {
    $directoryName = $directory.Name
    Write-Host "Creating clone of $directoryName"
    $newDirectory = adaptPath -oldPath $directoryName
    New-Item -Path $newDirectory -ItemType directory

    $children = Get-ChildItem $directory
    foreach($item in $children) {
        $itemName = $item.Name
        $itemPath = "$directoryName\$itemName"
        $newName = adaptPath -oldPath $itemPath

        
        Write-Host "Symlinking item $itemName at $newName"
        New-Item -Path $newName -ItemType SymbolicLink -Value $itemPath
    }
}

$activateFileName = adaptPath -oldPath 'activate.ps1'
$activateDownloadUrl = 'https://raw.githubusercontent.com/DRSchlaubi/omsi-version-manager/main/activate.ps1'
Invoke-WebRequest $activateDownloadUrl -OutFile $activateFileName
