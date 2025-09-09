Return-Path: <linux-mips+bounces-11129-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 29CBFB4A7C2
	for <lists+linux-mips@lfdr.de>; Tue,  9 Sep 2025 11:28:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 46EA61B22CF1
	for <lists+linux-mips@lfdr.de>; Tue,  9 Sep 2025 09:24:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 430CF308F37;
	Tue,  9 Sep 2025 09:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="cGuyF7Nw"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B69542D836D
	for <linux-mips@vger.kernel.org>; Tue,  9 Sep 2025 09:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757409358; cv=none; b=ZQks+5EURQrDjik76Q7LaFzLXIk3znE/tBPspPhzMdTU1zEWTMC8rsH5JHPMR9k7JIt6NfbZvqkiDs5OML1tn47HnWoQQ1aZH3uzI0etq7xV7SAeXWLUzVbcn8YqkDgrw1fLvf1WsHvDYwK0YX4u1c+erlTlMl8e8qQSAF9wOGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757409358; c=relaxed/simple;
	bh=yVgPPOcE+ewclBktjz5E2v2YtjZnxTx9c2rSBG/L3iY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Lrn/lnyGs3+pe42atM7NMmBbP5UqTbrI+fhMq/iOeTxEY5JwX33WXZIVZsxDGFWqOrxx+4PGsgbIOGz29MCYhFjNOO/05BNHOqCL0dQuqAuEiKh3iop5Nrw6Rknw4x2GTaVoWJ4ifMU1BioDvKPl15sCNqayZ0IVLmmPr0a7SPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=cGuyF7Nw; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-45de6ab6ce7so11863125e9.1
        for <linux-mips@vger.kernel.org>; Tue, 09 Sep 2025 02:15:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757409354; x=1758014154; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xHR8kEAINHQx8cEJdNb56gXGfX3p65LuAbViPfkkq1g=;
        b=cGuyF7Nw+OiZsJoZm6af6wDLnN7mXyVnETWwWmOAWY26y0dCBnG3Qbf2wVhca/r9hp
         l/evGoLW0OAm1SUwN9DQ56rwW5AvGme5YHsBI5TktP/VGOmCmdW0J4ms0qTzaElSJ9jJ
         dl4DR121ZpmZ2NhGjGJIlQJqrtoeBihedFm1kh8iUUgkph9eZ+0fefspSkIaeRfE/z5m
         M+vA8/k75kzlI5Iug2ZDvJL8nc95vfod8f0PyYU7HJEZNSqvld1IimbxWwtV2anPTIJL
         pNBB6gV5aLm+xANlIUnlg4mS97izS0MZKjjWmhftYB1U9HhG79fknof+66S1Kjdk7W8w
         wjcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757409354; x=1758014154;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xHR8kEAINHQx8cEJdNb56gXGfX3p65LuAbViPfkkq1g=;
        b=a12/uYiU8cmORSIYyws4zpoJsofdbMK4OQZfbeDLRfCiheh9Czg7j+BxUVomN8L7th
         8He8V9Of8enrkkzaMhwag9e66kYH4Ywu39ISpee84Wx4R3/RfVsKuwvM36u1FZ9HQWVU
         OcwW63Y6vE1d+c3OnIy48SHubmEzGBBqDNQtfx4jruGQkX58r6nSktrSCss6hkZTUZfi
         34Nh50BvHmaNMUpVUyPPNukOF3sOvcfui9zfEjYzfjJHdrjWOmN1XhiTvoefymWa9GRw
         0zv3b1ivGmIJD0CFIiYJR6X1TUlH1poN02PQP8tpwu2DDbTxZgDIdjWJHWWuxEHWJRGx
         VH7w==
X-Forwarded-Encrypted: i=1; AJvYcCU9lpVPJsva1rnIwbdcrt1o6OuaIEUlNE6JRFO3Fq4dy/zCO/xQ8TZyH4nnnOWXF7JVb5jqCHturWAw@vger.kernel.org
X-Gm-Message-State: AOJu0YznGk/aE8zFrXu6IZB8Wvem9sKLnY+go+83fDqdJ+VEHa8xl00K
	Tty5EcbYv9B7EY3DM5ETS4IPP4HVxZyQPrJ6TNlRvNCNkbrvlFZw8eaSTp23/lKD3D/30gBGWVv
	RZ3Ky
X-Gm-Gg: ASbGnctUgHMrF7wN4HxqiQ20NYeTh8h9bzCttqgRCeGkb/HW8mWm2qZeIRIM1rImda0
	u+9nIz43/TMuaZID4xylQ1S3DbleGcBAGbtZ0++dYM+VpLhfNF4m+4JjtcxrJgdKWDWp27NAj5B
	gzsRXCtWUjt9UBNQ4dj6llQNe0VKOMRyjV4Dp4lgfP6XjI1vH4CCKBHP3dFEtJfsQGpExGo8mNW
	iDQg/5I6v3oad7nNMcTOjtVb2wWVhDprnoAOI9xPiM1jrfA0p0STBgUYqWK+qH9x8CbuIm2wlTS
	f2gKLG1dNYIgvle3sCkecTe11x4SWC/01GSOpZ5D/1056ib1mgy03RWO0xQ1Xsd/pJ7ImtKQacz
	M4GmzPmQLUPEBkc/MW540TWEy0tq9
X-Google-Smtp-Source: AGHT+IHhcgO6dwZxJtkrv/4cgFJ9AZZjVhBwJVC7OCJoGvWxqWltiwPbbtdGBypNoYfTrgC0pMDsDA==
X-Received: by 2002:a05:600c:4f47:b0:45d:d903:beea with SMTP id 5b1f17b1804b1-45dec7992demr29926925e9.30.1757409353851;
        Tue, 09 Sep 2025 02:15:53 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:c1ee:7be9:3ebb:6cc0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7521c9caasm1900039f8f.19.2025.09.09.02.15.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 02:15:52 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 09 Sep 2025 11:15:33 +0200
Subject: [PATCH 06/15] gpio: xgene-sb: use generic GPIO chip register read
 and write APIs
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250909-gpio-mmio-gpio-conv-part4-v1-6-9f723dc3524a@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1238;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=We0X7xb7ACmLY+lbQa1fcNw6pP25NDN5z92R8VM93TU=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBov/A4pQZLBZn4BjfERAi0jFAen5It67lNNEGX4
 28/FwbaFj+JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaL/wOAAKCRARpy6gFHHX
 cppTD/4ubzT5gkUPHClRcXZW7nUjOwMKszigAjd07nNOb4PF0UpVU/Xa7EnK+Syz6p0XN914Vg1
 dMG2j9qlrjrNzhrbPetN/pzgg0RJ5FtkBeCt0QXzTIM/a+OIXPh7USmz0K2fiNPTPV2j9/afS9Q
 o1uvp7fh5vygt/dxzTY3GXRvzvAvlXF7Nj7cXXbufdr+leL6pNp9oAtHKmepILW5EXpYFjMoStH
 jbkjAo0gaQWdhdfr3K7hUFVirfvRgS3xp/s0PuStezskzt2soyUXvzAk68x1n1aoTsHvj8e18/M
 ELZsqbHx5BzbZXplavqjtoWHWaIHPaZGUK5I96znEf7RNJcznFDPSn3z2hemiZlD5j5zjVbaiQJ
 e7fMVvjPH1WvX60+a5oopYA1ZIZjLNqd31TgZltatr7zdX2BQbFJRQo8bHngbWak1gQiVh/7Cex
 zwXws2yfiUCjol1anGcqyeNvCPSA0b+vzKTlM9Yg+31ZHNGWeisiXTVtlVO8mxr5JdJg8IXJFhE
 HIN1TnCnnyCKDjmqRucW6M/Sj4KBGnUNgwFtA+dnhk1DDyvACq73VpW4OXZUPBsKF9uHpEHvW0M
 ymUv6nH3ayojO3TG4dtSPtFoY2Y4aol+CHE8v2IqHm74wWbdOuT7cdf+yMxDJ/DCtZs3ND+cIUd
 3eWJFcmxF3LRACg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The conversion to using the modernized generic GPIO chip API was
incomplete without also converting the direct calls to write/read_reg()
callbacks. Use the provided wrappers from linux/gpio/generic.h.

Fixes: 38d98a822c14 ("gpio: xgene-sb: use new generic GPIO chip API")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-xgene-sb.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-xgene-sb.c b/drivers/gpio/gpio-xgene-sb.c
index c559a89aadf7a77bd9cce7e5a7d4a2b241307812..62545e358b6c4b1cab25e1135cb24ccc3e955078 100644
--- a/drivers/gpio/gpio-xgene-sb.c
+++ b/drivers/gpio/gpio-xgene-sb.c
@@ -63,14 +63,15 @@ struct xgene_gpio_sb {
 static void xgene_gpio_set_bit(struct gpio_chip *gc,
 				void __iomem *reg, u32 gpio, int val)
 {
+	struct gpio_generic_chip *chip = to_gpio_generic_chip(gc);
 	u32 data;
 
-	data = gc->read_reg(reg);
+	data = gpio_generic_read_reg(chip, reg);
 	if (val)
 		data |= GPIO_MASK(gpio);
 	else
 		data &= ~GPIO_MASK(gpio);
-	gc->write_reg(reg, data);
+	gpio_generic_write_reg(chip, reg, data);
 }
 
 static int xgene_gpio_sb_irq_set_type(struct irq_data *d, unsigned int type)

-- 
2.48.1


