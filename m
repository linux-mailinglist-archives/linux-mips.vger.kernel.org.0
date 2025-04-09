Return-Path: <linux-mips+bounces-8529-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 18F4CA82216
	for <lists+linux-mips@lfdr.de>; Wed,  9 Apr 2025 12:30:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 688068C1FB0
	for <lists+linux-mips@lfdr.de>; Wed,  9 Apr 2025 10:29:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B912E25DB0C;
	Wed,  9 Apr 2025 10:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="StMW4ovH"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CCFC25DAE2;
	Wed,  9 Apr 2025 10:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744194600; cv=none; b=Cpy5sybc+t9Ng2k/qIN/wCYZIrcFNFXHcjzhZcorfc/5eMSpTnruG1y92kaHycU9Xwb4fIMdbYHnD/W/L9mYKMJ85zA9r2Jms9qdn3JnuT4GFHbNiMd0sD8T5rO6hFGt5J5Wwz6NVfrbS6haRF7SpxW7+6JFUIkHn/u3q4hGSGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744194600; c=relaxed/simple;
	bh=5Tc53pxjVxa86rw6gH92zMKZ+MrFWBmscHtIF90fUbw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=a4lNZ9/gCzjsJNNlEfoRYIHi1O+0cNX1gW4LtXO7qaerqdHMYcLzIZAkXPi+1b8KiadopF7jFbdNf4TheaeGt/JU/xh9CidKwDk0tQmz4qafqxmWKb6yH5gFZqvQJ5e9EtkRcwF+29v+0IWTszAwOVrF3CWQ8YqqxatdejZGSFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=StMW4ovH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id F366DC4CEF1;
	Wed,  9 Apr 2025 10:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744194600;
	bh=5Tc53pxjVxa86rw6gH92zMKZ+MrFWBmscHtIF90fUbw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=StMW4ovHSUyCy0+izavTlNwSpEpKr8rMeuYeFidLnUbP1k8f1+ROBtKZ/7L5TZ8+6
	 lkX4pA8L4hQsZ+1qVdhyr2/qhPiZtYT7F2g/uxI6j/TtdTD4+AhhA3Mfx30NuHwRM8
	 fPJc4Vul1+/FqUbZBqwrlsLX/q2FlY+47w3nJXSi/5LX+eaQZLn+Lon/sfB8n0+sMp
	 S5Lg7wwSj9dp68628kgFFlRDJP+7WN/OZs6XJ069bp3twRlCJTTgpeQyd66C2t1GWS
	 MaOMVkWI1AiXKgHKvDzrYCAef/XJEaKhvDo1DJxLQxvkTUMm6AlEQD6E+T5Vr9H3u7
	 2GRCr7Cosjxkw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E70F1C369A4;
	Wed,  9 Apr 2025 10:29:59 +0000 (UTC)
From: Keguang Zhang via B4 Relay <devnull+keguang.zhang.gmail.com@kernel.org>
Date: Wed, 09 Apr 2025 18:29:34 +0800
Subject: [PATCH v2 4/4] ASoC: ac97: Add DT support
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250409-loongson1-ac97-v2-4-65d5db96a046@gmail.com>
References: <20250409-loongson1-ac97-v2-0-65d5db96a046@gmail.com>
In-Reply-To: <20250409-loongson1-ac97-v2-0-65d5db96a046@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
Cc: linux-mips@vger.kernel.org, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Keguang Zhang <keguang.zhang@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744194597; l=1140;
 i=keguang.zhang@gmail.com; s=20231129; h=from:subject:message-id;
 bh=zOmvkdjOxEXNVbs0rnSsZ3qVKBPQtGNTr4XJg6yjJq8=;
 b=jfNHiiIkUNks040IkOBwMATTw/hJJ5gyDUmpLJgM7FznX3ndazW6dGT6L7akPE4GzfABZMK0M
 ieaYWoGQzQBCt8WwkEyWxPiy9djLBa5PMCuLUho+FVmzn9p9yHGRTuF
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



