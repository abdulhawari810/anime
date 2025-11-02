import jwt from 'jsonwebtoken'

export const verifyToken = async (req, res, next) => {
    const authHeader = req.headers['authorization'];
    const token = authHeader && authHeader.split(' ')[1];
    let error = [];
    if(!token)
    {
        error.push('Token tidak valid')
    }

    if(error.length > 0) return res.status(403).json({error})

    try {
        const decoded = jwt.verify(token, process.env.JWT_SECRET);

        req.user = decoded;

        next();
    } catch (error) {
        return res.status(403).json({ message: 'Token tidak valid atau sudah kadaluarsa!' });
    }
}


export const verifyAdmin = async(req, res, next) => {

  if(req.user.role !== 'admin')
    {
       return res.status(403).json({
            error: 'Akses ditolak, hanya admin yang boleh akses halaman ini!!'
        });
    }
    
    next()
}