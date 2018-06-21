require "csv_exportable/version"

module CsvExportable
  # @param filename String      出力されるファイル名称
  # @param header Array[String] CSVファイルのヘッダ
  # @param rows Array[Array]    CSVファイルの行
  def export_csv(filename:, header:, rows:)
    send_data NKF.nkf('-xsW -Lw', csv(header: header, rows: rows)),
      :filename    => filename,
      :type        => 'text/csv; charset=Shift_JIS',
      :disposition => 'attachment'
  end

  private

  def csv(header:, rows:)
    CSV.generate(:force_quotes => true) do |csv|
      csv << header
      rows.each do |row|
        csv << row
      end
    end
  end
end
