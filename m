Return-Path: <linux-mips+bounces-7461-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D3EAA121FE
	for <lists+linux-mips@lfdr.de>; Wed, 15 Jan 2025 12:03:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2A4813AA527
	for <lists+linux-mips@lfdr.de>; Wed, 15 Jan 2025 11:03:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D3952135B8;
	Wed, 15 Jan 2025 11:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pTzGJov5"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3509120764C;
	Wed, 15 Jan 2025 11:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736938992; cv=none; b=ShKl2N8kzW9Toj1EX82XPlc+r8VhHE/o3R7O/r0hz/hGjJeWWjOLS9YDdsnuS0Hjn5ANdP/pAeALgCZyrxu8SsPQ50BjN+fmdVTk2O3caZXYwEeJKh9s/QCe4uiZpTt8g51S3rqxlVmWlhgR2/8zjACRJ2uBPMW8MJtod8x3FXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736938992; c=relaxed/simple;
	bh=5Tc53pxjVxa86rw6gH92zMKZ+MrFWBmscHtIF90fUbw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lCzBEAB63t6IufJR+Xotsbkw7PIs42VdP2kdtxVr8CoARWjEbIuWQDM4JF5wT3NDcvjdoRtZ22ITEmk3u+AgwL6unLbP50QwA+Tm9KIoBoNl9UgWraiXTj7Y9smCgeyY2gf1zO88j05iNZMdkPr92+taUMkmfQouWF5zBWS8H/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pTzGJov5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id C15F0C4CEEF;
	Wed, 15 Jan 2025 11:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736938991;
	bh=5Tc53pxjVxa86rw6gH92zMKZ+MrFWBmscHtIF90fUbw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=pTzGJov5BI8ygk9TjEhr9sRqV4E26IyqdmjmZ08uXiHU32psxDS8F1RF4wOcP+oOD
	 CZomfHpXzx/MsP0TnTOYcUsb/OHczb4lq6Q7QuzOYcnCv2C2bIRr7CEK7b/ww3oF7x
	 GnghzarRf7cVH/EMCXKHwyTfDSrtiXagsqRDpLAe1dkE2w7W9aFOYqlWKI56zqpipE
	 b/ClmdWZhpgOuGya3sNAxql5cc3Uqf4l9IV2beCtGCTAL2qEn2YFeNk/H8n8YfvEoD
	 BJdoViljb4ytMLUfQGwtce949Uvek5dK2CAhJLsmMkMv08LD3mspfDKh3R5ROkrztU
	 KTejR6d6Nk87g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8481C02180;
	Wed, 15 Jan 2025 11:03:11 +0000 (UTC)
From: Keguang Zhang via B4 Relay <devnull+keguang.zhang.gmail.com@kernel.org>
Date: Wed, 15 Jan 2025 19:03:10 +0800
Subject: [PATCH 4/4] ASoC: ac97: Add DT support
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250115-loongson1-ac97-v1-4-2087b04dcd7f@gmail.com>
References: <20250115-loongson1-ac97-v1-0-2087b04dcd7f@gmail.com>
In-Reply-To: <20250115-loongson1-ac97-v1-0-2087b04dcd7f@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
Cc: linux-mips@vger.kernel.org, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Keguang Zhang <keguang.zhang@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736938989; l=1140;
 i=keguang.zhang@gmail.com; s=20231129; h=from:subject:message-id;
 bh=zOmvkdjOxEXNVbs0rnSsZ3qVKBPQtGNTr4XJg6yjJq8=;
 b=P3yzqblD2o8EvaKdf1XdWZyErWlDtmcrozd2JItjI9VlRkcQ6Oc8T6bKAVD98NtFYo83e7Xtd
 3jrW3XshfJrBQxWVVYLgzb04iqushcMCQMrnCIEyRr5PkD7l0+kJLgP
X-Developer-Key: i=keguang.zhang@gmail.com; a=ed25519;
 pk=FMKGj/JgKll/MgClpNZ3frIIogsh5e5r8CeW2mr+WLs=
X-Endpoint-Received: by B4 Relay for keguang.zhang@gmail.com/20231129 with
 auth_id=102
X-Original-From: Keguang Zhang <keguang.zhang@gmail.com>
Reply-To: keguang.zhang@gmail.com

From: Keguang Zhang <keguang.zhang@gmail.com>

Add an of_match_table with 'realtek,alc203' to provide
DT support for the AC97 generic codec driver.

Signed-off-by: Keguang Zhang <keguang.zhang@gmail.com>
---
 sound/soc/codecs/ac97.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/sound/soc/codecs/ac97.c b/sound/soc/codecs/ac97.c
index 0e013edfe63d..d8444a083af2 100644
--- a/sound/soc/codecs/ac97.c
+++ b/sound/soc/codecs/ac97.c
@@ -13,6 +13,7 @@
 #include <linux/kernel.h>
 #include <linux/device.h>
 #include <linux/module.h>
+#include <linux/of.h>
 #include <sound/core.h>
 #include <sound/pcm.h>
 #include <sound/ac97_codec.h>
@@ -127,9 +128,18 @@ static int ac97_probe(struct platform_device *pdev)
 			&soc_component_dev_ac97, &ac97_dai, 1);
 }
 
+#ifdef CONFIG_OF
+static const struct of_device_id ac97_codec_of_match[] = {
+	{ .compatible = "realtek,alc203", },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, ac97_codec_of_match);
+#endif
+
 static struct platform_driver ac97_codec_driver = {
 	.driver = {
 		.name = "ac97-codec",
+		.of_match_table = of_match_ptr(ac97_codec_of_match),
 	},
 
 	.probe = ac97_probe,

-- 
2.43.0



