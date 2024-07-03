Return-Path: <linux-mips+bounces-4112-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E2DF99265EB
	for <lists+linux-mips@lfdr.de>; Wed,  3 Jul 2024 18:21:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9CCC828311B
	for <lists+linux-mips@lfdr.de>; Wed,  3 Jul 2024 16:21:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43E7A183086;
	Wed,  3 Jul 2024 16:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X9UpOCTq"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81DA0282E1;
	Wed,  3 Jul 2024 16:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720023676; cv=none; b=FBPIAsSe1JRVM6hGMeKSL+f19raZj55FEoFfCLD1+kDsWQVWnZPFTYHhSmalUH+AsCHgWR+pJoT2KH6oldBtHrHC1oZGqzL/yAOhdGLQhw/a06B4+rsD4fQllhmLOdCX43Jn8pCjHOE2xTswHSt0Q008BuR41YiCb/wA0u0KVVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720023676; c=relaxed/simple;
	bh=2yfo3OvP/tnsTIp4VFs4rNirB845fNkFXJ45jxb/Y+c=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=IAGhzCZZL2dhIBZVuCMMv27Y/eJzBmkDAWxyiS+fmtep93OJjEPefpVcJS5wYUP+0EqH7L8B8iSNDlG/aUXGc7/me4ezPhWDdgwRTWz0SHjCNNh9uOviRYDXbq3CMENsQqi4GKABsytMzDW6vkmm8LoS4bVsEwAcHhGOx89Z3aQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X9UpOCTq; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-52e97e5a84bso1344614e87.2;
        Wed, 03 Jul 2024 09:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720023672; x=1720628472; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jsALFFHLFuxY5RQqYr6ygaK5HtrgJplgfhE1MyVzeTA=;
        b=X9UpOCTqvwzSMicpDoZjII/jBw1qP7Fz7/PFgrzV43Lmlye2jku4YsSN5Ui+C9SHXl
         RXVdz3Nnfalzgg5ER4GVS2AidGyFfCzuHAMRP+MdHpIDGWNuMbreucsyhduhr2u1+Lqz
         ItsElKH+MwL0LEddrFjZRxJUyuV+fLplHFRSDUjVlyqaWWS52BJOGMKzNWNq9vatZ3NU
         0dP+V7CneQrGnkb9BsOHjpgUl9oeox4MHf3gQtaEEO8+ywYCSsOV86fohpJp6TKzk7l1
         vHQVEEUPU3s4YxrsZ3yNd1Ysn2BYVGkjokvpaRLRl/0CoQy1ww/LpKbd/VAINwANwW3p
         luxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720023672; x=1720628472;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jsALFFHLFuxY5RQqYr6ygaK5HtrgJplgfhE1MyVzeTA=;
        b=MWE7722Cgi58ZrzIcMbybpfMXMymRiy5qYLk3y5zq5zAjpTOYM8+cv+b4hxx3JWtdz
         hq85IIwNkKSdIRHL4CyxSLfPIjLDTepQxJYYi0SceLKPazNuvfK7eiBrgkyUMdG7tVtD
         iiQLN3HYruoOiHCZY+Gqo3vO6fIGxQjQskICVxvGvRIIPEtrF4fdPkOpKHpoasMS5J9G
         XWDAQk0mO761OHxjuWHHuUChUzH3U02QeWAg27Otx6s32682/IR4/4EX7+Sx60RVR6LK
         H6stX6k0PpGn2hnjDWKOCMFamfSYqk1o04KYpwBwJ5fGRPBXNPj5KL8YT5+RHE42Q3PQ
         WPow==
X-Forwarded-Encrypted: i=1; AJvYcCXyKUo6oe1EoXpkVjLHBGgxGaSHtxcnryH5Aiwz2yxFrGcKiqlAZVjXceTaYn9z+Bch8XrIaZZxFVppu0ralias3PuEequH2sNAEcBgJ/PxNqziKmdMjZhl7A6+XTT3/UQUsYEbOio8sF6FoN69AEOt8KgXhbDODs5fdW/0AgC1q+hTZv2Ypi5nXe52r5ZPbngpj9cNodYTLsxxzPRB8zEKZZzmRA==
X-Gm-Message-State: AOJu0Yx8amQ6cwDN7xRXLBWmrAjgqwCDa/d8HQGADyC2dKjRjk9+jt7J
	W0Xe7t/odEhiyudUUcv96RXP4YFS0+HC/QU1BBnzY2wOdUYtUhyiNdmPPaWV
X-Google-Smtp-Source: AGHT+IEFbJZPNdKnbaS0tCECdKRbpFEUC6/kEynhmQGEQOtH15bPicM3fIy/tKjmK0CSUZrTfa6cCA==
X-Received: by 2002:a05:6512:124a:b0:529:b718:8d00 with SMTP id 2adb3069b0e04-52e8264b5dfmr11354631e87.8.1720023670436;
        Wed, 03 Jul 2024 09:21:10 -0700 (PDT)
Received: from [127.0.1.1] (91-118-163-37.static.upcbusiness.at. [91.118.163.37])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a72b5abddaesm473075166b.140.2024.07.03.09.21.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 09:21:10 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Subject: [PATCH 0/9] ASoC: Constify struct regmap_config
Date: Wed, 03 Jul 2024 18:20:56 +0200
Message-Id: <20240703-sound-const-regmap_config-v1-0-2e379b0446a7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGh6hWYC/x3MSwqEMBBF0a1IjS2Ivxbcikij5hlrYCIpbQRx7
 4YensG9NymiQKnLbor4iUrwCUWe0byO3oHFJlNpytq0pmINp7c8B68HR7ht3L8JizgubG2bz9S
 iASj1e8Qi1//dD8/zAtML9wtrAAAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720023669; l=1329;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=2yfo3OvP/tnsTIp4VFs4rNirB845fNkFXJ45jxb/Y+c=;
 b=2XXm7af+smGwzm0vmJjdGPs0OO7QoTlsUJ3ujwzB3P8Nu0wlrV/eudsRaas7fpkTWpXW772bV
 IB2/agz33aMBtUVwjbgPWXgOTcE34sW54Hcm2J2XEj5ds6/20gz0XNB
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

This series adds the const modifier to the remaining regmap_config
structs under sound/soc that are effectively used as const (i.e., only
read after their declaration), but kept as writtable data.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
Javier Carrasco (9):
      ASoC: cs35l34: Constify struct regmap_config
      ASoC: cs35l35: Constify struct regmap_config
      ASoC: cs35l36: Constify struct regmap_config
      ASoC: cs53l30: Constify struct regmap_config
      ASoC: jz4760: Constify struct regmap_config
      ASoC: jz4770: Constify struct regmap_config
      ASoC: wsa881x: Constify struct regmap_config
      ASoC: wsa883x: Constify struct regmap_config
      ASoC: wsa884x: Constify struct regmap_config

 sound/soc/codecs/cs35l34.c | 2 +-
 sound/soc/codecs/cs35l35.c | 2 +-
 sound/soc/codecs/cs35l36.c | 2 +-
 sound/soc/codecs/cs53l30.c | 2 +-
 sound/soc/codecs/jz4760.c  | 2 +-
 sound/soc/codecs/jz4770.c  | 2 +-
 sound/soc/codecs/wsa881x.c | 2 +-
 sound/soc/codecs/wsa883x.c | 2 +-
 sound/soc/codecs/wsa884x.c | 2 +-
 9 files changed, 9 insertions(+), 9 deletions(-)
---
base-commit: 0b58e108042b0ed28a71cd7edf5175999955b233
change-id: 20240703-sound-const-regmap_config-1d4d56b7e5ee

Best regards,
-- 
Javier Carrasco <javier.carrasco.cruz@gmail.com>


