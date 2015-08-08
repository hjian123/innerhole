function buttonOper(op)
{
    if(op === upperArrow)
    {
//        vk.bLower = !vk.bLower
//        if(!vk.bChar)vk.bChar=true;
//        //vk.getext=""
    }
    else if(op === "abc")
    {
//        if(!vk.bLower)vk.bLower=true;//不是小写改为小写
//        if(vk.bNum)vk.bNum =false;   //是数字关闭数字
//        vk.bChar = !vk.bChar
//        //vk.getext=""
    }
    else if(op === "123")
    {
//        vk.bNum = !vk.bNum
//        //vk.getext=""
    }
    else if(op === leftArrow)
    {

            var front=textEdit.editxt.slice(0,textEdit.pos-1)
            var back=textEdit.editxt.slice(textEdit.pos,textEdit.editxt.length)
            var position=textEdit.pos-1
            textEdit.editxt = (textEdit.pos===0?back:front+back)
            textEdit.pos=position

    }
    else if(op === accept || op === cancle)
    {

    }
    else if(op === space)
    {
//        if(vk.view.model[0])
//        {
//            textEdit.txtEditor.insert(textEdit.pos,vk.view.model[0])
//            //vk.getext ="";
//        }
//        else
//            textEdit.txtEditor.insert(textEdit.pos,op.toString())
    }
    else if(vk.bChar || !vk.bLower  || vk.bNum)
    {
        textEdit.txtEditor.insert(textEdit.pos,op)//.toString()
    }
    else
    {
        //vk.getext += op.toString()
    }
}

function viewOper(txt)
{
    textEdit.txtEditor.insert(textEdit.pos,txt)
    //vk.getext = ""
}
