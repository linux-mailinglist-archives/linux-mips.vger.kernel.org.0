Return-Path: <linux-mips+bounces-9907-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0E76B1060C
	for <lists+linux-mips@lfdr.de>; Thu, 24 Jul 2025 11:27:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C650E3BDC66
	for <lists+linux-mips@lfdr.de>; Thu, 24 Jul 2025 09:26:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5251D26A1A3;
	Thu, 24 Jul 2025 09:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ibiXC+0T"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0361C283FC3
	for <linux-mips@vger.kernel.org>; Thu, 24 Jul 2025 09:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753349104; cv=none; b=UO2gWuCPteAGBuhSpZg3AM6QRNchy2UDRZNeXPkwtlYgjBJ5BwDr+kGEQGkk4+KED9uGnYe/O7hp1b5oJSrcVSBNcw/PEO0VGQK2cl0sIhMiy2LhYif1XW7JgYaUN6qXumdNYMCgoJxSECKuO+44CKUj87UiJ0ZKl7cPjToZ5zY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753349104; c=relaxed/simple;
	bh=DO00Ils0PNbfp2/iTgw3UaaSPsoLw3lP/8/WxATgwBQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aPJ6b9Qqno7BBZgE/Hqlxhy1swVicrGQ1H6pGyJJ7JvtBo4NhUUVwjYkfNH7CPm9NYFF/v46utojAOs8kMMT3sbjOVDemoE6moH5TXvy9gEXBGqGq95ZyZVZeENdVGiNwBDKrQ+8wdCNl7jn5DjUwfi5dgNnRoY9kzb+xz0Jjb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=ibiXC+0T; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3a510432236so552432f8f.0
        for <linux-mips@vger.kernel.org>; Thu, 24 Jul 2025 02:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1753349098; x=1753953898; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q5Et21tlNKz8QCzLOQeaVbz2wkUry/HGWm7xpHNYV/E=;
        b=ibiXC+0TvtwwKiwy5Ym1Pe/MUtXYsqlnCZUFVakGfyaFJWMj9Z94xeFBMQkBJOIhHx
         frrjPKiT0uLMB9ZhKr8vxY1c8b+8S85pFYCYyPUt2zw/I5FnapTp7yI7rnLd0X+Fpy1m
         G1D8BFdFgxuleW9XoIvsde2edd9iw4mZTv/RHeQbdJiaBYiwIiCBDLpW4rgyZ+zExzAl
         mi1/mXWEPfEj4m42LHKoGCVDTdBklnRGjkanvk36E+3MkY7TkrBRWD0EvHYM8xn9qiMB
         ZPvY0WWuuQcQ453Ybg7CwlTsaTp4VyI5GjLQSO7p1X9dxGLMjE55qDyIztfrKHaR/ZFo
         27Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753349098; x=1753953898;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q5Et21tlNKz8QCzLOQeaVbz2wkUry/HGWm7xpHNYV/E=;
        b=c0zvDGZR5PSf83OcQddXU1lNToupzS6JAeqYsP0BWdYVg20hRNIVvqiogwKd6hI6ew
         NlK32eQT3ypOa2ky1sf1mzxN2F2gChLYblQ9fH7rdGvWtNoXFNJmX9pmtm4MZ5beyb7V
         5BmdYXWpxpf3nWku7XSqYl2RPwiSLflLRPdA4vfLP6XKE3ttqdVPF/KFxDA/OrvuztwZ
         tLAhQ8tirzxYDLe1tqvm7W8SIIkvH+5Esy5WeMLxDpqTmAd4+Ix8UBrQjYfR7ZNWVbvh
         HthrrLsfjVXYrK8p09ocBF9aWjFfWY1/vKeRjoVXLSnlQSWLLmku1S0hWlcyOqVQ+7C8
         WdzA==
X-Forwarded-Encrypted: i=1; AJvYcCVtlepzwmCSOk05CfPSaV9uDi7Xr6CJFXxwLNqwgSmqKE0yQfdObLwvLfHIvHlA7tvQ4l5LfVxsk/5+@vger.kernel.org
X-Gm-Message-State: AOJu0YwaQsLOKEMJ/1ZFLOCsAm1rbbOoghELJFTHbOrBOafviFDBqYbK
	0gIrPh/zdQfSAreHxF1TR9qLY0KTN7UoSg0ETtah2WW710DGM1EvP39Q/tDWLU64LH8=
X-Gm-Gg: ASbGncuQzAPx3u7IfAEeT3Nt0+Yl1+HikgvqmClTnklobLn7CGzS32WmhDCgCzmJn7+
	V0bScO5oXr7ka7ieNFOLMZxH6gvYjGjS0Ru0HGvvtUma4gDB0lJSwTN3SFEVxqzEyDfROTIBTIk
	W/ZRJjraarK0d2xcU5wqkI1c5X5Y4UGgzrqG7kVW9X5U7J2VCk3nes4dsIGmCaGhpw6os2UDrmv
	WgKgjk/Rry1N0L871H9SdYgQumdVazhe1qpPYeC8Mhzvy04MWR9D+/k7m0eKHxpHNG1nN10XcUL
	M8NZe8vtt68ApWns8WYDBghDnXFDES3/Y01x1xv/XkKjh2ELznAK5qfQlKdF7x65GSsMgE4ZHzn
	sr9zWzNEIoNW7BKI/bq9Ayw2jwjU=
X-Google-Smtp-Source: AGHT+IHK9ym35s7NHF150oDopl7CdxsijIcKei5Gs6AFRhmReJ4MEWnZ4kKTub7TlD3dR6aW1McU3g==
X-Received: by 2002:a5d:5f83:0:b0:3b7:649a:6a7b with SMTP id ffacd0b85a97d-3b768f27067mr5266406f8f.49.1753349098181;
        Thu, 24 Jul 2025 02:24:58 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:f44c:20db:7ada:b556])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b76fc72548sm1600833f8f.30.2025.07.24.02.24.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 02:24:57 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 24 Jul 2025 11:24:40 +0200
Subject: [PATCH v3 12/15] pinctrl: allow to mark pin functions as
 requestable GPIOs
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250724-pinctrl-gpio-pinfuncs-v3-12-af4db9302de4@linaro.org>
References: <20250724-pinctrl-gpio-pinfuncs-v3-0-af4db9302de4@linaro.org>
In-Reply-To: <20250724-pinctrl-gpio-pinfuncs-v3-0-af4db9302de4@linaro.org>
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
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
 linux-hardening@vger.kernel.org, linux-mm@kvack.org, imx@lists.linux.dev, 
 linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6779;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=xKvZSJeqL1YS+RHLa6ZJ9ocJVsZVH7/NUKTdgRxyg9w=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBogfvUEkzW0EQIuejJliJGAXd3b4hhn0Y90AKiK
 aMxE033XniJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaIH71AAKCRARpy6gFHHX
 ctZcD/9/win0ZTkZvv3o5OiADBgTXuQ9ZWagTSXWjrtJX4ta/fmW0osfTxhRQh8DQUeD40zNykY
 ZlumO0Lhv4nMQ5KVmmjzNYUHlhhmaZAslGLbjXMr57XHuqjwh1bzDimxv/YcU+CqFz/EUxDJDBT
 OWT1O88kRCz3ozoMKIiXSfkrtky+GT4VOOK4vasxtmqzfjVoVR2SgJUNZszPdM0wJaYtrY/iX5o
 zpbRdv7eUBksHcBgJS8pS6pIVPkhTVnCYo15H0Ed1VojOsGENvvstFyBNCp01nqZNxnB6w0bsbQ
 W+4cVp6T0bCpksTxYPu3J7hfyFYQ56QQ76Ezatfv4Azt+x/1x7PEZ5I7gRXvFpJYw+YGV+e3LAs
 JZzjN7zQXWD1NhFDFInObmVDoraBCp/ya0qXNqH3qrlm2HbobuvQAFFYt8cCP5aIZXKgBX+MQN/
 t4dR5V7zTs4YukzUhSXpYxR9B+sD4Ui3aQ/GrXLm+r3u0Zu9KamRs64j/7VHFbD5MDMeB2m+q24
 TRG9TOQ5nydi4Yajwig9MqOEPQ8ss4zaUfOm1ObHbWSRIVTQVlrzKIBoVGyLzQA2c4GwDd02eTd
 E13s+/MXe+gZmBCllLp3OCEpGtPQlsgrWqYuTFY4QYPRiq7jYWdxF60a/QnO9caJyCVH8nsniom
 GbDpdUV96wJsDTw==
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

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/pinmux.c        | 36 ++++++++++++++++++++++++++++++++++--
 drivers/pinctrl/pinmux.h        |  3 +++
 include/linux/pinctrl/pinctrl.h | 14 ++++++++++++++
 include/linux/pinctrl/pinmux.h  |  2 ++
 4 files changed, 53 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinmux.c b/drivers/pinctrl/pinmux.c
index 504dbb3e97cf334e39b49121137c6768081fcd40..52623b47cc87b49b649610eabfa547d7543292dd 100644
--- a/drivers/pinctrl/pinmux.c
+++ b/drivers/pinctrl/pinmux.c
@@ -89,13 +89,19 @@ bool pinmux_can_be_used_for_gpio(struct pinctrl_dev *pctldev, unsigned int pin)
 {
 	struct pin_desc *desc = pin_desc_get(pctldev, pin);
 	const struct pinmux_ops *ops = pctldev->desc->pmxops;
+	const struct pinctrl_setting_mux *mux_setting = desc->mux_setting;
+	bool func_is_gpio = false;
 
 	/* Can't inspect pin, assume it can be used */
 	if (!desc || !ops)
 		return true;
 
 	guard(mutex)(&desc->mux_lock);
-	if (ops->strict && desc->mux_usecount)
+	if (ops->function_is_gpio && mux_setting)
+		func_is_gpio = ops->function_is_gpio(pctldev,
+						     mux_setting->func);
+
+	if (ops->strict && desc->mux_usecount && !func_is_gpio)
 		return false;
 
 	return !(ops->strict && !!desc->gpio_owner);
@@ -116,7 +122,9 @@ static int pin_request(struct pinctrl_dev *pctldev,
 {
 	struct pin_desc *desc;
 	const struct pinmux_ops *ops = pctldev->desc->pmxops;
+	const struct pinctrl_setting_mux *mux_setting;
 	int status = -EINVAL;
+	bool func_is_gpio = false;
 
 	desc = pin_desc_get(pctldev, pin);
 	if (desc == NULL) {
@@ -126,11 +134,16 @@ static int pin_request(struct pinctrl_dev *pctldev,
 		goto out;
 	}
 
+	mux_setting = desc->mux_setting;
+
 	dev_dbg(pctldev->dev, "request pin %d (%s) for %s\n",
 		pin, desc->name, owner);
 
 	scoped_guard(mutex, &desc->mux_lock) {
-		if ((!gpio_range || ops->strict) &&
+		if (ops->function_is_gpio && mux_setting)
+			func_is_gpio = ops->function_is_gpio(pctldev,
+							     mux_setting->func);
+		if ((!gpio_range || ops->strict) && !func_is_gpio &&
 		    desc->mux_usecount && strcmp(desc->mux_owner, owner)) {
 			dev_err(pctldev->dev,
 				"pin %s already requested by %s; cannot claim for %s\n",
@@ -861,6 +874,25 @@ pinmux_generic_get_function(struct pinctrl_dev *pctldev, unsigned int selector)
 }
 EXPORT_SYMBOL_GPL(pinmux_generic_get_function);
 
+/**
+ * pinmux_generic_function_is_gpio() - returns true if given function is a GPIO
+ * @pctldev: pin controller device
+ * @selector: function number
+ */
+bool pinmux_generic_function_is_gpio(struct pinctrl_dev *pctldev,
+				     unsigned int selector)
+{
+	struct function_desc *function;
+
+	function = radix_tree_lookup(&pctldev->pin_function_tree,
+				     selector);
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


