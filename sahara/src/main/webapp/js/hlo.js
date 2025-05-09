// Get modal element
const modal = document.getElementById("loginModal");
// Get open modal button
const openModalBtn = document.getElementById("openModal");
// Get close button
const closeModalBtn = document.getElementById("closeModal");

// Open modal on button click
openModalBtn.onclick = function() {
    modal.style.display = "flex";
}

// Close modal when 'x' is clicked
closeModalBtn.onclick = function() {
    modal.style.display = "none";
}

// Close modal if outside click
window.onclick = function(event) {
    if (event.target === modal) {
        modal.style.display = "none";
    }
}
