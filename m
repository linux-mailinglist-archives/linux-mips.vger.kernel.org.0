Return-Path: <linux-mips+bounces-10224-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B66FBB22123
	for <lists+linux-mips@lfdr.de>; Tue, 12 Aug 2025 10:33:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 946EA6E1D4E
	for <lists+linux-mips@lfdr.de>; Tue, 12 Aug 2025 08:29:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 655EC2E7655;
	Tue, 12 Aug 2025 08:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="nsYIZKRi"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D0522E763E
	for <linux-mips@vger.kernel.org>; Tue, 12 Aug 2025 08:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754987254; cv=none; b=mnEBnfOjzLqvi6rb2i50xcOJXsV+Tb6W41o6fqApYOlWtCQPw39ZXjEXFYwv5izkaj87wf4FJtwJU+Qo9pLypEXa7B7tgFK7DGILuMkrIv+QW9+CwigYAh0e3yajWxVNclhC9HGRXWp5vWlp6ocZDMUblhJpqu3snYvCr37FAk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754987254; c=relaxed/simple;
	bh=t6VnOHT23SNHvGQFb4pmKtrrlV85O/PWd2L720CuPrY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZLR/mDvqXwH0Ersek93RbpDUe1yB1MU+Vaii3Od8UsIsgH3u2KKIzjBPF/S2+yTeWehmmigPrBIPwyP6PGdR8EuMKoQzJlLy8lIvz6ex+pVy3CsSgvt9PC57TDyTucCG4Hgrne3gmVArqmcUxiGhYx7VtQ/kDnkfJU7UN7vnkFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=nsYIZKRi; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3b79bddd604so3029416f8f.0
        for <linux-mips@vger.kernel.org>; Tue, 12 Aug 2025 01:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1754987249; x=1755592049; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qNkdBhL4SofepKXOMLPV0ruEBSHstnzYJRcPgI9HdoA=;
        b=nsYIZKRiLlYWJJNHxDSShQHkqCpXeOs1GawSjACa6bz+7Gsr4pe0EdYz8WJz20fvOE
         8URlOfR3+9bZb929KSBzOSQ1XkY8H/agXyGENCot5vdB3eoS4VrDwOQs1EYyOEscqo+6
         MGfWWlZYLbiRLfIWc8vhbq6pEuSCsNcl3TeLCm9kqrnGnhE00bZeNqwmX3fVi8OHMj8G
         cDgD7yQPFfOUH8I47xNUkMneJ4om3UJoMtoE332SXLWLeFwlAxF07EBzqrWKV57n2Y8Z
         M7z/hOoIBqtRiFD9gaf0fkBayIbO49Tf8MqNHjl9s8A8ORS2nc/+5DssysClk/VTLqs+
         GrCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754987249; x=1755592049;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qNkdBhL4SofepKXOMLPV0ruEBSHstnzYJRcPgI9HdoA=;
        b=xCkb1OuDaQzF/Hbs5sVgMTqh6rOYW0dJgOFtMsi+HixpUUIxAINkhjVi2MaNamkvPV
         L/cKmKTfpWphxx/CrtrUDm/ysBTYCdSvV9uHOi/CAlGem4X4flWrjnTAqmQev4HvfjZw
         NJM3XDWqHMBEQ7+6tgFgk9uuP97xQl030BqmaeCPHsSu0YSMOedvBOW8L9htK43ZrqFB
         LJJmUS6HE8gpMOSPyQL8Vrx2Iva9nTHf6jFUGEQGCXvg/gvzXGIu2teixfiJPBjOw2UF
         WYYTDSrFlEvyJlHDM3rAdEy1sr4zB+SgpE07q6og3hvLUyTQ7uQCEiuZpA1T7I3fxWOi
         7JMQ==
X-Forwarded-Encrypted: i=1; AJvYcCXiwPIoxAjtmKs2UjDslJ6bq6DJMiU+OTf+HaEIx4HBkPVVlKdVduLl/RiQRmSUzfDvEW3XqWPH1ZqS@vger.kernel.org
X-Gm-Message-State: AOJu0Yzx0mrRynp9L0hdwyK0B/uKOb+wZcUMy5ISPlDVNZtgXZuWIHa3
	02XDOXrIt4poRYzE6UYnZmR3c0qdR/LlBRnCb36i4s9zNDsDsWWi/y+wowU+RXfAxz0=
X-Gm-Gg: ASbGncvvIquhJUgObDcn8caFEE9sy+E1rK9JCK14JBtHzDahmtrmFUZP4/gLAE83zEZ
	QFVR/2b1VlgtPlJsYyXDm5gR50o3cDEuLOETA6oF3aOpuFTDqpwNxMk4C2jYBsao/nq2xFiVhcW
	F7wMUWM2Q1txiLrOxaTY0aigBxQ45FvFxpzsisiYPv/Bg8vt1VsWPHI3zndhNECqLKLTZw5HgCn
	plqadUWnDxSt8Flql/7u2NpJCT57S3FlF9Tp2hQeOeJkF2bvPyHzB+8nXePq36xLWjIJ8xCLRnK
	zfhpCPahBn9K+kjUVFLzwpv7jvX+gtE0JtXSxrvjRX8rxfKDib/ZHqpYLndtTXOdcqVVQamo3Ja
	AgHQLS8TtLRmsDMk=
X-Google-Smtp-Source: AGHT+IF1aOctmbWm54Tz9TzOo9LheJ0g+HtTHoUDuTShXnMfH1+OQDhTbVjjMEL+NvcX3+PUPhfyHA==
X-Received: by 2002:a05:6000:24c3:b0:3b6:d95:a3a4 with SMTP id ffacd0b85a97d-3b910fd0076mr2224430f8f.4.1754987248840;
        Tue, 12 Aug 2025 01:27:28 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:16c8:50:27fe:4d94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c3b9386sm43549423f8f.18.2025.08.12.01.27.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 01:27:28 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 12 Aug 2025 10:27:11 +0200
Subject: [PATCH v4 12/15] pinctrl: allow to mark pin functions as
 requestable GPIOs
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250812-pinctrl-gpio-pinfuncs-v4-12-bb3906c55e64@linaro.org>
References: <20250812-pinctrl-gpio-pinfuncs-v4-0-bb3906c55e64@linaro.org>
In-Reply-To: <20250812-pinctrl-gpio-pinfuncs-v4-0-bb3906c55e64@linaro.org>
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
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
 linux-hardening@vger.kernel.org, linux-mm@kvack.org, imx@lists.linux.dev, 
 linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6831;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=O5vQZ4MKE8bL3a5x2rEAk2QUL7J9Hk6iGEI+vVX0jVg=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBomvrZe3Gk6A7K6BuZ6C7ogxwBSW/5+axg5EzCc
 cPcQp7eSOWJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaJr62QAKCRARpy6gFHHX
 cr5pEADQKhyLMmGAMuIfT6I9nesZoE3YTWBvYFEsHrpHOXW7IcwofY+k/j4lTrHXWiFSH2aSHiH
 h09HksFuzIbVBj3KRssbgyxg1qec25nBDbuq+SG327Y8lzA/ElXT7l06ZMgLIhC6WbM+MwKsbmZ
 fK1xMMKfxJ/FbO2+CMtw2ZK1JEcpsOWRLy48UNMqhQvWhg47T3lFxxjxqJQK75Ga5zNGJif47oG
 SL4wNsfpGlfU1Ol5kRE1A6Bzp8ET/WvJ0S4SHCf9XLEdnkRFfckWCxKnsm3J7OlXIzUQl8D5ahM
 YhgYiQcXC3QYeQ26JOOa4soGndCYmSj48a5PTH+zGR7YM25kOINjlq/okZ0YsGLdZnNDudPbi4d
 ZxpU62lK0QknRASPsHd0k34j6edoSRowVsIJ/81b2ZyduahX2oGqZVO5b4nmaXxWQb14txOwfYf
 LB1eEbstCLY3GEBhgjPb0rvctBDxQxC1W/EPi2AVS0tNMSEte35/6dBiOunvTpLifOS7kV6UJ2C
 0SSFrUGBZGIudW/RB4Giyakl25Mz771OvscKs1Z6m7ebofkxHrHIoQRkKGeEVhs3DrKbP3VQcdk
 +XtwiXOJbfTT8I/2s/LLdvqGESE5IYGwSFp01drsYWOUm79oxdipIdgQjqexu/b1xGghJkJhzXt
 0MEwMGHjLVNQrqg==
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
 drivers/pinctrl/pinmux.c        | 37 +++++++++++++++++++++++++++++++++++--
 drivers/pinctrl/pinmux.h        |  3 +++
 include/linux/pinctrl/pinctrl.h | 14 ++++++++++++++
 include/linux/pinctrl/pinmux.h  |  2 ++
 4 files changed, 54 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinmux.c b/drivers/pinctrl/pinmux.c
index 6f5e3ede972bbfa78e279790df359632e2d63485..1f99547deebe085e907a6fc5d66b01deb55cb41c 100644
--- a/drivers/pinctrl/pinmux.c
+++ b/drivers/pinctrl/pinmux.c
@@ -89,13 +89,18 @@ bool pinmux_can_be_used_for_gpio(struct pinctrl_dev *pctldev, unsigned int pin)
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
+	if (mux_setting && ops->function_is_gpio)
+		func_is_gpio = ops->function_is_gpio(pctldev, mux_setting->func);
+
+	if (ops->strict && desc->mux_usecount && !func_is_gpio)
 		return false;
 
 	return !(ops->strict && !!desc->gpio_owner);
@@ -116,7 +121,9 @@ static int pin_request(struct pinctrl_dev *pctldev,
 {
 	struct pin_desc *desc;
 	const struct pinmux_ops *ops = pctldev->desc->pmxops;
+	const struct pinctrl_setting_mux *mux_setting;
 	int status = -EINVAL;
+	bool func_is_gpio = false;
 
 	desc = pin_desc_get(pctldev, pin);
 	if (desc == NULL) {
@@ -126,11 +133,16 @@ static int pin_request(struct pinctrl_dev *pctldev,
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
@@ -861,6 +873,27 @@ pinmux_generic_get_function(struct pinctrl_dev *pctldev, unsigned int selector)
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


