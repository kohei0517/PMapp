# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2023_09_06_115927) do

  create_table "count_days", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.date "inventory_day"
    t.integer "inventory_finish"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "export_plans", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.date "export_day", null: false
    t.integer "count", null: false
    t.bigint "count_day_id", null: false
    t.bigint "product_num_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["count_day_id"], name: "index_export_plans_on_count_day_id"
    t.index ["product_num_id"], name: "index_export_plans_on_product_num_id"
  end

  create_table "material_buys", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.date "buy_day", null: false
    t.integer "count", null: false
    t.bigint "count_day_id", null: false
    t.bigint "material_num_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["count_day_id"], name: "index_material_buys_on_count_day_id"
    t.index ["material_num_id"], name: "index_material_buys_on_material_num_id"
  end

  create_table "material_counts", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.integer "count", null: false
    t.bigint "material_num_id", null: false
    t.bigint "count_day_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["count_day_id"], name: "index_material_counts_on_count_day_id"
    t.index ["material_num_id"], name: "index_material_counts_on_material_num_id"
  end

  create_table "material_nums", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "product_number", null: false
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "material_plans", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.date "buy_day", null: false
    t.integer "count", null: false
    t.bigint "count_day_id", null: false
    t.bigint "material_num_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["count_day_id"], name: "index_material_plans_on_count_day_id"
    t.index ["material_num_id"], name: "index_material_plans_on_material_num_id"
  end

  create_table "product_counts", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.integer "count", null: false
    t.bigint "product_num_id", null: false
    t.bigint "count_day_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["count_day_id"], name: "index_product_counts_on_count_day_id"
    t.index ["product_num_id"], name: "index_product_counts_on_product_num_id"
  end

  create_table "product_makes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.date "product_day", null: false
    t.integer "count", null: false
    t.integer "miss", null: false
    t.bigint "count_day_id", null: false
    t.bigint "product_num_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["count_day_id"], name: "index_product_makes_on_count_day_id"
    t.index ["product_num_id"], name: "index_product_makes_on_product_num_id"
  end

  create_table "product_nums", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "product_number", null: false
    t.string "name", null: false
    t.integer "material_count", null: false
    t.bigint "material_num_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["material_num_id"], name: "index_product_nums_on_material_num_id"
  end

  create_table "product_plans", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.date "product_day", null: false
    t.integer "count", null: false
    t.bigint "count_day_id", null: false
    t.bigint "product_num_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["count_day_id"], name: "index_product_plans_on_count_day_id"
    t.index ["product_num_id"], name: "index_product_plans_on_product_num_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "export_plans", "count_days"
  add_foreign_key "export_plans", "product_nums"
  add_foreign_key "material_buys", "count_days"
  add_foreign_key "material_buys", "material_nums"
  add_foreign_key "material_counts", "count_days"
  add_foreign_key "material_counts", "material_nums"
  add_foreign_key "material_plans", "count_days"
  add_foreign_key "material_plans", "material_nums"
  add_foreign_key "product_counts", "count_days"
  add_foreign_key "product_counts", "product_nums"
  add_foreign_key "product_makes", "count_days"
  add_foreign_key "product_makes", "product_nums"
  add_foreign_key "product_nums", "material_nums"
  add_foreign_key "product_plans", "count_days"
  add_foreign_key "product_plans", "product_nums"
end
