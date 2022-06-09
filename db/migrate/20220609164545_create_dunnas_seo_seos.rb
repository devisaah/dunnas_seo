class CreateDunnasSeoSeos < ActiveRecord::Migration[7.0]
  def change
    create_table :dunnas_seo_seos, id: DunnasSeo.active_uuid.present? ? DunnasSeo.active_uuid.to_sym : :integer  do |t|
      t.string :metatag_title
      t.string :metatag_description
      t.string :metatag_language
      t.text :metatag_keywords
      t.string :metatag_author
      t.string :metatag_robots
      t.string :metatag_revisitafter
      t.string :metatag_charset
      t.string :metatag_ogimage
      t.string :metatag_ogurl
      t.string :metatag_ogtype
      t.string :metatag_googleboot
      t.string :metatag_tcard
      t.string :metatag_tsite
      t.string :metatag_tcreator
      t.text :google_anlytics
      t.text :google_adsence
      t.text :google_adsence_responsive
      t.text :google_search
      t.text :google_maps
      t.text :facebook_pixel
      t.text :one_signal
      t.text :onesignal_appid
      t.text :onesignal_restapi
      t.text :jivochat
      t.text :terms_of_use
      t.text :privacy_policy
      t.text :our_story
      t.text :mission
      t.text :vision
      t.text :values
      t.text :about
      t.string :photo_about

      t.timestamps
    end
  end
end
