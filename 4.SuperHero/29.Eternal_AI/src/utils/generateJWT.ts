import jwt from 'jsonwebtoken';

const generateAccessToken = ({ ...args }) => {
  const payload = {
    ...args
  };
  return jwt.sign(payload, process.env.JWT_SECRET!, { expiresIn: '24h' });
};
export default generateAccessToken;
