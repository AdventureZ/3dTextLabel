local readLabel = 0

addEvent("addLabels", true)
addEventHandler("addLabels", root, function(label) readLabel=label end)

function create3DTextLabel(text, color, x, y, z, dis, dimens, toelement)
    if not toelement or not isElement(toelement) then toelement = root end
    if not x or not tonumber(x) then x = 0 end
    if not y or not tonumber(y) then y = 0 end
    if not z or not tonumber(z) then z = 5 end

    readLabel = readLabel+1    
    
    setTimer(function() triggerClientEvent(toelement, "doCreateLabel", toelement, text, color, x, y, z, dis, dimens) end, 100, 1)
    
    return readLabel
end

function delete3DTextLabel(id, toelement)
    if not toelement or not isElement(toelement) then toelement = root end
    
    triggerClientEvent(toelement, "doRemoveLabel", toelement, id)
end

function update3DTextLabel(id, text, color, x, y, z, dist, dimens, toelement)
    if not toelement or not isElement(toelement) then toelement = root end
    
    triggerClientEvent(toelement, "doUpdateLabel", toelement, id, text, color, x, y, z, dist, dimens)
end 

function attach3DTextLabelToElement(id, element, x, y, z, dimens, toelement)
    if not toelement or not isElement(toelement) then toelement = root end
    
    triggerClientEvent(toelement, "doAttachLabel", toelement, id, element, x, y, z, dimens)
end

function detach3DTextLabel(id, toelement)
    if not toelement or not isElement(toelement) then toelement = root end
    
    triggerClientEvent(toelement, "doDetachLabel", toelement, id)
end
addEventHandler("onResourceStart", root,
    function()
        local labelz = create3DTextLabel("3D Text Label", 0xFFFF0000, 0, 0, 0, 3000, -1, root)
        local labels = create3DTextLabel("3D Text Label", 0xFFFF0000, 0, 0, 20, 3000, -1, root)
    end)
