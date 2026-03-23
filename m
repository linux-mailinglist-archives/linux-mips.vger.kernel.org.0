Return-Path: <linux-mips+bounces-13891-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YCAzC3lxwWkQTQQAu9opvQ
	(envelope-from <linux-mips+bounces-13891-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 23 Mar 2026 17:59:37 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A04402F9401
	for <lists+linux-mips@lfdr.de>; Mon, 23 Mar 2026 17:59:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3A210315384A
	for <lists+linux-mips@lfdr.de>; Mon, 23 Mar 2026 16:18:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F2CE3C0618;
	Mon, 23 Mar 2026 16:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g+iniI/e"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58CF63BFE47
	for <linux-mips@vger.kernel.org>; Mon, 23 Mar 2026 16:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774282608; cv=none; b=sr+Eq5h2bPufxBqHKvlPfQgwP1r0DmFFI7XuKyTHA0sjQoVV/rzzdNApR2h63wPO4KJIzX5IiCZMSYdD+ANLdl9sO8Qawdz3AjGV+pQBcBIL55p5VbTsD2ZAETiEb0D9/WMQi4oGzQmksygjblGxUSJpRf3rQ3IC2e6YVJZAveo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774282608; c=relaxed/simple;
	bh=iXK6wvRyFqYcb2f+HT0HHDjAo809KzTB5lgU9a6PXM0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qii/dgB99UKnU48N21alHqVXYh7/v1C6lCq+Qf8dQMSZFRJ65YHuYP3DEFrKr/eI1BKnsSSEbZKBN08FTIEn1gK5ynq+ZStbziYeKSyQRVZ/77oFiv3FcadSgOURJk5KmIViWnJtjA0FW232Vf+3fa2uZ9e+j7B011g6iT7hAtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g+iniI/e; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-486fb112c09so27203755e9.1
        for <linux-mips@vger.kernel.org>; Mon, 23 Mar 2026 09:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774282602; x=1774887402; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gp4YODN/4k6phpMRYg5cRzJL2UKo8bXWoJWQxfk4Kow=;
        b=g+iniI/eDfcqqVVXzyBwiQCEzvWJoKmPSQu+Y4AWEyUguzdmeGYjes9ZALdXzAMeSa
         O/qhQMWUeP+M/vQVQlSVwvJJN2/NLs8Gv+77TbQVtFFlJvEc/5HiTMVU5aA/cfXhyp58
         SMSDd05RBa9EK2IlpU57kUMMNMsQcXmwOntGfIcylkzITigeoSUmlMd1cDy4VdcDgKC9
         i0LbYA6BDqMz9sI0vMC3HmG5SzPItuCzl3xTk9DFemgkoGm2FtenWDXzJEevcYE1I6dt
         Gwi+6wp7xOfecuUd0eDi7FxyJiLrdPNsuCGQHgX6Hi9ide/fxXCnmEcyAGP9pPjx9hox
         gCTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774282602; x=1774887402;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Gp4YODN/4k6phpMRYg5cRzJL2UKo8bXWoJWQxfk4Kow=;
        b=LWR0CsgLMplkgx0gZhyBGs84jJb6Khfo7l87NUx0aLjjjQy4BzPRLfrdqaRMri7GMh
         TEyXYpwH+uMUq9wZUBwrFQbp3nhGqOGULs2QOr88BqLysTd/6CAwAeVMrZHyRIL1zeX7
         zPT3WWBOiYeK5gmVG/V8Y98M6oR5geP2hrWmHMtfIyYQTLCM6lz5TfgGC5xgMWjj2XD3
         uTrNtiNDo4MCszGGMhuCETUDiGyK0Zp/j18Kl8HBgyHIXgSrnuAFieSVGhMgM4Xuw79F
         KRqI9QFfYGBrhDHxuGr/C/IRmLdYy68z5Pw10onigqOaYs4yKoB7as8OGs4t7A9k/XbE
         2Q9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUknyJJcbSzgVX1Edcpmucj7mjtxMZC8uYeTVuq1pqvKktxQI63MHqNCVxVQAMlMg2HjHAad/nAWWZ5@vger.kernel.org
X-Gm-Message-State: AOJu0YxabcqGPxY8DWiZ2c61o1vFsbsBLwNLN3cDpUWFWTui5aNAB4cY
	ZgJQ1xuzwYRDWD7vdm/t6cA2Puc5RgV6udKPOWjGuhDzP7bJT2Gh6vQ=
X-Gm-Gg: ATEYQzwn9FHVv7mLD2KlF4k19qYlPWVvOWlN8I1KkEpx1SJuXo8zb9VwH4zXDVA/8+D
	6Alz+wnS6SZYhzUVWVKnUrQMY2YgU0nM+OgQABYfm17jAV3EWiLXp6fLq0XiqWUeAz3Ab785vb9
	+be4i7MOCF0lijhV1bs2yymu7HVEeLfy+yavKn2J0X8E85FVXQTlwOJiQp03E3ctMvtmBQuTxvA
	nbGA66fmbuWk4NuoZKPDpdxVwcCXj8q4pk4I5shvgs5Yo9VBI/3P+Mmy/2AOyp8XBCE3prZkMhS
	TiIbzs81M95jEGOV1/oJkODs1RvY2r3igxHuS1wkrGwG9RKJTFKwEqTxHEiDXj33TNOY2hi2S7r
	tZFPELkwx3zXxMvQdP8z8RQzb9Qw5sSweQ9TTE38kCrFuZ1aelJDfMsdMg2GKk22TRAUo7n8qee
	1b54+Puaj2VjkWAU0vL5c2TpUKIkNJILMNLAIF/kmiGw==
X-Received: by 2002:a05:600c:3546:b0:486:fbdb:b718 with SMTP id 5b1f17b1804b1-486fee29536mr181005205e9.25.1774282601876;
        Mon, 23 Mar 2026 09:16:41 -0700 (PDT)
Received: from localhost.localdomain ([78.240.51.139])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f8aacc73sm331863395e9.0.2026.03.23.09.16.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 09:16:37 -0700 (PDT)
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
Subject: [PATCH 3/3] ASoC: jz4770: Convert to devm_clk_get_enabled()
Date: Mon, 23 Mar 2026 17:15:51 +0100
Message-ID: <20260323161551.47181-4-jihed.chaibi.dev@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,perex.cz,suse.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-13891-lists,linux-mips=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jihedchaibidev@gmail.com,linux-mips@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-mips];
	RCPT_COUNT_SEVEN(0.00)[9];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: A04402F9401
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

Remove the now-unused struct clk pointer from struct jz_codec and drop
the empty component remove callback.

Signed-off-by: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
---
 sound/soc/codecs/jz4770.c | 20 ++++----------------
 1 file changed, 4 insertions(+), 16 deletions(-)

diff --git a/sound/soc/codecs/jz4770.c b/sound/soc/codecs/jz4770.c
index 6b86d47028d7..be1ecdcc737b 100644
--- a/sound/soc/codecs/jz4770.c
+++ b/sound/soc/codecs/jz4770.c
@@ -179,7 +179,6 @@ struct jz_codec {
 	struct device *dev;
 	struct regmap *regmap;
 	void __iomem *base;
-	struct clk *clk;
 };
 
 static int jz4770_codec_set_bias_level(struct snd_soc_component *codec,
@@ -634,25 +633,13 @@ static void jz4770_codec_codec_init_regs(struct snd_soc_component *codec)
 
 static int jz4770_codec_codec_probe(struct snd_soc_component *codec)
 {
-	struct jz_codec *jz_codec = snd_soc_component_get_drvdata(codec);
-
-	clk_prepare_enable(jz_codec->clk);
-
 	jz4770_codec_codec_init_regs(codec);
 
 	return 0;
 }
 
-static void jz4770_codec_codec_remove(struct snd_soc_component *codec)
-{
-	struct jz_codec *jz_codec = snd_soc_component_get_drvdata(codec);
-
-	clk_disable_unprepare(jz_codec->clk);
-}
-
 static const struct snd_soc_component_driver jz4770_codec_soc_codec_dev = {
 	.probe			= jz4770_codec_codec_probe,
-	.remove			= jz4770_codec_codec_remove,
 	.set_bias_level		= jz4770_codec_set_bias_level,
 	.controls		= jz4770_codec_snd_controls,
 	.num_controls		= ARRAY_SIZE(jz4770_codec_snd_controls),
@@ -865,6 +852,7 @@ static int jz4770_codec_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct jz_codec *codec;
+	struct clk *clk;
 	int ret;
 
 	codec = devm_kzalloc(dev, sizeof(*codec), GFP_KERNEL);
@@ -882,9 +870,9 @@ static int jz4770_codec_probe(struct platform_device *pdev)
 	if (IS_ERR(codec->regmap))
 		return PTR_ERR(codec->regmap);
 
-	codec->clk = devm_clk_get(dev, "aic");
-	if (IS_ERR(codec->clk))
-		return PTR_ERR(codec->clk);
+	clk = devm_clk_get_enabled(dev, "aic");
+	if (IS_ERR(clk))
+		return PTR_ERR(clk);
 
 	platform_set_drvdata(pdev, codec);
 
-- 
2.47.3


