Return-Path: <linux-mips+bounces-4119-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C5BD9265FF
	for <lists+linux-mips@lfdr.de>; Wed,  3 Jul 2024 18:23:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 47EE51F22113
	for <lists+linux-mips@lfdr.de>; Wed,  3 Jul 2024 16:23:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 301CC18C33E;
	Wed,  3 Jul 2024 16:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bBNgQ+Ct"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92F98188CD3;
	Wed,  3 Jul 2024 16:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720023685; cv=none; b=A8oPewNHZUPiJ1BEraoNSfoBwg8TQpwYR3wV+nucoNk4cI002QwUC/F21ZRNYD9zUrD55Fkbfd+7ggFeFKF4zrk84uYT2B9cVk+pmzuQgwetZ1f5s0IOCwEtJ+CVeSFyKWodj06gls4c3ktof2w/13IDR4d2YJN9y8smckqNjaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720023685; c=relaxed/simple;
	bh=6htGzMwQBaR8fepxCewe5VS66mt6hPOxDx6kiYIGOgc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DG3fzFUZTGnRDVGW2Ed8P1aKKucg6OPBOkhR/GeWvr6437NQyUXzDWcXXAM0lfF54THOkWBXbOy74Mw5JtP3UrVrW8uX4cJbnR79jzfYQ8MyvI6FDYRvmayVMKbloRDlIUoFYV1neRPQWUQY2lPqfTMdelrBFLWwlrJ7EDCb+hI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bBNgQ+Ct; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a6fd513f18bso740278966b.3;
        Wed, 03 Jul 2024 09:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720023682; x=1720628482; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5dJoSywsR4Em9gf/1ysM9oqz07c6C9thgpVrMtwr4Ro=;
        b=bBNgQ+CtiHh1WFhJmUF/17M0P/8vf7eLjpSV2MyYngyBP2hpPIO7QQP/Fo55s2HPxN
         XDcaBWkT7HwL2UNGFjtucX2id6xEmpNNI1r8Ls0CkHfSu/+fX4JcOQTaabnFfi+278vi
         fzQ2CT9IZw66fS4JG1CR3xluXmM4AcP2V87yPDdF4d3iFmyhfEsD+1O9XXPttHtOlPFu
         3T0PlmFMcJ+eY0R559heZn5sdBzXejXhdZXjKip7nZMN1XW6cIvlcBsjIscTn0OPzNtG
         +95Iuo8Tfdn/2Cvm7XZy14eAtP8RfV72oPkyicxmViihNiqdA66mPw3GupM+LhDTEJDc
         aIdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720023682; x=1720628482;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5dJoSywsR4Em9gf/1ysM9oqz07c6C9thgpVrMtwr4Ro=;
        b=lpWDtvGmPX7ZURGEzUnDURh1YkfFe/BNnuETxzMtO4HmrjteZxeGQbEdDiXZ3VvOsS
         +Cd71TfOAQLoUFuFqc8J+RCQ2RS3zuX8SvnuPwvi0KqTcdl+FYybJSkJ0hOYaFPgvgrl
         SCFJDGN1eqEGbTQEV8vjKfqIySPtae0KYS4DA8aSYlfMHQVoTk+4339MJXdXqE/w5ooa
         bWo4chIiHpC0GdjYAbYxUYLtjvzushwN7fol79a4V6PSC9sI9Gkmm8rIuceUqWCziXzG
         O11ZpUOkjSIrI1UF17oebLyWngIV6u1ecq3f/TP0OLnIYxI3Bs4qO1Xlz+CSXxvgeFd4
         U2Jg==
X-Forwarded-Encrypted: i=1; AJvYcCWc+ODFe8qbc+iPkC6yDYm+mBQ2uaOcgbgkaN7okLYQwfAYP5T2SQqLyVaB+31cjiUGBpqr++QSchKZ6jrRH1YEhO2XXfupO7jguRt1sh58nNiC7KwrbLcKeQwP2ouXL8pkuJ1DRjFTptO6FmJ+e/bmiwe4jhzVRnn23jXsnGg1Y0+/vYGfNnQH35Kr7m2/I+fJICITdQP95GdtxQCG/58R/Cf/OA==
X-Gm-Message-State: AOJu0Yw3L7+WcfexkY9E/mcJt1SFBq5HGyAqC7VzuYWpU1ih3XDq/ZhQ
	zSuCfuTz626/0KRAEpVIiyLmpBhTAH4D2IwfwiFDTQTBLtjCx/XD
X-Google-Smtp-Source: AGHT+IGZj1uqADWWLvZQE0V4WUOmTVTU10XuRxNdD3aNhQeOCo0eTyEoVBnQTRz75jMlg4RB7DKe8w==
X-Received: by 2002:a17:906:3408:b0:a72:4d91:6223 with SMTP id a640c23a62f3a-a75144a2b2amr803804066b.62.1720023681902;
        Wed, 03 Jul 2024 09:21:21 -0700 (PDT)
Received: from [127.0.1.1] (91-118-163-37.static.upcbusiness.at. [91.118.163.37])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a72b5abddaesm473075166b.140.2024.07.03.09.21.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 09:21:21 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Wed, 03 Jul 2024 18:21:03 +0200
Subject: [PATCH 7/9] ASoC: wsa881x: Constify struct regmap_config
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240703-sound-const-regmap_config-v1-7-2e379b0446a7@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720023669; l=761;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=6htGzMwQBaR8fepxCewe5VS66mt6hPOxDx6kiYIGOgc=;
 b=syuSi/vNrxsgXte3PF53cJhibfzYzPANo9dEVu81sruWIsCF5fNCZwS7swGb1Tw2Mxo2p8/bZ
 N5zAmxRL6JTDPD259YRWk8LyURFMmPglGFpG1Hs+NyfAGISSkTJKpBQ
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

`wsa881x_regmap_config` is not modified and can be declared as const to
move its data to a read-only section.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 sound/soc/codecs/wsa881x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wsa881x.c b/sound/soc/codecs/wsa881x.c
index 1253695bebd8..0478599d0f35 100644
--- a/sound/soc/codecs/wsa881x.c
+++ b/sound/soc/codecs/wsa881x.c
@@ -634,7 +634,7 @@ static bool wsa881x_volatile_register(struct device *dev, unsigned int reg)
 	}
 }
 
-static struct regmap_config wsa881x_regmap_config = {
+static const struct regmap_config wsa881x_regmap_config = {
 	.reg_bits = 32,
 	.val_bits = 8,
 	.cache_type = REGCACHE_MAPLE,

-- 
2.40.1


