export const uploadImage = {
    data() {
        return {
            imgPath: '',
        }
    },
    methods: {
        toGetImg() {
            // 生成文件上传的控件
            inputElement = document.createElement("input");
            inputElement.setAttribute("type", "file");
            inputElement.style.display = "none";

            if (window.addEventListener) {
                inputElement.addEventListener("change", this.uploadFile, false);
            } else {
                inputElement.attachEvent("onchange", this.uploadFile);
            }

            document.body.appendChild(inputElement);
            inputElement.click();
        },
        async uploadFile(el) {
            if (el && el.target && el.target.files && el.target.files.length > 0) {
                console.log(el);
                const file = el.target.files[0];
                console.log("文件为：", file);
                const isLt2M = file.size / 1024 / 1024 < 2;
                const size = file.size / 1024 / 1024;
                // console.log("size:", size);
                // 判断上传文件的大小
                if (!isLt2M) {
                    this.$message.error("上传头像图片大小不能超过 2MB!");
                } else if (file.type.indexOf("image") === -1) {
                    //如果不是图片格式
                    // this.$dialog.toast({ mes: '请选择图片文件' });
                    this.$message.error("请选择图片文件");
                } else {
                    let myFormData = new FormData();
                    myFormData.append("file", file);
                    console.log("formData", myFormData);
                    var result = await this.$API.uploadQImage(myFormData);
                    // console.log("上传的结果为", result.data);
                    // var url = URL.createObjectURL(file);
                    var url = result.data.filename;
                    this.imgPath = url
                    console.log("img url is", url);
                }
            }
        },
    },
}