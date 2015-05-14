def var cStr as char no-undo.
def var iCon as inte no-undo init 0.
find _ActSummary no-lock.
find _ActBiLog   no-lock.

case session:parameter:
  when 'Commits'    then cStr = string(_ActSummary._Summary-Commits).
  when 'Undo'       then cStr = string(_ActSummary._Summary-Undos).
  when 'Reads'      then cStr = string(_ActSummary._Summary-RecReads).
  when 'Create'     then cStr = string(_ActSummary._Summary-RecCreat).
  when 'Updat'      then cStr = string(_ActSummary._Summary-RecUpd).
  when 'Delete'     then cStr = string(_ActSummary._Summary-RecDel).
  when 'Lock'       then cStr = string(_ActSummary._Summary-RecLock).
  when 'BufWaits'   then cStr = string(_ActBiLog._BiLog-BBuffWaits).
  when 'TransLogBI' then cStr = trim(string(_ActBiLog._BiLog-Trans)).
  when 'Connections'
    then do:
      for each _Connect no-lock
        where _Connect._Connect-usr <> ?
        :
        if ( not _Connect._Connect-device matches "*batch*" ) and
             _Connect._connect-batch ne "yes"
        then
          iCon = iCon + 1.
      end.
      cStr = string(iCon).
    end.
  when 'HiWaterMark'
    then do:
      find _AreaStatus no-lock where _AreaStatus-Areanum eq 3.
      cStr = string(int(_AreaStatus-Hiwater / _AreaStatus-Totblocks * 100)).
    end.
  otherwise cStr = '0'.
end case.
cStr = cStr + chr(10).
output through cat.
put unform cStr.
output close.
quit.
