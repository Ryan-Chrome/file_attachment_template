class FileItemsController < ApplicationController

  # ファイル一覧
  def index
    @files = FileItem.all
  end

  # ファイル新規アップロード
  def new
    @file = FileItem.new
  end

  # ファイル新規登録
  def create
    @file = FileItem.new(file_params)
    if @file.save
      redirect_to root_path
    else
      render "new"
    end
  end

  def destroy
    @file = FileItem.find_by(id: params[:id])
    if @file
      @file.image_file.purge
      @file.destroy
    end
    redirect_to root_path
  end

  def download
    file = FileItem.find(params[:id])
    file_ext = File.extname("#{file.image_file.filename}")
    data = file.image_file.download
    send_data(data, filename: "#{file.name}#{file_ext}")
  end

  private

  def file_params
    params.require(:file_item).permit(:name, :image_file)
  end
end
