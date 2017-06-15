# == Schema Information
#
# Table name: responses
#
#  id               :integer          not null, primary key
#  answer_choice_id :integer          not null
#  responder_id     :integer          not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Response < ApplicationRecord
  validates :answer_choice_id, presence: true
  validates :responder_id, presence: true
  validate :responder_already_answered
  validate :responder_created_poll

  belongs_to :answer_choice,
    primary_key: :id,
    foreign_key: :answer_choice_id,
    class_name: :AnswerChoice

  belongs_to :responder,
    primary_key: :id,
    foreign_key: :responder_id,
    class_name: :User

  has_one :question_of_response,
    through: :answer_choice,
    source: :question

private

  def responder_created_poll
    if self.question_of_response.poll.author_id == self.responder_id
      errors[:base] << 'responder is the author of the poll!'
    end
  end

  def sibling_responses
    self.question_of_response.responses_to_questions.where.not(id: self.id)
  end

  def responder_already_answered
    if sibling_responses.exists?(responder_id: self.responder_id)
      errors[:base] << 'responder already answered this question'
    end
  end
end
