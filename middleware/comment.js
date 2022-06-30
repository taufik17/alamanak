/* eslint-disable linebreak-style */
const modelSearch = require('../model/comments/searchCommentModel');

const checkParamEdit = async (req, res, next) => {
  try {
    const {
      idComment, textComment,
    } = req.body;
    const isValid = idComment && textComment;
    if (isValid) {
      const checkComment = await modelSearch.getCommentById(idComment);
      if (checkComment.rowCount > 0) {
        next();
      } else {
        res.status(400).send('Comment was not found');
      }
    } else {
      res.status(400).send('Error params');
      return;
    }
  } catch (error) {
    res.status(500).send('Found Error');
  }
};

const checkParamDelete = async (req, res, next) => {
  try {
    const {
      idComment,
    } = req.body;
    if (idComment) {
      const checkComment = await modelSearch.getCommentById(idComment);
      if (checkComment.rowCount > 0) {
        next();
      } else {
        res.status(400).send('Comment was not found');
      }
    } else {
      res.status(400).send('Error params');
      return;
    }
  } catch (error) {
    res.status(500).send('Found Error');
  }
};

module.exports = { checkParamEdit, checkParamDelete };
