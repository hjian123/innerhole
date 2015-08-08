function eventOper(event,mod)
{
    if(vk.bChar)
    {
        switch(event)
        {
            case Qt.Key_Q:textEdit.txtEditor.insert(textEdit.pos,vk.bLower?"q":"Q");break;
            case Qt.Key_W:textEdit.txtEditor.insert(textEdit.pos,vk.bLower?"w":"W");break;
            case Qt.Key_E:textEdit.txtEditor.insert(textEdit.pos,vk.bLower?"e":"E");break;
            case Qt.Key_R:textEdit.txtEditor.insert(textEdit.pos,vk.bLower?"r":"R");break;
            case Qt.Key_T:textEdit.txtEditor.insert(textEdit.pos,vk.bLower?"t":"T");break;
            case Qt.Key_Y:textEdit.txtEditor.insert(textEdit.pos,vk.bLower?"y":"Y");break;
            case Qt.Key_U:textEdit.txtEditor.insert(textEdit.pos,vk.bLower?"u":"U");break;
            case Qt.Key_I:textEdit.txtEditor.insert(textEdit.pos,vk.bLower?"i":"I");break;
            case Qt.Key_O:textEdit.txtEditor.insert(textEdit.pos,vk.bLower?"o":"O");break;
            case Qt.Key_P:textEdit.txtEditor.insert(textEdit.pos,vk.bLower?"p":"P");break;
            case Qt.Key_A:textEdit.txtEditor.insert(textEdit.pos,vk.bLower?"a":"A");break;
            case Qt.Key_S:textEdit.txtEditor.insert(textEdit.pos,vk.bLower?"s":"S");break;
            case Qt.Key_D:textEdit.txtEditor.insert(textEdit.pos,vk.bLower?"d":"D");break;
            case Qt.Key_F:textEdit.txtEditor.insert(textEdit.pos,vk.bLower?"f":"F");break;
            case Qt.Key_G:textEdit.txtEditor.insert(textEdit.pos,vk.bLower?"g":"G");break;
            case Qt.Key_H:textEdit.txtEditor.insert(textEdit.pos,vk.bLower?"h":"H");break;
            case Qt.Key_J:textEdit.txtEditor.insert(textEdit.pos,vk.bLower?"j":"J");break;
            case Qt.Key_K:textEdit.txtEditor.insert(textEdit.pos,vk.bLower?"k":"K");break;
            case Qt.Key_L:textEdit.txtEditor.insert(textEdit.pos,vk.bLower?"l":"L");break;
            case Qt.Key_M:textEdit.txtEditor.insert(textEdit.pos,vk.bLower?"m":"M");break;
            case Qt.Key_N:textEdit.txtEditor.insert(textEdit.pos,vk.bLower?"n":"N");break;
            case Qt.Key_B:textEdit.txtEditor.insert(textEdit.pos,vk.bLower?"b":"B");break;
            case Qt.Key_V:textEdit.txtEditor.insert(textEdit.pos,vk.bLower?"v":"V");break;
            case Qt.Key_X:textEdit.txtEditor.insert(textEdit.pos,vk.bLower?"x":"X");break;
            case Qt.Key_Z:textEdit.txtEditor.insert(textEdit.pos,vk.bLower?"z":"Z");break;
            case Qt.Key_C:textEdit.txtEditor.insert(textEdit.pos,vk.bLower?"c":"C");break;
            case Qt.Key_Backspace:
                if(vk.getext.length>0)
                    vk.getext = vk.getext.slice(0,-1);
                else
                {
                    var front=textEdit.editxt.slice(0,textEdit.pos-1)
                    var back=textEdit.editxt.slice(textEdit.pos,textEdit.editxt.length)
                    var position=textEdit.pos-1
                    textEdit.editxt = (textEdit.pos===0?back:front+back)
                    textEdit.pos=position
                }
                break;
            case Qt.Key_CapsLock:
                vk.bLower = !vk.bLower;
                if(!vk.bChar)vk.bChar=true;
                vk.getext=""
                break;
             case Qt.Key_Space:
                 textEdit.txtEditor.insert(textEdit.pos," ");break;
            default: break;
        }
    }
    else
    {
        switch(event)
        {
            case Qt.Key_Q:vk.getext += "q";break;
            case Qt.Key_W:vk.getext += "w";break;
            case Qt.Key_E:vk.getext += "e";break;
            case Qt.Key_R:vk.getext += "r";break;
            case Qt.Key_T:vk.getext += "t";break;
            case Qt.Key_Y:vk.getext += "y";break;
            case Qt.Key_U:vk.getext += "u";break;
            case Qt.Key_I:vk.getext += "i";break;
            case Qt.Key_O:vk.getext += "o";break;
            case Qt.Key_P:vk.getext += "p";break;
            case Qt.Key_A:vk.getext += "a";break;
            case Qt.Key_S:vk.getext += "s";break;
            case Qt.Key_D:vk.getext += "d";break;
            case Qt.Key_F:vk.getext += "f";break;
            case Qt.Key_G:vk.getext += "g";break;
            case Qt.Key_H:vk.getext += "h";break;
            case Qt.Key_J:vk.getext += "j";break;
            case Qt.Key_K:vk.getext += "k";break;
            case Qt.Key_L:vk.getext += "l";break;
            case Qt.Key_M:vk.getext += "m";break;
            case Qt.Key_N:vk.getext += "n";break;
            case Qt.Key_B:vk.getext += "b";break;
            case Qt.Key_Z:
                if(mod ===1)
                    textEdit.txtEditor.undo()
                else
                vk.getext += "z";
                break;
            case Qt.Key_X:
                if(mod ===1)
                    textEdit.txtEditor.cut()
                else
                vk.getext += "x";
                break;
            case Qt.Key_V:
                if(mod ===1)
                    textEdit.txtEditor.paste()
                else
                vk.getext += "v";
                break;
            case Qt.Key_C:
                if(mod ===1)
                    textEdit.txtEditor.copy()
                else
                    vk.getext += "c";
                break;
            case Qt.Key_Backspace:
                if(vk.getext.length>0)
                    vk.getext = vk.getext.slice(0,-1);
                else
                {
                    var front=textEdit.editxt.slice(0,textEdit.pos-1)
                    var back=textEdit.editxt.slice(textEdit.pos,textEdit.editxt.length)
                    var position=textEdit.pos-1
                    textEdit.editxt = (textEdit.pos===0?back:front+back)
                    textEdit.pos=position
                }
                break;
            case Qt.Key_CapsLock:
                vk.bLower = !vk.bLower;
                if(!vk.bChar)vk.bChar=true;
                vk.getext=""
                break;
            case Qt.Key_Enter:
                if(vk.getext.length>0)
                    textEdit.txtEditor.insert(textEdit.pos,vk.getext);
                vk.getext =""
                break;
            case Qt.Key_Left:
                textEdit.position = Math.max(textEdit.position -1,0)
                break;
            case Qt.Key_Right:
                textEdit.position = Math.min(textEdit.position +1,textEdit.editxt.length)
                break;
            case Qt.Key_Space:
                if(vk.view.model[0])
                {
                    textEdit.txtEditor.insert(textEdit.pos,vk.view.model[0]);
                    vk.getext="";
                }
                else
                    textEdit.txtEditor.insert(textEdit.pos," ");
                break;
            case Qt.Key_1:
                if(vk.view.model[0])
                    textEdit.txtEditor.insert(textEdit.pos,vk.view.model[0]);vk.getext="";break;
            case Qt.Key_2:
                if(vk.view.model[1])
                    textEdit.txtEditor.insert(textEdit.pos,vk.view.model[1]);vk.getext="";break;
            case Qt.Key_3:
                if(vk.view.model[2])
                    textEdit.txtEditor.insert(textEdit.pos,vk.view.model[2]);vk.getext="";break;
            case Qt.Key_4:
                if(vk.name.model[3])
                    textEdit.txtEditor.insert(textEdit.pos,vk.view.model[3]);vk.getext="";break;
            case Qt.Key_5:
                if(vk.view.model[4])
                    textEdit.txtEditor.insert(textEdit.pos,vk.view.model[4]);vk.getext="";break;
            case Qt.Key_6:
                if(vk.view.model[5])
                    textEdit.txtEditor.insert(textEdit.pos,vk.view.model[5]);vk.getext="";break;
            default: break;
        }
    }
}
