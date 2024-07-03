Return-Path: <linux-mips+bounces-4120-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F88C926602
	for <lists+linux-mips@lfdr.de>; Wed,  3 Jul 2024 18:23:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CFDF1284327
	for <lists+linux-mips@lfdr.de>; Wed,  3 Jul 2024 16:23:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8930318FC7F;
	Wed,  3 Jul 2024 16:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MiKUj1Ye"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08F2518F2DF;
	Wed,  3 Jul 2024 16:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720023688; cv=none; b=kXJXKbKK6MEzQrUPPKO2fTcv1HePyiIxJxsAFTvKxT1LGr8sldmQICcgv8BQtEpcDe1b3HPHtkQqNyqBXrxs8efkQM4/fIxM1tbCgLGyz4wLzK7FO4BUPPc0Q2vQtN4j6cyNQ+pQARP+NJzO52gS4ZSqTCcysbu/7rks2zwnuf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720023688; c=relaxed/simple;
	bh=UWrN4K6qjuTz47KoIpXFDK4A5Ll6v6S2fwyFXTvplLY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UbKknZSaG+L4vKp3lAxyYpG4VgldMo2rOcC2YaTIsLjZveCXOkBKAQWEmYgNw8TnAf7xpRmLHQk2y2P59jZmzFHrWWtwApcbq62FQH30cUsjIhGRPojE//vxmU/pFEquOBK+vgDhZFDQfplTh9HBnkowlUGVDBwEKsScPuKNGh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MiKUj1Ye; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-58b3fee65d8so3082475a12.3;
        Wed, 03 Jul 2024 09:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720023685; x=1720628485; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ls7x37QW2OZP1luBkaxPMKRrBAXpPPDVacZ21UQ0RHQ=;
        b=MiKUj1Ye/1Dqxw44G7lubNHtoioSPvAMigAsHE/wMCt+ij73gKWL+Y4yRoTu2ZG/p/
         SXvs6/fZ7uQPgeGyPxUmdREfvtVPYJ6MAqMULrf/UH2Qck6hgckWdTUx/ChRWhLRdkQg
         ZluaxgUzE1sch3d6E1ECNIlb1GAeWDkUVOAKSPPxRsCewdT9roqqAwSSqqTef4u1LCek
         lTbpXoIzubo9GmVjgH/KvaYVSmUWQbJkE2VyYpyA/FveI49vo8AI9+7uMt3OeQkQtI9O
         NDtBzgUAjmGMw59tl81yQaTwU4Qfbyc73ktczwCjJ2i4t+vSrs1NR3U0XgMYs+GjqPez
         gZgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720023685; x=1720628485;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ls7x37QW2OZP1luBkaxPMKRrBAXpPPDVacZ21UQ0RHQ=;
        b=jdGl8O8mbFg3yujpLc1wjViB/1/T74pindttK0CpSuJaldjiUpszU7z+lTBTIj2d9c
         klCvqB79D5Btq0UXbIScn1uu0o7vduq1dOJw1MssNF/HHJBaoIriHOzr9BZsdT/8ro72
         fWADv22jUzsRzlMbTULEaKdMwvx7U1ku7GZjP1/c2YfrsEEXsIGvo8uWHJK+vuYz5pbq
         iiOAt8ZKx62FhjuzyKMKSh/ui5QTNW8kohS2uyRE/W9j7pj8okH3ELsNzuQb8tnAs7zv
         xQ3mzbGbOML1UzXcDijqi3B/5vG0NxTiN3iDrljUKBaf2NkiY20r+vHE2Dbg8ul6ieJM
         u4+A==
X-Forwarded-Encrypted: i=1; AJvYcCVoNZY1a+rFZFKQfp5QM8RDQK4lli4k39Fr7+BE9YsN8RTPkw1R/hN7llFvvfnby350+R6EO6ThkDx1PGQnqLZjRB3FGI54X+5apQa9t91B0/EIgg0FD3wYg/uFgKheHPTclThkH9xkeqKItOvSCPS7GVnK05YOjFYME/wJIja05GduXPW1vBjPnr5ajZZyKBKdqIYFBThR0qj/YwT3Rke/OplZcg==
X-Gm-Message-State: AOJu0Yxgct4g/rnrN5/5drBBMQ44oX2/jkAsgixwStyN/i9sgkGjE1Ok
	NO/vrBn2T/CQcoJy26rqtJzaWDN7FUDLJoHMTgptbDqEVVKvSGAvxFG5adR6
X-Google-Smtp-Source: AGHT+IH3KtVxb1RXbdA+tF59cEFxwUxKJCQZJx1M2KXh/7MQ2cvy+B3uUMbqNlFWoBgWJfCyF+/PXw==
X-Received: by 2002:a17:907:bb8e:b0:a72:7a70:f2e3 with SMTP id a640c23a62f3a-a7514451af5mr739438966b.39.1720023685462;
        Wed, 03 Jul 2024 09:21:25 -0700 (PDT)
Received: from [127.0.1.1] (91-118-163-37.static.upcbusiness.at. [91.118.163.37])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a72b5abddaesm473075166b.140.2024.07.03.09.21.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 09:21:25 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Wed, 03 Jul 2024 18:21:05 +0200
Subject: [PATCH 9/9] ASoC: wsa884x: Constify struct regmap_config
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240703-sound-const-regmap_config-v1-9-2e379b0446a7@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720023669; l=805;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=UWrN4K6qjuTz47KoIpXFDK4A5Ll6v6S2fwyFXTvplLY=;
 b=BXiOa8yT0md+TYJMO7aeLvPGVNstnbedA/eZZmINNVk+XuhDq0zcoUBvoi/zBaEPZkZIXNv9f
 HB4xJOaaxUvB6lwjn4AqWy6yxO6MsVN7JlQK8Crm73HuJV0QvwLbjKU
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

`wsa884x_regmap_config` is not modified and can be declared as const to
move its data to a read-only section.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 sound/soc/codecs/wsa884x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wsa884x.c b/sound/soc/codecs/wsa884x.c
index a6034547b4f3..d17ae17b2938 100644
--- a/sound/soc/codecs/wsa884x.c
+++ b/sound/soc/codecs/wsa884x.c
@@ -1319,7 +1319,7 @@ static bool wsa884x_volatile_register(struct device *dev, unsigned int reg)
 	return wsa884x_readonly_register(dev, reg);
 }
 
-static struct regmap_config wsa884x_regmap_config = {
+static const struct regmap_config wsa884x_regmap_config = {
 	.reg_bits = 32,
 	.val_bits = 8,
 	.cache_type = REGCACHE_MAPLE,

-- 
2.40.1


