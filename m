Return-Path: <linux-mips+bounces-10950-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A21AB3FFA0
	for <lists+linux-mips@lfdr.de>; Tue,  2 Sep 2025 14:13:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1C5FA2C4F40
	for <lists+linux-mips@lfdr.de>; Tue,  2 Sep 2025 12:08:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65AC832276C;
	Tue,  2 Sep 2025 11:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="V1k/TMzJ"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44939314B6C
	for <linux-mips@vger.kernel.org>; Tue,  2 Sep 2025 11:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756814390; cv=none; b=oEeQGC8A7V2Qyhq86GkpKqEaRGBJXy8AjFpjNPScsU+vzomEyeWAACBA0cq/bupcrZdOz/xNV9laeDuUzYnKzj01sgSfmqd1KmxqRx3pvrq+QmWT9tpTmXx2/4fFfrAGbFVMgySgEy5lk+ys0CjXdZpeYBAnBKfnmFAXF/mI+kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756814390; c=relaxed/simple;
	bh=TDxN/uH8qTcnKwV5wkk294D5MKsLXAiZ97ovdM0wb3o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RD/cZOjeXqgplfFDUzaiu6yyq36WY1I4MmqVIjJ5SoN9W3QIda10TWjjWfHHII0W+yJ9TvAcu+/hL56F5c3COWpZOBDLCuWm8bt8YQKhNw1IRJH8UF9Or7Sr2Tn9mrBc2y+7gb4SQMaRE3o0Wdk2m7dgIfnYu9/bbijWIBAMt9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=V1k/TMzJ; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-45b8b25296fso15504855e9.2
        for <linux-mips@vger.kernel.org>; Tue, 02 Sep 2025 04:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756814381; x=1757419181; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d/xhHenXAsMplf3u6s5pmBuHZgaTHex9nceZrFvuNAk=;
        b=V1k/TMzJ5l939gOWFeKDNdmkUUEh618t+ftH0f88uQM2wXCbagvdPHrnHlBZ9li1dN
         6LQgkzePJeb0sZ5yVJCNWV9B4Zg9JKZRG6aqZjo3xfGRq0KQ/i+1d8DaeZfQTzHY5HPe
         5RfDKE6MEuKiVKkz50i291GFBLBAgoVGEHJtem5m/N/hEBAim45QodjzvN5AIO4fhYVr
         GCf0D3QGAgCeXsrTiEUHtdJcHUE/An6tp+8yBP9rl2UOuKSfgPutQdSBkxYcyZrF2/dE
         hE8pNHwlTAGsw3p7oYRUig0ehdXZbLh2j4FdTUXju7W9e5GPFJeYg5w1GHJPHZyLzAe1
         vgiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756814381; x=1757419181;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d/xhHenXAsMplf3u6s5pmBuHZgaTHex9nceZrFvuNAk=;
        b=nf+b1hBRdSO/+uc5steXonhL1DaPY8yKjjbI1RL2ZcT7FsAoPIJJ87H9TRZAiXRQwX
         nk1AkZdEzDR5j2rSHBu34N7GN/V4P/8uSok7N1+x0NE0uxU1GXjHSgiPWTvJ2XJyP0h2
         tAXCdgMJgf5X8KYrfB2Dz6Sr0biWu2+gJ0Yr+NS/L1+BVmG40a9i4boJicn3rp3hz7gR
         k8JT8UhRDzag4gh1ryFbbA8qVLmpWaJBX7Piz/gzsafGy6WgDUL7gEjeeOT+7hCg8Wh7
         6CpYWZDzd9YOZB66PZgqPwJIOn6bTp8P3YMlRu/oIwfj9Sub6nMSGbqDYYt+JYzLZ+BR
         85bQ==
X-Forwarded-Encrypted: i=1; AJvYcCXlMOiGpgluNWWWA2x5jJbQ4QrM+yG2zPlu5o5rhM9Hcstqc2MWQZJbtOgjcz/U1ChUIesSiEx6gTUI@vger.kernel.org
X-Gm-Message-State: AOJu0YzPiwfMd8Vv2Y50MzlTrSE/NW3gkgdqmjUeNqyphYVt1WsykmsY
	5UNU4aX2sBP+LpG2uBrH1jAiTr66VTgaTOdirXs96A85ygCv9hrKBcC6YblejZyrHpc=
X-Gm-Gg: ASbGncss1zvNBNH80eijZFAsdTXs+p8qDvzxaQyZYRx4FEiBN/6RdW4XNwUHU7R1TKB
	VUeMLSWBIOzq2Jl9yRHCqqxWu209ftejkeZw6ec4/kzxi9wBNK2S3Jl7OLWd9XXV2j3/sI5oQLk
	xqeJYQWR5KLMiydzdC9KD+YBbgRL3hLZJGlRacD5mQGos7AHHHF7+t7ZdwgQ83A5fd5q/tl1pbD
	/9x21+JR3YIonbn1wo1KtkGMTAnRdJLqDYlf/2wd2pU1L8Vux24ucwlBrlt3TTUTrx7EHunG9oQ
	QiUQFX7bS8O4KoT9y71NtKEZDwR+Lg2vXvojSw4+SpfzHF6gqksS/mUoj4ZLfP1cZC7jAF62D34
	9CN2dlHKRzv39DFQg
X-Google-Smtp-Source: AGHT+IFFcOpY3Utnvjf65Nu64vvFfevq/JcfMRRsoKc8OiO51qRcKypbCk0ggH7PazTdXylK2/FTOg==
X-Received: by 2002:a05:600c:138c:b0:45b:75f0:2d66 with SMTP id 5b1f17b1804b1-45b8553da82mr85386745e9.4.1756814380994;
        Tue, 02 Sep 2025 04:59:40 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:3327:447f:34e9:44f7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b9c234b24sm10224195e9.16.2025.09.02.04.59.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 04:59:40 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 02 Sep 2025 13:59:22 +0200
Subject: [PATCH v7 13/16] pinctrl: allow to mark pin functions as
 requestable GPIOs
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250902-pinctrl-gpio-pinfuncs-v7-13-bb091daedc52@linaro.org>
References: <20250902-pinctrl-gpio-pinfuncs-v7-0-bb091daedc52@linaro.org>
In-Reply-To: <20250902-pinctrl-gpio-pinfuncs-v7-0-bb091daedc52@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Alexey Klimov <alexey.klimov@linaro.org>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Paul Cercueil <paul@crapouillou.net>, Kees Cook <kees@kernel.org>, 
 Andy Shevchenko <andy@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@redhat.com>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
 Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
 Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 NXP S32 Linux Team <s32@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Tony Lindgren <tony@atomide.com>, 
 Haojian Zhuang <haojian.zhuang@linaro.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Mark Brown <broonie@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
 linux-hardening@vger.kernel.org, linux-mm@kvack.org, imx@lists.linux.dev, 
 linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7303;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=Ad/7ZtxydbTdpBCeQAT3xe1dzmeABB/N+TQC4QQw00Q=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBottwUnI9ibVpJgIM2CXH34HKUqefNgJQqX111f
 6azmjUqEayJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaLbcFAAKCRARpy6gFHHX
 crI8EACxskT9dEpW5d6LUzgdawqMjxZwRmZyQMOCyV0IKvpVcaQ2Vv3Wr5Hht023kdnijctKCXS
 Ido3+4GIv8wSJdTZQ56I4KxofnDG2vyYeZPNpDoyiWLkH+yc6UQndbBmcs9JBrl+IY9DsH9KGE/
 I4eJI4ZEh7eJ8j56ofq+2BznQPdh9ksHXna1EzYROBLe+wzox6SnIpbHRCCYjjI4DqrN2w0Lsv4
 4LBel3uvwjLe/5Ye+Ku/OgrfFEs6SAN+1X51mLsUeCYW+41xXi4lXCOEUoxR5tWmdb7AswqeTan
 nZ/IaxxY4w2AiOPIGeq4RWgY0Ge5XCUYgxwKgj5SrSjWQ4cmuxOJtznbOquptEloM+cdwFGPrhl
 +hPVaXlKG7ES6gnoBDPkNzXJkRV5YOKTrNa4YXr623pJEa9WEywx9eeg19elGZ/gMFu0SZhm9ur
 8s6tHh7+0t1aqqLPm1w4pdFaLTigqMH3LYRExCoJs5YdGheFHXQ93HqhY2XswD7fr8MfhKExZ97
 /3cj20QdCk2vkJvJlzaItZ2Dy6RNKHd70azroEtYTGiKkMQZ5RX8H+I8Y8YuHHiVkMKHWEncfSu
 V22BPreBipqjNwOdGxc/fGEFSh+Dt9CpW55mvqzwcer+/Fo2Asl9/9tEusw0oLjMWt9BXfiibGC
 QB1qcz+eP8lWwfQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The name of the pin function has no real meaning to pinctrl core and is
there only for human readability of device properties. Some pins are
muxed as GPIOs but for "strict" pinmuxers it's impossible to request
them as GPIOs if they're bound to a devide - even if their function name
explicitly says "gpio". Add a new field to struct pinfunction that
allows to pass additional flags to pinctrl core. While we could go with
a boolean "is_gpio" field, a flags field is more future-proof.

If the PINFUNCTION_FLAG_GPIO is set for a given function, the pin muxed
to it can be requested as GPIO even on strict pin controllers. Add a new
callback to struct pinmux_ops - function_is_gpio() - that allows pinmux
core to inspect a function and see if it's a GPIO one. Provide a generic
implementation of this callback.

Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/pinmux.c        | 46 ++++++++++++++++++++++++++++++++++++++---
 drivers/pinctrl/pinmux.h        |  3 +++
 include/linux/pinctrl/pinctrl.h | 14 +++++++++++++
 include/linux/pinctrl/pinmux.h  |  2 ++
 4 files changed, 62 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/pinmux.c b/drivers/pinctrl/pinmux.c
index 07ec93f09334f8ba8f8cbde4c54fd6a894025ae6..3a8dd184ba3d670e01a890427e19af59b65eb813 100644
--- a/drivers/pinctrl/pinmux.c
+++ b/drivers/pinctrl/pinmux.c
@@ -89,13 +89,20 @@ bool pinmux_can_be_used_for_gpio(struct pinctrl_dev *pctldev, unsigned int pin)
 {
 	struct pin_desc *desc = pin_desc_get(pctldev, pin);
 	const struct pinmux_ops *ops = pctldev->desc->pmxops;
+	const struct pinctrl_setting_mux *mux_setting;
+	bool func_is_gpio = false;
 
 	/* Can't inspect pin, assume it can be used */
 	if (!desc || !ops)
 		return true;
 
+	mux_setting = desc->mux_setting;
+
 	guard(mutex)(&desc->mux_lock);
-	if (ops->strict && desc->mux_usecount)
+	if (mux_setting && ops->function_is_gpio)
+		func_is_gpio = ops->function_is_gpio(pctldev, mux_setting->func);
+
+	if (ops->strict && desc->mux_usecount && !func_is_gpio)
 		return false;
 
 	return !(ops->strict && !!desc->gpio_owner);
@@ -116,7 +123,9 @@ static int pin_request(struct pinctrl_dev *pctldev,
 {
 	struct pin_desc *desc;
 	const struct pinmux_ops *ops = pctldev->desc->pmxops;
+	const struct pinctrl_setting_mux *mux_setting;
 	int status = -EINVAL;
+	bool gpio_ok = false;
 
 	desc = pin_desc_get(pctldev, pin);
 	if (desc == NULL) {
@@ -126,11 +135,21 @@ static int pin_request(struct pinctrl_dev *pctldev,
 		goto out;
 	}
 
+	mux_setting = desc->mux_setting;
+
 	dev_dbg(pctldev->dev, "request pin %d (%s) for %s\n",
 		pin, desc->name, owner);
 
 	scoped_guard(mutex, &desc->mux_lock) {
-		if ((!gpio_range || ops->strict) &&
+		if (mux_setting) {
+			if (ops->function_is_gpio)
+				gpio_ok = ops->function_is_gpio(pctldev,
+								mux_setting->func);
+		} else {
+			gpio_ok = true;
+		}
+
+		if ((!gpio_range || ops->strict) && !gpio_ok &&
 		    desc->mux_usecount && strcmp(desc->mux_owner, owner)) {
 			dev_err(pctldev->dev,
 				"pin %s already requested by %s; cannot claim for %s\n",
@@ -138,7 +157,7 @@ static int pin_request(struct pinctrl_dev *pctldev,
 			goto out;
 		}
 
-		if ((gpio_range || ops->strict) && desc->gpio_owner) {
+		if ((gpio_range || ops->strict) && !gpio_ok && desc->gpio_owner) {
 			dev_err(pctldev->dev,
 				"pin %s already requested by %s; cannot claim for %s\n",
 				desc->name, desc->gpio_owner, owner);
@@ -861,6 +880,27 @@ pinmux_generic_get_function(struct pinctrl_dev *pctldev, unsigned int selector)
 }
 EXPORT_SYMBOL_GPL(pinmux_generic_get_function);
 
+/**
+ * pinmux_generic_function_is_gpio() - returns true if given function is a GPIO
+ * @pctldev: pin controller device
+ * @selector: function number
+ *
+ * Returns:
+ * True if given function is a GPIO, false otherwise.
+ */
+bool pinmux_generic_function_is_gpio(struct pinctrl_dev *pctldev,
+				     unsigned int selector)
+{
+	struct function_desc *function;
+
+	function = radix_tree_lookup(&pctldev->pin_function_tree, selector);
+	if (!function)
+		return false;
+
+	return function->func->flags & PINFUNCTION_FLAG_GPIO;
+}
+EXPORT_SYMBOL_GPL(pinmux_generic_function_is_gpio);
+
 /**
  * pinmux_generic_add_function() - adds a function group
  * @pctldev: pin controller device
diff --git a/drivers/pinctrl/pinmux.h b/drivers/pinctrl/pinmux.h
index 653684290666d78fd725febb5f8bc987b66a1afb..4e826c1a5246cf8b1ac814c8c0df24c4e036edd2 100644
--- a/drivers/pinctrl/pinmux.h
+++ b/drivers/pinctrl/pinmux.h
@@ -169,6 +169,9 @@ int pinmux_generic_remove_function(struct pinctrl_dev *pctldev,
 
 void pinmux_generic_free_functions(struct pinctrl_dev *pctldev);
 
+bool pinmux_generic_function_is_gpio(struct pinctrl_dev *pctldev,
+				     unsigned int selector);
+
 #else
 
 static inline void pinmux_generic_free_functions(struct pinctrl_dev *pctldev)
diff --git a/include/linux/pinctrl/pinctrl.h b/include/linux/pinctrl/pinctrl.h
index d138e18156452e008f24ca06358fcab45135632f..1a8084e2940537f8f0862761d3e47c56c8783193 100644
--- a/include/linux/pinctrl/pinctrl.h
+++ b/include/linux/pinctrl/pinctrl.h
@@ -11,6 +11,7 @@
 #ifndef __LINUX_PINCTRL_PINCTRL_H
 #define __LINUX_PINCTRL_PINCTRL_H
 
+#include <linux/bits.h>
 #include <linux/types.h>
 
 struct device;
@@ -206,16 +207,20 @@ extern int pinctrl_get_group_pins(struct pinctrl_dev *pctldev,
 				  const char *pin_group, const unsigned int **pins,
 				  unsigned int *num_pins);
 
+#define PINFUNCTION_FLAG_GPIO	BIT(0)
+
 /**
  * struct pinfunction - Description about a function
  * @name: Name of the function
  * @groups: An array of groups for this function
  * @ngroups: Number of groups in @groups
+ * @flags: Additional pin function flags
  */
 struct pinfunction {
 	const char *name;
 	const char * const *groups;
 	size_t ngroups;
+	unsigned long flags;
 };
 
 /* Convenience macro to define a single named pinfunction */
@@ -226,6 +231,15 @@ struct pinfunction {
 		.ngroups = (_ngroups),			\
 	}
 
+/* Same as PINCTRL_PINFUNCTION() but for the GPIO category of functions */
+#define PINCTRL_GPIO_PINFUNCTION(_name, _groups, _ngroups)	\
+(struct pinfunction) {						\
+		.name = (_name),				\
+		.groups = (_groups),				\
+		.ngroups = (_ngroups),				\
+		.flags = PINFUNCTION_FLAG_GPIO,			\
+	}
+
 #if IS_ENABLED(CONFIG_OF) && IS_ENABLED(CONFIG_PINCTRL)
 extern struct pinctrl_dev *of_pinctrl_get(struct device_node *np);
 #else
diff --git a/include/linux/pinctrl/pinmux.h b/include/linux/pinctrl/pinmux.h
index d6f7b58d6ad0cce421aad80463529c9ccc65d68e..6db6c3e1ccc2249d4b4204e6fc19bf7b4397cc81 100644
--- a/include/linux/pinctrl/pinmux.h
+++ b/include/linux/pinctrl/pinmux.h
@@ -66,6 +66,8 @@ struct pinmux_ops {
 				    unsigned int selector,
 				    const char * const **groups,
 				    unsigned int *num_groups);
+	bool (*function_is_gpio) (struct pinctrl_dev *pctldev,
+				  unsigned int selector);
 	int (*set_mux) (struct pinctrl_dev *pctldev, unsigned int func_selector,
 			unsigned int group_selector);
 	int (*gpio_request_enable) (struct pinctrl_dev *pctldev,

-- 
2.48.1


