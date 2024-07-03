Return-Path: <linux-mips+bounces-4113-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DD899265ED
	for <lists+linux-mips@lfdr.de>; Wed,  3 Jul 2024 18:21:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4FA301C227B6
	for <lists+linux-mips@lfdr.de>; Wed,  3 Jul 2024 16:21:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DB0F1849C0;
	Wed,  3 Jul 2024 16:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OB6IXmMj"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A90A1181CF0;
	Wed,  3 Jul 2024 16:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720023677; cv=none; b=QCRDUOxTbRdm5lFKVnNKQRwux8We4fS2POjMMT/+z7Io2myGG5WA6wea4X0TZ1zYri4/RjrBEBlIbkgWYH90isLm/4CeAbLnoy4W+D116v2XJQprifK+d8bcO5QmytzD0j8Ry3X7Fkeh4sDyDrByB/inQFncplxNtpp0S4h1fdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720023677; c=relaxed/simple;
	bh=wWw29OtvmtrGUfN54CyphDq2f7EZzv4CB36kBIg/V9w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I7ZAy8kVtL1RDztszbksbMgIij6wu+PREDr1BeRUIKTX6/dR3NVmof2RXPahiJtqbMOHW5SJA6EOQgcSvFcuM7bVl/Xr42OPuL3EPmiZxnF1TmEqo+cFiv8hnCMnXCUbxwiYTbEtQXy6nYaHnbZ39erelAMuz9U0aSWlGUAkaXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OB6IXmMj; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a72585032f1so614450466b.3;
        Wed, 03 Jul 2024 09:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720023674; x=1720628474; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nwodvvh/HkWOmrsQs4/edOtdukbP3CJ9J4qzQghO6GU=;
        b=OB6IXmMjiEUk3F0z4UI2+zhNOYsm9p6QK07dbNpjqGjwSRhOtN3GmTby0oO7XLxpit
         y5PzSdq3zWHg0t6hgDFfO7G+JGf9wtCH4H7tgHDpcYNTaa2G2tidgbS44os9+jyFTqeP
         dU4J079K0vfqR6+68kqR98NT1SY4CBwlZE1huToF3wVHzPGE9jTcuh9RqTec1brkf73h
         2x0UnHADz+ttqbsGgplq2+0GnRDOpn4Dsze/nVwB3yKKe9qy5EEE10jqOZYpM0cB+BtP
         1SZPhh5JAIJgsCOrmeNTgiVUYMq6AYSih2IrLpVGJyJADysg4iqq2w+iDmdTiT3wDYOm
         a8tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720023674; x=1720628474;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nwodvvh/HkWOmrsQs4/edOtdukbP3CJ9J4qzQghO6GU=;
        b=D2PmxV/nOmjeJSUqjWX9l7+nE9Y26O5QTgW80HS0Wd+xK6i8oTY/Fyvg7uSKfIgcuA
         Q2BhKg+rt1UyarVpAMDJFWYx0af6YgzeTUQE/zo6FwqJPe0SIPuaKddE+gUnN4xEWy2b
         mWj17B4Ebaekp6tkilo92KM4IFMzjYmN+mCxd54FoVFlWOKgz2iy0Lf2ZG2vVN1crPh5
         7El9cHy8q3yTIlNRScKCUGifV+05bKqtm9yq1+fH1rfsRmqkvmEP/1zKg1jQBNmfVd3F
         +aGtwDELL4GHNJCzRcwg/gaTg3Eu9d49hFS4KIjbmaA+VnlgIVmd5zbkdERtOG4rcqu4
         kRdQ==
X-Forwarded-Encrypted: i=1; AJvYcCUuZUjt1e0zZDSlDJZfUTUCKz3xywpwtrFTWNZwSxCTjxf4WbvQDVCKAVfAhspWj8IVXmpG/IyepvomCV7VGF+1WivITwJ7AsWpMh27kRgl1WBjgytkM7Wo4rN+RqktNRfGMC+asRn/X8l+1SfI+9aj+YLfkNsbM66/uO3DSc+LpgBgVBNHv6EsWYn5Upxn8AyiPXcsF+lN5qOSJ6uVrvBN5ToojQ==
X-Gm-Message-State: AOJu0YxrDQe/ZRMp2ht1vKuxu3b1omj5tjWbfhEvO2qLilyDpmfGIxjA
	SFAS+CjfoTQ1DDCrShF2r0HGGetByVxXOwa3R+2Gv/d5CczU7D/d
X-Google-Smtp-Source: AGHT+IHZgM3bWbhlAUMEeCiCQOK2JuYz8183C2SO08iuwK8/gvUGlFPUko6OaORXVGEjRIaT4kSWxw==
X-Received: by 2002:a17:907:988:b0:a6f:4fc8:2658 with SMTP id a640c23a62f3a-a751440b8eamr867471466b.14.1720023673759;
        Wed, 03 Jul 2024 09:21:13 -0700 (PDT)
Received: from [127.0.1.1] (91-118-163-37.static.upcbusiness.at. [91.118.163.37])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a72b5abddaesm473075166b.140.2024.07.03.09.21.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 09:21:13 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Wed, 03 Jul 2024 18:20:57 +0200
Subject: [PATCH 1/9] ASoC: cs35l34: Constify struct regmap_config
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240703-sound-const-regmap_config-v1-1-2e379b0446a7@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720023669; l=725;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=wWw29OtvmtrGUfN54CyphDq2f7EZzv4CB36kBIg/V9w=;
 b=dEdb0+rv67nGozH1LMpVrMHNNCAfY9i3pohpSZx11pxDJSu5DC06RTAYQiL2lHIhckxs0DcTk
 ImmrF22ZRNBATNS3dWN+xlOxzoswRH9gXSdryprPDOSQeQsMkpgclNq
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

`cs35l34_regmap` is not modified and can be declared as const to move
its data to a read-only section.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 sound/soc/codecs/cs35l34.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cs35l34.c b/sound/soc/codecs/cs35l34.c
index 4c517231d765..e63a518e3b8e 100644
--- a/sound/soc/codecs/cs35l34.c
+++ b/sound/soc/codecs/cs35l34.c
@@ -787,7 +787,7 @@ static const struct snd_soc_component_driver soc_component_dev_cs35l34 = {
 	.endianness		= 1,
 };
 
-static struct regmap_config cs35l34_regmap = {
+static const struct regmap_config cs35l34_regmap = {
 	.reg_bits = 8,
 	.val_bits = 8,
 

-- 
2.40.1


