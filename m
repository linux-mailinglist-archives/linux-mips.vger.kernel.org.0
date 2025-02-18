Return-Path: <linux-mips+bounces-7832-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 431EBA3A77E
	for <lists+linux-mips@lfdr.de>; Tue, 18 Feb 2025 20:31:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 849E816C276
	for <lists+linux-mips@lfdr.de>; Tue, 18 Feb 2025 19:30:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 903A01E8358;
	Tue, 18 Feb 2025 19:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="I6KT5ERU"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89F891E8340
	for <linux-mips@vger.kernel.org>; Tue, 18 Feb 2025 19:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739907042; cv=none; b=JXKKUVrgaTk2IiBTG6/nZcwylREYs0ZUbMAE/YYpGccmLBQJaqQ4x9lHZeEFXwNkR1wU+E5sHGrjM9zNvg5ooeBFACOWpZ1wCPtefcEt5/dTlj219gXDnQ+h+rTc+vSl+2ctuHU1K0Gq6gvA7oRu2ohwtKOwlKhpN9R7y42K3t0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739907042; c=relaxed/simple;
	bh=lC4JGAW79Gffs1TQMyzi5K8iGZRUrc3LT4D+fKp54fk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PhD2cAWFwFiRCJsv8yRRdKcnExMrLS/hBMRpJJfIcmHhiE/Pj35LfI6kqyKFkFs9w7T5zDfzhdQdUwsyxwSR0N1dvqVl346KERZuW7XmPo5H4v/wmxYQI/OpsEq/NuhdqEuwsxr9s2mNd0VN+UCRIoJ8dDn7tIp9HxxwcarP70U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=I6KT5ERU; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5e04cb346eeso5574013a12.2
        for <linux-mips@vger.kernel.org>; Tue, 18 Feb 2025 11:30:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1739907039; x=1740511839; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0T8F81F4dclX+rJ/ZeU1mJZ2+c2tosLP5JZ1w46AvKI=;
        b=I6KT5ERUW4yZOYSpceLTh8Hj7Hj2z9FnqDH90o41VKHDpH+RKWKOa2g1FymGReAaop
         wqURxSAyw39hP8zIq2wjNU0cvkLaSQSTgVi7CAEf53Ca/NPgxRydDJQKR2NOS9/t2Igz
         Ehhd8EIu/f5pQbMLNQrIL+clLVJk0ctNiNDM8M5WaYgbOotUpdG92oxwl5H0jMh1rVEC
         F78IvPs68xJPiYA9Ygu8gJNEjJ1V0LRbk4kKhrDYbeoae3VTMCuPbc7Q+e4DWAIhCJ1M
         j6ciBqcgd2uDZ/ksBssj+0uWHYhX0YyjBIMpNBogGtJIN3+NDNc1oa8VGKXpY3LCnJDg
         Hh/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739907039; x=1740511839;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0T8F81F4dclX+rJ/ZeU1mJZ2+c2tosLP5JZ1w46AvKI=;
        b=jIIlGXWdoUl3OeKdHw8Q1bHvRSJvykYsCKXgl2Ir0/L4BeKT4pfHkHy9JUnwZZe6m2
         xkfFnX+8dTaDsujD80PyvID8dd5ZRr51Cc909VBFxx1T9fg4z9Mycf6WOoBj8KtkgWZO
         Sq7mrGCpJtqc9gcEXe7id8fFle6K6FglN0z/vBoa7wz0URRAzpswAik/faVimCKwAtwu
         Sy64ezGyfWvNTzQijHu4mgexyPc92Oj1KQ04FuVs1Py9P5g4IRG9hsLPafNExENRU7gV
         R+c/8vyFmkbJQ41tkcIaJ4kz6rYBpIL2vgaxLYc3yuRwmxAHrZGzx5iL3d0FYAJaaPOv
         8HpQ==
X-Forwarded-Encrypted: i=1; AJvYcCWfBesmP7sIx5UcJtaSyal9HCMWX8898H06bNd3sN9nZT1y0zGu26Ucy5E/IN9ZW806TQGQV8ulSBDC@vger.kernel.org
X-Gm-Message-State: AOJu0YyH0QrXMhAOXBKp1+1u/bRubuEBhJ5+N9TsHt2jhoNZJdoq0Jde
	5R9ymzVLaNDUvOWjoP9hinsDIZbb2H/qYaGSg/+kXfb7UAllHLNJtWEiopNRSpo=
X-Gm-Gg: ASbGncs5xplFd6bk8cV2R2RYiMIffSp4PeyRRvcqx4DLkDIZjNO3RDcmt0pQ2I7WLgp
	NOWXcL9K+5i9WQi9xPk2vt6fC0eidR5QGFn1RE6m/iN9GnwD/Q7blRqAckvGaCJhk71Rks44/KT
	CHeSGNXf5HHvj+9hPgHHWIYFrdEN8YWhdmP0hNvvPxo6q423vbFE88KZNPJCcgDSM5yRuhHGo54
	aFSR38eGb+rVfWuR/YQuDqzrBESZq3BMMxL8JafhG2oJ24C7M3jnvaEtTMaKmKvqKCGo4hA/GtG
	hC0LXvgE3EN1baszY/srw/EqcCp3
X-Google-Smtp-Source: AGHT+IE38d9H2TgXTyTup8jkjPe2nCO1VlNwQJGJqEx5dpp48IZsz14VskWGHfiixxpwINWmEkNfGA==
X-Received: by 2002:a05:6402:13ce:b0:5e0:4a92:6b45 with SMTP id 4fb4d7f45d1cf-5e04a926cd7mr12713674a12.24.1739907038738;
        Tue, 18 Feb 2025 11:30:38 -0800 (PST)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:cbaf:af0:839d:fb4a])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-5dece1c3ce5sm9338985a12.17.2025.02.18.11.30.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 11:30:37 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Tue, 18 Feb 2025 20:29:47 +0100
Subject: [PATCH v4 2/8] reset: mpfs: use the auxiliary device creation
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250218-aux-device-create-helper-v4-2-c3d7dfdea2e6@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2301; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=lC4JGAW79Gffs1TQMyzi5K8iGZRUrc3LT4D+fKp54fk=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBntN/QcUQEhOWVZzyl8Bk6xzmnH//yZHJXSRo9/
 qRN2pMyjUyJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZ7Tf0AAKCRDm/A8cN/La
 hWnTD/9N7uDw2MgUMxhgsAUT5/+278puGBABcsLjbLLras1TheSQNvuJ2k6CxLv1JzCY2D66v4g
 1IZyaW6xKXiWnXsDJvRMfcjRdcEROcGnF3UC4ySSisSHu/ZQztXxFB+ZWe/fkAj0Yr8I5rv9jdi
 CVlbgdypg0F/xyy31QioTBrNDzru3kX+AZPogf8//n1HoaxOA5nRQAU+AMJDDJE4Tu3ZuwXujs8
 eHY+xCL7EVf2v0LnCxVtOkWdzWc1WD/1f83AvRqQh8zo/ADR5A8bcX432Ca2efhXfpTiJtTGV3C
 nkRAlV3jUon29+Atl1cui8KDavDFHk/+0IIwCMvrCreR+4YHxT4f+w2ay7hyiJ93zHmOpeBNwlD
 nsa+oMRZdeU6vHD2y2GJHX7m9CSFp1E8zmd2evt/+ZCvVMPhdfGJInOpC0HIWUKb46a8NeJxWly
 0eI7MOS4MfFJow59r73kkCyYHBPv3mfqUg+oCigQGJHFaP5irNw8C9yO4xX7Rabili/pwsYyI7G
 JTcCo+pvGbCJ2MnXqS0x6JpyZ/ZFrneZmwpN5fi3gPKSYljCbeXbCHd8pjuzg/Gu0I9u//RPWWo
 ufdtuzliUyzrzCu0/+O2KjwjCQuyA3XbhhDaA6uUq+TsSZbwdcJ6nKs4JMfwO9I4wruQJBQ8Dxc
 0NFwBr/IpdOtN0g==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

The auxiliary device creation of this driver is simple enough to
use the available auxiliary device creation helper.

Use it and remove some boilerplate code.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/reset/reset-mpfs.c | 56 +++++-----------------------------------------
 1 file changed, 5 insertions(+), 51 deletions(-)

diff --git a/drivers/reset/reset-mpfs.c b/drivers/reset/reset-mpfs.c
index 574e59db83a4fcf30b60cb5f638607a2ec7b0580..f6fa10e03ea889e5434110156f7bece808a6ae92 100644
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
-	if (IS_ERR(adev))
-		return PTR_ERR(adev);
-
-	ret = auxiliary_device_add(adev);
-	if (ret) {
-		auxiliary_device_uninit(adev);
-		return ret;
-	}
-
-	adev->dev.platform_data = (__force void *)base;
+	adev = devm_auxiliary_device_create(clk_dev, "reset-mpfs",
+					    (__force void *)base);
+	if (!adev)
+		return -ENODEV;
 
-	return devm_add_action_or_reset(clk_dev, mpfs_reset_unregister_adev, adev);
+	return 0;
 }
 EXPORT_SYMBOL_NS_GPL(mpfs_reset_controller_register, "MCHP_CLK_MPFS");
 

-- 
2.47.2


