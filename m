Return-Path: <linux-mips+bounces-9924-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E0A10B12E8F
	for <lists+linux-mips@lfdr.de>; Sun, 27 Jul 2025 10:24:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2131A17AC07
	for <lists+linux-mips@lfdr.de>; Sun, 27 Jul 2025 08:24:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D55E1FC3;
	Sun, 27 Jul 2025 08:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="gIkkdEN6"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82F687DA66
	for <linux-mips@vger.kernel.org>; Sun, 27 Jul 2025 08:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753604689; cv=none; b=r4aKnlM5anoLIhzqG0BFkvf7X2p48E5ZwYD0I6TOF+g+wpBkeFEiomdWjg31qw/5XYZnirYsv427npCK8fZ8yCjs9OT8bF+J591FIFbtAHZqEtIVpNxwM8RDPLCzJDOqw6XNtL/rGi2d3pgOIHHDECKfvyY/3XqZIcKXIJvMgc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753604689; c=relaxed/simple;
	bh=pCDzxxUimKSB3EwsfWX+tNITt36sdeo51kdPivLWWcA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=i9zv3owMAfzylea11VIFzN82hV200bFC0VoQGlYll6MSB3dq0tkerHe/IeDOht7I6Sr9LpZaD+674971FIb795zrTouoBDKip52sFoK5U30prPsHGfMINsR5r2Us2aVkVC8yqP8iNZTQ+JolhUj6djkQ7FrupxsjCCP9Iy5ETLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=gIkkdEN6; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-451d6ade159so23817595e9.1
        for <linux-mips@vger.kernel.org>; Sun, 27 Jul 2025 01:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1753604686; x=1754209486; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5Zp8NqMfP+9ZJxnvW6z72aJPcVY++D23DSoUHtspQxU=;
        b=gIkkdEN6Gwjh9Hj4j2CXqy/8h/LtGxx9uhA9h2zrfJkxY5EBOhB/H3MOmklfJdUYpH
         dLSW4JpB0D34Gy23PD9hCuVUIGZ+litflM20RC8rmaIW1Z8fRw0aBpm3AZzT44gba2E1
         sSUTg1JzyHJv7R4AkI1lUS6bP0udCvXG3ph9IfONLXcMTbILEcZFCk7e0z0x+FnUupWD
         ouWrbjUhOB8JJIqSmwYFCAPaKzAR4RwCLPC8RdDTGp4da+VK7ZQ0AyGBf3dxAfc+ZNPD
         57XOC3vTxeMPa2MTM9q+7K3D490X9kjsspnx/SBMpeWv9WEKA9byC/nI3jCaVD3k91HO
         Tabw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753604686; x=1754209486;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5Zp8NqMfP+9ZJxnvW6z72aJPcVY++D23DSoUHtspQxU=;
        b=eMgUpq/V/O2KeLHhcYafx71bim2SDAMxuPfQ8mW7KU96z7NUW2ODwfG+jTLxxmY0W9
         pqWqvgNT8huePhhMw4lElQ3xrVLxjNh8hrpnU37GTBf9T8LeePR4rgNquKY8KlMnR4Rj
         xjr5PGUTWwg1i9ChBkpqkoLPMmensS0U4LKRxHKLUsWkF4JoU4dOtETBhk5KFFjp2k0a
         09EFgQ4ZljP0zd4gOpmnZuFecXaWDj4A3rI6Ueo+BRXbM7uka/UtPXc/TdiNVIDzxBg4
         6HsCM17EzPK0Bp3DQRuTs8KzEbJbvun7qjU+ki1Gt3wij3EzOyv00VVzodqgoexG1l9p
         fhKw==
X-Gm-Message-State: AOJu0YyfsoNWCMbZFP2UeFz4ztkzRFmrFVp+LFqjjiEbsyjA+gXqBa2w
	UV7s6MWn89iNdmivN5YvL4BkcTYRGAtf9y3SYo8C+5Lm3vibVyVE/xpUEO+2oX71LVo=
X-Gm-Gg: ASbGncvJ4zgF2kX6F5xTZCLVIWB6GnH8ujQmybT6TpA5k3BJIjoYEV3m9SFGMKjfeXp
	Rs0rMCws0hIfAHf/W6Tn4Q10yIA7vakBP4dSLnbVT2HOr1f4oD1PTyJruiVwB1rh3YuaZJO25Sb
	PHSuShQey6pZZ99OX1fYG8XdKFGxfz6nRHTacVtsM9vQKMRXuB3Cc3ViA5e4x4tGYRAxDHUcJVI
	7X4L9s/8qx0TsKk2P+UL7DXzGwtXPPMyEyX8pEgVQQ9gz6ziy6eXiAmCFzTTqhjR+FdiqPLIRSB
	tt+mvGvH5EtkVEunUfFoLHD8JamcWMGbqbpTEgBDjdnDFoYZtH4dgc/sor5cWt5dCpJ32UWRX/p
	NT+5CV8gQbHWSEUbS+c6r
X-Google-Smtp-Source: AGHT+IG0veFybI//mpXDZL/MaqbtHsXicikTiM5496C0+N6+f4l7RapcJmOC2qPj/0wNY7u3GXYAYQ==
X-Received: by 2002:a05:600c:34cf:b0:450:d3b9:4ba4 with SMTP id 5b1f17b1804b1-458763032b6mr69544875e9.2.1753604685682;
        Sun, 27 Jul 2025 01:24:45 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:7619:fb4:5db:aeb8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4587ac58162sm54201335e9.18.2025.07.27.01.24.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jul 2025 01:24:45 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH] MIPS: alchemy: gpio: use new GPIO line value setter callbacks for the remaining chips
Date: Sun, 27 Jul 2025 10:24:42 +0200
Message-ID: <20250727082442.13182-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Previous commit missed two other places that need converting, it only
came out in tests on autobuilders now. Convert the rest of the driver.

Fixes: 68bdc4dc1130 ("MIPS: alchemy: gpio: use new line value setter callbacks")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Thomas: this flew under my radar until it came out in autobuilder tests
now. Thomas: if it's too late for you to take it through the MIPS tree
for v6.17, can you Ack it and let me take it directly through the GPIO
tree? This change is needed for us to complete the rework of GPIO
callbacks during the next cycle.

 arch/mips/alchemy/common/gpiolib.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/arch/mips/alchemy/common/gpiolib.c b/arch/mips/alchemy/common/gpiolib.c
index 411f70ceb762..194034eba75f 100644
--- a/arch/mips/alchemy/common/gpiolib.c
+++ b/arch/mips/alchemy/common/gpiolib.c
@@ -40,9 +40,11 @@ static int gpio2_get(struct gpio_chip *chip, unsigned offset)
 	return !!alchemy_gpio2_get_value(offset + ALCHEMY_GPIO2_BASE);
 }
 
-static void gpio2_set(struct gpio_chip *chip, unsigned offset, int value)
+static int gpio2_set(struct gpio_chip *chip, unsigned offset, int value)
 {
 	alchemy_gpio2_set_value(offset + ALCHEMY_GPIO2_BASE, value);
+
+	return 0;
 }
 
 static int gpio2_direction_input(struct gpio_chip *chip, unsigned offset)
@@ -68,10 +70,12 @@ static int gpio1_get(struct gpio_chip *chip, unsigned offset)
 	return !!alchemy_gpio1_get_value(offset + ALCHEMY_GPIO1_BASE);
 }
 
-static void gpio1_set(struct gpio_chip *chip,
+static int gpio1_set(struct gpio_chip *chip,
 				unsigned offset, int value)
 {
 	alchemy_gpio1_set_value(offset + ALCHEMY_GPIO1_BASE, value);
+
+	return 0;
 }
 
 static int gpio1_direction_input(struct gpio_chip *chip, unsigned offset)
@@ -97,7 +101,7 @@ struct gpio_chip alchemy_gpio_chip[] = {
 		.direction_input	= gpio1_direction_input,
 		.direction_output	= gpio1_direction_output,
 		.get			= gpio1_get,
-		.set			= gpio1_set,
+		.set_rv			= gpio1_set,
 		.to_irq			= gpio1_to_irq,
 		.base			= ALCHEMY_GPIO1_BASE,
 		.ngpio			= ALCHEMY_GPIO1_NUM,
@@ -107,7 +111,7 @@ struct gpio_chip alchemy_gpio_chip[] = {
 		.direction_input	= gpio2_direction_input,
 		.direction_output	= gpio2_direction_output,
 		.get			= gpio2_get,
-		.set			= gpio2_set,
+		.set_rv			= gpio2_set,
 		.to_irq			= gpio2_to_irq,
 		.base			= ALCHEMY_GPIO2_BASE,
 		.ngpio			= ALCHEMY_GPIO2_NUM,
-- 
2.48.1


