Return-Path: <linux-mips+bounces-11137-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 93379B4A7F0
	for <lists+linux-mips@lfdr.de>; Tue,  9 Sep 2025 11:31:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 77EF1188CA05
	for <lists+linux-mips@lfdr.de>; Tue,  9 Sep 2025 09:27:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABDEA31158C;
	Tue,  9 Sep 2025 09:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="AuK0gUgr"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B005531063B
	for <linux-mips@vger.kernel.org>; Tue,  9 Sep 2025 09:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757409374; cv=none; b=VgNUU9GPnW6GO/TJG1e9/eIJxzVR4FDQXGfcUBI+6gXvpKjq5QHb+N80VjFtgddrdJHtt3a39/hZ/iusLaoS2W+5PUNeZ4wGQdgu1eZXtT3hlu5jCqFPvHwVESmrAbTT7HVaMa+bTQnM2qhPx53pqpYMOxnAjK+f2i+HpS1qlFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757409374; c=relaxed/simple;
	bh=pfY5A0u470ZWmlLJkPgoDVi7l1fJw/+hwUAmIObpEP8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=vAETxnUvS3mO/BuVrlI4jp9TP79f7ys45MXwgpIStABNOZTjbAm5XA6SLv/Ons6l3Pck7VOwTAbp/QkgYsahE/le6SBYFZEaBeQEdZ1zTBsd9hfvXbNCV/AyBAJEf/dlmNJZG5uVDCY48CWuXkngnQgUWHWFFu3MA2zBissQosc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=AuK0gUgr; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-45dec601cd3so8417835e9.2
        for <linux-mips@vger.kernel.org>; Tue, 09 Sep 2025 02:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757409370; x=1758014170; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7NS6kcVwueQk8PTITkKoVosiwdk6Lg4fQNiLC3+K+D0=;
        b=AuK0gUgrqmPRHUjGvJSXt3LmL6oqBoiEW2mn/Uox+IybzG/3sNs+MgZ74t+Of8qoSm
         /Qf9Ot3AX7KZoPGzhuWpt93pJ6KHoGCu++in+e5SNw8nXeZsnDQGFZQEkGaU20jZx1qa
         Bv3AyuLQbAqBsUMFAVQkPCplOgqcHXpQmdtSIEHk0jWlkfZD/rK32voTen46dhaI2Rhz
         Mqu/INfRovcvg/ydb5xcaP4/ayVE5uuF1KYOlD1k3u9Ehhw2Wf44vjEnSpC5qv4JVQUU
         5TDh2GDo6C8ZQIw0AvyuuWcEr1UOdWpVaCsO4ZW5CwowPBi2epJeZa4HL66c0/o5X8NQ
         SU1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757409370; x=1758014170;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7NS6kcVwueQk8PTITkKoVosiwdk6Lg4fQNiLC3+K+D0=;
        b=rzMYES1r3+NM02rAAd2xQbEsEPw//Elb3MOyvase3+kfEUUrdQfu1PhHTkkrSLWv2w
         Mab7forqSSfr/9RkB8dcqDo7ANdE4RkCuIFdXufEZsC1J49KvKbQY0Dj1h2pIf5FsR6v
         sNupTlpRsXo2VfH2CLsfZebD9OR62I21mUHMr18E7HN+BWsk8K9/P+AKQAMuMfxW+6Sq
         y65ZPv2BjXWZnk0TghFQYzK/5SgKdVXlGUFcsruYsR56CoMfniRmOXngcdoCcvLBB6TZ
         tv9k0HFyctoGIhty0Sdn+HP3zYLqnqrLdA+EpS5v4GnO3PriAenhyXb/ho3jAyHMl4J5
         /JlQ==
X-Forwarded-Encrypted: i=1; AJvYcCVNqmKdkOuHeS5/XuTwgaLKQs05Qy94kKUGyiECdXhnbeIDlZ2GDNSTopejXVFxiM1ytggDIQE+XWI1@vger.kernel.org
X-Gm-Message-State: AOJu0Yxd6bozKH8F8nCofFnCASCoZylNW4RGaIDQWbJgfvkO1JjVVTww
	f9F5CQ6FiX8l1Pqo2rRO/VcJDk2MV0oQDY5a7q6KtP1Gb1X31oXL2cNcf8vVTpIsmX11lotg9mN
	rwuEj
X-Gm-Gg: ASbGncuSDR69ua29fE5p/c46ZJtEqDz71/5j+616Lakx2LlUzcsq2v7k2lxer7ebPiG
	uo4han6/xEakYN2e8qlLWI3cp+4T/Zn3vlF3WhRgt/GKNbQgypgISMdOEMQkSQs2vPWDpE+QoTf
	yFZ1GlArydwWf3Z/XpQBZZVk0wt7WB3mywzVeAlNcqh+yOtvnvd967tqQBMlKtnMUIlGuOOxTGa
	IZAOM2TyyNcB26D5cD2Id1ZLyZk7+P0GGFu3p1IFiQuSDxZNuwEr0hy0wK5LG2eviDeva8NOQgU
	Qhb+lr3DSytWNwvYYPAEhTpwdFELWP/tvrmgnC+ESk0hXJCcOfJP3fM7ftQmRJSqp2Ifl5Wyicu
	8B602tZgJHAKZykQg9q4o7YzJczPw
X-Google-Smtp-Source: AGHT+IGoJXBvUJSpBt2lyPYKxW7iuqKGK81p5w4PzJvmsSblYb1erZflWT5xfvs5LzLHjloaRsoS9A==
X-Received: by 2002:a5d:5f82:0:b0:3e7:4271:8c6d with SMTP id ffacd0b85a97d-3e742718faemr7197437f8f.34.1757409369974;
        Tue, 09 Sep 2025 02:16:09 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:c1ee:7be9:3ebb:6cc0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7521c9caasm1900039f8f.19.2025.09.09.02.16.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 02:16:08 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 09 Sep 2025 11:15:41 +0200
Subject: [PATCH 14/15] gpio: mmio: use new generic GPIO chip API
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250909-gpio-mmio-gpio-conv-part4-v1-14-9f723dc3524a@linaro.org>
References: <20250909-gpio-mmio-gpio-conv-part4-v1-0-9f723dc3524a@linaro.org>
In-Reply-To: <20250909-gpio-mmio-gpio-conv-part4-v1-0-9f723dc3524a@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Keguang Zhang <keguang.zhang@gmail.com>, Alban Bedel <albeu@free.fr>, 
 Doug Berger <opendmb@gmail.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Samuel Holland <samuel.holland@sifive.com>, Yixun Lan <dlan@gentoo.org>, 
 Andy Shevchenko <andy@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2852;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=ghLIXnylAYcLYVJg4ksyA9B4/RaoUKjw1Cc8UARhArE=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBov/A7M1kWuQRnL65yzzeom2IENhFIls+CzXrAj
 boY3wL6vvGJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaL/wOwAKCRARpy6gFHHX
 cjUbD/sHaYXToO+u0YqX7txBkP4Ezr0jc2j0S4iqMhj2XV/ZOkALp/qxGiMGm3GaPndvBOHLlko
 a+JYIaEtSb2cUM4o/Q7qpaiHJY7TST7XfNadxyDo/SfLQtQr7BzQ5FBU7+WU8omyvO2EonGCvah
 cCGCSQagVc7uqle5HXUtXcx5bglGy23IdFAi3D5HcPbgu8r4hegVKRPB35R3L196GVHJOARdZlJ
 SqGKqXaoRrqsCjoV7KfdkJs7Aq8KZs5lAMV/E7/Vjs0OQ5oL+IGXlf1pkfPQrk+m+bxxPo+CD1s
 o1co0Zh6+J34EVC5uiOvxm4QiWuJNJZ4OrU//m1bYHhAksr0qaLZmf6sd2eJ05ZyV2pCwbRyGcK
 NdN/wr81ld7t7tuLtbiWO85UH3i8G7+jlHyAB5kk4Bu1czKO0SCtM90ng3QeNoqhG/sI++TESm4
 JXHWeVwLLpSZqMU2Bf3EBFk0bPm1futJyBqmHcfDoPrXUJck+4IC/VrLUn09S8Y3evWzn9eTA2L
 NoxZIkWhOuNM8wZeBEuOPJ3IROTEAl0i0TNfkgOm76aAzuo5LXUEgUbIHQbNNi1KB3Wy8DD5i8d
 nkF6QDdT+keKJjVnvSQGBqIefYenhz+NehXtlsxXnYQKSdf3vpEEpWJ9iObJDEZVE3REDYl3+Il
 tXWZSivklUydFdQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Convert the driver to using the new generic GPIO chip interfaces from
linux/gpio/generic.h.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-mmio.c | 29 +++++++++++++++++++++--------
 1 file changed, 21 insertions(+), 8 deletions(-)

diff --git a/drivers/gpio/gpio-mmio.c b/drivers/gpio/gpio-mmio.c
index 79e1be149c94842cb6fa6b657343b11e78701220..a5e2f8a826af40ec96d2a3ea58240f1ca8ed250c 100644
--- a/drivers/gpio/gpio-mmio.c
+++ b/drivers/gpio/gpio-mmio.c
@@ -57,6 +57,7 @@ o        `                     ~~~~\___/~~~~    ` controller in FPGA is ,.`
 #include <linux/types.h>
 
 #include <linux/gpio/driver.h>
+#include <linux/gpio/generic.h>
 
 #include "gpiolib.h"
 
@@ -737,6 +738,8 @@ MODULE_DEVICE_TABLE(of, bgpio_of_match);
 
 static int bgpio_pdev_probe(struct platform_device *pdev)
 {
+	struct gpio_generic_chip_config config;
+	struct gpio_generic_chip *gen_gc;
 	struct device *dev = &pdev->dev;
 	struct resource *r;
 	void __iomem *dat;
@@ -748,7 +751,6 @@ static int bgpio_pdev_probe(struct platform_device *pdev)
 	unsigned long flags = 0;
 	unsigned int base;
 	int err;
-	struct gpio_chip *gc;
 	const char *label;
 
 	r = platform_get_resource_byname(pdev, IORESOURCE_MEM, "dat");
@@ -777,8 +779,8 @@ static int bgpio_pdev_probe(struct platform_device *pdev)
 	if (IS_ERR(dirin))
 		return PTR_ERR(dirin);
 
-	gc = devm_kzalloc(&pdev->dev, sizeof(*gc), GFP_KERNEL);
-	if (!gc)
+	gen_gc = devm_kzalloc(&pdev->dev, sizeof(*gen_gc), GFP_KERNEL);
+	if (!gen_gc)
 		return -ENOMEM;
 
 	if (device_is_big_endian(dev))
@@ -787,13 +789,24 @@ static int bgpio_pdev_probe(struct platform_device *pdev)
 	if (device_property_read_bool(dev, "no-output"))
 		flags |= BGPIOF_NO_OUTPUT;
 
-	err = bgpio_init(gc, dev, sz, dat, set, clr, dirout, dirin, flags);
+	config = (typeof(config)){
+		.dev = dev,
+		.sz = sz,
+		.dat = dat,
+		.set = set,
+		.clr = clr,
+		.dirout = dirout,
+		.dirin = dirin,
+		.flags = flags,
+	};
+
+	err = gpio_generic_chip_init(gen_gc, &config);
 	if (err)
 		return err;
 
 	err = device_property_read_string(dev, "label", &label);
 	if (!err)
-		gc->label = label;
+		gen_gc->gc.label = label;
 
 	/*
 	 * This property *must not* be used in device-tree sources, it's only
@@ -801,11 +814,11 @@ static int bgpio_pdev_probe(struct platform_device *pdev)
 	 */
 	err = device_property_read_u32(dev, "gpio-mmio,base", &base);
 	if (!err && base <= INT_MAX)
-		gc->base = base;
+		gen_gc->gc.base = base;
 
-	platform_set_drvdata(pdev, gc);
+	platform_set_drvdata(pdev, &gen_gc->gc);
 
-	return devm_gpiochip_add_data(&pdev->dev, gc, NULL);
+	return devm_gpiochip_add_data(&pdev->dev, &gen_gc->gc, NULL);
 }
 
 static const struct platform_device_id bgpio_id_table[] = {

-- 
2.48.1


