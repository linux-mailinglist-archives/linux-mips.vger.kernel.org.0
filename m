Return-Path: <linux-mips+bounces-10752-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C98CB3A56A
	for <lists+linux-mips@lfdr.de>; Thu, 28 Aug 2025 18:03:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 516471C8511E
	for <lists+linux-mips@lfdr.de>; Thu, 28 Aug 2025 16:03:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36C2A285041;
	Thu, 28 Aug 2025 16:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="0hYwRfA5"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5CEF2749CA
	for <linux-mips@vger.kernel.org>; Thu, 28 Aug 2025 16:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756396846; cv=none; b=mr894rf5Q360/WQ8FZgfQgd7waZfDoiKVTt2p3LzWQDyom50a3JalISGdKJ8w1Hp6MNO2z6Rx67GxXwYs77hfcDi885q3IIIgfHAKUuZc90mxrd6cP+2v+51jePqtfWKtxO1Nom+YdtguPziFUSjgS2h62fzZin+B9+7TA7Axn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756396846; c=relaxed/simple;
	bh=tTP3Ivi4QdIkGfdc8vPPhHpWnLxrIJA3KzSvQ1a6ndE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jpsifsl5VNNeXPCebKJOzlE9dyWWcwKjVg8vY0RN5xYjW+L0/Ai8Fafv6d2jqZli//6cT1rcpFEfhiMFvC0AzX5c5SrgStMCf1/UXX2YPGzmZpAUlMQ7rFmaJu5ki2/mkt+znIpFBrTIzGGoj5ZnsRlv7uiLidDof/+t1rr7XFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=0hYwRfA5; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-45b618e067eso15724945e9.1
        for <linux-mips@vger.kernel.org>; Thu, 28 Aug 2025 09:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756396840; x=1757001640; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5cgLuuNEHZ/uYnDNb6dxgb48v4u6axzoTiam4WWN7C4=;
        b=0hYwRfA5B9GwQqnQ9LxaICXrzroC/XyrnAslMSREJlZrS+HywcYb1tINacTjewenk1
         3ObeSQh2ZjU7khrSB6GbxYPQh9+6XbXFkHW6meMX9qsqzqWjakj8PKoyFfmtC/yfZF5y
         0BY1WovG5qAMWSf276Y+Poqvff0xVqs3NQisIhb8tM5cpuuxQL+XTPAL/OQXT/EUtZ+2
         wfUo2W5BTXCfiRxoR/UF9cYNy1apYuZHyxCI/y79rV5DYnDRX9uSkpIwE5d9aqRLbqKb
         uEnYaWuJehjx6m8It0HNJvNjJ8YTLh2yAVBGWwbnTlP/jHBdqQr73fegNqDxGx99NyAu
         K16g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756396840; x=1757001640;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5cgLuuNEHZ/uYnDNb6dxgb48v4u6axzoTiam4WWN7C4=;
        b=VC4cM7di7r5mX/1QF6iW3AHpPXT4bk2S5TP7jB9hCTfv8+6Hl+UVRm8qWDwsn/OPfN
         XHtUvo7+38NK6AhSX2aekPLPJErpJtdpVP0NazkGViqJfA2ulKsuypYiN4DlJkkRzlE1
         UTYFaw6DKXcFVfuyyzMl+0QqXbNyotp6C0dFC515p3UySGsB6RuokBq70GhzXu13tdk1
         NfNMk1VFN4sF8sYS05HnyX0JhliHH/R7H2PW3QVZzNkbskt+tMwdfSJvDYCNLSb0zR6V
         LEvtli2Zm/yEUp2Pv1xsj2NcR9NacAQnYDu2SV/81rApNepXDAnoRWcEnH3hWSXPEfd6
         Zeww==
X-Forwarded-Encrypted: i=1; AJvYcCW/6reJIX4MvxHYfmlYWvPf/dU2aBg8Saoz9IRN9MxBvnDsEqaWrhOnyaT4ZlWRKfRqoQo6JKv4ZESl@vger.kernel.org
X-Gm-Message-State: AOJu0YxGr95Dw7I0iRlN//VbFXiQOyL9RQewXzBkAzmLgQgFpdQYfDMi
	C+bY0k4gATinzs4XbPR4pblr9uWyKA6KgqsTWg3QsJsnGAa1Llsk+1L8GGvoywIy1eQ=
X-Gm-Gg: ASbGncteI1Z+N5FOm+OmRye3uA3HzEmYzTGAu1jRAZIvzhQ/8fMNSmx99fZRkWeY/sA
	wuogjIOgu1L5F+7r4wsDasKD8VlzNipPUGlDrGy4sQsNHsp7352wjJZBbUfdjjAeu/XuPLqh63Z
	RbL+g2kZqiJSdIdx+kNwXLrlyvqbbdT5rGmC7KvY0loGgZhIPeiJnBNGjzBlQrW5qGpVEiAwbCk
	gTacJmwS6ZVZQe3DGWITp/R1NcJ+zAKnRo/1M0CAqQL8mpwBCRYnP/x1pu3Bt178g8r3/f2njDa
	i+SE/gVcVGMyXpp+wNfbPeuVjaLexx91pkDn/lO1FvaxTXXS1/H/sL5gjB9IuhdTqRDnZ6gjXNb
	ua2KWTf+2UF8fDBffcA3QJ+4KnZRU
X-Google-Smtp-Source: AGHT+IHY93xJicIhLfSdUidEzVpKHtPobrQXprg+Ck+5hE5qf9qNEqu57kxQutrcB+RtoXUB4WrEqA==
X-Received: by 2002:a05:600c:5246:b0:458:6f13:aa4a with SMTP id 5b1f17b1804b1-45b68b79262mr97078985e9.6.1756396839658;
        Thu, 28 Aug 2025 09:00:39 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4933:4d7c:cf69:9502])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b6f0c6fe5sm80211675e9.5.2025.08.28.09.00.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 09:00:39 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 28 Aug 2025 18:00:20 +0200
Subject: [PATCH v6 12/15] pinctrl: allow to mark pin functions as
 requestable GPIOs
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250828-pinctrl-gpio-pinfuncs-v6-12-c9abb6bdb689@linaro.org>
References: <20250828-pinctrl-gpio-pinfuncs-v6-0-c9abb6bdb689@linaro.org>
In-Reply-To: <20250828-pinctrl-gpio-pinfuncs-v6-0-c9abb6bdb689@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7248;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=cNbq67lYy5x2lWhqKySAtFll26hPMdSh5sE8Ox6iL2Q=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBosH0PNGB6avixd0d4STpVF8wM5h87O2Lo5z2Kz
 bDbg4b/QXaJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaLB9DwAKCRARpy6gFHHX
 cqwYEACp9WcPOcy4gcfDh/LJJl3cXfpEoQwSAP1WBDPryd/nzyb+k1ROOY9B4LpM+IlXz7zoD5m
 4enSFZkdcYJf5OO80aWnvZN+c3oWCigs7WrMSdDoZ2wdPT/iHo8o0otbFvuk0WUlO9iOZPsZ430
 zWyy8AjRs5AxBwxee/C+MI/MsHcTmJxftuxqn/QZSUzjO4HdsYvSRORiDo9LG0IR+XKDC7rIAW6
 Hy2KsGziEum8j+RtK8udciPRz8b4Jrh/d3Ln1xTmqrCL4QhxGKjNiQG9vDHM2ufPi6ZHlWEtGuu
 w0fiUIG8vrnfMwAVz37LYjiYiVuaz3LTNKFy22jcPW/4msoW66y3NBn23pMqkuHVhIqf5BtCPeg
 n6zXZEFx7QbhvYIM7xhxgGciQAlKz2E9WONdxT4V/40OMzQzSHOjnJ0lVi4777IFfOoL2nE2KEL
 W48IdClDet9yldUS/sDS5N/LMmy9SpHdIH25+Q1gdX60QAQCN+NY5yvPMCrzzeaiBRcQGS7ufoK
 3ldEFyHY8UA6PKuNdsK4Ikns5jS/8E+37Jw0lYI+RsahMEx0txavgZA46S6nxj/8gMaD5IK4I3w
 ax66JFhNeIfXBqRZnEfpOh68bNIdhR6i+nG9FUJv4YXhIKoXfbtkJDBO71lKwsBsDHe6v9ZGXct
 OzAWs5aoyt5lRYg==
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
 drivers/pinctrl/pinmux.c        | 46 ++++++++++++++++++++++++++++++++++++++---
 drivers/pinctrl/pinmux.h        |  3 +++
 include/linux/pinctrl/pinctrl.h | 14 +++++++++++++
 include/linux/pinctrl/pinmux.h  |  2 ++
 4 files changed, 62 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/pinmux.c b/drivers/pinctrl/pinmux.c
index 6f5e3ede972bbfa78e279790df359632e2d63485..c01814b5b7cb43acd748153e08ce65f5ca7a7b9a 100644
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


