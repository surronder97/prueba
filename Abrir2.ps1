Set-ExecutionPolicy Unrestricted
Add-Type -AssemblyName System.Windows.Forms
$folderBrowser = New-Object System.Windows.Forms.FolderBrowserDialog
$folderBrowser.Description = "Selecciona la carpeta de inicio"
$folderBrowser.RootFolder = "MyComputer"

#Establecer titulo de ventana
$Host.UI.RawUI.WindowTitle = "Ejecutar mantenimiento"

#Establecer ruta de inicio
if ($folderBrowser.ShowDialog() -eq "OK") {
    $folderPathA = $folderBrowser.SelectedPath
} else {
    # El usuario canceló el cuadro de diálogo
    $folderPathA = "Optimizacion\"
    #exit
}

$filesA = Get-ChildItem $folderPathA -File


$Form = New-Object System.Windows.Forms.Form
$Form.Text = "Selecciona los archivos para abrir"
$Form.Width = 1200
$Form.Height = 700
$Form.Controls.Add($CheckListBoxA)
$Form.Font = New-Object System.Drawing.Font("Microsoft Sans Serif", 10)


    $groupBoxA = New-Object System.Windows.Forms.GroupBox
    $groupBoxA.Text = "OPCIONES"
    $groupBoxA.Location = New-Object System.Drawing.Point(5, 5)
    $groupBoxA.Size = New-Object System.Drawing.Size(710, 580)

        $CheckListBoxA = New-Object System.Windows.Forms.CheckedListBox
        $CheckListBoxA.Width = 700
        $CheckListBoxA.Height = 500
        $CheckListBoxA.Top = 20
        $CheckListBoxA.Left = 5
        $CheckListBoxA.ThreeDCheckBoxes = $false
        foreach ($fileA in $filesA) {
            $CheckListBoxA.Items.Add($fileA.Name)
        }
        $groupBoxA.Controls.Add($CheckListBoxA)

        $boton_A1 = New-Object System.Windows.Forms.Button
        $boton_A1.Text = "Para equipo de buen rendimiento"
        $boton_A1.Top = 520
        $boton_A1.Left = 5
        $boton_A1.Height = 55
        $boton_A1.Width = 150
        $boton_A1.FlatStyle = [System.Windows.Forms.FlatStyle]::Flat
        $groupBoxA.Controls.Add($boton_A1)

        $boton_A2 = New-Object System.Windows.Forms.Button
        $boton_A2.Text = "Para equipo de bajo rendimiento"
        $boton_A2.Top = 520
        $boton_A2.Left = 160
        $boton_A2.Height = 55
        $boton_A2.Width = 150
        $boton_A2.FlatStyle = [System.Windows.Forms.FlatStyle]::Flat
        $groupBoxA.Controls.Add($boton_A2)


        $boton_A3 = New-Object System.Windows.Forms.Button
        $boton_A3.Text = "Seleccionar todas"
        $boton_A3.Top = 520
        $boton_A3.Left = 315
        $boton_A3.Height = 55
        $boton_A3.Width = 150
        $boton_A3.FlatStyle = [System.Windows.Forms.FlatStyle]::Flat
        $groupBoxA.Controls.Add($boton_A3)


        $boton_A4 = New-Object System.Windows.Forms.Button
        $boton_A4.Text = "Ejecutar archivos seleccionados"
        $boton_A4.Top = 520
        $boton_A4.Left = 470
        $boton_A4.Height = 55
        $boton_A4.Width = 234
        $boton_A4.FlatStyle = [System.Windows.Forms.FlatStyle]::Flat
        $boton_A4.BackColor = [System.Drawing.Color]::FromArgb(27, 156, 252)
        $boton_A4.ForeColor = [System.Drawing.Color]::FromArgb(255, 255, 255)
        $groupBoxA.Controls.Add($boton_A4)

            $boton_A4.Add_Click({
                for ($a = 0; $a -lt $CheckListBoxA.Items.Count; $a++) {
                    if ($CheckListBoxA.GetItemChecked($a)) {
                        $selectedItemA = $CheckListBoxA.Items[$a]
                        $filePathA = Join-Path $folderPathA $selectedItemA

                        $codeA = '&' + "'$filePathA'"
                        Write-Host "Abriendo archivo: $codeA"
                        msg * $codeA
                        $processA = Start-Process powershell.exe -ArgumentList "-Command", $codeA -PassThru
                        $processA.WaitForExit()
                    }
                }
            })



    # Agregar el GroupBox al formulario
    $form.Controls.Add($groupBoxA)




    $groupBoxB = New-Object System.Windows.Forms.GroupBox
    $groupBoxB.Text = "ALMACENAMIENTO"
    $groupBoxB.Location = New-Object System.Drawing.Point(725, 5)
    $groupBoxB.Size = New-Object System.Drawing.Size(450, 380)

        $folderPathB = "Optimizacion\SRC\Mantenimiento"
        $filesB = Get-ChildItem $folderPathB -File

        $CheckListBoxB = New-Object System.Windows.Forms.CheckedListBox
        $CheckListBoxB.Width = 440
        $CheckListBoxB.Height = 305
        $CheckListBoxB.Top = 20
        $CheckListBoxB.Left = 5
        $CheckListBoxB.ThreeDCheckBoxes = $false
        foreach ($fileB in $filesB) {
            $CheckListBoxB.Items.Add($fileB.Name)
        }
        $groupBoxB.Controls.Add($CheckListBoxB)


        $boton_B1 = New-Object System.Windows.Forms.Button
        $boton_B1.Text = "Ejecutar archivos seleccionados"
        $boton_B1.Top = 320
        $boton_B1.Left = 5
        $boton_B1.Height = 55
        $boton_B1.Width = 100
        $boton_B1.FlatStyle = [System.Windows.Forms.FlatStyle]::Flat
        $groupBoxB.Controls.Add($boton_B1)


        $boton_B2 = New-Object System.Windows.Forms.Button
        $boton_B2.Text = "Ejecutar archivos seleccionados"
        $boton_B2.Top = 320
        $boton_B2.Left = 110
        $boton_B2.Height = 55
        $boton_B2.Width = 100
        $boton_B2.FlatStyle = [System.Windows.Forms.FlatStyle]::Flat
        $groupBoxB.Controls.Add($boton_B2)


        
        $boton_B3 = New-Object System.Windows.Forms.Button
        $boton_B3.Text = "Ejecutar archivos seleccionados"
        $boton_B3.Top = 320
        $boton_B3.Left = 215
        $boton_B3.Height = 55
        $boton_B3.Width = 100
        $boton_B3.FlatStyle = [System.Windows.Forms.FlatStyle]::Flat
        $groupBoxB.Controls.Add($boton_B3)


        
        $boton_B4 = New-Object System.Windows.Forms.Button
        $boton_B4.Text = "Ejecutar archivos seleccionados"
        $boton_B4.Top = 320
        $boton_B4.Left = 320
        $boton_B4.Height = 55
        $boton_B4.Width = 125
        $boton_B4.FlatStyle = [System.Windows.Forms.FlatStyle]::Flat
        $boton_B4.BackColor = [System.Drawing.Color]::FromArgb(27, 156, 252)
        $boton_B4.ForeColor = [System.Drawing.Color]::FromArgb(255, 255, 255)
        $groupBoxB.Controls.Add($boton_B4)

            $boton_B4.Add_Click({
            for ($b = 0; $b -lt $CheckListBoxB.Items.Count; $b++) {
                if ($CheckListBoxB.GetItemChecked($b)) {
                    $selectedItemB = $CheckListBoxB.Items[$b]
                    $filePathB = Join-Path $folderPathB $selectedItemB

                    $codeB = '&' + "'$filePathB'"
                    msg * $codeB
                    $processB = Start-Process powershell.exe -ArgumentList "-Command", $codeB -PassThru
                    $processB.WaitForExit()
                }
            }
        })

        

    $form.Controls.Add($groupBoxB)




# Mostrar el formulario
$form.ShowDialog()
