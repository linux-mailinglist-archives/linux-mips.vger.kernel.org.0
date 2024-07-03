Return-Path: <linux-mips+bounces-4118-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E39539265FC
	for <lists+linux-mips@lfdr.de>; Wed,  3 Jul 2024 18:22:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9D8E2282CC5
	for <lists+linux-mips@lfdr.de>; Wed,  3 Jul 2024 16:22:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C4A8188CDB;
	Wed,  3 Jul 2024 16:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iBVZoAj/"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E53291836D0;
	Wed,  3 Jul 2024 16:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720023683; cv=none; b=GDwTLnjQTYg1YkUE9k6UpdDChcsbtsFzkWLIJ6Egct80Hrz6FwCy+S3AgNFkwMvRgqV+q30uJ6DhcdeqCNSIfgPRQUHy65Fd43oEz0BE2VSZfo+kRdS/uAnE8s48c8BA4NL+SD35p8+/yrroD/jmE35tIrtWkLVGXTqJmj+Ws1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720023683; c=relaxed/simple;
	bh=3/rp8Ajf3GnxZH4fnipCM3HJyXPmN1fR0rMic23+28w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pBkWLipGTqvJOoCZC4nYd8+UdwPHfNJSK+Ny5vV5qldlI8RLAOay6fG1JHbUH//boKtjdID0NC7468OlZEqs2+Deucsgplus/+WS5nLnN+847qRbZ2zs/cnFbmvTwnRefOlBDn/ju2CesTEz0zlwKjo0z/MqisJxiKD7z6OSEO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iBVZoAj/; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a727d9dd367so601726666b.3;
        Wed, 03 Jul 2024 09:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720023680; x=1720628480; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YB3QG4cHw/5grgnujfHSGr77q98eD/K2cHI9+6joPLM=;
        b=iBVZoAj/JNVYTr+4x0/m/yQnTNSOsfRoX0wWb0vT2o125T7rGtaPPRfGI0EyDUeICq
         zqarJRbvzRW3qkekN4SyULJP7Fcc4yAHCCghYYbtoQRPeHs1tuQOlwHgdL/d3s68UKBh
         CbHvxAq0VAdRqOhQo6M+ECOQvpd2xP2EmQYdTYavEtfPpSNfIrk+BKF1tuJSuywgUgQx
         M2sIV4wFuXPVh3qwP0NK7R+sHLTRH7DNTLopV4+qaFkANVDNeXdMoYuwa3PixO4gmT8f
         ce095jTSdpSELKnrhPD461lJoGeEuKIqtFw5t1XUP1m/zuV5SpIyCXfgMF7Q8S7Iu8yA
         9yEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720023680; x=1720628480;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YB3QG4cHw/5grgnujfHSGr77q98eD/K2cHI9+6joPLM=;
        b=svQJhss6vGh8+YUhXXPTBhO6wdEAoOy8R34IzKX1e32ClqHJfi6Lxq0ccJuODP0RVK
         cqs2tVvX2WGeCEYtHF2aOQmu7R5LZXQYhicAmF+J/y+UVWiGoAjMRw1nT+6mE813wOGV
         olQ8yNRbvv6YYVwIQyE94tnDG8lnerubcKgn3vKkybrvXYuCwcJfpyS9FEP/J6uVP3Xl
         ZaJkP9VxfbWf80eR72cpISGaAobkUpPwazoUk3AK3XfJOlacON2tiI4u0xzqH6ul5Zpw
         mXKfHj6Uirx0TuRsvEamhFJlIZk98OmdV3FbDxjyh3S3Xh5K74PZF6DdgtTyfQcnaNDU
         WuXg==
X-Forwarded-Encrypted: i=1; AJvYcCV2v5gwgAmeEfPeHbTdk1R5vxjvZ5Aru7tXxn2oO1Nt2Cp7rE4ba8CQVJaJd6E2aMw9AxQbLoCDnmX5jJR5SkMn/xI6GF/LZcnV2XQqdIzh5fJupUPUwxekR3+t7XGmQeXxN7T148TPbV9W9OaIRojYH9QSKdlPSUhKTJuoB4W+QDoJaGxRBK7w1BTVe30OJYaE/kw3i1MN0ylpIP8JFQbnNEj4YA==
X-Gm-Message-State: AOJu0Ywu28uB59s0lXSFTi+qAtguQnA8C01OkQcP6yB2t3Wur+xnQrU3
	CMLtm1Y8Tkq3Eapy/BaX/H4jp6BEs/ZXX4aP6ERw2Nw+cDdNgQix
X-Google-Smtp-Source: AGHT+IGSnZkI96Px48DnU6YgZSAgJEUPfAYKZr3K91kLUEZFHxbqXo/tEx6JqtbSu7eIYxOTaFILbA==
X-Received: by 2002:a17:907:7f15:b0:a6e:fb9b:6769 with SMTP id a640c23a62f3a-a75144de327mr1006641366b.75.1720023680277;
        Wed, 03 Jul 2024 09:21:20 -0700 (PDT)
Received: from [127.0.1.1] (91-118-163-37.static.upcbusiness.at. [91.118.163.37])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a72b5abddaesm473075166b.140.2024.07.03.09.21.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 09:21:19 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Wed, 03 Jul 2024 18:21:02 +0200
Subject: [PATCH 6/9] ASoC: jz4770: Constify struct regmap_config
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240703-sound-const-regmap_config-v1-6-2e379b0446a7@gmail.com>
References: <20240703-sound-const-regmap_config-v1-0-2e379b0446a7@gmail.com>
In-Reply-To: <20240703-sound-const-regmap_config-v1-0-2e379b0446a7@gmail.com>
To: David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Paul Cercueil <paul@crapouillou.net>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Banajit Goswami <bgoswami@quicinc.com>
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mips@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720023669; l=734;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=3/rp8Ajf3GnxZH4fnipCM3HJyXPmN1fR0rMic23+28w=;
 b=FU/CH/vTUtYVYUffYi2PxJcnZTTW44Ijs/SIepa+gP5hZAlXnRj3HPDI22mYSG+jXyEOHhgrB
 ogFaxj8a/cnAdOyNdEFTrO9uhxwGaFKv9YvVZNU3/PDwGzRmd8YqU7V
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

`jz4760_codec_regmap_config` is not modified and can be declared as
const to move its data to a read-only section.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 sound/soc/codecs/jz4770.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/jz4770.c b/sound/soc/codecs/jz4770.c
index 1d0c467ab57b..acb9eaa7ea1c 100644
--- a/sound/soc/codecs/jz4770.c
+++ b/sound/soc/codecs/jz4770.c
@@ -872,7 +872,7 @@ static const u8 jz4770_codec_reg_defaults[] = {
 	0x07, 0x44, 0x1F, 0x00
 };
 
-static struct regmap_config jz4770_codec_regmap_config = {
+static const struct regmap_config jz4770_codec_regmap_config = {
 	.reg_bits = 7,
 	.val_bits = 8,
 

-- 
2.40.1


