/**
 * Asymm Systems - Form Validation Utility
 * Handles complex constraints like checkbox limits and mandatory field checks.
 */

document.addEventListener('DOMContentLoaded', () => {
    // 1. Checkbox Group Constraints (e.g., "Select up to 3")
    const checkboxGroups = document.querySelectorAll('.checkbox-group');

    checkboxGroups.forEach(group => {
        const max = parseInt(group.dataset.max) || Infinity;
        const checkboxes = group.querySelectorAll('input[type="checkbox"]');
        const otherCheckbox = group.querySelector('input[value="Other"]');
        const otherText = group.querySelector('.other-text');

        // Handle Max Selection Limit
        const updateCheckboxes = () => {
            const checkedCount = group.querySelectorAll('input[type="checkbox"]:checked').length;
            checkboxes.forEach(cb => {
                if (!cb.checked) {
                    cb.disabled = checkedCount >= max;
                    cb.parentElement.style.opacity = checkedCount >= max ? '0.5' : '1';
                    cb.parentElement.style.cursor = checkedCount >= max ? 'not-allowed' : 'pointer';
                }
            });
        };

        // Handle "Other" Visibility
        const updateOtherVisibility = () => {
            if (otherCheckbox && otherText) {
                const isVisible = otherCheckbox.checked;
                otherText.style.display = isVisible ? 'block' : 'none';
                if (isVisible) otherText.focus();
            }
        };

        checkboxes.forEach(cb => {
            cb.addEventListener('change', () => {
                updateCheckboxes();
                updateOtherVisibility();
            });
        });

        // Initial state
        updateCheckboxes();
        updateOtherVisibility();
    });

    // 2. Select "Other" Visibility (for single selects)
    const selectControls = document.querySelectorAll('select.form-control');
    selectControls.forEach(select => {
        const otherText = select.parentElement.querySelector('.other-text');
        if (otherText) {
            select.addEventListener('change', () => {
                otherText.style.display = select.value === 'Other' ? 'block' : 'none';
                if (select.value === 'Other') otherText.focus();
            });
        }
    });
});

/**
 * Validates a form before AJAX submission.
 * @param {HTMLFormElement} form 
 * @returns {boolean}
 */
window.validateAsymmForm = function (form) {
    // a) Native HTML5 Validity
    if (!form.checkValidity()) {
        form.reportValidity();
        return false;
    }

    // b) Custom Checkbox Group "Required" Check
    // If a checkbox group is in a required section or has a label with .required,
    // we should ensure at least one is checked.
    const requiredGroups = form.querySelectorAll('.form-group:has(.required) .checkbox-group');
    for (const group of requiredGroups) {
        if (group.querySelectorAll('input[type="checkbox"]:checked').length === 0) {
            alert("Please select at least one option in the required sections.");
            group.scrollIntoView({ behavior: 'smooth', block: 'center' });
            return false;
        }
    }

    return true;
};
