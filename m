Return-Path: <linux-mips+bounces-4116-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 498589265F7
	for <lists+linux-mips@lfdr.de>; Wed,  3 Jul 2024 18:22:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 009611F23C6C
	for <lists+linux-mips@lfdr.de>; Wed,  3 Jul 2024 16:22:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42EA4186E33;
	Wed,  3 Jul 2024 16:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GG9txN91"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C317185E43;
	Wed,  3 Jul 2024 16:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720023681; cv=none; b=XTMNXEBdpaqolLJ3A4dNTWyzt1tjBeAE7ySTqq+C9c49tbKCIG7IEyDqbz8C50Wf+4DPUsTLoJYOa9FcVGAn5LGhGvKL6bN/kWhDNAA/NdCZgQU7UjCqRMMLuwWkXLXIMFLPQvQFtGwlQDlczNLUObrhPKQj5B02B9Rcrv82I3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720023681; c=relaxed/simple;
	bh=4sjnkaXwLNp7p5DTjkC6jZAwMMW/qwiVCY05YVLu0yc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FOj/2Ulb65cldo7ft1d9jem/9xwrpSwq1Y0IVm5AVlEIPwHl2IlKcopOVTIK/DLdUudRuEuW6mvn82tWMvX9sMFEvmLiUXbXHfGTqyCEL4azjUMv4wVJeh+vK14I5bnoMIpfa2Qh0s62GWOUFT1rvvV3f87IcPF6MXhYNpAkPDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GG9txN91; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a724b3a32d2so659711566b.2;
        Wed, 03 Jul 2024 09:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720023678; x=1720628478; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HSyNvDm6zVDNskeAuatJPuva+eHFR+zlE1Zqp5rhiEk=;
        b=GG9txN918iDppE6X3XH5M7D04W27i5FahYU+7gkZWRPB1lKz0Q5zCQh+9YtvG4JVHu
         DORD/LXsUoGu1HyYzUIuEv3C+BXtgLyF2VAKNb5XbjeQmSeZ64Vd096pVPvar8y9nwSL
         QG6fYSBCJPugm4+MIps27mBP4/EveZW22bUqcI1czC/xeoMQW1UDv1nSfJWyFo/KQfF9
         qX1uyMJ1XUYm1ojB7sq9sK02PrPdaKE5Qpj5ei30+yjPvYOr4HiZkaxj8lFBPGm+Cw1i
         lP70jkJIKi4rW+NfJnxQ8hm36nDZl57xaB4i+oDWFKqufS90c/6nGtfxu/uNScdXvQqE
         l8gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720023678; x=1720628478;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HSyNvDm6zVDNskeAuatJPuva+eHFR+zlE1Zqp5rhiEk=;
        b=JaaYqzP2wQ6LB87hy47wgEj1WtX2gD5VHmD0Q1TLHsWjcFhcPJHmpGceGiSktbSylH
         Q1BN6w3eM7K6xJKfU6tebBGM2mqr3yEi2fVzmIKmjodms0UXelAIyeRGsNwOs/uJX227
         +eP0OK/hrjSv0ODzF0HIVkZoW9DwKU9ChlAG/n7CE7jHKUqELxAkwrUk69va9b0U7uec
         vrtFnWl96yGhnQ2xzYLSz/jhZmgx6uEny+T2x/QTLd7CjchV+qaxcPC/zfyWcMbU4Xqp
         VpP2kGN9hiVctKMxRro64w4pn9M60kV6aDzijlXeULv4YNVqquanMOrWzoMOlw4b6rmH
         walQ==
X-Forwarded-Encrypted: i=1; AJvYcCVmZDb+HdfUP0noMMVm4If1LTAPybQxb79IbRBBNx6CK8+VZz+01IdhCA/KNIp+pVSzue7LnI2OFZJ70QyFKR0e/BIIWauSURAPhKIKi8V/mrR0xMdZ6sSbiUEZB55kM9hFA5nSi1CLZeDrQqyC8r4A6U/WRA3w1MERNZw/kfB1aX9v9cE9L+vfB3v6hxBp+h11mALBXj7Pqug9JU7gZKMX4OKjlQ==
X-Gm-Message-State: AOJu0Yx6MKW4cO5z/Bm/4yAJ9cBkDBLvYFfcVFTzA76na7nmEmFrtEef
	IAOjeyjmEXCmwm4vNj3/lhPFjsSu9u0Zk05Sn+2k8I2/8X/NDo3gV0+m8Z7e
X-Google-Smtp-Source: AGHT+IHpV6OONoKSXjg7fmv0v4P9t/xb/YGq3hRdnf4TgeAqAi3cLe0CsUSlt5CpfgVGn9qzjXc4Sw==
X-Received: by 2002:a17:907:724c:b0:a6c:8b01:3f78 with SMTP id a640c23a62f3a-a75144630ddmr1006920266b.9.1720023677891;
        Wed, 03 Jul 2024 09:21:17 -0700 (PDT)
Received: from [127.0.1.1] (91-118-163-37.static.upcbusiness.at. [91.118.163.37])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a72b5abddaesm473075166b.140.2024.07.03.09.21.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 09:21:17 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Wed, 03 Jul 2024 18:21:00 +0200
Subject: [PATCH 4/9] ASoC: cs53l30: Constify struct regmap_config
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240703-sound-const-regmap_config-v1-4-2e379b0446a7@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720023669; l=714;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=4sjnkaXwLNp7p5DTjkC6jZAwMMW/qwiVCY05YVLu0yc=;
 b=JQkgJLw1miJzjpf5mCChsQHJZ0BOe0MkRMyozKA01N2dFbb36jeC4afQ69b/KKR93UYuvPuKy
 MKMLpuKq21kC/iZQM1qW5tCvHq16FYDlHoRrDIXYg66TIxHVE7eZiDl
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

`cs53l30_regmap` is not modified and can be declared as const to move
its data to a read-only section.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 sound/soc/codecs/cs53l30.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cs53l30.c b/sound/soc/codecs/cs53l30.c
index 2ee13d885fdc..bcbaf28a0b2d 100644
--- a/sound/soc/codecs/cs53l30.c
+++ b/sound/soc/codecs/cs53l30.c
@@ -900,7 +900,7 @@ static const struct snd_soc_component_driver cs53l30_driver = {
 	.endianness		= 1,
 };
 
-static struct regmap_config cs53l30_regmap = {
+static const struct regmap_config cs53l30_regmap = {
 	.reg_bits = 8,
 	.val_bits = 8,
 

-- 
2.40.1


