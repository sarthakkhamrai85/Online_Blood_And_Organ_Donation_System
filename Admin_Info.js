//Validation
function validate(e) {
    if (e.which < 48 || e.which > 57) {
        e.preventDefault();
    }
}