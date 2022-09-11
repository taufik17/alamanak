/* eslint-disable linebreak-style */
require('dotenv').config();
const fs = require('fs');
const { promisify } = require('util');

const unlinkAsync = promisify(fs.unlink);
const cloudinary = require('cloudinary').v2;
const multer = require('multer');
const multerUtils = require('../multer');

cloudinary.config({
  cloud_name: process.env.CLOUDINARY_NAME,
  api_key: process.env.CLOUDINARY_API_KEY,
  api_secret: process.env.CLOUDINARY_API_SECRET,
});

const uploadSingle = (req, res, next) => {
  const doUploadSingle = multerUtils.single('image');
  doUploadSingle(req, res, (err) => {
    try {
      if (err instanceof multer.MulterError) {
        // A Multer error occurred when uploading.
        res.status(400).send(err?.message ?? 'Something went wrong!');
        return;
      } if (err) {
        // An unknown error occurred when uploading.
        res.status(400).send(err ?? 'Something went wrong!');
        return;
      }
      (async () => {
        const result = await cloudinary.uploader.upload(req.file.path);
        res.img_url = result.secure_url;
        next();
      })();
    } catch (error) {
      res.status(500).send(error?.message ?? 'Upload Failed');
    }
  });
};

const uploadMultiple = (req, res, next) => {
  const doUploadSingle = multerUtils.array('images', 5);

  doUploadSingle(req, res, (err) => {
    try {
      if (err instanceof multer.MulterError) {
        // A Multer error occurred when uploading.
        res.status(400).send(err?.message ?? 'Something went wrong!');
        return;
      } if (err) {
        // An unknown error occurred when uploading.
        res.status(400).send(err ?? 'Something went wrong!');
        return;
      }

      next();
      // if (err) throw err;
    } catch (error) {
      res.status(500).send(error?.message ?? 'Upload Failed');
    }
  });
};

const deleteFile = async (req, res) => {
  await unlinkAsync(`images/${req.body.name}`);
  res.send('DELETE COMPLETED!');
};

module.exports = { deleteFile, uploadMultiple, uploadSingle };
