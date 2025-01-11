if not PropaneTorchAndTankFix then PropaneTorchAndTankFix = {} end

function PropaneTorchAndTankFix.UpdateProperty(itemType, propertyName, propertyValue)
    local item = ScriptManager.instance:getItem(itemType);

    if item ~= nil then
        item:DoParam(propertyName.." = "..propertyValue);
    end
end

function PropaneTorchAndTankFix.OnGameBoot()
    PropaneTorchAndTankFix.UpdateProperty("Base.BlowTorch", "UseDelta", "0.01");
    PropaneTorchAndTankFix.UpdateProperty("Base.PropaneTank", "UseDelta", "0.0125");

    if getActivatedMods():contains("TheWorkshop") then
        PropaneTorchAndTankFix.UpdateProperty("TW.LargePropaneTank", "UseDelta", "0.0125");
        PropaneTorchAndTankFix.UpdateProperty("TW.HugePropaneTank", "UseDelta", "0.00125");
    end
end

Events.OnGameBoot.Add(PropaneTorchAndTankFix.OnGameBoot)
