Return-Path: <linux-mips+bounces-10313-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B804CB27C99
	for <lists+linux-mips@lfdr.de>; Fri, 15 Aug 2025 11:17:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CC53A1CC297E
	for <lists+linux-mips@lfdr.de>; Fri, 15 Aug 2025 09:12:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59EDD2D9790;
	Fri, 15 Aug 2025 09:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="swdsSh3s"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 501C129B78C
	for <linux-mips@vger.kernel.org>; Fri, 15 Aug 2025 09:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755248973; cv=none; b=V2FGTiNcS7ZTIdjzp402+sTvDmyVLHe84XBL7HfvHpPtDb8UmrneIfEjj9LZXPS8oko3ynNMKwzJaGv8f/gi7UCXduptWBRoOq9jk6p8/Eelq3m7cOHEEGHaL/+jS+YLTU2Tkj+4Vsu7YbbFUYammoSOW98FyMfY7O89yqXFUZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755248973; c=relaxed/simple;
	bh=NN8N64azTZ6Tm9oD0O4UPA4GBXyAY9HuPJ1OulPwzrQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sVzJYUPiKhrx61/eWkAFEJ8xRc0t1iM/tsDytSVnh7R7Cw9qO2x7lbxf5VBdwrTuHRKUGPa5QcJDOWcMTT95DwQGIuX47YoC1R0Vlq4fAsDT5RRJOLdr8/MYpV5S3KAxO39/COyK4sN/omC1aYOkGsvjb/i7rHXGFfjdQIbTjBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=swdsSh3s; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-45a1b0b42d5so12670315e9.2
        for <linux-mips@vger.kernel.org>; Fri, 15 Aug 2025 02:09:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1755248966; x=1755853766; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EnhxaXfLWBAe5wxXyN7EB4a4qBStRGqZ5wQqNK1Gqy0=;
        b=swdsSh3s3SU12RtjPYT5MUtEhMLtTBTUL/EzJgufM8flszYOOxCBTaSXLGfOV1wfI9
         Pp90nuHhbGoYDXLv0IxJUQBvYOYHCAdH/GzRA5nIvUfgrqPFiQxfrDNyhIpyH5W+5UoY
         flB+OkFxhJ9ZkvULHtyuTMu4N6koOQEcuvFCeLE0jg2gTmQaxYQtIcpm6JyPN2uvhyjq
         TcnwJTD6WdaY6E5OVcD0TuanwQqE5Yd4kcUuD4JXlUZaaXiomP9IoCvL1vEZ4G2zD7d7
         AP+wMRCBwiRKYyw0IwoMANY87qHyv/wG9nKJ0HjsG4+6SOhdPpTux7r1vV/7MeveDHW6
         pTSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755248966; x=1755853766;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EnhxaXfLWBAe5wxXyN7EB4a4qBStRGqZ5wQqNK1Gqy0=;
        b=mbmr8cML/iSJTQEb5d3LQs/uuJ5dQFcTKWXmzcox4OP7ADWPw60rSSFnw6q6txq7yz
         w1vM3EzYcsdOFaJVf4BHKUo/JncTWdQbvd/rcXNRxWO/8aBQtgHejK3zfW9t1rklIj16
         YkRwnCJlx0XJz8WMKqWlYuYkEW0alYEuss8+0BWwF4bygSdflURh1+nIsrfQCBMVyTE5
         00FiJ5/Dp8ilRrCEj4RRNE/rYXEq9B1OnLDql3Io92Pn6CHhGx68Wr1wHpQ3hcjKYoRS
         haKaM3PbJZYBoj7IETHXIJByKsvtac7o4k4XL2RlyXBUZI39Dx0U/1zV5IYfvkdTYdDJ
         iVPw==
X-Forwarded-Encrypted: i=1; AJvYcCW7TuRVYAzrVAid+jZtsbgO7n2yXO1uJx0ANM/7Qicgz7a/gd4SaI4HmGKeW9WADvl80lAayco+3JKR@vger.kernel.org
X-Gm-Message-State: AOJu0YwWmH222SqxmFQZ8dm+85NzjaMGZecMrjZqvKRgbJEfA1dpYefG
	ybGqH3wSZOMwJDQOZt8NSaDm614ikJdkNvQ76ftZsxbSAAyfaKyu+HJwjLrXWE+qads=
X-Gm-Gg: ASbGncuZ21hHIk4L94UsYb7qePKuPfA/hhKJkieKvjG0IVrx1gt0TRHE461lW/QP3Ne
	0P9JMf4a4GO30jqKkRFXPRHx9cFvBdfPp07LnrZo0pEBRskip+aQ2KawK6AkGdx7qbPlfCyodod
	fU140bO089bF746rDNK9BPvWC3KcNq6uAV9xkV7E/eOM8KCPUA9acc7w5a5OxF7KS60rFmFiQu6
	HVQhROpVAxoRc7nbVYZDbWaXnpvVImRdSCn5+EdmX6ZtfAJrl7Zx9lcMC1HdqcgY6846qPixoh+
	V645NCJrAUHoOcXX505z24FYFEijZZzgQ6Qezs1VnbmboeOVJMqyrQGPu7NiHscnPgjSxadF6Il
	iDsmi0jnOnO48lxQB/A==
X-Google-Smtp-Source: AGHT+IGrKalxRH2emMVFhJl/BSNAcO1PZ0/C3WQ9SuFSJDnEC4sffp01HAuXZ7aewRxm96m4CMiqDw==
X-Received: by 2002:a05:600c:45c8:b0:459:d667:1842 with SMTP id 5b1f17b1804b1-45a2180461fmr14807625e9.12.1755248966340;
        Fri, 15 Aug 2025 02:09:26 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:a125:bd3e:6904:c9f9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3bb676c9a67sm1205210f8f.35.2025.08.15.02.09.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 02:09:25 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 15 Aug 2025 11:09:08 +0200
Subject: [PATCH v5 06/15] pinctrl: imx: don't access the pin function radix
 tree directly
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250815-pinctrl-gpio-pinfuncs-v5-6-955de9fd91db@linaro.org>
References: <20250815-pinctrl-gpio-pinfuncs-v5-0-955de9fd91db@linaro.org>
In-Reply-To: <20250815-pinctrl-gpio-pinfuncs-v5-0-955de9fd91db@linaro.org>
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
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBonvk3rpCdQt6oBLFE3JhUek7wpG6X1F3lNHhRD
 1xBSnpghMSJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaJ75NwAKCRARpy6gFHHX
 crmbEADXui3pd5txQPs5OswgHt+SSwhRPgY5VgbCuLzFGwr/2pud+3IwLJwQv32sg5biLycFPIS
 tgqKV2jg1ezhF3AuxuIS6nCEBUC25Q4ocf7Z5bIG1PaVNj4kx8CSRz3xaBNqzSIggrfzcGSDKRV
 vkfdoThbQz1qBjCZIGDtAxHee64mmlelkG9kaF77q9JSRcOTZX6A/dACXHIDwKOuyzV2Uvm1CQZ
 ElBeUIRyu4lx9a7VMF/jP6aewEJE2p1wugJvkvSI91B+YhvnkPrqA/QqGzYrxlHqflJy98WygLu
 VlPXlUsXqP5POoIbK6S3GDkQCnr22v9vHBTmkOmJ1H1flKtn+0JuYy8JwUFHe3h22Dl0ChZU1LS
 95/YKWnICS0nBiAFltHYmCDB1oIqxpBTQ16DUA5SSIcy+8aUUVJbvJafN7qVlBjOxUFIujaietr
 CGqK52H8fm5AmTAOmZ3WaCns5oKr+XuL+/h5SpO+GfhHrfeOF3DNb/EI2Y1jpV8t7GGsBzWu6W/
 Uo2gOtnoUPeWQEEW8J0qn9wdPXQc6uep1CXJVXcOOOZYG5XCIWOs+2CQm9FXoxOvfTaYa85+cwq
 t19ujQgkGk9zToTdGziHLee8zGBTKfXUwoa2g5obhZ0lJVJ7RLtUYDhq9oSn1tU9lVBWfPBWx/H
 CIIk4Htmm9oBG1A==
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


