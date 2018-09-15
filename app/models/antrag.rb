class Antrag < ApplicationRecord
    mount_uploader :datei, FormularUploader
end
