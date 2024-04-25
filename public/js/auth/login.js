import { builtValidationElement, fetchWithToken } from "../utils.js";
import toast from "../toast.js";
import { setLoadingButton } from "../loading.js";

const loginForm = document.getElementById("login-form");

loginForm.addEventListener("submit", async function (e) {
    e.preventDefault();
    const loginFormButton = this.querySelector("#login-form-button");
    const formData = new FormData(this);

    setLoadingButton(loginFormButton, true);
    try {
        const { res, data } = await fetchWithToken(this.action, {
            method: "POST",
            body: formData,
        });
        setLoadingButton(loginFormButton, false);

        if (res.status === 422) {
            const errorElement = builtValidationElement(data.errors);
            toast.show({
                title: "Error",
                body: errorElement,
                colorClass: toast.TOAST_DANGER,
            });
        } else if (res.status === 400) {
            toast.show({
                title: "Informasi",
                body: `<span>${data.message}</span>`,
                colorClass: toast.TOAST_DANGER,
            });
        } else if (res.status === 200) {
            toast.show({
                title: "Informasi",
                body: `<span>${data.message}</span>`,
                colorClass: toast.TOAST_SUCCESS,
            });
            window.location.assign(data.redirect_to);
        } else {
            throw new Error("Unexpected response from server");
        }
    } catch (error) {
        console.error("An error occurred:", error);
        setLoadingButton(loginFormButton, false);
        // Handle other types of errors, e.g., network errors
        toast.show({
            title: "Error",
            body: "An error occurred while processing your request. Please try again later.",
            colorClass: toast.TOAST_DANGER,
        });
    }
});
