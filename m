Return-Path: <linux-mips+bounces-11189-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 985B2B50F09
	for <lists+linux-mips@lfdr.de>; Wed, 10 Sep 2025 09:16:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 329917AD156
	for <lists+linux-mips@lfdr.de>; Wed, 10 Sep 2025 07:14:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 189AD309EF7;
	Wed, 10 Sep 2025 07:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="YSAEvJGM"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C7B3307ADD
	for <linux-mips@vger.kernel.org>; Wed, 10 Sep 2025 07:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757488413; cv=none; b=uqYD33SRqBczv8dM19H3ombHzpnUs+J3cpGw+S87kSMG8B/cRBqV/nzsvthN797XwDuXfxckhv0QlwrK8IGKrlCoKWZrlSypd2A/1Tl+dA0fUgX2IQOWCpWal09YMzPMPbSCVigSPUX9OQaUyXxzp0TGIgO32YwFaa+Lt6UCKck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757488413; c=relaxed/simple;
	bh=jM9HZPZj4Z3NSrT8fO/FR+ycs0RuVA+R9XSOSXviJ7U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SLRvA4Id/qfmz6/e9IHlc6ScgdAktallgJR/kLT2wq9EIwopCIDQGX9Plg5pxmD300zUansJg78Hq+R0rz7AfRhLghC6o1iLCX1S883oTKFf1q24wRWuw230fg89kl51Gn4TR+OsMRqTQh+k5WhG18LQm4Vo/hXVur2qTSC7uUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=YSAEvJGM; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-45cb5e1adf7so53302325e9.0
        for <linux-mips@vger.kernel.org>; Wed, 10 Sep 2025 00:13:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757488406; x=1758093206; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZUHzZdVGwuFyc1spevp1MxuwlP6If42bm6AhrkTFCmY=;
        b=YSAEvJGMP7EO+uGA/j9aAQhA7qpq53zXMfdzTRoSDtmF98q0YHOZuL1fZjo2EkOhxE
         Shb01tRRuk6u1pihNLImKGQurQeSOgXuXGN/M4KF6aTRhJFALwMKZAepSKz/P2dBTIrB
         qxn+iaZctemNhQNjjX3bDCrUhiN+IsQ6bQO3sbjSgCcjqJsS/5+vV6Jo5qSxQ2nB4rtV
         5cKZ2GH9oaXQv98QAm3zF9gHk2NQAkY/LpOuYYArle10Tydqt6omvdUxgQpEPCFhM4K8
         DOLGuTR+/bMxm6P67dhzen9i65TQVIasr7GPMC4ylBg5iuNVp4mCLyrL3Tiz5Rc6KYJ9
         h0TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757488406; x=1758093206;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZUHzZdVGwuFyc1spevp1MxuwlP6If42bm6AhrkTFCmY=;
        b=a2rRDnex/Yor19eHFNxrpT32yMEFnn8jf7g/L3BW3Rrk+bqRAzz3RbRrpfuPjZwy4q
         Hamq7Qat34fbYB2vzhpLLXGyIvk/IHdYxS7pISSeYseiHMKq72btEVLo6K/Q63XBm/O4
         vGz9uAcAcx6Vh6MsrTnQd8NUSwsTSBIRvyQ8HUGZ1W28iYTEB9aT+pFXP7GZHP6OhC0n
         9Y8X67V3VtEOiNwqppdWZ6MsUdWiw5fIn8SA63IxxxTmfVJ783++B3It9luz1NqwbcEp
         Ou0sKLaIrYzJJ1G2XwGQZrsXYJ9G7XQZ5Q3dp/N7/xlh0XTqZ6cT+A3NNc880xIeB8q+
         X1Fw==
X-Forwarded-Encrypted: i=1; AJvYcCUDjFfW9C3Qwmf/Rk9VJUvAQbv4hgobUmupvEO/kR0aNWndPI6nf7YVjPbw990ZIIm+1vR4bp0NtsYP@vger.kernel.org
X-Gm-Message-State: AOJu0YxMPs7L4ws3IxDPYvn/cSU5NsdHhPYGZrdNsuM2HQwQMq0GQp/w
	Sr4Q7g1nEA2hCM4vI0gSrLi0Wmf7v1mrgrQR2J2rJGO5mJdxfOLTu2SjoRdzGc9fLXQ=
X-Gm-Gg: ASbGncu7gyu/8qPAQvnRMkVNbFq0GuEGyyVhlJC9CysVFzMJWWJ4y9Jzgo5sg5BuTDE
	wDEM/qNLdkFFNB6ZB2S48Sqk8nhT5e3r/UEkikxedLnlm6Ejen6QGCxDCs2/P14LOPmshNhA3a8
	5t5uCtjz+09DgRAARs7Edz9pOhz1zKkP4CWDlfea0qkDdE8j3/XAtdR8dNmXX+PICcRDBO0VnDi
	pnAuc5YlTmgoX3yawFRYrI5lO1GhYgKCpTtXSt9v5S3U3n4/DbIZdcKpDK5ktOHBWznTni4ovyz
	VzP+hTGplKfe+QTHAK++s9v9g07klhchMg0YTmnBQJOiTQuQNy0nYm+UW5yoIec6pqJ+EEDdbci
	sIiGKf9AzuJzFnhXn0gq4lhKcfTY=
X-Google-Smtp-Source: AGHT+IEZai2wUqX32R6KjxPyJg82r4y4y4WjSxmKQUBH8UwufegapAOzqHjr9rMbwhU8Bq2SJ+ys2Q==
X-Received: by 2002:a05:600c:4e48:b0:45c:b52d:8d30 with SMTP id 5b1f17b1804b1-45dddf22eb4mr128606295e9.26.1757488406334;
        Wed, 10 Sep 2025 00:13:26 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:3936:709a:82c4:3e38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45df81d20d2sm16357035e9.8.2025.09.10.00.13.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 00:13:24 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 10 Sep 2025 09:12:51 +0200
Subject: [PATCH v2 15/15] gpio: move gpio-mmio-specific fields out of
 struct gpio_chip
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250910-gpio-mmio-gpio-conv-part4-v2-15-f3d1a4c57124@linaro.org>
References: <20250910-gpio-mmio-gpio-conv-part4-v2-0-f3d1a4c57124@linaro.org>
In-Reply-To: <20250910-gpio-mmio-gpio-conv-part4-v2-0-f3d1a4c57124@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=33076;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=5QPrcJ0xGv/cLs6lAGGpKz1WPPpvYUNjcNdJbHEsgC4=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBowSTvSb7YeBUUGs/nznxvJq4YF1l3POKnwF8Am
 czwobwrO4OJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaMEk7wAKCRARpy6gFHHX
 cr1XD/wObKIj1S+LcfWdTvRZWP2rX1jTbGvR8irdITywqzEUn6ZoRGU59h3+pUW7rW6iHCprviZ
 9KCCWSuc2OVCCs/RbdLfPI0lv53lIQFdWn3J27K+4vB+v0nturphPv5MrxmceFsgSQb5KrgqSjR
 wX5r6kMVM076m++OGWW5K/uQgsr5r1CsBAl0HkBOjyhHsVaHWPAPY/t5kWREFpzfoZz8a+e5obd
 kO2M5EAH30nW/JcvU4ZdxCaqqK7oTIH4V6soGiSCFkC5ko6a9wOmJPBDVislz7PKx6y1rtMVL+p
 vlfA976gM9CimO3JNPDJmv+dOw2acDDcnGUcrPqpD+DLSwUVhbqyu2zuKG4QUUh+QyCSPbfBPkY
 6M+aKMx3edDnQnku4RASGSx4bJKAwMEtQkXpxcLNgbEPGzekje6DVS31eX/S4tPJh9Kmya75WjD
 ncpp0S+z9/C+ijVidcKASkTdpv1Bz+O5fADA681QT0oNy7FiiZBod7Fnxl/12vSciTWgZ0Oajgv
 YhAa8ftM8gy4E290JruiHXgVz+E0YWdErQtgfrfKzhbuidXpjxgHOWjF8e6zRIzMKZyVuT9s72G
 k9Umw1nnIs5sexXEsnVcVsy7katlRD+4yUKZOBWZuZjy2VSbMIgzj7QZlKAoZm1Y9SwrLS8ZOeM
 wduum87SAjM+Z5Q==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

With all users of bgpio_init() converted to using the modernized generic
GPIO chip API, we can now move the gpio-mmio-specific fields out of
struct gpio_chip and into the dedicated struct gpio_generic_chip. To
that end: adjust the gpio-mmio driver to the new layout, update the
docs, etc.

The changes in gpio-mlxbf2.c and gpio-mpc8xxx.c are here and not in their
respective conversion commits because the former passes the address of
the generic chip's lock to the __releases() annotation and we cannot
really hide it while gpio-mpc8xxx.c accesses the shadow registers in a
driver-specific workaround and there's no reason to make them available
in a public API.

Also: drop the relevant task from TODO as it's now done.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/TODO            |   5 -
 drivers/gpio/gpio-mlxbf2.c   |   2 +-
 drivers/gpio/gpio-mmio.c     | 321 ++++++++++++++++++++++---------------------
 drivers/gpio/gpio-mpc8xxx.c  |   5 +-
 include/linux/gpio/driver.h  |  44 ------
 include/linux/gpio/generic.h |  67 ++++++---
 6 files changed, 211 insertions(+), 233 deletions(-)

diff --git a/drivers/gpio/TODO b/drivers/gpio/TODO
index b797499e627ee9fdb1ee9c564b8278241f720850..8ed74e05903a972e99e0789319ed19ebd8545a1a 100644
--- a/drivers/gpio/TODO
+++ b/drivers/gpio/TODO
@@ -131,11 +131,6 @@ Work items:
   helpers (x86 inb()/outb()) and convert port-mapped I/O drivers to use
   this with dry-coding and sending to maintainers to test
 
-- Move the MMIO GPIO specific fields out of struct gpio_chip into a
-  dedicated structure. Currently every GPIO chip has them if gpio-mmio is
-  enabled in Kconfig even if it itself doesn't register with the helper
-  library.
-
 -------------------------------------------------------------------------------
 
 Generic regmap GPIO
diff --git a/drivers/gpio/gpio-mlxbf2.c b/drivers/gpio/gpio-mlxbf2.c
index f99f66cd189ca71c9d188dff0a0b42ef2223abb3..9520d26b20a5851ac8b5de239b8f5980dabc2820 100644
--- a/drivers/gpio/gpio-mlxbf2.c
+++ b/drivers/gpio/gpio-mlxbf2.c
@@ -156,7 +156,7 @@ static int mlxbf2_gpio_lock_acquire(struct mlxbf2_gpio_context *gs)
  * Release the YU arm_gpio_lock after changing the direction mode.
  */
 static void mlxbf2_gpio_lock_release(struct mlxbf2_gpio_context *gs)
-	__releases(&gs->chip.gc.bgpio_lock)
+	__releases(&gs->chip.lock)
 	__releases(yu_arm_gpio_lock_param.lock)
 {
 	writel(YU_ARM_GPIO_LOCK_RELEASE, yu_arm_gpio_lock_param.io);
diff --git a/drivers/gpio/gpio-mmio.c b/drivers/gpio/gpio-mmio.c
index b4f0ab0daaeb11bd88723f8b1c15bd09225f1d97..a3df14d672a92ac771014315458cb50933b6c539 100644
--- a/drivers/gpio/gpio-mmio.c
+++ b/drivers/gpio/gpio-mmio.c
@@ -125,20 +125,23 @@ static unsigned long bgpio_read32be(void __iomem *reg)
 
 static unsigned long bgpio_line2mask(struct gpio_chip *gc, unsigned int line)
 {
-	if (gc->be_bits)
-		return BIT(gc->bgpio_bits - 1 - line);
+	struct gpio_generic_chip *chip = to_gpio_generic_chip(gc);
+
+	if (chip->be_bits)
+		return BIT(chip->bits - 1 - line);
 	return BIT(line);
 }
 
 static int bgpio_get_set(struct gpio_chip *gc, unsigned int gpio)
 {
+	struct gpio_generic_chip *chip = to_gpio_generic_chip(gc);
 	unsigned long pinmask = bgpio_line2mask(gc, gpio);
-	bool dir = !!(gc->bgpio_dir & pinmask);
+	bool dir = !!(chip->sdir & pinmask);
 
 	if (dir)
-		return !!(gc->read_reg(gc->reg_set) & pinmask);
-	else
-		return !!(gc->read_reg(gc->reg_dat) & pinmask);
+		return !!(chip->read_reg(chip->reg_set) & pinmask);
+
+	return !!(chip->read_reg(chip->reg_dat) & pinmask);
 }
 
 /*
@@ -148,26 +151,28 @@ static int bgpio_get_set(struct gpio_chip *gc, unsigned int gpio)
 static int bgpio_get_set_multiple(struct gpio_chip *gc, unsigned long *mask,
 				  unsigned long *bits)
 {
-	unsigned long get_mask = 0;
-	unsigned long set_mask = 0;
+	struct gpio_generic_chip *chip = to_gpio_generic_chip(gc);
+	unsigned long get_mask = 0, set_mask = 0;
 
 	/* Make sure we first clear any bits that are zero when we read the register */
 	*bits &= ~*mask;
 
-	set_mask = *mask & gc->bgpio_dir;
-	get_mask = *mask & ~gc->bgpio_dir;
+	set_mask = *mask & chip->sdir;
+	get_mask = *mask & ~chip->sdir;
 
 	if (set_mask)
-		*bits |= gc->read_reg(gc->reg_set) & set_mask;
+		*bits |= chip->read_reg(chip->reg_set) & set_mask;
 	if (get_mask)
-		*bits |= gc->read_reg(gc->reg_dat) & get_mask;
+		*bits |= chip->read_reg(chip->reg_dat) & get_mask;
 
 	return 0;
 }
 
 static int bgpio_get(struct gpio_chip *gc, unsigned int gpio)
 {
-	return !!(gc->read_reg(gc->reg_dat) & bgpio_line2mask(gc, gpio));
+	struct gpio_generic_chip *chip = to_gpio_generic_chip(gc);
+
+	return !!(chip->read_reg(chip->reg_dat) & bgpio_line2mask(gc, gpio));
 }
 
 /*
@@ -176,9 +181,11 @@ static int bgpio_get(struct gpio_chip *gc, unsigned int gpio)
 static int bgpio_get_multiple(struct gpio_chip *gc, unsigned long *mask,
 			      unsigned long *bits)
 {
+	struct gpio_generic_chip *chip = to_gpio_generic_chip(gc);
+
 	/* Make sure we first clear any bits that are zero when we read the register */
 	*bits &= ~*mask;
-	*bits |= gc->read_reg(gc->reg_dat) & *mask;
+	*bits |= chip->read_reg(chip->reg_dat) & *mask;
 	return 0;
 }
 
@@ -188,6 +195,7 @@ static int bgpio_get_multiple(struct gpio_chip *gc, unsigned long *mask,
 static int bgpio_get_multiple_be(struct gpio_chip *gc, unsigned long *mask,
 				 unsigned long *bits)
 {
+	struct gpio_generic_chip *chip = to_gpio_generic_chip(gc);
 	unsigned long readmask = 0;
 	unsigned long val;
 	int bit;
@@ -200,7 +208,7 @@ static int bgpio_get_multiple_be(struct gpio_chip *gc, unsigned long *mask,
 		readmask |= bgpio_line2mask(gc, bit);
 
 	/* Read the register */
-	val = gc->read_reg(gc->reg_dat) & readmask;
+	val = chip->read_reg(chip->reg_dat) & readmask;
 
 	/*
 	 * Mirror the result into the "bits" result, this will give line 0
@@ -219,19 +227,20 @@ static int bgpio_set_none(struct gpio_chip *gc, unsigned int gpio, int val)
 
 static int bgpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
 {
+	struct gpio_generic_chip *chip = to_gpio_generic_chip(gc);
 	unsigned long mask = bgpio_line2mask(gc, gpio);
 	unsigned long flags;
 
-	raw_spin_lock_irqsave(&gc->bgpio_lock, flags);
+	raw_spin_lock_irqsave(&chip->lock, flags);
 
 	if (val)
-		gc->bgpio_data |= mask;
+		chip->sdata |= mask;
 	else
-		gc->bgpio_data &= ~mask;
+		chip->sdata &= ~mask;
 
-	gc->write_reg(gc->reg_dat, gc->bgpio_data);
+	chip->write_reg(chip->reg_dat, chip->sdata);
 
-	raw_spin_unlock_irqrestore(&gc->bgpio_lock, flags);
+	raw_spin_unlock_irqrestore(&chip->lock, flags);
 
 	return 0;
 }
@@ -239,31 +248,32 @@ static int bgpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
 static int bgpio_set_with_clear(struct gpio_chip *gc, unsigned int gpio,
 				int val)
 {
+	struct gpio_generic_chip *chip = to_gpio_generic_chip(gc);
 	unsigned long mask = bgpio_line2mask(gc, gpio);
 
 	if (val)
-		gc->write_reg(gc->reg_set, mask);
+		chip->write_reg(chip->reg_set, mask);
 	else
-		gc->write_reg(gc->reg_clr, mask);
+		chip->write_reg(chip->reg_clr, mask);
 
 	return 0;
 }
 
 static int bgpio_set_set(struct gpio_chip *gc, unsigned int gpio, int val)
 {
-	unsigned long mask = bgpio_line2mask(gc, gpio);
-	unsigned long flags;
+	struct gpio_generic_chip *chip = to_gpio_generic_chip(gc);
+	unsigned long mask = bgpio_line2mask(gc, gpio), flags;
 
-	raw_spin_lock_irqsave(&gc->bgpio_lock, flags);
+	raw_spin_lock_irqsave(&chip->lock, flags);
 
 	if (val)
-		gc->bgpio_data |= mask;
+		chip->sdata |= mask;
 	else
-		gc->bgpio_data &= ~mask;
+		chip->sdata &= ~mask;
 
-	gc->write_reg(gc->reg_set, gc->bgpio_data);
+	chip->write_reg(chip->reg_set, chip->sdata);
 
-	raw_spin_unlock_irqrestore(&gc->bgpio_lock, flags);
+	raw_spin_unlock_irqrestore(&chip->lock, flags);
 
 	return 0;
 }
@@ -273,12 +283,13 @@ static void bgpio_multiple_get_masks(struct gpio_chip *gc,
 				     unsigned long *set_mask,
 				     unsigned long *clear_mask)
 {
+	struct gpio_generic_chip *chip = to_gpio_generic_chip(gc);
 	int i;
 
 	*set_mask = 0;
 	*clear_mask = 0;
 
-	for_each_set_bit(i, mask, gc->bgpio_bits) {
+	for_each_set_bit(i, mask, chip->bits) {
 		if (test_bit(i, bits))
 			*set_mask |= bgpio_line2mask(gc, i);
 		else
@@ -291,25 +302,27 @@ static void bgpio_set_multiple_single_reg(struct gpio_chip *gc,
 					  unsigned long *bits,
 					  void __iomem *reg)
 {
-	unsigned long flags;
-	unsigned long set_mask, clear_mask;
+	struct gpio_generic_chip *chip = to_gpio_generic_chip(gc);
+	unsigned long flags, set_mask, clear_mask;
 
-	raw_spin_lock_irqsave(&gc->bgpio_lock, flags);
+	raw_spin_lock_irqsave(&chip->lock, flags);
 
 	bgpio_multiple_get_masks(gc, mask, bits, &set_mask, &clear_mask);
 
-	gc->bgpio_data |= set_mask;
-	gc->bgpio_data &= ~clear_mask;
+	chip->sdata |= set_mask;
+	chip->sdata &= ~clear_mask;
 
-	gc->write_reg(reg, gc->bgpio_data);
+	chip->write_reg(reg, chip->sdata);
 
-	raw_spin_unlock_irqrestore(&gc->bgpio_lock, flags);
+	raw_spin_unlock_irqrestore(&chip->lock, flags);
 }
 
 static int bgpio_set_multiple(struct gpio_chip *gc, unsigned long *mask,
 			       unsigned long *bits)
 {
-	bgpio_set_multiple_single_reg(gc, mask, bits, gc->reg_dat);
+	struct gpio_generic_chip *chip = to_gpio_generic_chip(gc);
+
+	bgpio_set_multiple_single_reg(gc, mask, bits, chip->reg_dat);
 
 	return 0;
 }
@@ -317,7 +330,9 @@ static int bgpio_set_multiple(struct gpio_chip *gc, unsigned long *mask,
 static int bgpio_set_multiple_set(struct gpio_chip *gc, unsigned long *mask,
 				  unsigned long *bits)
 {
-	bgpio_set_multiple_single_reg(gc, mask, bits, gc->reg_set);
+	struct gpio_generic_chip *chip = to_gpio_generic_chip(gc);
+
+	bgpio_set_multiple_single_reg(gc, mask, bits, chip->reg_set);
 
 	return 0;
 }
@@ -326,21 +341,24 @@ static int bgpio_set_multiple_with_clear(struct gpio_chip *gc,
 					 unsigned long *mask,
 					 unsigned long *bits)
 {
+	struct gpio_generic_chip *chip = to_gpio_generic_chip(gc);
 	unsigned long set_mask, clear_mask;
 
 	bgpio_multiple_get_masks(gc, mask, bits, &set_mask, &clear_mask);
 
 	if (set_mask)
-		gc->write_reg(gc->reg_set, set_mask);
+		chip->write_reg(chip->reg_set, set_mask);
 	if (clear_mask)
-		gc->write_reg(gc->reg_clr, clear_mask);
+		chip->write_reg(chip->reg_clr, clear_mask);
 
 	return 0;
 }
 
 static int bgpio_dir_return(struct gpio_chip *gc, unsigned int gpio, bool dir_out)
 {
-	if (!gc->bgpio_pinctrl)
+	struct gpio_generic_chip *chip = to_gpio_generic_chip(gc);
+
+	if (!chip->pinctrl)
 		return 0;
 
 	if (dir_out)
@@ -375,39 +393,42 @@ static int bgpio_simple_dir_out(struct gpio_chip *gc, unsigned int gpio,
 
 static int bgpio_dir_in(struct gpio_chip *gc, unsigned int gpio)
 {
+	struct gpio_generic_chip *chip = to_gpio_generic_chip(gc);
 	unsigned long flags;
 
-	raw_spin_lock_irqsave(&gc->bgpio_lock, flags);
+	raw_spin_lock_irqsave(&chip->lock, flags);
 
-	gc->bgpio_dir &= ~bgpio_line2mask(gc, gpio);
+	chip->sdir &= ~bgpio_line2mask(gc, gpio);
 
-	if (gc->reg_dir_in)
-		gc->write_reg(gc->reg_dir_in, ~gc->bgpio_dir);
-	if (gc->reg_dir_out)
-		gc->write_reg(gc->reg_dir_out, gc->bgpio_dir);
+	if (chip->reg_dir_in)
+		chip->write_reg(chip->reg_dir_in, ~chip->sdir);
+	if (chip->reg_dir_out)
+		chip->write_reg(chip->reg_dir_out, chip->sdir);
 
-	raw_spin_unlock_irqrestore(&gc->bgpio_lock, flags);
+	raw_spin_unlock_irqrestore(&chip->lock, flags);
 
 	return bgpio_dir_return(gc, gpio, false);
 }
 
 static int bgpio_get_dir(struct gpio_chip *gc, unsigned int gpio)
 {
+	struct gpio_generic_chip *chip = to_gpio_generic_chip(gc);
+
 	/* Return 0 if output, 1 if input */
-	if (gc->bgpio_dir_unreadable) {
-		if (gc->bgpio_dir & bgpio_line2mask(gc, gpio))
+	if (chip->dir_unreadable) {
+		if (chip->sdir & bgpio_line2mask(gc, gpio))
 			return GPIO_LINE_DIRECTION_OUT;
 		return GPIO_LINE_DIRECTION_IN;
 	}
 
-	if (gc->reg_dir_out) {
-		if (gc->read_reg(gc->reg_dir_out) & bgpio_line2mask(gc, gpio))
+	if (chip->reg_dir_out) {
+		if (chip->read_reg(chip->reg_dir_out) & bgpio_line2mask(gc, gpio))
 			return GPIO_LINE_DIRECTION_OUT;
 		return GPIO_LINE_DIRECTION_IN;
 	}
 
-	if (gc->reg_dir_in)
-		if (!(gc->read_reg(gc->reg_dir_in) & bgpio_line2mask(gc, gpio)))
+	if (chip->reg_dir_in)
+		if (!(chip->read_reg(chip->reg_dir_in) & bgpio_line2mask(gc, gpio)))
 			return GPIO_LINE_DIRECTION_OUT;
 
 	return GPIO_LINE_DIRECTION_IN;
@@ -415,18 +436,19 @@ static int bgpio_get_dir(struct gpio_chip *gc, unsigned int gpio)
 
 static void bgpio_dir_out(struct gpio_chip *gc, unsigned int gpio, int val)
 {
+	struct gpio_generic_chip *chip = to_gpio_generic_chip(gc);
 	unsigned long flags;
 
-	raw_spin_lock_irqsave(&gc->bgpio_lock, flags);
+	raw_spin_lock_irqsave(&chip->lock, flags);
 
-	gc->bgpio_dir |= bgpio_line2mask(gc, gpio);
+	chip->sdir |= bgpio_line2mask(gc, gpio);
 
-	if (gc->reg_dir_in)
-		gc->write_reg(gc->reg_dir_in, ~gc->bgpio_dir);
-	if (gc->reg_dir_out)
-		gc->write_reg(gc->reg_dir_out, gc->bgpio_dir);
+	if (chip->reg_dir_in)
+		chip->write_reg(chip->reg_dir_in, ~chip->sdir);
+	if (chip->reg_dir_out)
+		chip->write_reg(chip->reg_dir_out, chip->sdir);
 
-	raw_spin_unlock_irqrestore(&gc->bgpio_lock, flags);
+	raw_spin_unlock_irqrestore(&chip->lock, flags);
 }
 
 static int bgpio_dir_out_dir_first(struct gpio_chip *gc, unsigned int gpio,
@@ -446,31 +468,30 @@ static int bgpio_dir_out_val_first(struct gpio_chip *gc, unsigned int gpio,
 }
 
 static int bgpio_setup_accessors(struct device *dev,
-				 struct gpio_chip *gc,
+				 struct gpio_generic_chip *chip,
 				 bool byte_be)
 {
-
-	switch (gc->bgpio_bits) {
+	switch (chip->bits) {
 	case 8:
-		gc->read_reg	= bgpio_read8;
-		gc->write_reg	= bgpio_write8;
+		chip->read_reg	= bgpio_read8;
+		chip->write_reg	= bgpio_write8;
 		break;
 	case 16:
 		if (byte_be) {
-			gc->read_reg	= bgpio_read16be;
-			gc->write_reg	= bgpio_write16be;
+			chip->read_reg	= bgpio_read16be;
+			chip->write_reg	= bgpio_write16be;
 		} else {
-			gc->read_reg	= bgpio_read16;
-			gc->write_reg	= bgpio_write16;
+			chip->read_reg	= bgpio_read16;
+			chip->write_reg	= bgpio_write16;
 		}
 		break;
 	case 32:
 		if (byte_be) {
-			gc->read_reg	= bgpio_read32be;
-			gc->write_reg	= bgpio_write32be;
+			chip->read_reg	= bgpio_read32be;
+			chip->write_reg	= bgpio_write32be;
 		} else {
-			gc->read_reg	= bgpio_read32;
-			gc->write_reg	= bgpio_write32;
+			chip->read_reg	= bgpio_read32;
+			chip->write_reg	= bgpio_write32;
 		}
 		break;
 #if BITS_PER_LONG >= 64
@@ -480,13 +501,13 @@ static int bgpio_setup_accessors(struct device *dev,
 				"64 bit big endian byte order unsupported\n");
 			return -EINVAL;
 		} else {
-			gc->read_reg	= bgpio_read64;
-			gc->write_reg	= bgpio_write64;
+			chip->read_reg	= bgpio_read64;
+			chip->write_reg	= bgpio_write64;
 		}
 		break;
 #endif /* BITS_PER_LONG >= 64 */
 	default:
-		dev_err(dev, "unsupported data width %u bits\n", gc->bgpio_bits);
+		dev_err(dev, "unsupported data width %u bits\n", chip->bits);
 		return -EINVAL;
 	}
 
@@ -515,27 +536,25 @@ static int bgpio_setup_accessors(struct device *dev,
  *	- an input direction register (named "dirin") where a 1 bit indicates
  *	the GPIO is an input.
  */
-static int bgpio_setup_io(struct gpio_chip *gc,
-			  void __iomem *dat,
-			  void __iomem *set,
-			  void __iomem *clr,
-			  unsigned long flags)
+static int bgpio_setup_io(struct gpio_generic_chip *chip,
+			  const struct gpio_generic_chip_config *cfg)
 {
+	struct gpio_chip *gc = &chip->gc;
 
-	gc->reg_dat = dat;
-	if (!gc->reg_dat)
+	chip->reg_dat = cfg->dat;
+	if (!chip->reg_dat)
 		return -EINVAL;
 
-	if (set && clr) {
-		gc->reg_set = set;
-		gc->reg_clr = clr;
+	if (cfg->set && cfg->clr) {
+		chip->reg_set = cfg->set;
+		chip->reg_clr = cfg->clr;
 		gc->set = bgpio_set_with_clear;
 		gc->set_multiple = bgpio_set_multiple_with_clear;
-	} else if (set && !clr) {
-		gc->reg_set = set;
+	} else if (cfg->set && !cfg->clr) {
+		chip->reg_set = cfg->set;
 		gc->set = bgpio_set_set;
 		gc->set_multiple = bgpio_set_multiple_set;
-	} else if (flags & BGPIOF_NO_OUTPUT) {
+	} else if (cfg->flags & BGPIOF_NO_OUTPUT) {
 		gc->set = bgpio_set_none;
 		gc->set_multiple = NULL;
 	} else {
@@ -543,10 +562,10 @@ static int bgpio_setup_io(struct gpio_chip *gc,
 		gc->set_multiple = bgpio_set_multiple;
 	}
 
-	if (!(flags & BGPIOF_UNREADABLE_REG_SET) &&
-	    (flags & BGPIOF_READ_OUTPUT_REG_SET)) {
+	if (!(cfg->flags & BGPIOF_UNREADABLE_REG_SET) &&
+	    (cfg->flags & BGPIOF_READ_OUTPUT_REG_SET)) {
 		gc->get = bgpio_get_set;
-		if (!gc->be_bits)
+		if (!chip->be_bits)
 			gc->get_multiple = bgpio_get_set_multiple;
 		/*
 		 * We deliberately avoid assigning the ->get_multiple() call
@@ -557,7 +576,7 @@ static int bgpio_setup_io(struct gpio_chip *gc,
 		 */
 	} else {
 		gc->get = bgpio_get;
-		if (gc->be_bits)
+		if (chip->be_bits)
 			gc->get_multiple = bgpio_get_multiple_be;
 		else
 			gc->get_multiple = bgpio_get_multiple;
@@ -566,27 +585,27 @@ static int bgpio_setup_io(struct gpio_chip *gc,
 	return 0;
 }
 
-static int bgpio_setup_direction(struct gpio_chip *gc,
-				 void __iomem *dirout,
-				 void __iomem *dirin,
-				 unsigned long flags)
+static int bgpio_setup_direction(struct gpio_generic_chip *chip,
+				 const struct gpio_generic_chip_config *cfg)
 {
-	if (dirout || dirin) {
-		gc->reg_dir_out = dirout;
-		gc->reg_dir_in = dirin;
-		if (flags & BGPIOF_NO_SET_ON_INPUT)
+	struct gpio_chip *gc = &chip->gc;
+
+	if (cfg->dirout || cfg->dirin) {
+		chip->reg_dir_out = cfg->dirout;
+		chip->reg_dir_in = cfg->dirin;
+		if (cfg->flags & BGPIOF_NO_SET_ON_INPUT)
 			gc->direction_output = bgpio_dir_out_dir_first;
 		else
 			gc->direction_output = bgpio_dir_out_val_first;
 		gc->direction_input = bgpio_dir_in;
 		gc->get_direction = bgpio_get_dir;
 	} else {
-		if (flags & BGPIOF_NO_OUTPUT)
+		if (cfg->flags & BGPIOF_NO_OUTPUT)
 			gc->direction_output = bgpio_dir_out_err;
 		else
 			gc->direction_output = bgpio_simple_dir_out;
 
-		if (flags & BGPIOF_NO_INPUT)
+		if (cfg->flags & BGPIOF_NO_INPUT)
 			gc->direction_input = bgpio_dir_in_err;
 		else
 			gc->direction_input = bgpio_simple_dir_in;
@@ -595,117 +614,101 @@ static int bgpio_setup_direction(struct gpio_chip *gc,
 	return 0;
 }
 
-static int bgpio_request(struct gpio_chip *chip, unsigned gpio_pin)
+static int bgpio_request(struct gpio_chip *gc, unsigned int gpio_pin)
 {
-	if (gpio_pin >= chip->ngpio)
+	struct gpio_generic_chip *chip = to_gpio_generic_chip(gc);
+
+	if (gpio_pin >= gc->ngpio)
 		return -EINVAL;
 
-	if (chip->bgpio_pinctrl)
-		return gpiochip_generic_request(chip, gpio_pin);
+	if (chip->pinctrl)
+		return gpiochip_generic_request(gc, gpio_pin);
 
 	return 0;
 }
 
 /**
- * bgpio_init() - Initialize generic GPIO accessor functions
- * @gc: the GPIO chip to set up
- * @dev: the parent device of the new GPIO chip (compulsory)
- * @sz: the size (width) of the MMIO registers in bytes, typically 1, 2 or 4
- * @dat: MMIO address for the register to READ the value of the GPIO lines, it
- *	is expected that a 1 in the corresponding bit in this register means the
- *	line is asserted
- * @set: MMIO address for the register to SET the value of the GPIO lines, it is
- *	expected that we write the line with 1 in this register to drive the GPIO line
- *	high.
- * @clr: MMIO address for the register to CLEAR the value of the GPIO lines, it is
- *	expected that we write the line with 1 in this register to drive the GPIO line
- *	low. It is allowed to leave this address as NULL, in that case the SET register
- *	will be assumed to also clear the GPIO lines, by actively writing the line
- *	with 0.
- * @dirout: MMIO address for the register to set the line as OUTPUT. It is assumed
- *	that setting a line to 1 in this register will turn that line into an
- *	output line. Conversely, setting the line to 0 will turn that line into
- *	an input.
- * @dirin: MMIO address for the register to set this line as INPUT. It is assumed
- *	that setting a line to 1 in this register will turn that line into an
- *	input line. Conversely, setting the line to 0 will turn that line into
- *	an output.
- * @flags: Different flags that will affect the behaviour of the device, such as
- *	endianness etc.
+ * gpio_generic_chip_init() - Initialize a generic GPIO chip.
+ * @chip: Generic GPIO chip to set up.
+ * @cfg: Generic GPIO chip configuration.
+ *
+ * Returns 0 on success, negative error number on failure.
  */
-int bgpio_init(struct gpio_chip *gc, struct device *dev,
-	       unsigned long sz, void __iomem *dat, void __iomem *set,
-	       void __iomem *clr, void __iomem *dirout, void __iomem *dirin,
-	       unsigned long flags)
+int gpio_generic_chip_init(struct gpio_generic_chip *chip,
+			   const struct gpio_generic_chip_config *cfg)
 {
+	struct gpio_chip *gc = &chip->gc;
+	unsigned long flags = cfg->flags;
+	struct device *dev = cfg->dev;
 	int ret;
 
-	if (!is_power_of_2(sz))
+	if (!is_power_of_2(cfg->sz))
 		return -EINVAL;
 
-	gc->bgpio_bits = sz * 8;
-	if (gc->bgpio_bits > BITS_PER_LONG)
+	chip->bits = cfg->sz * 8;
+	if (chip->bits > BITS_PER_LONG)
 		return -EINVAL;
 
-	raw_spin_lock_init(&gc->bgpio_lock);
+	raw_spin_lock_init(&chip->lock);
 	gc->parent = dev;
 	gc->label = dev_name(dev);
 	gc->base = -1;
 	gc->request = bgpio_request;
-	gc->be_bits = !!(flags & BGPIOF_BIG_ENDIAN);
+	chip->be_bits = !!(flags & BGPIOF_BIG_ENDIAN);
 
 	ret = gpiochip_get_ngpios(gc, dev);
 	if (ret)
-		gc->ngpio = gc->bgpio_bits;
+		gc->ngpio = chip->bits;
 
-	ret = bgpio_setup_io(gc, dat, set, clr, flags);
+	ret = bgpio_setup_io(chip, cfg);
 	if (ret)
 		return ret;
 
-	ret = bgpio_setup_accessors(dev, gc, flags & BGPIOF_BIG_ENDIAN_BYTE_ORDER);
+	ret = bgpio_setup_accessors(dev, chip,
+				    flags & BGPIOF_BIG_ENDIAN_BYTE_ORDER);
 	if (ret)
 		return ret;
 
-	ret = bgpio_setup_direction(gc, dirout, dirin, flags);
+	ret = bgpio_setup_direction(chip, cfg);
 	if (ret)
 		return ret;
 
 	if (flags & BGPIOF_PINCTRL_BACKEND) {
-		gc->bgpio_pinctrl = true;
+		chip->pinctrl = true;
 		/* Currently this callback is only used for pincontrol */
 		gc->free = gpiochip_generic_free;
 	}
 
-	gc->bgpio_data = gc->read_reg(gc->reg_dat);
+	chip->sdata = chip->read_reg(chip->reg_dat);
 	if (gc->set == bgpio_set_set &&
 			!(flags & BGPIOF_UNREADABLE_REG_SET))
-		gc->bgpio_data = gc->read_reg(gc->reg_set);
+		chip->sdata = chip->read_reg(chip->reg_set);
 
 	if (flags & BGPIOF_UNREADABLE_REG_DIR)
-		gc->bgpio_dir_unreadable = true;
+		chip->dir_unreadable = true;
 
 	/*
 	 * Inspect hardware to find initial direction setting.
 	 */
-	if ((gc->reg_dir_out || gc->reg_dir_in) &&
+	if ((chip->reg_dir_out || chip->reg_dir_in) &&
 	    !(flags & BGPIOF_UNREADABLE_REG_DIR)) {
-		if (gc->reg_dir_out)
-			gc->bgpio_dir = gc->read_reg(gc->reg_dir_out);
-		else if (gc->reg_dir_in)
-			gc->bgpio_dir = ~gc->read_reg(gc->reg_dir_in);
+		if (chip->reg_dir_out)
+			chip->sdir = chip->read_reg(chip->reg_dir_out);
+		else if (chip->reg_dir_in)
+			chip->sdir = ~chip->read_reg(chip->reg_dir_in);
 		/*
 		 * If we have two direction registers, synchronise
 		 * input setting to output setting, the library
 		 * can not handle a line being input and output at
 		 * the same time.
 		 */
-		if (gc->reg_dir_out && gc->reg_dir_in)
-			gc->write_reg(gc->reg_dir_in, ~gc->bgpio_dir);
+		if (chip->reg_dir_out && chip->reg_dir_in)
+			chip->write_reg(chip->reg_dir_in, ~chip->sdir);
 	}
 
 	return ret;
 }
-EXPORT_SYMBOL_GPL(bgpio_init);
+EXPORT_SYMBOL_GPL(gpio_generic_chip_init);
 
 #if IS_ENABLED(CONFIG_GPIO_GENERIC_PLATFORM)
 
diff --git a/drivers/gpio/gpio-mpc8xxx.c b/drivers/gpio/gpio-mpc8xxx.c
index 38643fb813c562957076aab48d804f8048cee5e4..2bb6100840ea27fb63ce7cdc3e1eb3e43526eb4d 100644
--- a/drivers/gpio/gpio-mpc8xxx.c
+++ b/drivers/gpio/gpio-mpc8xxx.c
@@ -71,7 +71,7 @@ static int mpc8572_gpio_get(struct gpio_chip *gc, unsigned int gpio)
 					 mpc8xxx_gc->regs + GPIO_DIR);
 	val = gpio_generic_read_reg(&mpc8xxx_gc->chip,
 				    mpc8xxx_gc->regs + GPIO_DAT) & ~out_mask;
-	out_shadow = gc->bgpio_data & out_mask;
+	out_shadow = mpc8xxx_gc->chip.sdata & out_mask;
 
 	return !!((val | out_shadow) & mpc_pin2mask(gpio));
 }
@@ -399,7 +399,8 @@ static int mpc8xxx_probe(struct platform_device *pdev)
 		gpio_generic_write_reg(&mpc8xxx_gc->chip,
 				       mpc8xxx_gc->regs + GPIO_IBE, 0xffffffff);
 		/* Also, latch state of GPIOs configured as output by bootloader. */
-		gc->bgpio_data = gpio_generic_read_reg(&mpc8xxx_gc->chip,
+		mpc8xxx_gc->chip.sdata =
+				gpio_generic_read_reg(&mpc8xxx_gc->chip,
 						       mpc8xxx_gc->regs + GPIO_DAT) &
 				 gpio_generic_read_reg(&mpc8xxx_gc->chip,
 						       mpc8xxx_gc->regs + GPIO_DIR);
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 9fcd4a988081f74d25dc88535705ba9265e56fd2..9b14fd20f13eee7d465e065e7ded2c92e2bbc78e 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -388,28 +388,6 @@ struct gpio_irq_chip {
  *	implies that if the chip supports IRQs, these IRQs need to be threaded
  *	as the chip access may sleep when e.g. reading out the IRQ status
  *	registers.
- * @read_reg: reader function for generic GPIO
- * @write_reg: writer function for generic GPIO
- * @be_bits: if the generic GPIO has big endian bit order (bit 31 is representing
- *	line 0, bit 30 is line 1 ... bit 0 is line 31) this is set to true by the
- *	generic GPIO core. It is for internal housekeeping only.
- * @reg_dat: data (in) register for generic GPIO
- * @reg_set: output set register (out=high) for generic GPIO
- * @reg_clr: output clear register (out=low) for generic GPIO
- * @reg_dir_out: direction out setting register for generic GPIO
- * @reg_dir_in: direction in setting register for generic GPIO
- * @bgpio_dir_unreadable: indicates that the direction register(s) cannot
- *	be read and we need to rely on out internal state tracking.
- * @bgpio_pinctrl: the generic GPIO uses a pin control backend.
- * @bgpio_bits: number of register bits used for a generic GPIO i.e.
- *	<register width> * 8
- * @bgpio_lock: used to lock chip->bgpio_data. Also, this is needed to keep
- *	shadowed and real data registers writes together.
- * @bgpio_data:	shadowed data register for generic GPIO to clear/set bits
- *	safely.
- * @bgpio_dir: shadowed direction register for generic GPIO to clear/set
- *	direction safely. A "1" in this word means the line is set as
- *	output.
  *
  * A gpio_chip can help platforms abstract various sources of GPIOs so
  * they can all be accessed through a common programming interface.
@@ -475,23 +453,6 @@ struct gpio_chip {
 	const char		*const *names;
 	bool			can_sleep;
 
-#if IS_ENABLED(CONFIG_GPIO_GENERIC)
-	unsigned long (*read_reg)(void __iomem *reg);
-	void (*write_reg)(void __iomem *reg, unsigned long data);
-	bool be_bits;
-	void __iomem *reg_dat;
-	void __iomem *reg_set;
-	void __iomem *reg_clr;
-	void __iomem *reg_dir_out;
-	void __iomem *reg_dir_in;
-	bool bgpio_dir_unreadable;
-	bool bgpio_pinctrl;
-	int bgpio_bits;
-	raw_spinlock_t bgpio_lock;
-	unsigned long bgpio_data;
-	unsigned long bgpio_dir;
-#endif /* CONFIG_GPIO_GENERIC */
-
 #ifdef CONFIG_GPIOLIB_IRQCHIP
 	/*
 	 * With CONFIG_GPIOLIB_IRQCHIP we get an irqchip inside the gpiolib
@@ -723,11 +684,6 @@ int gpiochip_populate_parent_fwspec_fourcell(struct gpio_chip *gc,
 
 #endif /* CONFIG_IRQ_DOMAIN_HIERARCHY */
 
-int bgpio_init(struct gpio_chip *gc, struct device *dev,
-	       unsigned long sz, void __iomem *dat, void __iomem *set,
-	       void __iomem *clr, void __iomem *dirout, void __iomem *dirin,
-	       unsigned long flags);
-
 #define BGPIOF_BIG_ENDIAN		BIT(0)
 #define BGPIOF_UNREADABLE_REG_SET	BIT(1) /* reg_set is unreadable */
 #define BGPIOF_UNREADABLE_REG_DIR	BIT(2) /* reg_dir is unreadable */
diff --git a/include/linux/gpio/generic.h b/include/linux/gpio/generic.h
index 4c0626b53ec90388a034bc7797eefa53e7ea064e..162430d96660e96b995eb4a2e64183503fc618e3 100644
--- a/include/linux/gpio/generic.h
+++ b/include/linux/gpio/generic.h
@@ -50,9 +50,44 @@ struct gpio_generic_chip_config {
  * struct gpio_generic_chip - Generic GPIO chip implementation.
  * @gc: The underlying struct gpio_chip object, implementing low-level GPIO
  *      chip routines.
+ * @read_reg: reader function for generic GPIO
+ * @write_reg: writer function for generic GPIO
+ * @be_bits: if the generic GPIO has big endian bit order (bit 31 is
+ *           representing line 0, bit 30 is line 1 ... bit 0 is line 31) this
+ *           is set to true by the generic GPIO core. It is for internal
+ *           housekeeping only.
+ * @reg_dat: data (in) register for generic GPIO
+ * @reg_set: output set register (out=high) for generic GPIO
+ * @reg_clr: output clear register (out=low) for generic GPIO
+ * @reg_dir_out: direction out setting register for generic GPIO
+ * @reg_dir_in: direction in setting register for generic GPIO
+ * @dir_unreadable: indicates that the direction register(s) cannot be read and
+ *                  we need to rely on out internal state tracking.
+ * @pinctrl: the generic GPIO uses a pin control backend.
+ * @bits: number of register bits used for a generic GPIO
+ *        i.e. <register width> * 8
+ * @lock: used to lock chip->sdata. Also, this is needed to keep
+ *        shadowed and real data registers writes together.
+ * @sdata: shadowed data register for generic GPIO to clear/set bits safely.
+ * @sdir: shadowed direction register for generic GPIO to clear/set direction
+ *        safely. A "1" in this word means the line is set as output.
  */
 struct gpio_generic_chip {
 	struct gpio_chip gc;
+	unsigned long (*read_reg)(void __iomem *reg);
+	void (*write_reg)(void __iomem *reg, unsigned long data);
+	bool be_bits;
+	void __iomem *reg_dat;
+	void __iomem *reg_set;
+	void __iomem *reg_clr;
+	void __iomem *reg_dir_out;
+	void __iomem *reg_dir_in;
+	bool dir_unreadable;
+	bool pinctrl;
+	int bits;
+	raw_spinlock_t lock;
+	unsigned long sdata;
+	unsigned long sdir;
 };
 
 static inline struct gpio_generic_chip *
@@ -61,20 +96,8 @@ to_gpio_generic_chip(struct gpio_chip *gc)
 	return container_of(gc, struct gpio_generic_chip, gc);
 }
 
-/**
- * gpio_generic_chip_init() - Initialize a generic GPIO chip.
- * @chip: Generic GPIO chip to set up.
- * @cfg: Generic GPIO chip configuration.
- *
- * Returns 0 on success, negative error number on failure.
- */
-static inline int
-gpio_generic_chip_init(struct gpio_generic_chip *chip,
-		       const struct gpio_generic_chip_config *cfg)
-{
-	return bgpio_init(&chip->gc, cfg->dev, cfg->sz, cfg->dat, cfg->set,
-			  cfg->clr, cfg->dirout, cfg->dirin, cfg->flags);
-}
+int gpio_generic_chip_init(struct gpio_generic_chip *chip,
+			   const struct gpio_generic_chip_config *cfg);
 
 /**
  * gpio_generic_chip_set() - Set the GPIO line value of the generic GPIO chip.
@@ -110,10 +133,10 @@ gpio_generic_chip_set(struct gpio_generic_chip *chip, unsigned int offset,
 static inline unsigned long
 gpio_generic_read_reg(struct gpio_generic_chip *chip, void __iomem *reg)
 {
-	if (WARN_ON(!chip->gc.read_reg))
+	if (WARN_ON(!chip->read_reg))
 		return 0;
 
-	return chip->gc.read_reg(reg);
+	return chip->read_reg(reg);
 }
 
 /**
@@ -125,23 +148,23 @@ gpio_generic_read_reg(struct gpio_generic_chip *chip, void __iomem *reg)
 static inline void gpio_generic_write_reg(struct gpio_generic_chip *chip,
 					  void __iomem *reg, unsigned long val)
 {
-	if (WARN_ON(!chip->gc.write_reg))
+	if (WARN_ON(!chip->write_reg))
 		return;
 
-	chip->gc.write_reg(reg, val);
+	chip->write_reg(reg, val);
 }
 
 #define gpio_generic_chip_lock(gen_gc) \
-	raw_spin_lock(&(gen_gc)->gc.bgpio_lock)
+	raw_spin_lock(&(gen_gc)->lock)
 
 #define gpio_generic_chip_unlock(gen_gc) \
-	raw_spin_unlock(&(gen_gc)->gc.bgpio_lock)
+	raw_spin_unlock(&(gen_gc)->lock)
 
 #define gpio_generic_chip_lock_irqsave(gen_gc, flags) \
-	raw_spin_lock_irqsave(&(gen_gc)->gc.bgpio_lock, flags)
+	raw_spin_lock_irqsave(&(gen_gc)->lock, flags)
 
 #define gpio_generic_chip_unlock_irqrestore(gen_gc, flags) \
-	raw_spin_unlock_irqrestore(&(gen_gc)->gc.bgpio_lock, flags)
+	raw_spin_unlock_irqrestore(&(gen_gc)->lock, flags)
 
 DEFINE_LOCK_GUARD_1(gpio_generic_lock,
 		    struct gpio_generic_chip,

-- 
2.48.1


