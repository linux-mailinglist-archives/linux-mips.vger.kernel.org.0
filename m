Return-Path: <linux-mips+bounces-7729-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 04E97A31302
	for <lists+linux-mips@lfdr.de>; Tue, 11 Feb 2025 18:29:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4A55F16850A
	for <lists+linux-mips@lfdr.de>; Tue, 11 Feb 2025 17:28:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D526263895;
	Tue, 11 Feb 2025 17:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="dzKp9Uga"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FF55262D2D
	for <linux-mips@vger.kernel.org>; Tue, 11 Feb 2025 17:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739294913; cv=none; b=DYphRxb0VRIMJ80C47LFJV+VOcdNe5SAyAwnnjvcHSXgkB4jYb5kxoS7iuZXKHhMKU4phgyktRTg9Xt7XIxSxyyA03QozUZwPP2KixW3U9Tj0ZWZZngpklFlBmRwzkyKC/zmzUl6LPuOboEf2ckqy+23PywE1/jMTAddrGb/U5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739294913; c=relaxed/simple;
	bh=JaT81TlS5JMrK8kOZ5IZdpgPZCU4QD/jFNP5Hu5Ari0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HWcZgGJMZwioWFkpXuGmguc7jyy3IVUfl6OAGnpM4ngMlZbTsmZbslpWIb63LVBffAUsn0ooFmXK/ElQPqviX0IkYhUwmdesqrkoKO5Dmo/Fg1a7GJtnrXXuoQEU/lE14rxxVpvIr06cbSyvLnKQSuH4LixXXTAf/p9EORzOhKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=dzKp9Uga; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4362bae4d7dso39192915e9.1
        for <linux-mips@vger.kernel.org>; Tue, 11 Feb 2025 09:28:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1739294910; x=1739899710; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vS3u0ChTSEKOd8+Sz6F6ngUlw65dB3dACQW1SqE48AI=;
        b=dzKp9UgamZyHG5RUuhYq6yRHit9jyAS3eReyoagIqHpO4CBGPhdGThhQB3bUehmaQk
         y7XZn8rHeNIeHXU1P65sc5N7C2E88qcF+aeCTC9JUzFYGvPpsNg9tV9rhIAg+vRMiEyY
         uT7gkfdCcDON5VKnse5dK+i27Gle+zxgENMjS3z0KMbZm0/LSbmW2q+ysIu63kc5/LAy
         h5zFyR9sVEmkWyF6E2IXpEIlgrN5RbmwcnSXl5T+7VHDH3Gr4Km0eLvxFUKnnLTuXpNa
         o6yIt20gBHmiF2rXQ6J91AYIrMdyGOI7vIGOQeCW0gkxxtCuWxbmWZsej6fhCgTdPqo1
         y7Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739294910; x=1739899710;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vS3u0ChTSEKOd8+Sz6F6ngUlw65dB3dACQW1SqE48AI=;
        b=r1POUZT2OA/htTcx/VV3XAEE/iDNhXy8+SnU5v/AKI8TYJLbrhm+sXo/GV6QFMHnHR
         akTUiaikG0MKiVNwHdVFXrBl+oDjSVwWg0ZrHcG/EbErEewhaA1J0CKsVFEYyg53Z/2I
         pJPgW7ikB1AMf+xD9exaNn3MRUwpOaO7HbaGNP51C/jj6CNxBAYKqLD9sIUc/H4brbpJ
         gPbF1lW8BdyyHavDBJxObyShylIQtnsjYkwoD2EzfuDL6sWJkTTCVQ7Mhcm4byvHbk2G
         yw7tVOemCEJJ8uxuOurkDYrufKAa8AfZO+48HB7+uYX5fSATSb+2bwTK1EbyyKoUREtR
         kqcw==
X-Forwarded-Encrypted: i=1; AJvYcCUD6yVdIQ6qTzjbLE0sjCwar9rITvE8kmlA3xh8WIBmSR+Dbn5AASKzptVY9QTtid44YkjC9W4wOoLx@vger.kernel.org
X-Gm-Message-State: AOJu0Yza3hpMIl+e9d60dnUfkhjX8NlZ8tHQjhtlNrkF+YtlLtKGevXa
	8V8u0h4jdl6LaC83/LchRwwCNtj8NNKo5Vf6S3cdMQDafiaBAxsCI82kF9fbOJI=
X-Gm-Gg: ASbGnctS1LOwpI5ufkcFbU6NX7V1c751YbGsgEL9f6ZpvTnmsgqOHtO4pGuPFvhsekb
	xY0sBgQwPnS1Y2/tDKr9hiz6p6k6qZbpRobdSpUGp8nI+0naxDrltKRfRJ1QZYTuy9bkZClFtcS
	xchPLTPTF0QtzZJT8d9RTcTgxI4SGq8s/9OKHD0iKxl4TJs/u4zLRHxuXxQY8i7sHIu+J+DqXX/
	PJRyfSNMi+8LYM8pTLLV+DdCzN00RXk0kapTofQjsp1m/VZQmUZI/cppX/hTH9TrRnWvJtBwUet
	U1OB6FMqR1iUkZ9svw==
X-Google-Smtp-Source: AGHT+IHqQL8DP1JxgbD5VCseSPJliBuud4+TKe0/7TKQBN2dXAAu4cWiVWufhhODSvakeasxOn/B7w==
X-Received: by 2002:a5d:6c66:0:b0:38a:418e:1177 with SMTP id ffacd0b85a97d-38dc8d9202dmr13638587f8f.11.1739294909768;
        Tue, 11 Feb 2025 09:28:29 -0800 (PST)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:fc0c:6c04:7ae0:c5c2])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38dc6c80df2sm13691082f8f.18.2025.02.11.09.28.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 09:28:29 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dave Ertman <david.m.ertman@intel.com>,
	Ira Weiny <ira.weiny@intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Danilo Krummrich <dakr@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Douglas Anderson <dianders@chromium.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Hans de Goede <hdegoede@redhat.com>,
	=?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	=?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	platform-driver-x86@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Subject: [PATCH v3 2/7] reset: mpfs: use the auxiliary device creation helper
Date: Tue, 11 Feb 2025 18:27:59 +0100
Message-ID: <20250211-aux-device-create-helper-v3-2-7edb50524909@baylibre.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250211-aux-device-create-helper-v3-0-7edb50524909@baylibre.com>
References: <20250211-aux-device-create-helper-v3-0-7edb50524909@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2220; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=JaT81TlS5JMrK8kOZ5IZdpgPZCU4QD/jFNP5Hu5Ari0=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBnq4g2b7ztdhzPOxtPtSHwTFX2Q+o4rv+DEa9t5
 h6A3WVIiOaJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZ6uINgAKCRDm/A8cN/La
 hfOYD/99mpDDUk+53d/ZanCMbwJ18FpyC1UiheDU5tolp1TjYQ6xJZCD+FUPxTFT7MftJJcmhYU
 ppgXsxWu0vXkLiqwtls3vqypBiQP+/Br9Qd5XQWkcZy/dc3ZG2zA3FYPdrfq+GhBMRIkGuLuHTL
 o7EuhQ8gx6YcEgqWCA6gSH/AN/YL2kOG6F+B5JEBMrI37awyyaz1Rygwhyl0qItpoUOWJamW9JV
 wIpocIeEtV+MlTG1Kbg1WF84EI6JwAjfM5JOZjn65GDvReg9Ar7nhjkfw9C+PcnPZH0HZyY/RsO
 2nb7YpQYtDrCuTOtHOVSR7fA8CD/QL0C/aSz1PBFOUFaQHD5znSEvuNqIZ9MPROPDFGwWQTygho
 2baf6O6czt8zk+qqtahPDzlgKfvfXO6FmH4Hb1xyCFSAyBR2DoZV+W2xJP1brfagyAH+hw0+twD
 635z1DYFdgPAGxz2iXJxZK24JpVoR9CrB33x3a2TEwdc/KaNUt7ax6Lt2f81O587Z+7O8L6/JP4
 XoAxgdGRTcmsl4S9zAEnByChdEI4wOcGAX/bdK2ZG0vy8N1L3IoKJnpRT+bFUN4v+dlR2ppl9wt
 u0Jd4hipB0voUxKyhN6Eu4LjGycuGC96lmkrjExZld1DdDEdciaO1sLFUKFZ592SZ9dz1emyXb5 8Aak+H6IrmLmDhg==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp; fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
Content-Transfer-Encoding: 8bit

The auxiliary device creation of this driver is simple enough to
use the available auxiliary device creation helper.

Use it and remove some boilerplate code.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/reset/reset-mpfs.c | 52 +++-------------------------------------------
 1 file changed, 3 insertions(+), 49 deletions(-)

diff --git a/drivers/reset/reset-mpfs.c b/drivers/reset/reset-mpfs.c
index 574e59db83a4fcf30b60cb5f638607a2ec7b0580..bbea64862181877eb7ae51fdaa9e50ffac17c908 100644
--- a/drivers/reset/reset-mpfs.c
+++ b/drivers/reset/reset-mpfs.c
@@ -155,62 +155,16 @@ static int mpfs_reset_probe(struct auxiliary_device *adev,
 	return devm_reset_controller_register(dev, rcdev);
 }
 
-static void mpfs_reset_unregister_adev(void *_adev)
-{
-	struct auxiliary_device *adev = _adev;
-
-	auxiliary_device_delete(adev);
-	auxiliary_device_uninit(adev);
-}
-
-static void mpfs_reset_adev_release(struct device *dev)
-{
-	struct auxiliary_device *adev = to_auxiliary_dev(dev);
-
-	kfree(adev);
-}
-
-static struct auxiliary_device *mpfs_reset_adev_alloc(struct device *clk_dev)
-{
-	struct auxiliary_device *adev;
-	int ret;
-
-	adev = kzalloc(sizeof(*adev), GFP_KERNEL);
-	if (!adev)
-		return ERR_PTR(-ENOMEM);
-
-	adev->name = "reset-mpfs";
-	adev->dev.parent = clk_dev;
-	adev->dev.release = mpfs_reset_adev_release;
-	adev->id = 666u;
-
-	ret = auxiliary_device_init(adev);
-	if (ret) {
-		kfree(adev);
-		return ERR_PTR(ret);
-	}
-
-	return adev;
-}
-
 int mpfs_reset_controller_register(struct device *clk_dev, void __iomem *base)
 {
 	struct auxiliary_device *adev;
-	int ret;
 
-	adev = mpfs_reset_adev_alloc(clk_dev);
+	adev = devm_auxiliary_device_create(clk_dev, "reset-mpfs",
+					    (__force void *)base, 666u);
 	if (IS_ERR(adev))
 		return PTR_ERR(adev);
 
-	ret = auxiliary_device_add(adev);
-	if (ret) {
-		auxiliary_device_uninit(adev);
-		return ret;
-	}
-
-	adev->dev.platform_data = (__force void *)base;
-
-	return devm_add_action_or_reset(clk_dev, mpfs_reset_unregister_adev, adev);
+	return 0;
 }
 EXPORT_SYMBOL_NS_GPL(mpfs_reset_controller_register, "MCHP_CLK_MPFS");
 

-- 
2.45.2


