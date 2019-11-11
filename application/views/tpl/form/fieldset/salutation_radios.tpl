<div class="custom-control custom-radio custom-control-inline mt-2">
    <input class="custom-control-input" type="radio" name="[{$name}]" id="[{$name}]_MRS" value="MRS" [{if $required}]required="required"[{/if}] [{if $value|lower  == "mrs" or $value2|lower == "mrs"}]checked="checked"[{/if}]>
    <label class="custom-control-label" for="[{$name}]_MRS">[{oxmultilang ident="MRS"}]</label>
</div>
<div class="custom-control custom-radio custom-control-inline mt-2">
    <input class="custom-control-input" type="radio" name="[{$name}]" id="[{$name}]_MR" value="MR" [{if $required}]required="required"[{/if}] [{if $value|lower  == "mr" or $value2|lower == "mr"}]checked="checked"[{/if}]>
    <label class="custom-control-label" for="[{$name}]_MR">[{oxmultilang ident="MR"}]</label>
</div>