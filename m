Return-Path: <linux-mips+bounces-13889-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +EpqJWhxwWkQTQQAu9opvQ
	(envelope-from <linux-mips+bounces-13889-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 23 Mar 2026 17:59:20 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C85E2F93DF
	for <lists+linux-mips@lfdr.de>; Mon, 23 Mar 2026 17:59:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1D7DD31B2A04
	for <lists+linux-mips@lfdr.de>; Mon, 23 Mar 2026 16:17:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C7E13BF686;
	Mon, 23 Mar 2026 16:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DfL7ZP4L"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 341463BD634
	for <linux-mips@vger.kernel.org>; Mon, 23 Mar 2026 16:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774282599; cv=none; b=CF32s4sodr51HHRp3wFCs3cQsKeb593wp1+OqiNPnq91vj23yJNYRUuEdnjjVWVhGps0HFILTvRNvyEci0U98/xnRoWqYdUKinU/DOW1nuLW0fKDOSloqR7/hzgHN+Kb500itwRVXSQ+a5Nx+pUClwRDQAAnlraJIBlxO5PavOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774282599; c=relaxed/simple;
	bh=g8+Hj0Vb1Y/88a17yOow0ZjQc6l0noTQuUGZxhIscS0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e8+k4MixeAfGvRfsVr05tqA+jzj+SIm+BxeudHuk9dYeoWU7sIqoSYEaVk78DMTM0M4eyCdLD+dC4Q1ki3/LXfRdXCiQcq+fXlK/v8BBLRmDDloHVA5vf5im14UfjndGGrBAT2yitddybhYfxPSIKN7CAJsPL0nW4XP2rJLm8LQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DfL7ZP4L; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-486fb439299so35302815e9.0
        for <linux-mips@vger.kernel.org>; Mon, 23 Mar 2026 09:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774282594; x=1774887394; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8e14EFbUgBOZGsLZ9xhCm0kYrey9UscJoVzYYnSs0h4=;
        b=DfL7ZP4Llr92HekVW2kyP2b4s9Qyu1vsgQfyaskD9FbZ4dPGD3IdrcpP8MRCRMo8a7
         +SmkE5IcF9Kdn06p/ka3nvaVpTn/Gn3E7vMR007RubPNkbHB9BHEiCLL1mBBmqdOHQe4
         d9K8k+2jQykdskGS3n7+IIh6en0YoP1Ga932SCTkuwiMBwxvssLNxB9wK5qmpn7wfTf7
         gkdv1nlOvMxZDXi69+SPOv6nEQdJE5LVYvvpgtNh7752gDNBR6jerpk7y/mIdgjUzrE0
         pIKwOYxI1wimzzfOPyTY6ybPyOySpxcZVKcH0r+NI+Sn/f4sy4bJtgwFU+WTB4e50x1Z
         vjbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774282594; x=1774887394;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8e14EFbUgBOZGsLZ9xhCm0kYrey9UscJoVzYYnSs0h4=;
        b=DICr2S2ahKGWDxXJNZmChSpqxjxLjUHXwIgXfqNDQxEIq8aXfqsxBVIW7a4wd9lskA
         HQl1tjocnqabNToJjeqSFVippYJfZrJaN4B0tYK5gL7KXqDTH3wcpUP4UtxMYLgLodWv
         c3Vaeo1UgNrScx6NQUMObmvLvQuZfTss14qyrDjQbEt1+i9OkEH9LbYc/+V+LaQFHuhe
         U1Sa37BKKn3H4pslddCYEo54kjClSxx5x2ndV3hA0QAIQZhsfSCvnRoB1Yc+Aa9R9gWz
         uZSwPSsPIDvLQirovPYvhSa0LERdoXVk2c9bapfL22tUaPHNnLjcSpVGVj8ibSpqDwyg
         VS3Q==
X-Forwarded-Encrypted: i=1; AJvYcCU1n62bIGWfnFfGvqw7GZ0heBT4SlW757AZgP/QI5a3m5pxW4q/zrEwTEadW8WW83OE9POETTPVRAVJ@vger.kernel.org
X-Gm-Message-State: AOJu0YwAyln8Ww5XveKYIDl59eJIfY6Gzprrr4NuuMAXBXYnb1Bx5PsK
	bT/z0sytxg2BULRWzirOuZ3G3kQHpvw1wijZWLC7gsG0CJXoqOYR5Pk=
X-Gm-Gg: ATEYQzx6F/mmW7/F4zp2LE8o//NySXXKYxZ9X5wmkVriL0uVV3JcgGEj9hRJGwYZXj7
	787NqteN1PRbx6pUTRumNXUKuRWImNWPH3clyTTbl3aq1qJI8pEw/vV2H0xmpgJM4PTJT8WppPa
	VC/BB7Se8idwE5wMsR8huWa0Zapd9zGtaZ4lBm6QAw3CptyQiSa3k3EhzDHw57vUjq79ssU6h+g
	0rHa4dYHQ7/G3ygzksaz8aSs0G9iQJNg4V8Z8wovgtQadEqA2g8vlkKU0SqAAbDbEv/jnJ1ET+b
	XneYrr5GdGZDrZpaY0ACc3Md/rvYiflJXvE4+Lj19A7I8ZZAtPjL30XfYkkJZGsCWzp93HUmpww
	8F4VAPXsesDzW0jiq7aN7uwDP/F6j0iozQdHjpPFtMm+hz0M7Ug3VOztE9JZdlT4X7U+Hp4qsAu
	+VvY1XVqDjb+uqW9BaJBb+AKEikRv3e76CpWclgLjSPmCi3kupgxZK
X-Received: by 2002:a05:600c:a59b:b0:486:ffa3:593 with SMTP id 5b1f17b1804b1-486ffa30b26mr96817745e9.28.1774282594063;
        Mon, 23 Mar 2026 09:16:34 -0700 (PDT)
Received: from localhost.localdomain ([78.240.51.139])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f8aacc73sm331863395e9.0.2026.03.23.09.16.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 09:16:29 -0700 (PDT)
From: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
To: paul@crapouillou.net,
	linux-mips@vger.kernel.org
Cc: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	jihed.chaibi.dev@gmail.com
Subject: [PATCH 1/3] ASoC: jz4725b: Convert to devm_clk_get_enabled()
Date: Mon, 23 Mar 2026 17:15:49 +0100
Message-ID: <20260323161551.47181-2-jihed.chaibi.dev@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260323161551.47181-1-jihed.chaibi.dev@gmail.com>
References: <20260323161551.47181-1-jihed.chaibi.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,perex.cz,suse.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-13889-lists,linux-mips=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jihedchaibidev@gmail.com,linux-mips@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-mips];
	RCPT_COUNT_SEVEN(0.00)[9];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 4C85E2F93DF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The clock is obtained with devm_clk_get() in the platform probe, then
manually enabled in the component probe and disabled in the component
remove without checking the return value of clk_prepare_enable().

Use devm_clk_get_enabled() instead, which combines the get, prepare and
enable operations into one call whose lifetime is tied to the device.
This removes the need for explicit enable/disable in the component
probe/remove callbacks, and ensures that clock enable failures are
propagated as errors rather than silently ignored.

Remove the now-unused struct clk pointer from struct jz_icdc and drop
the empty component remove callback.

Signed-off-by: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
---
 sound/soc/codecs/jz4725b.c | 18 ++++--------------
 1 file changed, 4 insertions(+), 14 deletions(-)

diff --git a/sound/soc/codecs/jz4725b.c b/sound/soc/codecs/jz4725b.c
index 39cebaa167be..8a7d26a08c03 100644
--- a/sound/soc/codecs/jz4725b.c
+++ b/sound/soc/codecs/jz4725b.c
@@ -160,7 +160,6 @@ enum {
 struct jz_icdc {
 	struct regmap *regmap;
 	void __iomem *base;
-	struct clk *clk;
 };
 
 static const SNDRV_CTL_TLVD_DECLARE_DB_SCALE(jz4725b_adc_tlv,     0, 150, 0);
@@ -405,8 +404,6 @@ static int jz4725b_codec_dev_probe(struct snd_soc_component *component)
 	struct jz_icdc *icdc = snd_soc_component_get_drvdata(component);
 	struct regmap *map = icdc->regmap;
 
-	clk_prepare_enable(icdc->clk);
-
 	/* Write CONFIGn (n=1 to 8) bits.
 	 * The value 0x0f is specified in the datasheet as a requirement.
 	 */
@@ -418,16 +415,8 @@ static int jz4725b_codec_dev_probe(struct snd_soc_component *component)
 	return 0;
 }
 
-static void jz4725b_codec_dev_remove(struct snd_soc_component *component)
-{
-	struct jz_icdc *icdc = snd_soc_component_get_drvdata(component);
-
-	clk_disable_unprepare(icdc->clk);
-}
-
 static const struct snd_soc_component_driver jz4725b_codec = {
 	.probe			= jz4725b_codec_dev_probe,
-	.remove			= jz4725b_codec_dev_remove,
 	.set_bias_level		= jz4725b_codec_set_bias_level,
 	.controls		= jz4725b_codec_controls,
 	.num_controls		= ARRAY_SIZE(jz4725b_codec_controls),
@@ -618,6 +607,7 @@ static int jz4725b_codec_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct jz_icdc *icdc;
+	struct clk *clk;
 	int ret;
 
 	icdc = devm_kzalloc(dev, sizeof(*icdc), GFP_KERNEL);
@@ -633,9 +623,9 @@ static int jz4725b_codec_probe(struct platform_device *pdev)
 	if (IS_ERR(icdc->regmap))
 		return PTR_ERR(icdc->regmap);
 
-	icdc->clk = devm_clk_get(&pdev->dev, "aic");
-	if (IS_ERR(icdc->clk))
-		return PTR_ERR(icdc->clk);
+	clk = devm_clk_get_enabled(dev, "aic");
+	if (IS_ERR(clk))
+		return PTR_ERR(clk);
 
 	platform_set_drvdata(pdev, icdc);
 
-- 
2.47.3


