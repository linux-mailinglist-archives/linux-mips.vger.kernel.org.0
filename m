Return-Path: <linux-mips+bounces-7834-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B8134A3A784
	for <lists+linux-mips@lfdr.de>; Tue, 18 Feb 2025 20:31:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 91322188FEF2
	for <lists+linux-mips@lfdr.de>; Tue, 18 Feb 2025 19:31:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 765AE1EFF94;
	Tue, 18 Feb 2025 19:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="l4+pDokp"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C5171E833B
	for <linux-mips@vger.kernel.org>; Tue, 18 Feb 2025 19:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739907047; cv=none; b=j22Khtxd3XA5/PAB9u/FrUqgmb6I6WkubZk+MXr5yb5O5aXqHCxCmMmLOWNbaR9wTrFaNfxkiMP1vY/cP+qiLaWR2O7IpO96gbWjZTSN+OXOFLMHjJnK0im0NNfLl49r92Nkb6q9+QNPOBD/hGS6H+gfnxJb2zbDLn6VXhVjgqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739907047; c=relaxed/simple;
	bh=Cr25mWKeZ/YkxEU3AVjqGal7txJ2589uVh41kSdabtQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mU1Sg29ijWmkW+KNFGEhaDwYyGd5qM90OOeQeV1LEhQMAB+nvfQosbmmYrGnNA3raFoyoDfSgykpc63UUxIf3gDpiu6JxYEELbgsgDmOLgOE4WrOR7EzqcE6f5KSRLVcSv8WnhpON3sDfx4xltCBA7v68f3WkGVi7sHiS83NZmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=l4+pDokp; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5e04f87584dso4128976a12.3
        for <linux-mips@vger.kernel.org>; Tue, 18 Feb 2025 11:30:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1739907044; x=1740511844; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hjJyNDYGWNlVfx3UHGcOmdtWcFRQpeErkJQFZDrnkgk=;
        b=l4+pDokpvKjNa8KTmTuP9Ldxy+YTsUyNZ0M9vBt+3nlNZTSvCyRrgu2250w3MC90zp
         jFwzx8NMPlhjhMvs5k9JKMDJhrVo3WJI2Ev/K35YqFa9SQbAO5acHiU5zHjGOYPndbRS
         LtnxjHmfxfMI/IN9zMOpEs3PhWgefrZHOKZfZDC+14aa72p9jWVe7CUDqzkGeg8GSQHK
         /EXWEF8rWckn5nOvkNYO4mwPI+LlrFK75levjNuEH+LOoa5gmgopKglau9LcuDQpyc53
         di8ltFhYdGjE/Jbdf/5N49UDU2/UlfWjgn8i0r8BU2G6rZ/aiMeeQm8PxvXwfaZliF3t
         b8FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739907044; x=1740511844;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hjJyNDYGWNlVfx3UHGcOmdtWcFRQpeErkJQFZDrnkgk=;
        b=ORdpUhqbp3U20vo90/Dm2orehPbS5TYMYmos7PL21u4k7b2FnsYsihFG7BbHWd/rLL
         jUTP7Tvj3osx6yiQIsnNTs6UX8ALE63s3d5kYhf4n6iVgrHNz0S4dDmpk9a3NaKgDNoV
         oIfvRGI5iQRvseqfYGuIXyTVMcTn13FajOtKwxPrZfF37qEcrgHMo7IaStFc/NZ2d3CF
         PuUaEvx8emQ9qvyY9ZC2z9+J7yB3UQdG5fFPQCkua2h5ghtBl+qxDOHTu/wM6VdAbjAy
         6wG6OsUPXaXY4KHwNUtUjtXeRH5lgq53+4cO8fuPMFUwjZADvewI+9ULdbvzKFnPAbAr
         g5FA==
X-Forwarded-Encrypted: i=1; AJvYcCWfBPeayULqhbav6zuXm2YC8NlRVgrGmRem9zLIQz6zY078533w8aPKl0/hIa3bhT5y7GPQCzOtUmZ7@vger.kernel.org
X-Gm-Message-State: AOJu0YzuTq5iWOIRXu0037rrpDtjTYtFB6/U0o7qdbGxIF7gJP4R4PKt
	60GaRSyCAq5/394db9WT+AFMQe/KbddiwV0yzxWruN8n5M3yYCIvSnaE5CKP/w0=
X-Gm-Gg: ASbGncspsZuS9/0DLy/wderCf4HsH+Oj0f58XKkcT5YT9HqSYVukglFbCfnOZf65v6Y
	IqJXdmLaIY6wq60wH9jVZ9CE8rfetc6stobG+2Pz3F6dOgMWWlIgll6VRg1d4QMjkBgjqs3zf9P
	fAZXNFLDed8Lnyixn7UWIjooz4/j9JyVcSeUl+PTrE1P806BwiCVoGfI7Xm3Nlhu+2OwO2c53vB
	e1RCmuNS/L6fmov4AZFIfafGJEI1Ow8cezQeCM2Xtx0YWmQJ04/Vp/yAqjhuAYz5qCFTEHAbfLX
	PAUgFluSkXGvrCh6JIzQJh2H6ZxU
X-Google-Smtp-Source: AGHT+IECmlrf1Z+1L2rx/ADMh1RlCaQ+nxKiAFCqRveAMzjHV+oepi3NANZfof9OC/6vmxpoOyaleQ==
X-Received: by 2002:a05:6402:50c7:b0:5e0:87fb:72fb with SMTP id 4fb4d7f45d1cf-5e089510c40mr694282a12.6.1739907044107;
        Tue, 18 Feb 2025 11:30:44 -0800 (PST)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:cbaf:af0:839d:fb4a])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-5dece1c3ce5sm9338985a12.17.2025.02.18.11.30.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 11:30:43 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Tue, 18 Feb 2025 20:29:49 +0100
Subject: [PATCH v4 4/8] platform: arm64: lenovo-yoga-c630: use the
 auxiliary device creation helper
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250218-aux-device-create-helper-v4-4-c3d7dfdea2e6@baylibre.com>
References: <20250218-aux-device-create-helper-v4-0-c3d7dfdea2e6@baylibre.com>
In-Reply-To: <20250218-aux-device-create-helper-v4-0-c3d7dfdea2e6@baylibre.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Dave Ertman <david.m.ertman@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Arnd Bergmann <arnd@arndb.de>, Danilo Krummrich <dakr@kernel.org>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Daire McNamara <daire.mcnamara@microchip.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Douglas Anderson <dianders@chromium.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Hans de Goede <hdegoede@redhat.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 dri-devel@lists.freedesktop.org, platform-driver-x86@vger.kernel.org, 
 linux-mips@vger.kernel.org, linux-clk@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1973; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=Cr25mWKeZ/YkxEU3AVjqGal7txJ2589uVh41kSdabtQ=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBntN/SD4OL52K/QfMKVSEvyPzO6g3xqyAnnznv2
 tNz5v43QBWJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZ7Tf0gAKCRDm/A8cN/La
 hQ3NEACMePloQ6q9Op19MgwdvWmpVPN0pvC4qMKEleBTPpWgSbX07LzsOs33BF6DElzTXnPBE7V
 Hc6gTFj4eFpmZWZ0JLOLUmssy6Psl/FT45fjkiI6n1fz3DAwt9ZAHMX8li1/hrg9Jm8kTJTxkdT
 4bDV79Tklwis8J/7ZD2hJKoV02hT7FGm3mi0VzB65ZDGv6b5LcNmbZn95vUsmM9vQKOlyDsZ+5j
 xQZKbwufaGoPkjT64mDVnAKoZdF3vNaNN5Yje/d9tiezCjghHjEQXg8nP5TIJgDzYrbByCFDCQ2
 uO6nlODoPUfF90cbT60YJAE7QcCQOsrjt8e2+MvwcZdOMX6+e4wy3mIs24V2+8OKbSSxEO46L2l
 Bq5ehm93JeFwihWXwSSzccoDgTdL9uTM0T+n7gXSmVWMuo9FQ7ezZ1NcVkhY0hIn/oSI7yHdM9C
 oDiWNvNBvsV3+EksgLl8g8CFq0b8ykBaFZsBO19TLYDtzd0YUEbvkjbHjpFaDvVWVQFbxmFOiOm
 RwwfbcTkpQ8yKuwqtYNwng31MbhKDu90tRu3Q02h5kBTCZ8xPP4EIT+baSgD9YzWlOAKtcjFrRT
 Er3q3PLeaKRm/ZarDvM72dgEjzwT5TsJ6qku+wsH87MnixceMMf524tJXp0zcQWBJYtba1cPB09
 RzDUMDBKnqETK4A==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

The auxiliary device creation of this driver is simple enough to
use the available auxiliary device creation helper.

Use it and remove some boilerplate code.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/platform/arm64/lenovo-yoga-c630.c | 40 +++----------------------------
 1 file changed, 3 insertions(+), 37 deletions(-)

diff --git a/drivers/platform/arm64/lenovo-yoga-c630.c b/drivers/platform/arm64/lenovo-yoga-c630.c
index 1f05c9a6a89d5ee146144062f5d2e36795c56639..75060c842b249c1b4cab21fef943266ae0b31d32 100644
--- a/drivers/platform/arm64/lenovo-yoga-c630.c
+++ b/drivers/platform/arm64/lenovo-yoga-c630.c
@@ -191,50 +191,16 @@ void yoga_c630_ec_unregister_notify(struct yoga_c630_ec *ec, struct notifier_blo
 }
 EXPORT_SYMBOL_GPL(yoga_c630_ec_unregister_notify);
 
-static void yoga_c630_aux_release(struct device *dev)
-{
-	struct auxiliary_device *adev = to_auxiliary_dev(dev);
-
-	kfree(adev);
-}
-
-static void yoga_c630_aux_remove(void *data)
-{
-	struct auxiliary_device *adev = data;
-
-	auxiliary_device_delete(adev);
-	auxiliary_device_uninit(adev);
-}
-
 static int yoga_c630_aux_init(struct device *parent, const char *name,
 			      struct yoga_c630_ec *ec)
 {
 	struct auxiliary_device *adev;
-	int ret;
 
-	adev = kzalloc(sizeof(*adev), GFP_KERNEL);
+	adev = devm_auxiliary_device_create(parent, name, ec);
 	if (!adev)
-		return -ENOMEM;
-
-	adev->name = name;
-	adev->id = 0;
-	adev->dev.parent = parent;
-	adev->dev.release = yoga_c630_aux_release;
-	adev->dev.platform_data = ec;
-
-	ret = auxiliary_device_init(adev);
-	if (ret) {
-		kfree(adev);
-		return ret;
-	}
-
-	ret = auxiliary_device_add(adev);
-	if (ret) {
-		auxiliary_device_uninit(adev);
-		return ret;
-	}
+		return -ENODEV;
 
-	return devm_add_action_or_reset(parent, yoga_c630_aux_remove, adev);
+	return 0;
 }
 
 static int yoga_c630_ec_probe(struct i2c_client *client)

-- 
2.47.2


