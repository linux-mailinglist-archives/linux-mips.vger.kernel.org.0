Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5292B79E732
	for <lists+linux-mips@lfdr.de>; Wed, 13 Sep 2023 13:50:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240567AbjIMLu2 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 13 Sep 2023 07:50:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240558AbjIMLu0 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 13 Sep 2023 07:50:26 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF3291999
        for <linux-mips@vger.kernel.org>; Wed, 13 Sep 2023 04:50:22 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-31fa15f4cc6so3465071f8f.2
        for <linux-mips@vger.kernel.org>; Wed, 13 Sep 2023 04:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1694605821; x=1695210621; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9VygHWUUTxJcwgk20gKLWHe+YEMHPQx8FheNmwIckcQ=;
        b=it6XWD63NWzmlXIvizvgT6JCD9RWAoAEwGWTLHbrTB9cBevk2KasDN3Hvq/cBcMTci
         /GZ9Jwaj3xM6j67vzx0Iu70UkpbvB/MQox/v6wEkDAdFf3qXsl/3mZZZtqkS8bp8KuEy
         QUuoJeTzvYc38TIzguvRl1iCzvgBaQ8W41EclIJ/ZVpEn8pEHkEpd23pjO4K3N3wBM9H
         DDEOdS9C0jYoGRySHc9yWUKHEIFBjQOkH2f2nmNDbYsVShyXfoHVYa2xVDd4aSE/QwIg
         D7l1gyjKSb6urjJ+WXeDWMiGHlarDCCQMYTori2ay49npCywVbUYkzZA42ZXGjOj/3X9
         Vcfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694605821; x=1695210621;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9VygHWUUTxJcwgk20gKLWHe+YEMHPQx8FheNmwIckcQ=;
        b=tYNJEynvqovo+tHkU4KX8sPnzUSTeRU2gEBEtIVI3YReSrDKOosT6vj9yr/z4fCDLK
         pZHRryHKlrnTthuQM4IhW8WKV6cdXmS8gOo4epIyneHDj3klYlba3gTgyEo4qUUixkyA
         7QIA/ofUt/zq3WSGTvUgnsSGHv++Ri0SMDXGpy/cJsfBIxp41BGX6o3oU+bioAcwNTFM
         7vzAGSBghagn5gReWQTU/Vq9lejjwyGLD02mjwYzAMsbO/HPZLhOUiteCeFS5CFRd6Uj
         GdL8e1M03VXoDqm94UZT7qlEEc2TAwLdg/u4KIXX3VcAstCT2yJPOVCm7XMwl4vMbRaw
         fQKA==
X-Gm-Message-State: AOJu0YyYX7XgOYLXG+rrRV70Erb+D6zjVz6YdIJohHuC5KDqHud61Lhl
        liPSRCpU0Fv7CNwWl73gkPbUPA==
X-Google-Smtp-Source: AGHT+IE8/xUMx2CxEG3cqDJgSjbSA2NWMS00vPEgINZ0yvChOcoxgNUbEbPflHzcyEJln62XxJ5Bpg==
X-Received: by 2002:a5d:5957:0:b0:314:12c:4322 with SMTP id e23-20020a5d5957000000b00314012c4322mr1948005wri.4.1694605821222;
        Wed, 13 Sep 2023 04:50:21 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:3b50:bca5:a754:7463])
        by smtp.gmail.com with ESMTPSA id j14-20020adfd20e000000b0031fc4c31d77sm1932689wrh.88.2023.09.13.04.50.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Sep 2023 04:50:20 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Paul Cercueil <paul@crapouillou.net>,
        Harvey Hunt <harveyhuntnexus@gmail.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Daniel Scally <djrscally@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        Heiner Kallweit <hkallweit1@gmail.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-mtd@lists.infradead.org, platform-driver-x86@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 3/5] mmc: slot-gpio: use gpiod_set_active_[low|high]()
Date:   Wed, 13 Sep 2023 13:49:59 +0200
Message-Id: <20230913115001.23183-4-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230913115001.23183-1-brgl@bgdev.pl>
References: <20230913115001.23183-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

We have new, less cumbersome and clearer interfaces for controlling GPIO
polarity. Use them in the MMC code.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/mmc/core/slot-gpio.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/mmc/core/slot-gpio.c b/drivers/mmc/core/slot-gpio.c
index 2a2d949a9344..a6fea6559a5e 100644
--- a/drivers/mmc/core/slot-gpio.c
+++ b/drivers/mmc/core/slot-gpio.c
@@ -204,12 +204,11 @@ int mmc_gpiod_request_cd(struct mmc_host *host, const char *con_id,
 	}
 
 	/* override forces default (active-low) polarity ... */
-	if (override_active_level && !gpiod_is_active_low(desc))
-		gpiod_toggle_active_low(desc);
-
+	if (override_active_level)
+		gpiod_set_active_low(desc);
 	/* ... or active-high */
-	if (host->caps2 & MMC_CAP2_CD_ACTIVE_HIGH)
-		gpiod_toggle_active_low(desc);
+	else if (host->caps2 & MMC_CAP2_CD_ACTIVE_HIGH)
+		gpiod_set_active_high(desc);
 
 	ctx->cd_gpio = desc;
 
@@ -256,7 +255,7 @@ int mmc_gpiod_request_ro(struct mmc_host *host, const char *con_id,
 	}
 
 	if (host->caps2 & MMC_CAP2_RO_ACTIVE_HIGH)
-		gpiod_toggle_active_low(desc);
+		gpiod_set_active_high(desc);
 
 	ctx->ro_gpio = desc;
 
-- 
2.39.2

