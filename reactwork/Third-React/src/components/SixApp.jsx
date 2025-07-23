import React, { useState } from 'react'
import Alert from '@mui/material/Alert';
import CheckIcon from '@mui/icons-material/Check';
import Card from '@mui/material/Card';
import CardContent from '@mui/material/CardContent';
import Typography from '@mui/material/Typography';
import TextField from '@mui/material/TextField';
import Button from '@mui/material/Button';
import List from '@mui/material/List';
import ListItem from '@mui/material/ListItem';
import ListItemAvatar from '@mui/material/ListItemAvatar';
import Avatar from '@mui/material/Avatar';
import ListItemText from '@mui/material/ListItemText';
import IconButton from '@mui/material/IconButton';
import DeleteIcon from '@mui/icons-material/Delete';
import Box from '@mui/material/Box';

const SixApp = () => {
    const [names, setNames] = useState(['제니', '리사', '로제', '지수']);
    const [irum, setIrum] = useState('');

    // 추가 버튼 이벤트
    const btnInsert = () => {
        if (irum.trim() === '') return;
        setNames(names.concat(irum)); // 배열에 이름 데이터 추가
        setIrum('');
    }

    const txtEnter = (e) => {
        if (e.key === 'Enter') {
            btnInsert();
        }
    }

    // 입력 change 이벤트
    const txtInput = (e) => {
        setIrum(e.target.value);
    }

    const dataRemove = (index) => {
        setNames(names.filter((item, i) => i !== index));
    }

    return (
        <Box sx={{ display: 'flex', justifyContent: 'center', alignItems: 'flex-start', minHeight: '100vh', background: '#f5f6fa', py: 6 }}>
            <Card sx={{ minWidth: 350, maxWidth: 400, boxShadow: 6, borderRadius: 3 }}>
                <CardContent>
                    <Alert icon={<CheckIcon fontSize="inherit" />} severity="primary" sx={{ mb: 2 }}>
                        <Typography variant="h6" fontWeight={700}>SixApp_추가/삭제 이벤트</Typography>
                    </Alert>
                    <Typography variant="subtitle1" sx={{ mb: 2, color: '#555' }}>
                        이름을 입력하고 <b>Enter</b> 또는 <b>추가</b> 버튼을 누르세요.
                    </Typography>
                    <Box sx={{ display: 'flex', gap: 1, mb: 3 }}>
                        <TextField
                            fullWidth
                            variant="outlined"
                            size="small"
                            placeholder="이름을 입력해주세요"
                            value={irum}
                            onChange={txtInput}
                            onKeyUp={txtEnter}
                        />
                        <Button
                            variant="contained"
                            color="primary"
                            onClick={btnInsert}
                            sx={{ minWidth: 80, fontWeight: 700 }}
                        >
                            추가
                        </Button>
                    </Box>
                    <Typography variant="body2" sx={{ mb: 1, color: '#888' }}>
                        <b>이름 옆 휴지통</b>을 클릭하면 삭제됩니다
                    </Typography>
                    <List sx={{ width: '100%', bgcolor: 'background.paper', borderRadius: 2, boxShadow: 1 }}>
                        {names.length === 0 && (
                            <ListItem>
                                <ListItemText primary="등록된 이름이 없습니다." sx={{ textAlign: 'center', color: '#aaa' }} />
                            </ListItem>
                        )}
                        {names.map((name, index) => (
                            <ListItem
                                key={index}
                                secondaryAction={
                                    <IconButton edge="end" aria-label="delete" onClick={() => dataRemove(index)}>
                                        <DeleteIcon />
                                    </IconButton>
                                }
                                sx={{
                                    '&:hover': { bgcolor: '#e3f2fd' },
                                    borderBottom: index !== names.length - 1 ? '1px solid #f0f0f0' : 'none',
                                    transition: 'background 0.2s'
                                }}
                            >
                                <ListItemAvatar>
                                    <Avatar sx={{ bgcolor: '#1976d2', color: '#fff', fontWeight: 700 }}>
                                        {name[0]}
                                    </Avatar>
                                </ListItemAvatar>
                                <ListItemText primary={name} />
                            </ListItem>
                        ))}
                    </List>
                </CardContent>
            </Card>
        </Box>
    )
}

export default SixApp