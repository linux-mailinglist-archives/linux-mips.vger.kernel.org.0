Return-Path: <linux-mips+bounces-13890-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0FoiOjF0wWkQTQQAu9opvQ
	(envelope-from <linux-mips+bounces-13890-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 23 Mar 2026 18:11:13 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EBA5C2F98B8
	for <lists+linux-mips@lfdr.de>; Mon, 23 Mar 2026 18:11:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 67D4D30A0A11
	for <lists+linux-mips@lfdr.de>; Mon, 23 Mar 2026 16:17:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 019D73BD634;
	Mon, 23 Mar 2026 16:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N6u4mQ7H"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B0F63BF67F
	for <linux-mips@vger.kernel.org>; Mon, 23 Mar 2026 16:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774282603; cv=none; b=ZhaYwr33aWVbf/L3zR1G8V68LQJSU9bircKW2g9Jw6C28lNqD0B+6XSB/1TDQPpDMQQtxrNb6cgn7MasLuSpuG0aHrZ7VIwjvixiRGrEJyqX/IK2Tj8KsGcu5QNTRrH3yraLwjdxmBrg2YeAn1z8gNpXKbk12//CiWQ0uDJnPf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774282603; c=relaxed/simple;
	bh=SFCFFwHLQsmCdrpuqlJCrhc5Ygf2e1G8qXrq4SXv7os=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MwXHJFnfLtQQdF0TlaNTwZEva47IIItsgfDTfGT3gZ7MPFqP2r8orLTSXe2v1JKuI9a/MkFwS3US6B9IrbTEIOrGVorbjTNZP6Kn76cDUvTVyZ77UzBF/6e+t4Gn7f2+sgFAschsdlNyz58ShDx02PrreN3mUMINyaPi7oeyp7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N6u4mQ7H; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-486ff201041so24431615e9.1
        for <linux-mips@vger.kernel.org>; Mon, 23 Mar 2026 09:16:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774282597; x=1774887397; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UO+SkoI9eVt74xNLLkIIUZ5Y4CPfHlVSwCp47CpWJR8=;
        b=N6u4mQ7Hgb1gF1cZcBRTyezt7fM5d6Rhg7pd62rSDv/WsDjxbRj9+gw8cc69RJKzlj
         2380kYSzDtecDcXwIvBFN1L5z3YoRuuTY343iT6FXD1x8wIHQPaFwp+L+2Hwt+hYUWYN
         05NaxWuk0ICApC5gBNHRaWNCsylhz+pleLfzybAVuJG984qFY+m4543mglQ5WNgQkTrZ
         OKgAVivPM/4y+H9WSuH5zlEXyK60QiWq7nEnnFpKY7P9S6uzEXJS5twZOu5mAqi+8u3m
         osob5aSGmi28qfAFneB+tzc1uC5frFwi2FakbLjn2YaEHVWA4LyXMilVDf9cahb9RMDz
         Sepg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774282597; x=1774887397;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UO+SkoI9eVt74xNLLkIIUZ5Y4CPfHlVSwCp47CpWJR8=;
        b=fksQA5FqVTLoRmGO6nmTy9hw1mRGiiczTL59b+gznjG+18oDWPMd6mbORSgLYsB3ZO
         0/h4W990LcIYU/nUbp6Hce2DvxMS2FxaBg8xfPgur0ICLq0tmyQaYHYPmv63eQmYDKSs
         pED74YQMhYd4WFlr7TwYYSj/P17OY1z5bLwuetvrL+StvzROI236xKcKbO6xJmtYe4Y3
         AHt1E59KIPGWzXTm24bIkS++5xNb/da9xQdIqgzifzs93khwtlovHX70PY6XHrIm+YZI
         81H5UAnX+wkCgr0raXxPMnWrhVx3A6LOfTej3vBZLXgM292M2Sc2FemY+QOyAmmzX5sy
         /1Vw==
X-Forwarded-Encrypted: i=1; AJvYcCUNEXw9dSoZdbMQE0pLhEEVdIageXpa/MNfSSRGblvTsJU/cgK6V/jqSxw5ISNIyKQnEUXCvufc5E84@vger.kernel.org
X-Gm-Message-State: AOJu0YwK7Hz92uWU25HPTvZ6JitUHWlrO9PTsAAm4Nna8uGT/cX7IvNs
	VJuGYTcCcO4hzYffzvGVzE4mo2Y2UpgBHID5V3jcIEyRvkjBbfJHVJU=
X-Gm-Gg: ATEYQzxaVqkUMI+eQnzmwvHoi06f7zX4uwVMcvheDPbfKRZFbZHADOSvPNwNECZCL/U
	h29oaF0/Qvh5ES3nymtZchyExq2z6GQGK3U33h12kNytAub+0Blr4/KgN41jqBAu8KUH3E+gYnP
	jDnU9HTzJq3iLvE7IKtbniPoWiQFoyGii7Bk2K9Sf0myR4SBd2c6cUdNq+7Um3ZLgVuvT3JUbgR
	vmgVmLRMgnkEDqnQER7KQLDh/kU+VcGXIFHARGq4wBM8L+XIR+ztnonkoXNUEceOT2qngPBsqBU
	KVj3O/kueAjV4WpL/n4miz3Lm3mE9qtYTETrm8rqlXYJpgypXZNsp/5snEziTMBtAnQhR0MjO6i
	qfeSZ55YaeJBWBaEC3Xbl/Q3BwfS8P+otmb5NqYq/MipkeVf2mUaDNwkzLMGv6U2St6iT+Z+uKt
	SKj3VjErqkrUH81Ip+IjrIFD9TAjBaR0sXxw+mLYuugw==
X-Received: by 2002:a05:600c:4705:b0:485:3f17:425 with SMTP id 5b1f17b1804b1-486fee04a53mr175550015e9.21.1774282596969;
        Mon, 23 Mar 2026 09:16:36 -0700 (PDT)
Received: from localhost.localdomain ([78.240.51.139])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f8aacc73sm331863395e9.0.2026.03.23.09.16.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 09:16:34 -0700 (PDT)
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
Subject: [PATCH 2/3] ASoC: jz4760: Convert to devm_clk_get_enabled()
Date: Mon, 23 Mar 2026 17:15:50 +0100
Message-ID: <20260323161551.47181-3-jihed.chaibi.dev@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,perex.cz,suse.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-13890-lists,linux-mips=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jihedchaibidev@gmail.com,linux-mips@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-mips];
	RCPT_COUNT_SEVEN(0.00)[9];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: EBA5C2F98B8
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
 sound/soc/codecs/jz4760.c | 20 ++++----------------
 1 file changed, 4 insertions(+), 16 deletions(-)

diff --git a/sound/soc/codecs/jz4760.c b/sound/soc/codecs/jz4760.c
index 344c251be397..6846ace06415 100644
--- a/sound/soc/codecs/jz4760.c
+++ b/sound/soc/codecs/jz4760.c
@@ -163,7 +163,6 @@ struct jz_codec {
 	struct device *dev;
 	struct regmap *regmap;
 	void __iomem *base;
-	struct clk *clk;
 };
 
 static int jz4760_codec_set_bias_level(struct snd_soc_component *codec,
@@ -602,25 +601,13 @@ static void jz4760_codec_codec_init_regs(struct snd_soc_component *codec)
 
 static int jz4760_codec_codec_probe(struct snd_soc_component *codec)
 {
-	struct jz_codec *jz_codec = snd_soc_component_get_drvdata(codec);
-
-	clk_prepare_enable(jz_codec->clk);
-
 	jz4760_codec_codec_init_regs(codec);
 
 	return 0;
 }
 
-static void jz4760_codec_codec_remove(struct snd_soc_component *codec)
-{
-	struct jz_codec *jz_codec = snd_soc_component_get_drvdata(codec);
-
-	clk_disable_unprepare(jz_codec->clk);
-}
-
 static const struct snd_soc_component_driver jz4760_codec_soc_codec_dev = {
 	.probe			= jz4760_codec_codec_probe,
-	.remove			= jz4760_codec_codec_remove,
 	.set_bias_level		= jz4760_codec_set_bias_level,
 	.controls		= jz4760_codec_snd_controls,
 	.num_controls		= ARRAY_SIZE(jz4760_codec_snd_controls),
@@ -818,6 +805,7 @@ static int jz4760_codec_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct jz_codec *codec;
+	struct clk *clk;
 	int ret;
 
 	codec = devm_kzalloc(dev, sizeof(*codec), GFP_KERNEL);
@@ -835,9 +823,9 @@ static int jz4760_codec_probe(struct platform_device *pdev)
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


