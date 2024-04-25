export const fetchWithToken = (url, options = {}) => {
    return new Promise(async (resolve, reject) => {
        let res, data;
        try {
            // Membuat permintaan fetch dengan menggabungkan opsi dan menambahkan header CSRF
            res = await fetch(url, {
                ...options,
                headers: {
                    ...options.headers,
                    "X-CSRF-TOKEN": document
                        .querySelector('meta[name="csrf-token"]')
                        .getAttribute("content"),
                },
            });

            // Memeriksa apakah respons memiliki status sukses (status 200-299)
            if (!res.ok) {
                // Jika respons tidak berhasil, kirim respons ke catch
                throw new Error(`Server responded with error: ${res.status} ${res.statusText}`);
            }

            // Parsing data JSON dari respons
            data = await res.json();
            // Menyelesaikan Promise dengan respons dan data yang diperoleh
            resolve({ res, data });
        } catch (error) {
            // Menangani kesalahan
            reject({
                message: "Error occurred while fetching data:",
                url,
                options,
                error: error.message // Menyertakan pesan kesalahan yang terperinci
            });
        }
    });
};


export const builtValidationElement = (errors) => {
    const keyOfErrors = Object.getOwnPropertyNames(errors);
    return keyOfErrors
        .map((key) => `<li class="d-block">${errors[key][0]}</li>`)
        .join("");
};

export const toFormurlenconded = (data) => {
    let formBody = [];
    for (var property in data) {
        var encodedKey = encodeURIComponent(property);
        var encodedValue = encodeURIComponent(data[property]);
        formBody.push(encodedKey + "=" + encodedValue);
    }
    return formBody.join("&");
};
