Return-Path: <linux-mips+bounces-4117-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FD279265FA
	for <lists+linux-mips@lfdr.de>; Wed,  3 Jul 2024 18:22:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 51C501C22CD5
	for <lists+linux-mips@lfdr.de>; Wed,  3 Jul 2024 16:22:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7BDE18754C;
	Wed,  3 Jul 2024 16:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HYH5vmda"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 029A51862BA;
	Wed,  3 Jul 2024 16:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720023682; cv=none; b=f+iG7qJp6ngUy4XA8LnnBtLiBJcbp1kG7UcdJzRLt9HTpPHIhTvPftL2SwyWO6RU0JY/8TOexX+rVacD6oQf4ykBMS7uiEZ/Fm2GD7yoIgrO+qUmPbX+KAdvARMgZwqbfpVJyGeSoOGp0dRBN/Hv5O81QvpKw+XdJrrtPl2ISKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720023682; c=relaxed/simple;
	bh=dwpTb/6xnICUSoz81QCz1WdqOCgJoRgxLrJ83df9Lxg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GeH+u6vf+tHuJY0XQwIOZjaS4Wi00ppfCkrHxbIzd4UViv00yxK6oS5CbspksOqpqQ4IHOfWOKwXPUlHPwjiCGy5IOeEKyd1BmGLm2zilSHei4JDUj3y1LIOll0HvhcGfcmimZWbXuT7BMGuBqic0x537nDQnvFny7HUaPPXBvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HYH5vmda; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-58b447c5112so2756712a12.3;
        Wed, 03 Jul 2024 09:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720023679; x=1720628479; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pq6E8xpaYTkE4/TuNFv9VlzGhvZEyhhsiWZ97b1YfgU=;
        b=HYH5vmdacnhvsDOljjiYgpS9Fxndr9JU8g7bc6jXIZWvivErs6yzmNDIqrMhL24DP6
         DA1k7H/VRa9mqwiAMtENAdBypuFeTHY1KqVnZ1fKjAA2d6mWGC4h0jNA6qEJTTL1lSfB
         ruzXNGXCAEGazga3E4cp2RugrE1YrhLhzxYOdelaM1i57Q83wQQHwxZDlqQ/GBWgqJC3
         +r/7NhWqQQNMjj3R3v4M25C0ZMD543bUJQoqgndyKf42m3DJsbnPetvlU1cC2GtZ2JIo
         mFS3wdKuiTbkGIhqlLLR7PCvLNzct62wxnDeBOzXTbTIbnKBMaxbTIMEPYGjn8WeGpVV
         Layg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720023679; x=1720628479;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pq6E8xpaYTkE4/TuNFv9VlzGhvZEyhhsiWZ97b1YfgU=;
        b=WJoGusFpyUBhZVgW8lHUi3CT81lORVZmEStdqRcSHiUfwA37crg8GzmL6uhqjb7Z/x
         04UCnnNGpIMJe8F4BhuFzF2ZKtzGCLGLSoyb9fNVc72OgS5iJKmU6taq/ejTWhWJ3DIY
         iAVN9MrfzOAhpDAOUIxqf7Qz1r95VUX4qAvKl4bMvLV6dk6noMzfEZe7rtwdC7EFI6MK
         Nz9V3acwKdskUBt39uHxgVqcmJJblDsKYiCS5yGNIx29UMFIZnewUmqaHji7bz5RuQAn
         9WEU/U+AqHQbG/TwoEpb1QacWUedrFm6ETgDSQiOcWmqiiZ7rzsxfjLreq+B/Jx7nnOp
         MxNg==
X-Forwarded-Encrypted: i=1; AJvYcCXvwIAArbrxIbTEq+7dIW+UufjKURf+kUbAs2AarxeZ4t6ZpWp1wdnVxIEmakG4uZYqIga4f5hlW+IwLAOw4AxGhKjVo3ruZMFuG1viXDKkTFRb8s018QhxTyf2kR5+7YrXkiocAaTzs9IArtl/UF2FVWZCjjl+E0Z8X1W0GfTrDnUEiq+vnxeL7gbpMdfzLJrWcxZNnRkZHcyOLXR0D2l5eGXvJA==
X-Gm-Message-State: AOJu0YxjWmJp/x8r8huRmhmhnBBwr0KBdE0zIoQe8kSDGwbKWrwY6frk
	+2p6FwdBATOeFquysY72roWLKu2eWOHTxeN7HWPTQtZOjTY3a6Ow
X-Google-Smtp-Source: AGHT+IEhABzL0PnBsf3kobt1kk0fkrkOzufUwSfbL0Wy674+CeiIFiE0YQvVeoMPunCrTx62/Z6g9A==
X-Received: by 2002:a17:907:972a:b0:a6f:586b:6c2 with SMTP id a640c23a62f3a-a75144baebemr984884966b.60.1720023679084;
        Wed, 03 Jul 2024 09:21:19 -0700 (PDT)
Received: from [127.0.1.1] (91-118-163-37.static.upcbusiness.at. [91.118.163.37])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a72b5abddaesm473075166b.140.2024.07.03.09.21.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 09:21:18 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Wed, 03 Jul 2024 18:21:01 +0200
Subject: [PATCH 5/9] ASoC: jz4760: Constify struct regmap_config
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240703-sound-const-regmap_config-v1-5-2e379b0446a7@gmail.com>
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
 bh=dwpTb/6xnICUSoz81QCz1WdqOCgJoRgxLrJ83df9Lxg=;
 b=6omJZQ/QIiaamzE/XAx0iMjAim8gjACwbg3+nN5KqEsCorvwhF6l8ybP4kXi7ZSYtmcyfxb3e
 NdNwavD+rCkBD1InWSt+j+HJ8vYOgJRtmyPT4X64Xlbh4AMXmizH0Zn
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

`jz4760_codec_regmap_config` is not modified and can be declared as
const to move its data to a read-only section.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 sound/soc/codecs/jz4760.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/jz4760.c b/sound/soc/codecs/jz4760.c
index 9df58e23d360..6217e611259f 100644
--- a/sound/soc/codecs/jz4760.c
+++ b/sound/soc/codecs/jz4760.c
@@ -821,7 +821,7 @@ static const u8 jz4760_codec_reg_defaults[] = {
 	0x1F, 0x00, 0x00, 0x00
 };
 
-static struct regmap_config jz4760_codec_regmap_config = {
+static const struct regmap_config jz4760_codec_regmap_config = {
 	.reg_bits = 7,
 	.val_bits = 8,
 

-- 
2.40.1


