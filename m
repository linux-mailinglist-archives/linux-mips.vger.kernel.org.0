Return-Path: <linux-mips+bounces-9905-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E38F0B105F6
	for <lists+linux-mips@lfdr.de>; Thu, 24 Jul 2025 11:27:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8F5111CE3E5C
	for <lists+linux-mips@lfdr.de>; Thu, 24 Jul 2025 09:27:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F75028D849;
	Thu, 24 Jul 2025 09:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="yqR+UoVf"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC84F28B4E0
	for <linux-mips@vger.kernel.org>; Thu, 24 Jul 2025 09:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753349101; cv=none; b=N3PI7vgoLzul6l/MmrQa39O7LoY4rjygcbhPykafMIPv9Tkeu45PyhgQF1t+ZQmRmLn4x7PMetKZIDtqyKukY8dxhQL1BG+1GvnOgtbPlgPQvbm+sWgTvUY7l1+XEkTsuCq9Jl+3gKgR0FCKIC8l3Z8hfMJlOhW26zDjfqVarc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753349101; c=relaxed/simple;
	bh=yJai2nkmTuRtN9wYrXCSoW+LMFZLORE0+SVs4qkrcVw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y6Q92oRdEEVK1c/kLvqfd/k2Hfg1oYoaraFeCyyoa9pGYDzhpWhP+smXtzeG7jC06BJjo4obr6iaUu4Mv31gD4BpzZ+LZ+90k4yvbdU/EE9VOC8zpRc9bH2KSNo1P42rJUbEBuhfcyvOKdLNzBwGIiX9S+FQVicbmi6wxl0Urm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=yqR+UoVf; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3a582e09144so349985f8f.1
        for <linux-mips@vger.kernel.org>; Thu, 24 Jul 2025 02:24:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1753349095; x=1753953895; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/B5mqzJPOKnymkKTWWqgRIpNgdkGss9Cl2KKrxouE6o=;
        b=yqR+UoVftGH7kXSCfYsua+hQ+N6AIDJXIRDTD8IU+TOgzMeVMiNOoYq91x3WuqsB5M
         gGQJJKc8JzFWWBSTfby2oXtiicQQtu5etB9rMPe87tpPULzWXr9mTKKkKz8RLiRmNO1D
         7/AZIpbGB2oU3wxj7YvMXtj87kJYs+oVjnY1OSAiOKw7CSALJ2Lx147Ud7EAvhofKIKx
         AYzW4PQFw9Z14Vf3Uq3S1YQnMVG8Np8KohceDjzblJsiZqH2onlFqwXlaqsqw79xQ7VO
         NhxkwRn2wsRtCItQaheFVQ0vzwPNPbUejknkkDh2io1spfEZBIoS3PJs3PqOn1Is4HSI
         JdHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753349095; x=1753953895;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/B5mqzJPOKnymkKTWWqgRIpNgdkGss9Cl2KKrxouE6o=;
        b=H3UFmiDttlhafhOJKmQft4f629MA08Xf0HFDfXFbOUvsFRpmnx2bX73KXAgwUW94fi
         Sj9ujyD5LOWoZavXk1MEUm6GmBqSx7PEArNE2REbPL+toUm3am2A5ubLh0vrc4gdDhLI
         1gKfKpZDAf7H200SCYDW2FA85pIGNm9W4NVLTgiY5U4D7ly3dNis8cpVfDI1arODN+jV
         7N0V1dU6RU6dMMuOdQ+PnVmTUPqt+gdRty7WkyzUcqKWwxmNyyoA6DzLg0wdlmRh/wrh
         Dgqu+5iB0q3sd9k2Ep2EHAvZx9aNz4MPuwoLj8jWzFAcbkqjE5UUANtoDK23vcGoMk/S
         EmXg==
X-Forwarded-Encrypted: i=1; AJvYcCUPmLwbqiqXl+4as0i8VGunwGvAw0oOq59E7StoU0ETk08gZ7YDASA5ltI3MDDvc9qcULTboaTDyX17@vger.kernel.org
X-Gm-Message-State: AOJu0Yyx9n/RT8UhHMNwO1AwfRCu8HxueJeXrxwI2J+ggyjja2ZVsVad
	nrqKCl6F/QYojli+ctDu+gMUWKhSsrc0OklwVxFFFLlJ3I92xXnlmqSbhJSMJfJpXV0=
X-Gm-Gg: ASbGnctHPH21NVv27Uz+8geBjl0WWRxMTVqztnV84faR7eInAKDkuxgNJpGNnLdSrtF
	l98mz3amDYszNEIBkVYO6pelGBkZJSYJSk4wFVckWhI/miZIEd5zmDZpQajjRR/k7fq5HRsTOCS
	NnZ/kDvob/flbEbwmzO9ZrWbvyEUTBo/7/phsalSK11u7kZ+/jZgNbr2CcW8/VwXtlIHv4/4Dnj
	53WyV/PYW80haRYdA/yMHAusL+6n4Ey06dVxyBOAQmI3LjrE5RV+0cVzfJk2gmKfwhv7nR95J48
	U1nyZvUOaNYUcdlD4whZVYTNx/aY/kSLuwsXp86PBRfbGz/P8Vle2hMwjAlv2OdjVYZeMnnMfn+
	OS4e79HIy1+9Fv7EdRSZWD8AegMI=
X-Google-Smtp-Source: AGHT+IFFYGzeJ4b/YJmykKhJ4ByKyqeHXAd3kTP4MKkFIfH5T5aehAq/f8O2Wira9xvCFqeB7o4n6w==
X-Received: by 2002:a5d:5f92:0:b0:3a4:f66a:9d31 with SMTP id ffacd0b85a97d-3b768ea0755mr5380456f8f.16.1753349095153;
        Thu, 24 Jul 2025 02:24:55 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:f44c:20db:7ada:b556])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b76fc72548sm1600833f8f.30.2025.07.24.02.24.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 02:24:54 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 24 Jul 2025 11:24:38 +0200
Subject: [PATCH v3 10/15] pinctrl: make struct pinfunction a pointer in
 struct function_desc
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250724-pinctrl-gpio-pinfuncs-v3-10-af4db9302de4@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5376;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=ZmuiefgGXXB3FllRDbqQi+J+Hkq37TmiTiEClP1ORcs=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBogfvTNNHWkYm23ctD+yFB8BkOI94T1g5+tu11i
 kTU7G+yUG6JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaIH70wAKCRARpy6gFHHX
 cjGVD/9OXwWkNBcpAmTOjXHlhRrDKtxZJu1qTGLXSjtO0KPkqd5CY7BMFUOCdEi8XlcQanbbL7L
 nvP4K7dN+xr1iL0x/HfeKZEelU9W3C9bNoRmDledoPw393rdRV8doK7SRnqa0O20RjWjxn+Xz/N
 Lwehl5zRQRsMH+nFk8QUjzlnqGbUuQ9TQ0SodhzRdqiAT1GZ2GRFkMVJpPhlI8WtJ9dk1luDtGN
 WV5h6irSxODFsX5L/TrgvODweankE50CEjYLFjnyxR5i78TCH8a1hnsaQB/2Tk21DW+GuJTyz4Q
 Z0deaoQamyFH2VEzh5oSTnAf8wsObNY5E/wKBggsLhhB/qRgiWy376pUMyEci+0hal9AuOu6aJX
 fEVuNV0LGRkANlOKZYvIQ2NU/XmdvaBaFF7QzhuwBRXeE2wK3lKe5pZwe0OdYnC92MawGANseFj
 7C/VuOkNz2W8FIMgJr2JyhJZAh9LOJjklXwJxohtKwiKpUAlGipl5v7wuql1Pv9X3tKlODyqmfO
 FgsgXnUg/EeCpUgKVgMOIgO665Zmt5PwsHtlaVU+AgJzZV+9/sGUHTB3rCOCLcTL7iJwzyG3atU
 oaKrWyF94LGpCqDvWnT2xznL1U3NEqV89eC0mwfnlvlGrGOFuf1fxB/78fjOW+hZj52AJT0UnEM
 FvdC1chVyjxW7zg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

We currently duplicate the entire struct pinfunction object in
pinmux_generic_add_pinfunction(). While this is inevitable when the
arguments come in split through pinmux_generic_add_function(), users of
pinmux_generic_add_pinfunction() will typically pass addresses of
structures in .rodata, meaning we can try to avoid the duplication with
the help from kmemdup_const(). To that end: don't wrap the entire struct
pinfunction in struct function_desc but rather just store the address.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/freescale/pinctrl-imx.c   |  2 +-
 drivers/pinctrl/mediatek/pinctrl-airoha.c |  2 +-
 drivers/pinctrl/mediatek/pinctrl-moore.c  |  2 +-
 drivers/pinctrl/pinctrl-ingenic.c         |  2 +-
 drivers/pinctrl/pinmux.c                  | 23 +++++++++++++++++++----
 drivers/pinctrl/pinmux.h                  |  2 +-
 6 files changed, 24 insertions(+), 9 deletions(-)

diff --git a/drivers/pinctrl/freescale/pinctrl-imx.c b/drivers/pinctrl/freescale/pinctrl-imx.c
index 9ed84479a5b43871861f46fe1326f1dfadc7f63c..0df7eba8ccd3209fbc4b2e67ffdea12b77b90858 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx.c
@@ -266,7 +266,7 @@ static int imx_pmx_set(struct pinctrl_dev *pctldev, unsigned selector,
 	npins = grp->grp.npins;
 
 	dev_dbg(ipctl->dev, "enable function %s group %s\n",
-		func->func.name, grp->grp.name);
+		func->func->name, grp->grp.name);
 
 	for (i = 0; i < npins; i++) {
 		/*
diff --git a/drivers/pinctrl/mediatek/pinctrl-airoha.c b/drivers/pinctrl/mediatek/pinctrl-airoha.c
index 9a95577439a1b50607427756a713c8122c7c4af1..148b6e235db53290c48d717a994d88cd53c3a135 100644
--- a/drivers/pinctrl/mediatek/pinctrl-airoha.c
+++ b/drivers/pinctrl/mediatek/pinctrl-airoha.c
@@ -2459,7 +2459,7 @@ static int airoha_pinmux_set_mux(struct pinctrl_dev *pctrl_dev,
 		return -EINVAL;
 
 	dev_dbg(pctrl_dev->dev, "enable function %s group %s\n",
-		desc->func.name, grp->grp.name);
+		desc->func->name, grp->grp.name);
 
 	func = desc->data;
 	for (i = 0; i < func->group_size; i++) {
diff --git a/drivers/pinctrl/mediatek/pinctrl-moore.c b/drivers/pinctrl/mediatek/pinctrl-moore.c
index ec0005246c19a156079807acddc93bcb767d1222..8ebd731675f69c8b076a7e7767be8ff7c6d3dd79 100644
--- a/drivers/pinctrl/mediatek/pinctrl-moore.c
+++ b/drivers/pinctrl/mediatek/pinctrl-moore.c
@@ -56,7 +56,7 @@ static int mtk_pinmux_set_mux(struct pinctrl_dev *pctldev,
 		return -EINVAL;
 
 	dev_dbg(pctldev->dev, "enable function %s group %s\n",
-		func->func.name, grp->grp.name);
+		func->func->name, grp->grp.name);
 
 	for (i = 0; i < grp->grp.npins; i++) {
 		const struct mtk_pin_desc *desc;
diff --git a/drivers/pinctrl/pinctrl-ingenic.c b/drivers/pinctrl/pinctrl-ingenic.c
index f89f8ec06ac63227930a38dbc80f00333cc15b48..d81788aea5cb002a86869e22eaab430f7ad18e77 100644
--- a/drivers/pinctrl/pinctrl-ingenic.c
+++ b/drivers/pinctrl/pinctrl-ingenic.c
@@ -4015,7 +4015,7 @@ static int ingenic_pinmux_set_mux(struct pinctrl_dev *pctldev,
 		return -EINVAL;
 
 	dev_dbg(pctldev->dev, "enable function %s group %s\n",
-		func->func.name, grp->grp.name);
+		func->func->name, grp->grp.name);
 
 	mode = (uintptr_t)grp->data;
 	if (mode <= 3) {
diff --git a/drivers/pinctrl/pinmux.c b/drivers/pinctrl/pinmux.c
index 62bd4aa53b2b22cb09eacfb05398205f2fe391b9..504dbb3e97cf334e39b49121137c6768081fcd40 100644
--- a/drivers/pinctrl/pinmux.c
+++ b/drivers/pinctrl/pinmux.c
@@ -810,7 +810,7 @@ pinmux_generic_get_function_name(struct pinctrl_dev *pctldev,
 	if (!function)
 		return NULL;
 
-	return function->func.name;
+	return function->func->name;
 }
 EXPORT_SYMBOL_GPL(pinmux_generic_get_function_name);
 
@@ -835,8 +835,8 @@ int pinmux_generic_get_function_groups(struct pinctrl_dev *pctldev,
 			__func__, selector);
 		return -EINVAL;
 	}
-	*groups = function->func.groups;
-	*ngroups = function->func.ngroups;
+	*groups = function->func->groups;
+	*ngroups = function->func->ngroups;
 
 	return 0;
 }
@@ -903,7 +903,22 @@ int pinmux_generic_add_pinfunction(struct pinctrl_dev *pctldev,
 	if (!function)
 		return -ENOMEM;
 
-	function->func = *func;
+	function->func = kmemdup_const(func, sizeof(*func), GFP_KERNEL);
+	if (!function->func)
+		return -ENOMEM;
+
+	/*
+	 * FIXME: It's generally a bad idea to use devres in subsystem core
+	 * code - managed interfaces are aimed at drivers - but pinctrl already
+	 * uses it all over the place so it's a larger piece of technical debt
+	 * to fix.
+	 */
+	error = devm_add_action_or_reset(pctldev->dev,
+					 (void (*)(void *))kfree_const,
+					 (void *)function->func);
+	if (error)
+		return error;
+
 	function->data = data;
 
 	error = radix_tree_insert(&pctldev->pin_function_tree, selector, function);
diff --git a/drivers/pinctrl/pinmux.h b/drivers/pinctrl/pinmux.h
index 549ab10f7afbda32fadf4ad151401180bed2064f..653684290666d78fd725febb5f8bc987b66a1afb 100644
--- a/drivers/pinctrl/pinmux.h
+++ b/drivers/pinctrl/pinmux.h
@@ -137,7 +137,7 @@ static inline void pinmux_init_device_debugfs(struct dentry *devroot,
  * @data: pin controller driver specific data
  */
 struct function_desc {
-	struct pinfunction func;
+	const struct pinfunction *func;
 	void *data;
 };
 

-- 
2.48.1


