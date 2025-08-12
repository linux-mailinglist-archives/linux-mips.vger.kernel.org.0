Return-Path: <linux-mips+bounces-10212-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 30CE6B220C5
	for <lists+linux-mips@lfdr.de>; Tue, 12 Aug 2025 10:27:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1BAA01AA408B
	for <lists+linux-mips@lfdr.de>; Tue, 12 Aug 2025 08:27:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 480F62E284F;
	Tue, 12 Aug 2025 08:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="QgPZfl2s"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6F5E2E265D
	for <linux-mips@vger.kernel.org>; Tue, 12 Aug 2025 08:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754987233; cv=none; b=YCtysHgazswFbet2Fc7kRMULXN/hqAIY/istbpbK2REtLca+pw/40b8RTxFJQE6HpQwiCvz/Ze7PPhzFfet41g6rtVJI14aAMnPeOTYy480i7ulXi/Wj4QlCUrqYGN9M5Oc1lYiqIs88zerMsP2KGTdCMJf93T2ojqaR57u1etU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754987233; c=relaxed/simple;
	bh=bNsQPb9AwqRnxouMDlFzcHJphF1Do/Kcrq8+ZqSjYVs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sKn5Uie3xMppKY+g/HySnjAvlRcpm5pbVTtfKDDvNCf5fPR+OY28R9h7XrpdX7qj/XPbq7J+JuuUEKg+bzkoMpjoO6wr8xV1ZwXpPwopzZCG+oW5p0DJqkmVFdUHr0Qz3aJxjuZcG3CEJe4CZluLVnKdFdLlZb0WkO1viXGC2nU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=QgPZfl2s; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-458b49c98a7so32979625e9.1
        for <linux-mips@vger.kernel.org>; Tue, 12 Aug 2025 01:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1754987230; x=1755592030; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HTgIYPzRiaE3tZSZCUJbaKi97GRLZz5syZCli9/nEr0=;
        b=QgPZfl2sW4dc5ZBASFbhZ6LnAguM1EhnVEsiEpBlgk2e53Ql3v0+xUdhMCxvCvsL/w
         4ckDfrU4Z1I32aiQQL7T9Eu7AHSovvqEjhr1scutbyj9zhy0uikLnnRprs+ddWBOCDCy
         d6vDPwoFM4srssi/ZZjgTbhbC7pG4gtdvqGF/Ltzl1lz/+E1yA4nCHnTNil+oBPWbOlv
         LKEtc/cpUeea5HzHG2dOOXAM3xbjA3V/LA2nJAm0Q+dz6FVJ+EZWJFWiVbLLju/3VpIO
         gXeoSF0GGODKC/KFVY3ByxZ9noEKBHT+THdCT9zld/Nyh8wZCqeI6xoy+o9mW80Zkke0
         rg3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754987230; x=1755592030;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HTgIYPzRiaE3tZSZCUJbaKi97GRLZz5syZCli9/nEr0=;
        b=a6UIZRK9ittZiMxInuSZs2UpLFOW9g1S1Lwo8nWLA2Lj2CklSazLgWGoft7tcfEHvN
         nRPKQ4xA1OgbcJs+nh7a06v4QUClyX5yRRNsMdEviJsPR5FJjxvREWlrxEqALgFm7udU
         58Lh/rHNeEh4WhwDDiLePNDFcPL405MwQ0YToI9g95zZVnwEkUb+k8QHc/h7iNLKwe/1
         XTkkj8QEH5VG81byAAc2Gc5lL0wBRfJ/B594Vc2qsLKff+FTikcNSOpq7FP+6JfFEWOX
         37RNTdYqQPl8ZJ0mR5ByAYDRib43+SVmxZLeHHavhY2fXAe4KRwuSyZ4R9QYGUeRzQt1
         i1qw==
X-Forwarded-Encrypted: i=1; AJvYcCXw3ezImLP5P3PlTFWRJKG04OAd0J9qLFAZwt6Xb0VYHq88FHLpbW/eQAA0cHrpXooVH1WFCLtLCNC7@vger.kernel.org
X-Gm-Message-State: AOJu0YxCc1gYBOdj3WLTo/SPfzN8Tjbfkk9907YwnNiI5Hh8Fqa8tmaT
	GwyjcekihdUyGLhOialtOTklVqaxulMSofCoIsYk3qFr+o5gmo68ZWDHFqbpsqKYLIo=
X-Gm-Gg: ASbGncvfh2UIhc2cRg7zxXxG6XfJ5z7VpGPcXbhON+nyhN86IFw+1/a3Eg8lHXfescb
	eZE8hi2B/XCNB8cHgmSD6iNK19zt4dgTdvTbF4jeuK1jXecHXql36+E0X+i1XL1HCjETMnF+Cq7
	DpZczZmHVD7z4kl4gha7ckzcYrQq5ekZTTzzgSKWw2yLUp8/YknII/+upe/wJdToKQV0ir4+Yb2
	iCZck915W3X4Aa1WuVGo5XleLaQ9Ulan1tFUDTVjuEq8qYzF2QBh8f/who0moG8IGlWposet9Sl
	Az7ygOiYQC9An/ri5OrZxPqgibIWudWXwxExIEI05hz3wIVgSYq2QWNCcGXGtCO0df3RJIN9ZvD
	DzZClL8RxONFeDb8=
X-Google-Smtp-Source: AGHT+IH2gcGBdQpuT3RXzrIq10+dePuK4J44tZFpcWvxuc+mjI/75XhCe1aSLOq9Ow+V0+SkeWNRig==
X-Received: by 2002:a05:600c:1f0d:b0:459:df07:6da4 with SMTP id 5b1f17b1804b1-45a10b9b16cmr23623335e9.5.1754987229745;
        Tue, 12 Aug 2025 01:27:09 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:16c8:50:27fe:4d94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c3b9386sm43549423f8f.18.2025.08.12.01.27.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 01:27:09 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 12 Aug 2025 10:27:00 +0200
Subject: [PATCH v4 01/15] devres: provide devm_kmemdup_const()
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250812-pinctrl-gpio-pinfuncs-v4-1-bb3906c55e64@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2063;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=Igk+yDN8BP1JkTjLlRhKQ7SRJ5My7JH94ZAwq+/yocg=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBomvrWHo270jKNT7TR30vMTLvJtquAQ8DkFhjQc
 ewt3zLD8DaJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaJr61gAKCRARpy6gFHHX
 cjXuEADPonktCGWYlKywp9d3HO63lp5DL98Fa5df96en6tECd7hEXtS99i9LAByEf9gB+XIzpYT
 bn7HKsMznjan6cqY/js2/PmDrnfrTaS8GMTWnnVOxndSGotuSFmQ3zk2ssQIvblDxvtxEK/VfWs
 Xorx6opZLXirGk7awxEDwydn2R24ZBfAv4HNzCaPxdZDR5jPuBK3Y2Sz9Z7zxOLkgCA/dFSI/VC
 EiaB0QwENlBXLbDTWm+FBJKFkgyLBaaelM7rRmgWagtEkB6QDH4aDB2BeQn46Fwrx5thDVEjHzS
 fyE7pWZD/eVoSgnClKMYjtwFSECf860vmV3a0SYw2OQWjdtR6GDu3H9s05ASNdUyHuSY4YiLG9n
 JVpnETaTHpb9lSDi3vb0asDKaLIcBMaBkG4dWOWsNqs5Z91/qSP1KRMVbnpNI91WMeQ2as7u3Cd
 m8zJYNga6cC9JfwhC+54Q4ijTmVTGa6tqyxkNqWlsEm7M5jjCpIRR07fAODaqKv3MIgXA//89QS
 iCwpz0h208VuntqHpkRusRFTEDihMX9aqBRpvGkYLphyCcDXTK5bT1bOhByWDi4UnlmkZGRK8C5
 Ciga46g5hgKGVQM1Nkkit1mjBI1xoc0CaHoC4+KXTbzTIormwWsZBSPMKWcYUwOzlpENKo0Z34/
 nBWlmLjGY27IFaA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Provide a function similar to devm_strdup_const() but for copying blocks
of memory that are likely to be placed in .rodata.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/base/devres.c         | 21 +++++++++++++++++++++
 include/linux/device/devres.h |  2 ++
 2 files changed, 23 insertions(+)

diff --git a/drivers/base/devres.c b/drivers/base/devres.c
index ff55e1bcfa30057849a352c577bd32f1aa196532..c948c88d395607ff511ffa6eb0a75b7847ab9239 100644
--- a/drivers/base/devres.c
+++ b/drivers/base/devres.c
@@ -1117,6 +1117,27 @@ void *devm_kmemdup(struct device *dev, const void *src, size_t len, gfp_t gfp)
 }
 EXPORT_SYMBOL_GPL(devm_kmemdup);
 
+/**
+ * devm_kmemdup_const - conditionally duplicate and manage a region of memory
+ *
+ * @dev: Device this memory belongs to
+ * @src: memory region to duplicate
+ * @len: memory region length,
+ * @gfp: GFP mask to use
+ *
+ * Return: source address if it is in .rodata or the return value of kmemdup()
+ * to which the function falls back otherwise.
+ */
+const void *
+devm_kmemdup_const(struct device *dev, const void *src, size_t len, gfp_t gfp)
+{
+	if (is_kernel_rodata((unsigned long)src))
+		return src;
+
+	return devm_kmemdup(dev, src, len, gfp);
+}
+EXPORT_SYMBOL_GPL(devm_kmemdup_const);
+
 struct pages_devres {
 	unsigned long addr;
 	unsigned int order;
diff --git a/include/linux/device/devres.h b/include/linux/device/devres.h
index ae696d10faff4468a41f37b5d5fd679d4ff11997..8c5f57e0d613492fd0b2ec97dd384181608192fc 100644
--- a/include/linux/device/devres.h
+++ b/include/linux/device/devres.h
@@ -80,6 +80,8 @@ void devm_kfree(struct device *dev, const void *p);
 
 void * __realloc_size(3)
 devm_kmemdup(struct device *dev, const void *src, size_t len, gfp_t gfp);
+const void *
+devm_kmemdup_const(struct device *dev, const void *src, size_t len, gfp_t gfp);
 static inline void *devm_kmemdup_array(struct device *dev, const void *src,
 				       size_t n, size_t size, gfp_t flags)
 {

-- 
2.48.1


