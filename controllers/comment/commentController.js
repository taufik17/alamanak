const model = require('../../model/comments/commentModel');
const modelSearch = require('../../model/comments/searchCommentModel');

const addComment = async (req, res) => {
  try {
    const {
      textComment,
      idRecipe,
    } = req.body;
    const idUser = req.res.locals;
    const doAddComment = await model.doAddComment({
      idUser,
      textComment,
      idRecipe,
    });
    // disini upload video
    if (doAddComment) {
      res.send('Add Comment Successfully');
    }
  } catch (error) {
    res.status(400).send('ada yang error');
  }
};

const editComment = async (req, res) => {
  try {
    const {
      idComment, textComment,
    } = req.body;
    const idUser = req.res.locals;
    const checkComment = await modelSearch.getCommentById(idComment);
    if (checkComment.rows[0].id_user === idUser) {
      const doEditComment = await model.doEditComment({ idComment, textComment });
      if (doEditComment) {
        res.send('Edit Successfully');
      } else {
        res.status(400).send('Failed edit');
      }
    } else {
      res.status(401).send('Failed, permission denied');
    }
  } catch (error) {
    res.status(400).send('ada yang error');
  }
};

const deleteComment = async (req, res) => {
  try {
    const {
      idComment,
    } = req.body;
    const idUser = req.res.locals;
    const checkComment = await modelSearch.getCommentById(idComment);
    if (checkComment.rows[0]?.id_user === idUser) {
      const doDeleteComment = await model.doDeleteComment(idComment);
      if (doDeleteComment) {
        res.send('Delete Successfully');
      } else {
        res.status(400).send('Failed delete');
      }
    } else {
      res.status(401).send('Failed, permission denied');
    }
  } catch (error) {
    res.status(400).send('ada yang error');
  }
};

module.exports = {
  addComment, editComment, deleteComment,
};
