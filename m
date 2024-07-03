Return-Path: <linux-mips+bounces-4121-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 74AB4926605
	for <lists+linux-mips@lfdr.de>; Wed,  3 Jul 2024 18:23:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A70E01C22D82
	for <lists+linux-mips@lfdr.de>; Wed,  3 Jul 2024 16:23:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1DD318FC8E;
	Wed,  3 Jul 2024 16:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kH2Jqy71"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00EAF1836D0;
	Wed,  3 Jul 2024 16:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720023688; cv=none; b=Z7738ZA0KvAqg1OK1RTUkZQL9RiEF66FSFgPwvEXFbd8haIj6qPLjb8sw9ZJftk/vPgoN/xVfMeKfPKGk/dcXIboQPPQt6heDPLFqYNrLOYhiXQr+NhgbcTHqumZo+MJJzNIauEZywNRCnUrZFZsflX8uxhLt9HuoYq23QA+1i0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720023688; c=relaxed/simple;
	bh=GEk39FRydi1fT70oPtE+ZJuGWxA/nAzFfLAJ2IHsPtE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lcBhg1VNsoTbeXi+WammUiXkU4A3U6qgmFFbOdO7HDtgsZ3bZFqNbE4h5edjuhPAjxH6q0THwDx6DOljco6j92CKOEHAFXU2Jg6dwbKABZAeX2igr6rdotZwqxCfb/Zcbsi+4j2Qqq1VHnkg9qus/7nS2A3QhQzG55Re1c+0AW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kH2Jqy71; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a7245453319so143098066b.1;
        Wed, 03 Jul 2024 09:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720023684; x=1720628484; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gG++efZ7r1OnmtfXthfdtG2tmWWRLh+fSeybQPYJHDQ=;
        b=kH2Jqy716a2RanD/apZm5eDTOJAfvnQMVa3WWk0CLPzDHeVUHbbLblhGYR0V6w4UGH
         UiEySrV9mdMtd43ZYm83GkqQlrdAWVW0dNeD/eqqnjg8P2Ld8qNn/NPr28cwvfsUGAhX
         UlQidgBRx7PMTJ5L9htLu+gJRJdcpi0rGWpc2ZyVMVzttSGOIKYmYxKmvC7v1RYgZLJs
         GRVr7SfUKW+zId8jjQl9f9j3CASCjKK7MBvpsd/Wuihfwdh+dbeLSFIcHP/E7OBvl5iJ
         EmZqKk+OHmckd2pnKH3NOSe3HOfgElSijG0rkN3DiAbC6gFQUPlNHpj1X/D30QCe28rY
         c9pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720023684; x=1720628484;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gG++efZ7r1OnmtfXthfdtG2tmWWRLh+fSeybQPYJHDQ=;
        b=CCZnionbIB1ThV3n/dJ7Yslw+Wlim9TRNWdr4fYpPvTaIdvJnO9jqSfh2rkWuKWdyX
         WQwvT5NXBPyyBrId6fixwA77xWAL3ytqy3uTsWV1qoBV41fntgF+9vUfP8GphoXJgEdH
         iEm4vSeUSKmStD5FttVf6VeY/JCbhAjUsuQnzdz2ikSvDyu5IaHFA9Y7fE83fXNyd7V4
         M01uQI8CK3vYaOMS7UrqFgSHcxcDvBmYmdXByWSvmmh0kHxuVkuK1LAnnRI4Vafls0ub
         JSl4DxdLRQvnsCzGQyTE0+TWpFng2ipDeSidFSRUhC3rrdqWOhMp9ZFeRRwvWYMMUTks
         /pYw==
X-Forwarded-Encrypted: i=1; AJvYcCVoMrDmJ5mLDXE0iJ5gW3p562bQECmj7pT0sz3tnNHPMkjfPwynmXkrM9Zaerdjs8oYVQgtHd+RMzui0+1Khw9UdYikrtUVhcKfqLfL5n49Xz+NcBkjc+HJqWQp3WDE3wesyiSNB3cjdJIfYwtyVAW+QCbsmBfV/FKLvm/GSPmGmGLV2SNV2GZ5nqXaaOw6QXzRDUEW1M9KiPCp7xvB3dDC6EuHyA==
X-Gm-Message-State: AOJu0YzWOZRLfZPoLiqn7jxQK/uMUU6v+rA9YZRxixzoj8FZcJtFhm9U
	O8KlrkbqAvjb8RNqm+YNGec3K9SkIJrPCu33EQP4gsQXtvxpw6fA
X-Google-Smtp-Source: AGHT+IF1wtHFL+7cLyQBLapJSHhoz/9l0imQ+li63K8X61yyAq8uOaolAshVRhS+rXWk32NgpulPFA==
X-Received: by 2002:a17:906:a259:b0:a6f:dd93:7ffb with SMTP id a640c23a62f3a-a77a2404383mr140720766b.1.1720023683153;
        Wed, 03 Jul 2024 09:21:23 -0700 (PDT)
Received: from [127.0.1.1] (91-118-163-37.static.upcbusiness.at. [91.118.163.37])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a72b5abddaesm473075166b.140.2024.07.03.09.21.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 09:21:22 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Wed, 03 Jul 2024 18:21:04 +0200
Subject: [PATCH 8/9] ASoC: wsa883x: Constify struct regmap_config
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240703-sound-const-regmap_config-v1-8-2e379b0446a7@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720023669; l=803;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=GEk39FRydi1fT70oPtE+ZJuGWxA/nAzFfLAJ2IHsPtE=;
 b=mBVpWmb88Olh/VCUWZconNdt8PnC5GlUgHDJFhFJmq4s9dXsX5xDlJDoQxBO0xm95ScDZadiC
 VHXdrkMl9zeD7CnE3OeehfrVKkA94ViNvLhIHXY09hkgLZNnSICo4Om
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

`wsa883x_regmap_config` is not modified and can be declared as const to
move its data to a read-only section.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 sound/soc/codecs/wsa883x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wsa883x.c b/sound/soc/codecs/wsa883x.c
index f5a15f0e891e..d0ab4e2290b6 100644
--- a/sound/soc/codecs/wsa883x.c
+++ b/sound/soc/codecs/wsa883x.c
@@ -934,7 +934,7 @@ static bool wsa883x_volatile_register(struct device *dev, unsigned int reg)
 	return wsa883x_readonly_register(dev, reg);
 }
 
-static struct regmap_config wsa883x_regmap_config = {
+static const struct regmap_config wsa883x_regmap_config = {
 	.reg_bits = 32,
 	.val_bits = 8,
 	.cache_type = REGCACHE_MAPLE,

-- 
2.40.1


