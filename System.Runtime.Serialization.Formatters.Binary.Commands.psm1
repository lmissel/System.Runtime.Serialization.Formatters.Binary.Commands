#-------------------------------------
#
# Module: System.Runtime.Serialization.Formatters.Binary.Commands
#
# Description: 
# Dieses PowerShell Module stellt Funktion zur Verfügung mit der Hilfe 
# Objekte im binären Format serialisiert und deserialisiert werden können.
#
# Namespace: System.Runtime.Serialization.Formatters.Binary
# Assemblies: mscorlib.dll, netstandard.dll, System.Runtime.Serialization.Formatters.dll
#
#-------------------------------------

# Deserialisiert den angegebenen Stream in ein Objektdiagramm.
function ConvertFrom-BinaryFile
{
    [CmdletBinding()]
    [Alias()]
    Param
    (
        # Hilfebeschreibung zu Param1
        [Parameter(Mandatory=$true,
                   ValueFromPipelineByPropertyName=$true,
                   Position=0)]
        [String] $File
    )

    Begin
    {
        if (-not(Test-Path -Path $File)) { throw "File not found."}
    }
    Process
    {
        [System.IO.FileStream] $FileStream = [System.IO.FileStream]::new($File, [System.IO.FileMode]::Open)
        [System.Runtime.Serialization.Formatters.Binary.BinaryFormatter] $BinaryFormatter = [System.Runtime.Serialization.Formatters.Binary.BinaryFormatter]::new()
        $OutputObject = $BinaryFormatter.Deserialize($FileStream)
        return $OutputObject
    }
    End
    {
        $FileStream.Close()
    }
}

# Serialisiert das Objekt oder das Objektdiagramm mit dem angegebenen obersten Element (Stamm) in den angegebenen Stream.
function ConvertTo-BinaryFile
{
    [CmdletBinding()]
    [Alias()]
    Param
    (
        # Hilfebeschreibung zu Param1
        [Parameter(Mandatory=$true,
                   ValueFromPipelineByPropertyName=$true,
                   Position=0)]
        [String] $File,

        # Hilfebeschreibung zu Param2
        [Parameter(Mandatory=$true,
                   ValueFromPipelineByPropertyName=$true,
                   Position=1)]
        [System.Object]
        $InputObject
    )

    Begin
    {
    }
    Process
    {
        [System.IO.FileStream] $FileStream = [System.IO.FileStream]::new($File, [System.IO.FileMode]::Create)
        [System.Runtime.Serialization.Formatters.Binary.BinaryFormatter] $BinaryFormatter = [System.Runtime.Serialization.Formatters.Binary.BinaryFormatter]::new()
        $BinaryFormatter.Serialize($FileStream, $InputObject)
    }
    End
    {
        $FileStream.Close()
    }
}