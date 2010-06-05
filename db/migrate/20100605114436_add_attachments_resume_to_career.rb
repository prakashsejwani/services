class AddAttachmentsResumeToCareer < ActiveRecord::Migration
  def self.up
    add_column :careers, :resume_file_name, :string
    add_column :careers, :resume_content_type, :string
    add_column :careers, :resume_file_size, :integer
    add_column :careers, :resume_updated_at, :datetime
  end

  def self.down
    remove_column :careers, :resume_file_name
    remove_column :careers, :resume_content_type
    remove_column :careers, :resume_file_size
    remove_column :careers, :resume_updated_at
  end
end
