class InputfilesController < ApplicationController
  def new
    @inputfile = Inputfile.new
  end

  def create
    uploaded = params[:inputfile][:uploaded_file]
    new_filename = Rails.root.join('public', 'uploads', uploaded.original_filename)
    contents = uploaded.read

    tempfile = File.open(new_filename, 'wb') do |file|
      file.write(contents)
    end

    @inputfile = Inputfile.new title: params[:inputfile][:title], filename: new_filename.to_s, contents: contents
    if @inputfile.save && tempfile.present?
      flash[:message] = "Your file #{ @inputfile.filename} has been successfully uploaded"
      redirect_to new_inputfile_url
    else
      render action: "new"
    end
  end

  def show
    @inputfile = Inputfile.find(params[:id])
  end
end
