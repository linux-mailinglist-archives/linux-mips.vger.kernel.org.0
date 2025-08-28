Return-Path: <linux-mips+bounces-10747-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B272EB3A555
	for <lists+linux-mips@lfdr.de>; Thu, 28 Aug 2025 18:02:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8676B16E604
	for <lists+linux-mips@lfdr.de>; Thu, 28 Aug 2025 16:02:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F37625EF87;
	Thu, 28 Aug 2025 16:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="bPNneU8D"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEFCD263C8E
	for <linux-mips@vger.kernel.org>; Thu, 28 Aug 2025 16:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756396835; cv=none; b=GEs1koIf5InLqFqAG4Zyhunf6hdBELKVvBGB6YrNV/CzwHjUyFWQT39eCPrHHfcrBdMZWf28Z7fbvc1EytSa+ItPYeLjbQ9N7EnSntLUGTIfFQiBRbzRgxBnvA/gMXqBB8+wuGPQ+pqX8GrC8J2tmxaWDautZITHDKIo+xFVwgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756396835; c=relaxed/simple;
	bh=8LckYYbv7wEiVDCoVOTbwt+nYJz1zV0AkW539eEIzwQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WFu2rRHUewI32OijTxFUz3174obtt6GgTE5HAWD4eeOJiGEjQgLO0aVDUcK6buV5TuaL09gr8TVq3Qp8UsDsZo3DEkyE/La3MqP1jYAJ0ZECgr9m041juiRaKSmRnkFgbZidajeJT/EoeU0aIf8RM7KPMLLZVDcaFdshOMVW1Js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=bPNneU8D; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-45b4d89217aso7109445e9.2
        for <linux-mips@vger.kernel.org>; Thu, 28 Aug 2025 09:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756396830; x=1757001630; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rcnhHIb6eNEwdjxZYrigpF4SQxNgYqLi3t6s+DqhmIc=;
        b=bPNneU8DkNbGvwvoIhfgnA/1yDK1Cel/S894RSctbOUuwiG8xyhY4m3RP/vyqrjE8X
         SKMUeXWusEzYtdoqKbD0FG6c+6yjribeMAgr1Rutg9X8zp9Wqrh5W8HKSdDfUWNM+NFK
         gWIxAH8RB6EA3kGaQxJbPupAVUHCkd+I0GBcSXuAWeMGq4GUwLJB5Yyu4SzPiDtr5Q8U
         HWNmoT00KKW8RIW4+CRw6mS3kJKM5lfcRFWahZwr/Jvx0BgHGfEmRSIMwLYIFaQKEhVP
         z7O0qcl/MZ2nEFHr9eMD75fyJHlrUl6iy3vfzhvWN5kUE3Fuzm4LvtLYQhx51TSz38OY
         r9dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756396830; x=1757001630;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rcnhHIb6eNEwdjxZYrigpF4SQxNgYqLi3t6s+DqhmIc=;
        b=mKdtmREYPBGxpt26+fZgElUeg8cnpfgJHbFZnOAeWKzuCEhaHqlimHdOt9yr37Pp3M
         4SAUlqamnAQjbPt6cz6Fp2JgrFViGwhQ3EsFBEoRm9DztOo475Ozh/XaNvut6/WaGVTB
         WM8FxXKq+FoP+WlarVTEXaN8uwxKxb5x2NeaYkxcecPehr40g1eULA+Xc6T08M2Hrn0j
         fqXIeDXT3uSHud6KbYN4FlhqM+ls0rd1vTsq4CeEEBaMngNAdCIYk7IqMOAurcOMovWi
         1Lq7h8Yi5GUtgIpIS5kuNn+6s+bK5yE6poMUCxU1+92f51OdNh9onJ0Mo4DUx/UXxPWV
         PmAw==
X-Forwarded-Encrypted: i=1; AJvYcCVSBBhWOiZqe5xHY1L2RRZMDjUIrZsI5om3EvxPQvXfgDOD643ll4u7omw4U156yojq9p5/rBDKntQx@vger.kernel.org
X-Gm-Message-State: AOJu0YyiBsdQYl0fNrH4plMrVcjD5FoC/9VNRv0+87mgSY7l2RrWdr9t
	mHS8anpbhVfJi+x0H14YdbNRryhBL0Uwx/9ODZZrCNtvNheoOCr9oNPiJYx5p21Yszs=
X-Gm-Gg: ASbGnctvcVMnIIbCGRtt65Xqcait0+45PpQe+IJ+9qFxxq7rsPPLweacEx4/PS6z3Z3
	Qa9qa00oVHZCB6ABTIVVph+gF+zYH5GBSGpBMv2z3QIOrz9/zGWeqvG0KDhJ8Qc+pMF6aDpbXk1
	lVS6/naEVv4AXdTvzdjAYrD+JdagyM1lm74sinRGbnDuJ7E4d0jNCeKDCaRnHxRsCGEMWSgTMfA
	1oHA9gSz8ACd7OmemrXGW2mASqbEeVyZ+ocdnLdkGB2cn0RJEBfEL8EjZ8f8JYuhqKAlRbw7yoJ
	xfdtHhJ1svYNfHDc3z/R1c5rvDkm1Bl91r8xISL4VBFZeJ/UQV0KW7DbmirifZsL/D1WjBFbYbn
	JJoy8NylLsKXiszrjMg==
X-Google-Smtp-Source: AGHT+IFFepUYI+bxIRTxDUeMnPHpoc8pmGJqVENaUjjXrMHXXy2WRVR0FTskPq39jX17KmytYEjexA==
X-Received: by 2002:a05:600c:3b04:b0:439:86fb:7340 with SMTP id 5b1f17b1804b1-45b517e9d34mr225147805e9.30.1756396830367;
        Thu, 28 Aug 2025 09:00:30 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4933:4d7c:cf69:9502])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b6f0c6fe5sm80211675e9.5.2025.08.28.09.00.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 09:00:29 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 28 Aug 2025 18:00:15 +0200
Subject: [PATCH v6 07/15] pinctrl: keembay: release allocated memory in
 detach path
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250828-pinctrl-gpio-pinfuncs-v6-7-c9abb6bdb689@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1867;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=qPaUa8oAewMMgl8vCYU8JU6h4WrDoK89nonD2PTBKh4=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBosH0OrC02A7A3w/syOmHWmFD75kiKFWOGyfOfU
 IkOZw9hCMKJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaLB9DgAKCRARpy6gFHHX
 cog4EACpRHc2z4CEO5/+sWycbTJ/Lv36XdsRhCdryTDmJugI9ckFKoQSZSCDj/EPSYTLap4IRcK
 v9nSbe3GHgyhCBsI4oPZRLALF/GxIpu/uT6Km1hMYNz0BKb73ON/KkKX2YjD6FDJmZxw+Vu6UVN
 WM9eKdip1jecx1xnrqabz4R4N+ToGOw8uBEpUBFz+GxzItCcchdLGaDiVu5sSr+vQqBIRi02YVw
 nMlphUxtITQbANQYECx1Nv1wP0FC3z/NrADiA7uTJmmpoQ9/oGlBIxsk3oaFapoPnuJGo3SJHgW
 mmck7aZcXXhlAVZIiw9AIJJh/pgBI9uk7x1EcsNXWmikxyDmqd6lCXPMdIoknKVfyRqWnkCSgQ9
 TXbSuYZKBlETf4DXch3J0+3Gzk048a+TZ3AGds07+/KPC1otJhyxKQk9l33053cVyeXhjYOH12w
 NmL9X+K1QkmH632UgY1mZUockXDkxaq77pVHpq7LhuGkPXIO7OQ4Z9s6joU6MzhxlIPSvHywpkm
 eO/vZTvIhUNoYQh3fEW1qBuMVuvoh9jDfivIMlZC5aDXleNbJrQTlT9uKils+YyNyOsXfM9sejY
 tdyEgsTDn1lfM8sKVtJe8RRgFOBmDbxsHb04CG5Olf9wBaVFRC3YBSJ5c5ro5ldHl3e+V93Ildw
 o6i4ZvyV6pa1cVg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Unlike all the other allocations in this driver, the memory for storing
the pin function descriptions allocated with kcalloc() and later resized
with krealloc() is never freed. Use devres like elsewhere to handle
that. While at it - replace krealloc() with more suitable
devm_krealloc_array().

Note: the logic in this module is pretty convoluted and could probably
use some revisiting, we should probably be able to calculate the exact
amount of memory needed in advance or even skip the allocation
altogether and just add each function to the radix tree separately.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/pinctrl-keembay.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-keembay.c b/drivers/pinctrl/pinctrl-keembay.c
index 60cf017498b32a9f36a1f8608e372951c2b8f12a..6aefcbc31309995ec1e235416b40aab3e4a073a9 100644
--- a/drivers/pinctrl/pinctrl-keembay.c
+++ b/drivers/pinctrl/pinctrl-keembay.c
@@ -1603,7 +1603,8 @@ static int keembay_build_functions(struct keembay_pinctrl *kpc)
 	 * being part of 8 (hw maximum) globally unique muxes.
 	 */
 	kpc->nfuncs = 0;
-	keembay_funcs = kcalloc(kpc->npins * 8, sizeof(*keembay_funcs), GFP_KERNEL);
+	keembay_funcs = devm_kcalloc(kpc->dev, kpc->npins * 8,
+				     sizeof(*keembay_funcs), GFP_KERNEL);
 	if (!keembay_funcs)
 		return -ENOMEM;
 
@@ -1634,7 +1635,9 @@ static int keembay_build_functions(struct keembay_pinctrl *kpc)
 	}
 
 	/* Reallocate memory based on actual number of functions */
-	new_funcs = krealloc(keembay_funcs, kpc->nfuncs * sizeof(*new_funcs), GFP_KERNEL);
+	new_funcs = devm_krealloc_array(kpc->dev, keembay_funcs,
+					kpc->nfuncs, sizeof(*new_funcs),
+					GFP_KERNEL);
 	if (!new_funcs) {
 		kfree(keembay_funcs);
 		return -ENOMEM;

-- 
2.48.1


