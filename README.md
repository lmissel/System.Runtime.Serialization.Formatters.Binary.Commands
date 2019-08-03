# System.Runtime.Serialization.Formatters.Binary.Commands
 
 Dieses PowerShell Module enthält Funktionen mit der Hilfe Objekte im binären Format serialisiert und deserialisiert werden können.

## Voraussetzungen

Um dieses Module nutzen zu können, ist .Net Standard notwendig. Dies sollte bei Windows Systemen standardmäßig zur Verfügung stehen.

## Installation

Kopieren Sie das Module in eins der PowerShell Module Pfade.

## Verwendung

In diesem Beispiel wird gezeigt und erläutert, wie das Module verwendet werden kann.

```powershell
# Importieren des Moduls
Import-Module System.Runtime.Serialization.Formatters.Binary.Commands

# Pfad angegeben
$TargetPath = "C:\test"

# Serialisiert das Objekt
ConvertTo-BinaryFile -File $TargetPath -InputObject $host

# Deserialisiert die angegebene Datei.
ConvertFrom-BinaryFile -File $TargetPath

```

## Hinweis

Das Module verwendet Klassen des Namepaces [System.Runtime.Serialization.Formatters.Binary], mit denen die Umsetzung vereinfacht wird.