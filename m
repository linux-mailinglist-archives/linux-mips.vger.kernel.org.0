Return-Path: <linux-mips+bounces-4115-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 73D019265F4
	for <lists+linux-mips@lfdr.de>; Wed,  3 Jul 2024 18:22:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A64551C22823
	for <lists+linux-mips@lfdr.de>; Wed,  3 Jul 2024 16:22:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6ECEE18628F;
	Wed,  3 Jul 2024 16:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bhDRnIAI"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7BDE185095;
	Wed,  3 Jul 2024 16:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720023680; cv=none; b=ia0uM5wuXpHRonKiG/6w8OoI6WkVHnzFcYe0sT8VWRh+wqpv/3dCu0I/7jHcIfHoCCn/dVzF9K7digbRCdZ5Cw+mZGDKaeQ42gyl6z2km7jcNN2WGBZYiG8m17qqzwft+kHHWhN1Y3fpyQDiB73SKWqGPiCRKiZqNMoxmq2spF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720023680; c=relaxed/simple;
	bh=j5sPCwhhCviCU7Vu2ABzpjqggf1PnHdW58kdo9eadZQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XzjjU8v7wnr45xfSHk8nXqgOrQhRdskz3bGxz3WFqgWVEHjA0QGtzFNTlDz7A4uaF0iJL134qFNpxkrXh7zaSTztHo8d0coA71gWoZgXHcoYig9lq/xmmuiXWjvbs+GrPwhwrVRBbjJ76eIn82l/LB4lnq90E/AeZq2aKdyVksc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bhDRnIAI; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2ee794ec014so19681131fa.0;
        Wed, 03 Jul 2024 09:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720023677; x=1720628477; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pIxz4BhRdDbBTxy1ZxI+3NgFm2AiBBocYllJB6osFnM=;
        b=bhDRnIAIMYa+Bm07WniMVDUwoIxM9/BcEE3NcOqwliMU6Bb/xg+CvCLCQJQbGaUFMf
         yhzFxRptgvqVv18Wxoe6iNFyrvtghHw1gUhwkSooB09u3u3vzeOy7oTkKuN+Omz02byY
         MJkGjC459eRGrRdaROJ6o73u69LQ3zJDrLRsvhBNTFnk3vPw43rZ1XtlYD0ey8NH6tWo
         l/aoHziLK3HkygNg6umuwZxDU+vyygsDGThiQA2+pbda0JdbDieVI4xg5+oo45PgVC1h
         Jy8TGdaOxPFDIW4anaJCxd8w8RBuQm69vODEbqSD/6gApv3trr2/oThVdiLKOAp/ZRpU
         wE3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720023677; x=1720628477;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pIxz4BhRdDbBTxy1ZxI+3NgFm2AiBBocYllJB6osFnM=;
        b=fxV6bo+YAyJlzExQmOwcvJYLuvQyZQeD5AcTgobi2aSeodcXL8U9QqtFsRy6MaP3pD
         lQ7Ok/1vaH81Oo1scA6WirRtBcVR2UNo1/cwLNGVRIP++/mNo3Dvdih4n+rVXqfPTKXX
         i46lucHl/fh0B+md32IVrp5/FflM+yC/Yqjfvf4z6+hJHdapI5g1Hv8sJYOoLXw8TGUw
         OYDKxtabDhMsd5u03323Qtekr94YDR+Zd5KiVdjWuOB+FhYyef5TcFO5A+oTtnPED2x1
         sK+vvpC4kirbJK+7m9rb3uFY8DDJHXQDcGiPvNpvVcjDZyRjnCgslw6c1orKVA3XpDXG
         c+eA==
X-Forwarded-Encrypted: i=1; AJvYcCWSAF+TJdWzlJFL/6wjB6QeqXuSr4nyYBdUfcZJk0MqrtVb3HfRqgunG2ViQq5tdHZAwiqmmY1hegBLJmsgVjcoRQcat71uvP7hhRZpL5MV+X8JtEccg9hFtdoZrOJdPEszj6+pOTdcnCDXav5CWUahShkotYQSpu5FgX11YD5Cn8tnVHgUmnusBBFPGG0cl3+YnZKQg4Aaq3dpYIqNCzOPnpCB2Q==
X-Gm-Message-State: AOJu0YyPWySUR4VxdEele9UAxoCcp5BzBjjBcBOHhpphnRBNquEdKTHz
	AnJaLaF6TROz78kaO4XQ8tJM/2lW6oDO61j4blWTVWfWlmAYQl8O
X-Google-Smtp-Source: AGHT+IEg38LI8zSwhtv7gZ81fD0e7zGHYVVoUZhtCGgWIfi7hIcLtYqbuRUPAnd5RKorZBpjTgxyFw==
X-Received: by 2002:a05:6512:3c9f:b0:52c:99c9:bef6 with SMTP id 2adb3069b0e04-52e8264bbdfmr9515258e87.7.1720023676559;
        Wed, 03 Jul 2024 09:21:16 -0700 (PDT)
Received: from [127.0.1.1] (91-118-163-37.static.upcbusiness.at. [91.118.163.37])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a72b5abddaesm473075166b.140.2024.07.03.09.21.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 09:21:16 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Wed, 03 Jul 2024 18:20:59 +0200
Subject: [PATCH 3/9] ASoC: cs35l36: Constify struct regmap_config
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240703-sound-const-regmap_config-v1-3-2e379b0446a7@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720023669; l=746;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=j5sPCwhhCviCU7Vu2ABzpjqggf1PnHdW58kdo9eadZQ=;
 b=QhTXFi/FH7gHSBuHri6xDFWv6J6P0NWZ2YOSlyT0AmUqU/Z0xGHKFPmtNFjpBdCtWYKRpbo5r
 cL6Q5y3doOwD/GzsZgie0nUxIEKD1C41ZTRNLi2UQdUALi3LTT6arMg
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

`cs35l36_regmap` is not modified and can be declared as const to move
its data to a read-only section.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 sound/soc/codecs/cs35l36.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cs35l36.c b/sound/soc/codecs/cs35l36.c
index bc79990615e8..cbea79bd8980 100644
--- a/sound/soc/codecs/cs35l36.c
+++ b/sound/soc/codecs/cs35l36.c
@@ -1300,7 +1300,7 @@ static const struct snd_soc_component_driver soc_component_dev_cs35l36 = {
 	.endianness		= 1,
 };
 
-static struct regmap_config cs35l36_regmap = {
+static const struct regmap_config cs35l36_regmap = {
 	.reg_bits = 32,
 	.val_bits = 32,
 	.reg_stride = 4,

-- 
2.40.1


