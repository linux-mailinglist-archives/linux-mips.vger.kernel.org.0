Return-Path: <linux-mips+bounces-10218-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 61E99B220D1
	for <lists+linux-mips@lfdr.de>; Tue, 12 Aug 2025 10:28:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3382C7A0423
	for <lists+linux-mips@lfdr.de>; Tue, 12 Aug 2025 08:26:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEE592E6100;
	Tue, 12 Aug 2025 08:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="AT2zV9KZ"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98E592E54A6
	for <linux-mips@vger.kernel.org>; Tue, 12 Aug 2025 08:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754987243; cv=none; b=jLFMYLLUdHMNUQMQ/lxlQLh8cuvEi4MX9sAJFQhMVBwWvbQ1LCBtkJ5RTI0PHjuJ+IpQKR/QEJxi0n6Ejz70KjAS1GAfR/G+HNMzovdnE5jkEvG78ce82iBE+jz29h2bi58ak+2l56ZQqN4aGoF+TDF33MQYCeXrBbaLX5o6NnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754987243; c=relaxed/simple;
	bh=NN8N64azTZ6Tm9oD0O4UPA4GBXyAY9HuPJ1OulPwzrQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m8BrLutWhdY/xECPPsFFipxA9joEuSFcDFORWiS0wvbnyhj107xX7EOF5q4Uf/RAyZnq05mtW3EzRKtYGjmrt5DqLqB44sSVQ1pMlGzJysnvPJLUAc51BycSjIgZjXAfk6OKatyYgsdzuctABBaffhA93wuyvTqNRZRWfo2gnhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=AT2zV9KZ; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-459e3926cbbso21610665e9.1
        for <linux-mips@vger.kernel.org>; Tue, 12 Aug 2025 01:27:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1754987239; x=1755592039; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EnhxaXfLWBAe5wxXyN7EB4a4qBStRGqZ5wQqNK1Gqy0=;
        b=AT2zV9KZCcgY4lPNqwXBx1+GbuveznMIOkMdpvSx7z5IqnVdAfM9GYT1jzCmqI8AB4
         2iyNCJ3DtGxeuxtEXBw3ELfi5GNne5UpESl5Vqyj3FTe4TsXX4wa4h+iba4ogXpbbHZZ
         tFd4V7iOhlBtVugF4Widtc1i7jEQr4mqHoISjPjfQZzfnXWTRTiPrR9n6RCyox/7P8oa
         RyIQ4TfIrbPWTQtujY2/39fLZVAmjMEh0e/KAr1pFMdLcD8cjiVED29q4C9aQxOxpt3f
         AzF3EjFletg0zwoxhbpXOgb1XOgsnkT0y1bBl30P+hrU1O4IyxOTtqFZHNgUI6OR1gDW
         /W1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754987239; x=1755592039;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EnhxaXfLWBAe5wxXyN7EB4a4qBStRGqZ5wQqNK1Gqy0=;
        b=FivZLGuXg5z8liFELKghBwbdYrkoak75n1nJZIuIwkkFQV22SfGMn1+YvTidNTpB2G
         qUd2Ok7sFlgHgemqZHD45pRiyGxroiiyB7gb4SPokNSFJghdCdbd7IljTLiTKsyILN8T
         0TVnjcxIrb0xUl83BF2YFo5PbR6MyeTbZizwOEU/z6FJud/83/tq8TqZqdc8y+TV+ZFT
         //qRPQVEYTBn2uBqorZWKZbqUPOLv97MT4FP9Ys5hWQeoQyWnOaW+MMpL8EtfpmWur84
         Yb3xIu/KD5S+cpkz1VuiQYlQtFIYDwC9uILpaWIDrD6Z21noQDv3sXBzgk6gqypJii5U
         iUIQ==
X-Forwarded-Encrypted: i=1; AJvYcCWIHt9NM5HfLvbcxAZpdjp9Palh+mywOZHUP4d+wvpRn3+tDlHJk16KD+S+6LnaIpSNJs4BQBH61R1z@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8wY8OTX87PIgpsbP4clykfXnXUmUqeMndxOj/7iWLip7Z3XLv
	hLIDXFInxqtiLG0QFDf06ICEZ+dIF7i5cJkQERVfw2kQt6j+Z5rUY7+PJa+o6wogdvw=
X-Gm-Gg: ASbGncsuANd3MwKLJ6yAEGL20f2j8GuhjqHREhNoCW7mvixE28jxdLs+j9+ByJk33A5
	W9oNJidDurnKnV1W+feFug41jXl+TkE7REBrrQzVfcWzHEHyfYlan+c3L5HxEMDz/RVNi9IlzMw
	qc+yiege8V0LcpfBxscGF1kMtDzi1bon40tGZ58MIWKqRuIuRBRJCxrRa7SkYhZQ1FSUwVb6mAE
	Ij39X+VeNY8R4/HH2hJELRJX6hvuvt/7/u/ImzkfMsXfKZfaBJbgQTaJ6fgR0XaWBKwboPhaKlD
	cK3BCZd0/JhizDRGcAadDN3LsX6koLzBRWVb9bUpoiA2xFWliSWodCZKBPTXJVbvHPJswUnRPh+
	P/AB/uLPEOT6DXn8=
X-Google-Smtp-Source: AGHT+IHCxxphw0C1ysWW25fo60uK0xUciNoK6/brqWeyF0IqKEcM+9QCTW7mxqYhhnP5CYPiuHCuHA==
X-Received: by 2002:a05:600c:4753:b0:43c:fc04:6d35 with SMTP id 5b1f17b1804b1-45a10b95677mr23101005e9.4.1754987238810;
        Tue, 12 Aug 2025 01:27:18 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:16c8:50:27fe:4d94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c3b9386sm43549423f8f.18.2025.08.12.01.27.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 01:27:18 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 12 Aug 2025 10:27:05 +0200
Subject: [PATCH v4 06/15] pinctrl: imx: don't access the pin function radix
 tree directly
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250812-pinctrl-gpio-pinfuncs-v4-6-bb3906c55e64@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3088;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=FuPiesxsrAA0Rn9DkOactcvX9/BHBoNthgyhyXGEhH0=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBomvrXvfSwc1aR/VkXuzCwVe/jTr/RkVSkQok9/
 6ZfT3vraKiJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaJr61wAKCRARpy6gFHHX
 crU/D/47WmiHhr1jD4X7MX23IkaKdqa8H3X1+A1yMibQlOZwva+m91uzbA5E1KqKisV1OFMTrwM
 qQw8JodqYSC7dGdkQzBqDTIPr8qzRWzoSvMRK4SEMSkWN6JmzLvQkjkT0QFqmMWrU29Eu7a0K1F
 Dajot6d2+kAVgD6I14MGW8cJyorpzlsoHipAlEw12RWTEeduUUSmBSgSdFriSRaQ59MJPBKp8hZ
 kVe4zp0J0g84ajKZ+DnhXBhaHIQym7fLJR57ngkJWPemTobyqxz2105/iqorzBrO2YC4Y2pX36z
 cuDpKjunZLGwb4w0loqgMygcLK/bV/U5ML167wppqGTE781xJw8gTclK0ECkF06V9mMriWr5qog
 w0Iiq+SbqD84+qFscPmKzsUrqqSX0Ih35IZdHkB2+uOuY9wKhFsFauO5KIiHmPkgPvd1VHClNqm
 ItFa/4pd+kPjurFIxcHWHYyEQ5xM2PYjHpH1qPVzaQNzL0f+rZPoifcD1zBil+ildZtDLwNHbLj
 9bGuk4x45L/2ysZqyTqShL9pN8TnHn3mQrsZpHh+PUIe5e3hgaZi+P7oiTmtPmifDRFb/rJlKSM
 l7mYoB8Nx9U1KflhK7GPr2sCxhy436TecxSTqnjxs3nFe0iqlGJPyQMvKZURsDe/JEiBZVGu0+n
 KZOvfyXmKWunFeA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The radix tree containing pin function descriptors should not be
accessed directly by drivers. There are dedicated functions for it. I
suppose this driver does it so that the memory containing the function
description is not duplicated but we're going to address that shortly so
convert it to using generic pinctrl APIs.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/freescale/pinctrl-imx.c | 38 +++++++++++----------------------
 1 file changed, 13 insertions(+), 25 deletions(-)

diff --git a/drivers/pinctrl/freescale/pinctrl-imx.c b/drivers/pinctrl/freescale/pinctrl-imx.c
index 18de31328540458b7f7e8e2e539a39d61829deb9..d5d42c9ad5fe9dcf7c25ad393688e714b02db678 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx.c
@@ -580,33 +580,34 @@ static int imx_pinctrl_parse_functions(struct device_node *np,
 				       u32 index)
 {
 	struct pinctrl_dev *pctl = ipctl->pctl;
-	struct function_desc *func;
+	struct pinfunction *func;
 	struct group_desc *grp;
 	const char **group_names;
+	int ret;
 	u32 i;
 
 	dev_dbg(pctl->dev, "parse function(%d): %pOFn\n", index, np);
 
-	func = pinmux_generic_get_function(pctl, index);
+	func = devm_kzalloc(ipctl->dev, sizeof(*func), GFP_KERNEL);
 	if (!func)
-		return -EINVAL;
+		return -ENOMEM;
 
 	/* Initialise function */
-	func->func.name = np->name;
-	func->func.ngroups = of_get_child_count(np);
-	if (func->func.ngroups == 0) {
+	func->name = np->name;
+	func->ngroups = of_get_child_count(np);
+	if (func->ngroups == 0) {
 		dev_info(ipctl->dev, "no groups defined in %pOF\n", np);
 		return -EINVAL;
 	}
 
-	group_names = devm_kcalloc(ipctl->dev, func->func.ngroups,
-				   sizeof(*func->func.groups), GFP_KERNEL);
+	group_names = devm_kcalloc(ipctl->dev, func->ngroups,
+				   sizeof(*func->groups), GFP_KERNEL);
 	if (!group_names)
 		return -ENOMEM;
 	i = 0;
 	for_each_child_of_node_scoped(np, child)
 		group_names[i++] = child->name;
-	func->func.groups = group_names;
+	func->groups = group_names;
 
 	i = 0;
 	for_each_child_of_node_scoped(np, child) {
@@ -614,10 +615,9 @@ static int imx_pinctrl_parse_functions(struct device_node *np,
 		if (!grp)
 			return -ENOMEM;
 
-		mutex_lock(&ipctl->mutex);
-		radix_tree_insert(&pctl->pin_group_tree,
-				  ipctl->group_index++, grp);
-		mutex_unlock(&ipctl->mutex);
+		ret = pinmux_generic_add_pinfunction(pctl, func, NULL);
+		if (ret < 0)
+			return ret;
 
 		imx_pinctrl_parse_groups(child, grp, ipctl, i++);
 	}
@@ -669,18 +669,6 @@ static int imx_pinctrl_probe_dt(struct platform_device *pdev,
 		}
 	}
 
-	for (i = 0; i < nfuncs; i++) {
-		struct function_desc *function;
-
-		function = devm_kzalloc(&pdev->dev, sizeof(*function),
-					GFP_KERNEL);
-		if (!function)
-			return -ENOMEM;
-
-		mutex_lock(&ipctl->mutex);
-		radix_tree_insert(&pctl->pin_function_tree, i, function);
-		mutex_unlock(&ipctl->mutex);
-	}
 	pctl->num_functions = nfuncs;
 
 	ipctl->group_index = 0;

-- 
2.48.1


