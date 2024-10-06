Return-Path: <linux-mips+bounces-5757-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CABF399204C
	for <lists+linux-mips@lfdr.de>; Sun,  6 Oct 2024 20:14:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EF1DB1C20DCF
	for <lists+linux-mips@lfdr.de>; Sun,  6 Oct 2024 18:14:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4184718A947;
	Sun,  6 Oct 2024 18:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LUSd2YaI"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EEFA189F33;
	Sun,  6 Oct 2024 18:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728238435; cv=none; b=lU9pEQcUWF4AQUYtbSDV9Hk4+6froL5Yup3g3Gzj2ADPPN2F0aC4zSKjrBuEzdkTlyicm1NFiqX4ilDrP2/7uarsz6P7hD71u7kpHzdiFNG3YMygTls5/WP4t920hTMHabkA+Xera+9Tc49ZmAr5H14gPoXN+/ZDs5rT6h7tfUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728238435; c=relaxed/simple;
	bh=2vinHMjIVsbvXvk/POIE6BcHLC5+k4nm8160D4G4mLc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=LJD5w7wtV7wCwwxtyVdTYuMpOx8CE+QNSU4MLl7ucttDiqYtFkO+IvcEHcv1kglN5wPFAOIoS9lZnMEDmBrvfbhV8cMKCJSJgfK91jDZMkUJGHgWZ7yH9c0ON8TX4n+WaD+BN7DIejd8BaoUF/e8N27+MwnhzNbDJrWJyw6I5ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LUSd2YaI; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2facf48166bso42063011fa.0;
        Sun, 06 Oct 2024 11:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728238431; x=1728843231; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QEQVGFiC/tUnd5t9LVKOtGNBDLBebGm5Cn79MCVhRTY=;
        b=LUSd2YaIyBRygtmoXJB4YlmHtaYOdPNsPjCNC5NA/ztJEE+rPyCbcUDAXFIrXWLVt1
         6dyI/BTkfbvbpnnbSxQ3FvjTl1VEfcjf4uPxtLeslgzva0nlqZkwGCpeSDLRzhudHjcZ
         cEx9ECPNsJTyg3S8plPwAiDLuiyxtCNgIwuE1DkaLXqX51++m4YyUMpZq9FYsA0STRet
         RPns2ilLy2DGtwsyEMSIDecvNOhcTzJXAijcKtamz/DbOzyn2YBObjS+7vVzWHNh6dFX
         QhCYF+iMfAbpstZU6dgT/iDPpJ5q0/b9+25Jmn06tLk/kzQbiYXIyPpxjWbB8BWhMTRJ
         VvaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728238431; x=1728843231;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QEQVGFiC/tUnd5t9LVKOtGNBDLBebGm5Cn79MCVhRTY=;
        b=ANc5VuAj1x35hhUDwhYasAb3Zv73XDeo/8O+bMdqx964AGtuxuGtyiYH9ceF1NauTZ
         vRbm+vkhf/3dS6Ha1qTdnWMcfDE1UweAtSUmIJjxGT0bRsvZvkoen/iTsrIRDCRNn3OO
         xcUGB4WqMFwADDxgTSYePs4f1oUeaMWoSny2q0H0WHTY7iavpamQHq1FpvcCHPOLI11m
         Mydi7R6139pkxGGUjw83aZPuiSX4CsngUI9LEOhSgbM1jCimHVxKonir43+y14UjP++2
         TM3vFcNVk0qFAq9seTB3yUVWH/k+p3KjLsW1QewEhWmvbnCKapMpAE4Ye+GvTGZSAOcl
         jqaw==
X-Forwarded-Encrypted: i=1; AJvYcCW7kI7201XdfzMweNBGT6Izp2Soft4L1BaYALZlpLCLawC+SKqp30sQ23ATKh/Q+aNZKPxGVJDhrxV2yw==@vger.kernel.org, AJvYcCWDWQh5tQal/RX2R1SILslBlZSixfG9887E8VUIzd2SGUiky6elv9BVYN3M+FPeBIvXNWVNOUYePL4GZ1Uy@vger.kernel.org, AJvYcCXVDmpWotsEKtaAYfYgbLCfvSOZUv8AzR7KGBXogQsJy89UtAdN2oSRANVluJ1Uv2k2+UYrYWoM6G9N@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2b/s6msCo2WjQKGezrxGzbeMZMaQazvP3B177NBXarsTX+aOd
	BoiYbUZujzD9DFoczG/PYMg0m2t52b+sjRzVFVZHxa272j5FoK5prMzoetul
X-Google-Smtp-Source: AGHT+IGU3f+3dQWU6E0+4c/4FD7P0D7h0sWOR8HA0OR4JE6sNH0tU1BM3gwhHRG9fy/C1j7n8PLhLQ==
X-Received: by 2002:a05:651c:a0b:b0:2fa:c6b3:bf1c with SMTP id 38308e7fff4ca-2faf3c01f43mr41983451fa.8.1728238431374;
        Sun, 06 Oct 2024 11:13:51 -0700 (PDT)
Received: from KILLINGMACHINE.itotolink.net ([46.188.27.115])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539afec8276sm590372e87.86.2024.10.06.11.13.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Oct 2024 11:13:51 -0700 (PDT)
From: Sergey Matsievskiy <matsievskiysv@gmail.com>
To: linus.walleij@linaro.org
Cc: alexandre.belloni@bootlin.com,
	quentin.schulz@bootlin.com,
	lars.povlsen@microchip.com,
	horatiu.vultur@microchip.com,
	andriy.shevchenko@linux.intel.com,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	UNGLinuxDriver@microchip.com,
	Sergey Matsievskiy <matsievskiysv@gmail.com>
Subject: [PATCH 1/1] pinctrl: ocelot: fix system hang on level based interrupts
Date: Sun,  6 Oct 2024 21:13:10 +0300
Message-Id: <20241006181310.181309-2-matsievskiysv@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241006181310.181309-1-matsievskiysv@gmail.com>
References: <20241006181310.181309-1-matsievskiysv@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix interrupt handle loops, produced by spurious and short level based
interrupts by unconditionally clearing the parent interrupt, even when
no GPIO interrupts are pending.

Signed-off-by: Sergey Matsievskiy <matsievskiysv@gmail.com>
---
 drivers/pinctrl/pinctrl-ocelot.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-ocelot.c b/drivers/pinctrl/pinctrl-ocelot.c
index be9b8c010167..d1ab8450ea93 100644
--- a/drivers/pinctrl/pinctrl-ocelot.c
+++ b/drivers/pinctrl/pinctrl-ocelot.c
@@ -1955,21 +1955,21 @@ static void ocelot_irq_handler(struct irq_desc *desc)
 	unsigned int reg = 0, irq, i;
 	unsigned long irqs;
 
+	chained_irq_enter(parent_chip, desc);
+
 	for (i = 0; i < info->stride; i++) {
 		regmap_read(info->map, id_reg + 4 * i, &reg);
 		if (!reg)
 			continue;
 
-		chained_irq_enter(parent_chip, desc);
-
 		irqs = reg;
 
 		for_each_set_bit(irq, &irqs,
 				 min(32U, info->desc->npins - 32 * i))
 			generic_handle_domain_irq(chip->irq.domain, irq + 32 * i);
-
-		chained_irq_exit(parent_chip, desc);
 	}
+
+	chained_irq_exit(parent_chip, desc);
 }
 
 static int ocelot_gpiochip_register(struct platform_device *pdev,
-- 
2.39.5


