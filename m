Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5525A2F0345
	for <lists+linux-mips@lfdr.de>; Sat,  9 Jan 2021 20:55:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726108AbhAITys (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 9 Jan 2021 14:54:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726011AbhAITys (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 9 Jan 2021 14:54:48 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7B63C061786;
        Sat,  9 Jan 2021 11:54:07 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id t16so12274636wra.3;
        Sat, 09 Jan 2021 11:54:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ijErLEx9QijLdxHcyZ6vJJ1tLpwbdCCs0FW9Exd7T0s=;
        b=fNXpl8jSERFYuXmTo+UYU2Ew+IDg2aYc9+bWQs1AZr0vYg+5g8ywl7dijHV9JlyvtJ
         ou9Fgm41iOG9vyoxAzxaTaZFGc1IHTC0cs41IxVJ5nBwKSO67hmI7+eWIOuAqxDukskj
         MsSg5iD43gAgUvr1JPP0JYX6jF9f7Dw20bCrPzJZkbVZwqRI1zMC2VA9alOfPxqxNZLX
         /I4+S+V1b/hiTAjsRvhUifLPElFbV+o4jWJwcxKLqunITsJEtV9aKtHOra5KBI3OulOG
         Vg0T/2Yh+c6yFDVgpXq9z/Ytyd2+to2G+8MTvgmPY3dF9RZRmrDaXu8wkjz5VqR5wHO5
         d1MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ijErLEx9QijLdxHcyZ6vJJ1tLpwbdCCs0FW9Exd7T0s=;
        b=FOinJzF4KoG8GlA+6yTsBpL5BKZWRno2CTvkElAK8+Ji7JOmPoaQe68ymIihZM9vCN
         yY3meBJJBeJYvIpP0uZITye85Jp3kAyLc5NDblri7VrApz1NpMkm9MHf79kjxxwtjy+U
         hi2IFC1XImXJVoZ2kbpfoVjXutqbxti/9ECXAYsjPl/INeiwELXQITrwKbkios6RG72V
         DzIjUBNWqyQnNBQxm1y4H1F28687VIrK5TAbINyP9jyO21WOJW1fPLC4jKQ7/EfQwsFT
         1Tqpo9u1u19xj6As6+qR0MwtI3iiUZNJtfva2ds52DJaaOG6eqfCfiF1uwOjES6I77o+
         AXGA==
X-Gm-Message-State: AOAM531fRhFvLawuDdWHjW8mZkz2nRNAFR2SevUKNHKUIQBVj0mulCoQ
        47CH90KUOyr/4CGHMJH428/+PFJ1wVE=
X-Google-Smtp-Source: ABdhPJxmtS455Upnnhunr7lfShxr6vb7TGcKnwnciUFK6sQEHV1yvNyXaMfgrKmFFX8yAMqkQz7GPA==
X-Received: by 2002:a5d:470d:: with SMTP id y13mr9352178wrq.309.1610222046562;
        Sat, 09 Jan 2021 11:54:06 -0800 (PST)
Received: from localhost.localdomain (p200300f13711ec00428d5cfffeb99db8.dip0.t-ipconnect.de. [2003:f1:3711:ec00:428d:5cff:feb9:9db8])
        by smtp.googlemail.com with ESMTPSA id x25sm16072863wmc.3.2021.01.09.11.54.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Jan 2021 11:54:06 -0800 (PST)
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To:     linux-mips@vger.kernel.org
Cc:     tsbogend@alpha.franken.de, linux-kernel@vger.kernel.org,
        john@phrozen.org, hauke@hauke-m.de,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH] MIPS: lantiq: irq: register the interrupt controllers with irqchip_init
Date:   Sat,  9 Jan 2021 20:53:51 +0100
Message-Id: <20210109195351.2724769-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add support for more interrupt controllers by switching from
of_irq_init() to irqchip_init() in Lantiq's arch_init_irq(). This
requires switching the ICU interrupt controller to use
IRQCHIP_DECLARE(), like a real irqchip driver would do.

This is needed for future changes when new irqchip drivers are
implemented:
- a dedicated driver for the EIU interrupt controller
- a driver for the MSI PIC (Programmable Interrupt Controller) found on
  VRX200 and newer SoCs
- ..or any other driver which uses IRQCHIP_DECLARE

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/mips/lantiq/irq.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/arch/mips/lantiq/irq.c b/arch/mips/lantiq/irq.c
index df8eed3875f6..76806d11e483 100644
--- a/arch/mips/lantiq/irq.c
+++ b/arch/mips/lantiq/irq.c
@@ -8,6 +8,7 @@
 #include <linux/interrupt.h>
 #include <linux/ioport.h>
 #include <linux/sched.h>
+#include <linux/irqchip.h>
 #include <linux/irqdomain.h>
 #include <linux/of_platform.h>
 #include <linux/of_address.h>
@@ -422,12 +423,9 @@ unsigned int get_c0_compare_int(void)
 	return CP0_LEGACY_COMPARE_IRQ;
 }
 
-static const struct of_device_id of_irq_ids[] __initconst = {
-	{ .compatible = "lantiq,icu", .data = icu_of_init },
-	{},
-};
+IRQCHIP_DECLARE(lantiq_icu, "lantiq,icu", icu_of_init);
 
 void __init arch_init_irq(void)
 {
-	of_irq_init(of_irq_ids);
+	irqchip_init();
 }
-- 
2.30.0

