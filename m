Return-Path: <linux-mips+bounces-6001-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E8B999B339
	for <lists+linux-mips@lfdr.de>; Sat, 12 Oct 2024 12:58:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2B6221F2400E
	for <lists+linux-mips@lfdr.de>; Sat, 12 Oct 2024 10:58:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E085155CBF;
	Sat, 12 Oct 2024 10:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hS3mKbNg"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6845D15534D;
	Sat, 12 Oct 2024 10:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728730697; cv=none; b=YQq28wyxee1wHNcVOrN/8wDJgkiNxeWwYyyMshtg4YKjyCwKz+QUijIf+b5YfQBkLo5LXHnLV5FZY9jAqm95jRQ0jhRCKlYklppcxJkhKBZClDvSIuPN9JbZ0omq+t4BrHsrbeZfk6OeNTiW2H25zCHUIqBXurTLcYzbbk6pwEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728730697; c=relaxed/simple;
	bh=z4IaITTfM9CLQeC30kewCLBTMVVQFXjBlqESR37Y9Mg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ACZg6kBVx4gz3uEFJ6sSrkrHEDQoAeNFYVkedCpWJQez5y2/uWvaPAOpERy01xpRhToy20TqN7SRPvQP8T1PuqHd2uYSA9uIKHf3NPhZrmkyTPsG1zkGGiJviQbfnhDqUQom6qPm1vDtpu8KB5fy5YfjtXloC092aoO3mhp4AzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hS3mKbNg; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5398e7dda5fso2804074e87.0;
        Sat, 12 Oct 2024 03:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728730693; x=1729335493; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Av7Zzf1fZtUDBL1oRh0TlfThGawFwtPaU6RDJ7RcuD8=;
        b=hS3mKbNgg69uNlMVIjtNI2w3S6e9jHuPfUZtLPQEf03MmgVyU3cbdqyv2sc8BcaH0H
         J4x1VSm8CvU5MTVwv3nw/+W18EgMrjgTy6j4EfjAbmLfqOENG1JGHSqZ7Y7ko24fPWy4
         r6x4gxpKNIx7ovEOfhHVcF+HHnvKgbYhhfV1RiRrZmUKYr/NAXatu/QF1Ud4kse6lzD3
         37o7mbjV0cGVlg9D4CyzA1e3W5ra/FJ+WFCiQKSCQe3mg2gV3Ul9NWzlQLA2/MJGhcBY
         Mz88EnldeRJvJfVi5CikFh7HgPhVOYAGJj4Wh9Q6xy1NQ3OrZi+8p530Vt10ZfoRDZEv
         icng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728730694; x=1729335494;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Av7Zzf1fZtUDBL1oRh0TlfThGawFwtPaU6RDJ7RcuD8=;
        b=nDJIZruPUHZoNoEhxAjRQlmM2iRUbpSyWV9IIAI6kYG5SxRyPw4qOFpHEAvcqAie0P
         5gWqDWCsCPJsb8EKbMYznpeexIHIXTAfQ6oj66pwTvAI3piHzPedHYKC3R3NonEmaOio
         3qZSWWf1ciMKvfJNeXBgXxUMC6S4EgnfGYvDnKAuQAe96qmGJ68uZXyLDgUE36MeXNhf
         YkFBQZDEAXEbmMWRHYDcxg9PkXEz85x+XEfPW+krW749VdhY9wblghUvw2VlNlu2Vmdq
         l6XJ8agxnCaoAglZIxJsmW5BttB2t+HQb70aQeQAjZECUdX8MnJuS7b8iYPPyoljyL6K
         iSfA==
X-Forwarded-Encrypted: i=1; AJvYcCWRL2vRSVY6QXYoPGSNcI7NYXSRFJPjEuzS/ijvwx2WDnXd1r03GLOGV1r/labMyaGoeVkwE2FWTWHv@vger.kernel.org, AJvYcCXR04fuCP3z+Bv2q2APMzVGGuwy70tU/DNUGJYNCD5Bv1N+3V4wpOIbXJ0qbiFFzA5PBg0rIzZ4mB7nvV9M@vger.kernel.org, AJvYcCXlceXk1nzoTGKIh+srqx5Z5eR1K1Tsw2TsFiCW+nP6/y/ZxA5Ev28o2sy0RJHLH4OM2Bwxysb9yGatDw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyQ8UZgQXCi4NgDxXlK017Gh0UqV+IzZGd0AGGKj5CYwzokO/C5
	FXyNBkEl2g/b3e5SZQEg2bHRLYkoctbn7wuNeRkbRBbz+4mvXc+m
X-Google-Smtp-Source: AGHT+IGLbCeJX8FV+q8Hc0+59ht/muVlxi7z0cHYmSPz/j1h0Ez6+43ddnI5dKt9TchS7gJHNnjOIA==
X-Received: by 2002:a05:6512:b11:b0:539:8d9b:b624 with SMTP id 2adb3069b0e04-539e5742bdamr1026898e87.55.1728730693273;
        Sat, 12 Oct 2024 03:58:13 -0700 (PDT)
Received: from KILLINGMACHINE.itotolink.net ([46.188.27.115])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539e2a59408sm396944e87.206.2024.10.12.03.58.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Oct 2024 03:58:12 -0700 (PDT)
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
Subject: [PATCH v2 1/1] pinctrl: ocelot: fix system hang on level based interrupts
Date: Sat, 12 Oct 2024 13:57:43 +0300
Message-Id: <20241012105743.12450-2-matsievskiysv@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241012105743.12450-1-matsievskiysv@gmail.com>
References: <20241012105743.12450-1-matsievskiysv@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The current implementation only calls chained_irq_enter() and
chained_irq_exit() if it detects pending interrupts.

```
for (i = 0; i < info->stride; i++) {
	uregmap_read(info->map, id_reg + 4 * i, &reg);
	if (!reg)
		continue;

	chained_irq_enter(parent_chip, desc);
```

However, in case of GPIO pin configured in level mode and the parent
controller configured in edge mode, GPIO interrupt might be lowered by the
hardware. In the result, if the interrupt is short enough, the parent
interrupt is still pending while the GPIO interrupt is cleared;
chained_irq_enter() never gets called and the system hangs trying to
service the parent interrupt.

Moving chained_irq_enter() and chained_irq_exit() outside the for loop
ensures that they are called even when GPIO interrupt is lowered by the
hardware.

The similar code with chained_irq_enter() / chained_irq_exit() functions
wrapping interrupt checking loop may be found in many other drivers:
```
grep -r -A 10 chained_irq_enter drivers/pinctrl
```

Signed-off-by: Sergey Matsievskiy <matsievskiysv@gmail.com>
Reviewed-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
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


