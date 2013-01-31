describe ScaleSubmittable, '#breakdown' do
  it 'returns the average' do
    survey = create(:survey)
    question = create(:scale_question, minimum: 0, maximum: 10, survey: survey)
    submittable = ScaleSubmittable.new(question)
    taker = AnswerCreator.new(survey)
    taker.answer question, 6
    taker.answer question, 6
    taker.answer question, 8

    submittable.breakdown.should eq 'Average: 6.67'
  end
end

describe ScaleSubmittable, '#score' do
  it 'returns the integer value of the text' do
    question = build_stubbed(:scale_question)
    submittable = ScaleSubmittable.new(question)

    result = submittable.score('5')

    result.should eq 5
  end
end