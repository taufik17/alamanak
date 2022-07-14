const multer = require("multer");
const path = require("path");
const { v4: uuidv4 } = require("uuid");

const storage = multer.diskStorage({
  destination(req, file, cb) {
    cb(null, "./images");
  },
  filename(req, file, cb) {
    cb(
      null,
      `${Date.now()}_${Math.random()}_${uuidv4()}_${path.extname(
        file.originalname
      )}`
    );
  },
});

const fileFilter = (req, file, cb) => {
  if (
    file.mimetype === "image/png" ||
    file.mimetype === "image/jpg" ||
    file.mimetype === "image/jpeg"
  ) {
    cb(null, true);
  } else {
    cb("Error: Images Only!");
  }
};

const upload = multer({
  storage,
  limits: {
    fileSize: 1000000, // 1MB
  },
  fileFilter,
});

module.exports = upload;
