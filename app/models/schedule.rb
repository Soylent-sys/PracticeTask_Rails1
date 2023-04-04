class Schedule < ApplicationRecord
  validates :title, presence: true, length: { maximum: 20 }
  validates :start_date, presence: true,
            format: { with: /\A\d{4}\-\d{2}\-\d{2}\Z/, message: "YYYY/MM/DDのフォーマットではありません" }
  validates :end_date, presence: true,
            format: { with: /\A\d{4}\-\d{2}\-\d{2}\Z/, message: "YYYY/MM/DDのフォーマットではありません" }
  validates :memo, length: { maximum: 500 }
  validate :start_end_check  # 終了日が開始日より前に設定された場合の制御

  # 以下メソッド
  def start_end_check
    if self.start_date === nil || self.end_date === nil
      return
    elsif self.start_date > self.end_date
      errors.add(:end_date, "終了日は開始日の前には設定できません")
    end
  end

end
