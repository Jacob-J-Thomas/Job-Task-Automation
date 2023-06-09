Sub RemoveDiacritics()
Dim rRng As Range, rCell As Range
Dim l As Long, lCode As Long, lIndex As Long
Dim sOutputColumn As String, sCell As String
Set rRng = Range("F1:F1000") ' Chooses the column to translate
sOutputColumn = "F" ' Chooses the column to add the translated data to. Choosing the same column overwrites data
Call LoadRemoveDiacriticsTables ' Calls module where the Chars and their replacements are stored

On Error Resume Next
For Each rCell In rRng
   If (Not rCell.HasFormula) And (TypeName(rCell.Value) = "String") And (rCell <> "") Then
       sCell = rCell
       For l = 1 To Len(sCell)
           lCode = AscW(Mid(sCell, l, 1))
           lIndex = 0
           lIndex = Application.Match(lCode, tblRemoveDiacriticsCodes, 0)
           If lIndex > 0 Then Mid(sCell, l, 1) = tblRemoveDiacriticsChars(lIndex)
       Next l
       Cells(rCell.Row, sOutputColumn) = sCell
   End If
Next rCell
End Sub
