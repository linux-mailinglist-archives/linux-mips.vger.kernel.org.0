Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 569C21F4017
	for <lists+linux-mips@lfdr.de>; Tue,  9 Jun 2020 18:02:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731105AbgFIQC5 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 9 Jun 2020 12:02:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728888AbgFIQCw (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 9 Jun 2020 12:02:52 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DAE8C05BD1E;
        Tue,  9 Jun 2020 09:02:52 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id l17so3373667wmj.0;
        Tue, 09 Jun 2020 09:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gHs2Hmq/cMCtHez1Sl38pen96RVcvfaVKKusUUWkl1Q=;
        b=K97/qA90mFaAplYpbm7F7z6CsBsM6H9J8R1c0/lpUWri6OShcydYyNmR4zb7C90DPv
         lzbveyB8n7KH5x7+d5JLQYfYL+4v87f5ay7UyTtCRDPgS68feFvsW7xi+scpGHQF/pbB
         Q5UlwcTfmrY0Qkn+aAzLpgiE61pk1cLteFqtyKbyxdztUno48dpmvyTfRijr6dffUWkO
         aQ0rlvhE3b8YvdkpGytGxC0fBVJw33xeSs2UUPEihXILj25m5LRjSX1v8gZpQiQuFT+1
         ch1A0brU58L6CxPrb9bRnlPYn1/nyG168zVBmY634uiOrwXNnU6IkutNoOZpt8yevZbY
         2INA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gHs2Hmq/cMCtHez1Sl38pen96RVcvfaVKKusUUWkl1Q=;
        b=cOXim3hhifWUkzsJC5eeZgGya/WrJmW46MjUVpGLR/wY8PuNSQdhJWXs/Edekw7ytl
         VpfXpUnym/C6aeUX32XUaEgf5MO4qR+5UiLvbUu0sEOrSRp/ZfUOptsRxaF035Ffn3S8
         qCw5QjlBkCpfUJwoPCjWUY+IHOPTDwXJFPdwbhleyruLJasBblz08eb/5gb1AeQ0AWDD
         uirxYofc8nQbcpNL3yiRXW3N6MeAFt3E1u2wBoDms9QGwI+Im6fEa/nAPGzaS1Qnl03n
         0+QfncLR1nv4Cana3uEsOSaD7MKADqA2wek1BtFWeODS0MUxtyXe/OBgu+psl1QfBmnH
         GIIQ==
X-Gm-Message-State: AOAM532H0Jkr1SfAEdknBpIYGvlcI9GGD/6reCwhnooygN63PdmiJwVA
        30fAcBJWVBE21dZuoSJQhP0=
X-Google-Smtp-Source: ABdhPJy5FnOofZd6hVNmjqzMApcPggZpuz45H9Syvb56WQml46U21uNA0VUMvIjObUutm3X5915RSw==
X-Received: by 2002:a7b:cf35:: with SMTP id m21mr4922248wmg.181.1591718570565;
        Tue, 09 Jun 2020 09:02:50 -0700 (PDT)
Received: from skynet.lan (28.red-83-49-61.dynamicip.rima-tde.net. [83.49.61.28])
        by smtp.gmail.com with ESMTPSA id y14sm3341864wma.25.2020.06.09.09.02.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2020 09:02:50 -0700 (PDT)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     p.zabel@pengutronix.de, robh+dt@kernel.org,
        tsbogend@alpha.franken.de, f.fainelli@gmail.com,
        jonas.gorski@gmail.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com
Cc:     =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
Subject: [PATCH v2 3/7] drivers: reset: simple: add BCM6345 reset support
Date:   Tue,  9 Jun 2020 18:02:40 +0200
Message-Id: <20200609160244.4139366-4-noltari@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200609160244.4139366-1-noltari@gmail.com>
References: <20200609134232.4084718-1-noltari@gmail.com>
 <20200609160244.4139366-1-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add support for resetting blocks through the Linux reset controller
subsystem for BCM63xx SoCs.

Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
---
 v2: add compatibility to reset-simple instead of adding a new driver.

 drivers/reset/Kconfig        | 3 ++-
 drivers/reset/reset-simple.c | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index d9efbfd29646..84d29b585e9b 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -153,7 +153,7 @@ config RESET_SCMI
 
 config RESET_SIMPLE
 	bool "Simple Reset Controller Driver" if COMPILE_TEST
-	default ARCH_AGILEX || ARCH_ASPEED || ARCH_BITMAIN || ARCH_REALTEK || ARCH_STM32 || ARCH_STRATIX10 || ARCH_SUNXI || ARCH_ZX || ARC
+	default ARCH_AGILEX || ARCH_ASPEED || ARCH_BITMAIN || ARCH_REALTEK || ARCH_STM32 || ARCH_STRATIX10 || ARCH_SUNXI || ARCH_ZX || ARC || BMIPS_GENERIC
 	help
 	  This enables a simple reset controller driver for reset lines that
 	  that can be asserted and deasserted by toggling bits in a contiguous,
@@ -163,6 +163,7 @@ config RESET_SIMPLE
 	   - Altera SoCFPGAs
 	   - ASPEED BMC SoCs
 	   - Bitmain BM1880 SoC
+	   - BMIPS (BCM6345)
 	   - Realtek SoCs
 	   - RCC reset controller in STM32 MCUs
 	   - Allwinner SoCs
diff --git a/drivers/reset/reset-simple.c b/drivers/reset/reset-simple.c
index 067e7e7b34f1..c00bb65c0b70 100644
--- a/drivers/reset/reset-simple.c
+++ b/drivers/reset/reset-simple.c
@@ -118,6 +118,7 @@ static const struct reset_simple_devdata reset_simple_active_low = {
 static const struct of_device_id reset_simple_dt_ids[] = {
 	{ .compatible = "altr,stratix10-rst-mgr",
 		.data = &reset_simple_socfpga },
+	{ .compatible = "brcm,bcm6345-reset" },
 	{ .compatible = "st,stm32-rcc", },
 	{ .compatible = "allwinner,sun6i-a31-clock-reset",
 		.data = &reset_simple_active_low },
-- 
2.26.2

