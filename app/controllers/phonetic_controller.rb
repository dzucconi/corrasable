class PhoneticController < ApplicationController
  def index
    text = params.require(:text)
    algorithm = params[:algorithm].try(:to_sym) || Phonetic::Index::DEFAULT_ALGORITHM

    @indexed = Phonetic::Index.send(algorithm, text)

    render json: {
      text: text,
      indexed: @indexed
    }
  end

  def algorithms
    render json: Phonetic::Index::ALGORITHMS
  end
end
