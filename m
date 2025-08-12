Return-Path: <linux-mips+bounces-10219-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B49DBB220D6
	for <lists+linux-mips@lfdr.de>; Tue, 12 Aug 2025 10:29:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 455B11B6153B
	for <lists+linux-mips@lfdr.de>; Tue, 12 Aug 2025 08:29:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26D962E62CB;
	Tue, 12 Aug 2025 08:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="f8YcOLuJ"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C3F12E5B20
	for <linux-mips@vger.kernel.org>; Tue, 12 Aug 2025 08:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754987246; cv=none; b=Xa8627dd3/YGa02DALB8p1lQZgExmQAQWWCKOyl3im9QLO1ming48iTkXT69mkzKsNotYIuXZ03xHQQC5qxWfXrUtXyab89NXV4EOg9K4wWTBOB/9Cibtay3hcOZ2OAQk+1rRNSLqD4z/Y2nCcWlYPRpa0FrRfkt3/IndXuyzpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754987246; c=relaxed/simple;
	bh=8LckYYbv7wEiVDCoVOTbwt+nYJz1zV0AkW539eEIzwQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eh+9doxBbHYIowNhrfjU38UhEzHT7nCyQNG1rFcFm9AypUBGd+qJb7ldOLCpKpax4I40nOjqat55viGhI1UagJWYv1jgGyiHJ78DDeUpEcxPDpY/j46Eub75fbHwbRZkdshjcCamdFO864HkHm25ZYOQsbNwczy7LllQP9bbJVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=f8YcOLuJ; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-458bdde7dedso35366605e9.0
        for <linux-mips@vger.kernel.org>; Tue, 12 Aug 2025 01:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1754987241; x=1755592041; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rcnhHIb6eNEwdjxZYrigpF4SQxNgYqLi3t6s+DqhmIc=;
        b=f8YcOLuJWaGoKO3ukED1ZsheFdnSRu5+oB9sD73V5nMByxiz15V+e5dLXCdtR3zPoS
         5WdQLsn/RoE4Mjif/R0dCQ34iZ8BKbRiQXikHc0J5IiQEJJYO4p8YSw2BbuMIZrMzXjt
         DqOvaaSHYgA7cW/6YDepzSUcmIJuMLT5jf8/TbhJzss7bTiJ8BSJ5BRYCBoRnTRjqlzv
         Da387BNwVhnn4ee3QZhR9gDlVpf5IKqxYq2GW5Kh5LlSPy9X8SOnB0c/tRl5ANUL3AE3
         yi0EDPFEU+okfgwI7gt8DnkIXUrQEmjLUPBSCKT2Iio0XQKGY/EOHy1vG/WzadL2km1P
         UaZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754987241; x=1755592041;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rcnhHIb6eNEwdjxZYrigpF4SQxNgYqLi3t6s+DqhmIc=;
        b=Am334AuzBqDwgFUrmIYCVVJGMQUBdT1+/WbYrr8ARcxqg3lUejSua8RAP5//Nvt+wW
         17CbUrVf5IyVY3kLZ0Bpg4jf/ZT26R5j/pQZvwicqQ3gZBiqCCdKYE/OxNsxARKO0zTd
         MqupMbcOBSo9uBJIW0TGufsB+gJG8TqDeRCnHD6GjvuzDaM2B/DyS6VX0JoQKOBap9Th
         0Zm67KOYNwBmh77rBc5vzVIzI2D3KW9lm88Q1/aj04xUrCwFu77MsrWcVD6KUVL0h2ij
         tbiqSpwGQCY1PXLARbUNM/4HOf/afRKcNVkUMPzzPXykPb001jQqkFlwUT0d5b1ylJfi
         4pYw==
X-Forwarded-Encrypted: i=1; AJvYcCWJX/BXz9lBplTtAWNaogYCrXAulgDyjyysheTiEHMkoSjCaIaWfcZhGHlPSpT/hOmej44rLhjl+Pds@vger.kernel.org
X-Gm-Message-State: AOJu0YxneDdiWzJFaUTMCycoU1cP63DtdpToo2zgiCVZzv5iRgJdhjXy
	1dIpAhVD2olEN5hqpZR20gjpS5CCJa7aGlYfOSHY5dw6xALuF8/bIJM+wPaKvS3dmYI=
X-Gm-Gg: ASbGnctpRt1ahRcBlam7lKW6wOCFWxGMHDZclF6jdZ5f37kb5c9HrgAg+l1jIVbEoox
	wQ0O/6oSXsMZRguyh/XnsUg9vmI5T8xmA6wKp8M8DksoFXFJJlIwtBU7kxH5pt0CGGfQl2KAdFj
	MI9bZ3wssERB+tklKgVbSxldEE7TThcwK1bn8sZSl1xE3P4uM3w2XhYE8ANQhZOPQOlLhKYvS8c
	DQ+wySNoycpqCr93pUCfM4sowdy5em8SIDoIOAMtOFbIeTMo/4wJBRbrZbesbu83dmh9WasPvvI
	PoKTPVYAOqK3ji9J8k+V3LGp3fveDgAa7CEaZUcJ8lypHMn3PZd7mfcrDad+V2r+jKAo1K9hiHn
	pjKQRObXMcXXEHM4=
X-Google-Smtp-Source: AGHT+IE8fEgiEn9lwBjUv2uob+aBCzOy3kH39g3JVI8xm0JYVluln+IusGsEv24A0i5bbeOMk/kDAw==
X-Received: by 2002:a05:600c:4f91:b0:456:29da:bb25 with SMTP id 5b1f17b1804b1-45a10bf510dmr21937425e9.19.1754987240452;
        Tue, 12 Aug 2025 01:27:20 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:16c8:50:27fe:4d94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c3b9386sm43549423f8f.18.2025.08.12.01.27.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 01:27:20 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 12 Aug 2025 10:27:06 +0200
Subject: [PATCH v4 07/15] pinctrl: keembay: release allocated memory in
 detach path
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250812-pinctrl-gpio-pinfuncs-v4-7-bb3906c55e64@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1867;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=qPaUa8oAewMMgl8vCYU8JU6h4WrDoK89nonD2PTBKh4=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBomvrYc40u0edePr0EkIpRoNV/l6AhxW+gy+qoJ
 DRbu/5uoWyJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaJr62AAKCRARpy6gFHHX
 cr0FEADfv+WVcmzOaStfsm70mXUw69iAKQ+QB7ceZ9BjSwzet76pU/4gtWAVho7oelV+euRBcs0
 rI79EvWGS9pbM7J6fBEPxlORgTWjhZ68KXqcPbqBLiBSldQTY1ZILTMVi18urPLCWQ3mj+w+Kju
 4MbUSfSaeCLqLiFFCETd7te4vFDeDMpKmDmKxpTtqBqt8ZFzShFGXV2vxVtYLR7ztkmE1QAI3u7
 DzjZ7r/jkB0IfHAG0G7RyIfDdVHgRGGw/Luhe0ppGZA3Q3qJalbn0K487GB79PLQT36ptT2Ey6C
 kcr9rYtt9kyoaXybtesyYcENhiUdkUSP1StOc7c54IUPOjlZ6EDG7fD72/LrgzRnCtsZ/WADH0G
 w6u6iuLcYQdpYxtED6m7q6rfDBsuzq6tHiZ4w3rvfvjep0xGXNo6s3bwioOPlDCh7ldFD3AEAUJ
 Ulgn9cufPkFGzcCwVnEc0mRvdlTavOeHzjQIt77zX98T6+AGs9rBsIDvYazO+jzAIU0TRSy7QqQ
 8cE/3vgeDgTOzpTxfqdUm1HKwiHEuebwYuXdr2mI50EV4MjJbX6RN0C7XWKJjcLl7Q0l7aZRt4x
 MzKCL1YVBkfo6txurpQA3wRqXkgDFUW6ek8GoVdzy0LtGZirWgtY2Q3RAMVsBav9S02diTip1P2
 w/nGmj49yU8wsew==
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


