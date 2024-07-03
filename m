Return-Path: <linux-mips+bounces-4114-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 767399265F1
	for <lists+linux-mips@lfdr.de>; Wed,  3 Jul 2024 18:21:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2D7D61F23C01
	for <lists+linux-mips@lfdr.de>; Wed,  3 Jul 2024 16:21:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AF4D1849FF;
	Wed,  3 Jul 2024 16:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G1592B+m"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9F81183092;
	Wed,  3 Jul 2024 16:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720023678; cv=none; b=m5admwsVqZTVwqm+TKL47l9hhEj2mGoy4CpamZpn0ortd6yc2UrcVxMQKr6H++vG3XGjkPmtmoGSZLfUrJiqNscFbI2ea5XNQe2+YuVuUKABqbtCaYhDLFolY+hzV6LTPD5d3mOqaL3Q6Fp5RO1CCMMPOyH1djcKQD90qMa7xWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720023678; c=relaxed/simple;
	bh=NwcjSKqDE0VK2dDbdmqM/92kBglAO28ukjiQXm09KUU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h2wdQ1sgGTciok6hYIpLWFRfXlFwkqnI7R4qXGDRF03UYNawnBdLIR6PbX0UdjjasRAtKUlEp/euXbEfICnmwxkKZt/yLtcUPVhBPMQ4OU1zvfaF79XoqDxSMqjpYUgHv602UJi6Oai6BSwjnMMju8JNv8mKcqbtuFihXcqJb40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G1592B+m; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a72b3e1c14cso665434266b.1;
        Wed, 03 Jul 2024 09:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720023675; x=1720628475; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3hjyRNvMZXMYBEm5NP3z8RmRqPF9CkIDkfVc08IOZB8=;
        b=G1592B+mP3tbALgslQOsuNhr3x+CtW2vnzsIDgnvzTpC3fmVA5SC690mpuuXUeeEN6
         TxdGQ6QK7MhTEElAyHvY2i33kRIRmTDGcAleMYzqG+9puKdPv6Yjp8PDEDWz4MkMLzV+
         0EjcfBB7lz9lccU+eNZJxg+8d88TbVgwHX8j9iq3qB5WT9f1jpzFtpSJVWcFEONM3IiC
         nzOVSmkv4F7JC8p58K8JKvVXFd9haBt7cdP5ftSwNGt8GgqqyNQ5uL3HCuDyfEXPLc/E
         iTUT5VFYnL7VUmSLXN3U0/AFlEVSjtMlEaX+OcW3X9Agsbn7eLkkzQXfM4hbc7LdLAOk
         ppsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720023675; x=1720628475;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3hjyRNvMZXMYBEm5NP3z8RmRqPF9CkIDkfVc08IOZB8=;
        b=Bo4ymH2mJeI8E4K8eTZHvxaDMZn5wN3/ttHPOYqZq04MvFb36We7/N/Dyl3NsFS/4i
         JGUSxHvFvaSLvH9VGkaWU4N931sXYZsBws4czq6rnlMOIPiz5EvN6tAX+Iff37mx+CwH
         sAtO+fjtMTZBPqgVavtYGLCb/R/jXF8yQSeTHE/jS3tzLAv10EaVh2u8PM0J85PH4xR3
         LnMlTAjBigo+OGfzZU3ULrAeN5avyTh6t5Mvbjn0caTTvK6INuYbsXOwS8i67c8udKaN
         Kv3rPmJ2y08ErDFzYWnb0SXiaTz5X2txRRh1wjgWz9/WZat6DgIT4k5EBR9XzSbPwkDE
         Yv3w==
X-Forwarded-Encrypted: i=1; AJvYcCWOUYjMDIqarXavjiSGO00corBcMwa+E9m2xTDmNGMgmt8VpDvvdOJ15B/FfkIklf8BJV0nYAx8pYrUzmUjgUjYqR50HA2I66iOOPKlUgvfDjK6WVYRPaCaM8fqaBEFEfy/xSrtZ39u/R0etuPWX6Xd8Qc2b37/bXTL6GZ+SUj23A0eghW+WwCx3fce262WfzerYXt491d/mtHMXdLNOdu1KXdcPQ==
X-Gm-Message-State: AOJu0YxPmjrXLFt6PlDPG5O6t2i8ZT8ePdexiARbEE/+cssZzbIewxMo
	vaW7Ih1vDi0yZcieguFRr6XFrOK0WlAKfT1q5FBpys2lS+Xi+JLf
X-Google-Smtp-Source: AGHT+IFOgOBRrS9IUtn6qtfyrq5vCvZtNpLMPWCmi322966ijwSGZ4lwhvUtQ+TzJoBprglknSsVuA==
X-Received: by 2002:a17:906:455a:b0:a77:b249:7845 with SMTP id a640c23a62f3a-a77b24978dfmr6398866b.68.1720023675011;
        Wed, 03 Jul 2024 09:21:15 -0700 (PDT)
Received: from [127.0.1.1] (91-118-163-37.static.upcbusiness.at. [91.118.163.37])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a72b5abddaesm473075166b.140.2024.07.03.09.21.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 09:21:14 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Wed, 03 Jul 2024 18:20:58 +0200
Subject: [PATCH 2/9] ASoC: cs35l35: Constify struct regmap_config
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240703-sound-const-regmap_config-v1-2-2e379b0446a7@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720023669; l=727;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=NwcjSKqDE0VK2dDbdmqM/92kBglAO28ukjiQXm09KUU=;
 b=qRGQKMbhjYvNJI99p/tB7KMd8jCtxTve1uuNNnquwCevb6IQukXQIFf3b4dH2atJCTqzqRdZG
 i9gkyQUG0ToAAElojBWoubl2XVu3HmlbhADGvlciUCcyvbujH5dzuD8
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

`cs35l35_regmap` is not modified and can be declared as const to move
its data to a read-only section.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 sound/soc/codecs/cs35l35.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cs35l35.c b/sound/soc/codecs/cs35l35.c
index c39b3cfe9574..7a01b1d9fc9d 100644
--- a/sound/soc/codecs/cs35l35.c
+++ b/sound/soc/codecs/cs35l35.c
@@ -1086,7 +1086,7 @@ static const struct snd_soc_component_driver soc_component_dev_cs35l35 = {
 	.endianness		= 1,
 };
 
-static struct regmap_config cs35l35_regmap = {
+static const struct regmap_config cs35l35_regmap = {
 	.reg_bits = 8,
 	.val_bits = 8,
 

-- 
2.40.1


