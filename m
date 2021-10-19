Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2315343411D
	for <lists+linux-mips@lfdr.de>; Tue, 19 Oct 2021 23:59:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230298AbhJSWCA (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 19 Oct 2021 18:02:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230190AbhJSWBm (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 19 Oct 2021 18:01:42 -0400
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E69AC0613E3;
        Tue, 19 Oct 2021 14:59:24 -0700 (PDT)
Received: by mail-pg1-x531.google.com with SMTP id g184so20631668pgc.6;
        Tue, 19 Oct 2021 14:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2G1kdri23kWnlj1enPufIZN1leyxpMasJ2EyRU0acfw=;
        b=Y5clh4hJuQyM8eC5A+hgiBCp367+x4gkBxd+43EC3gI8EhkdW9oupc9VprJN88A+SS
         MXTHIQCNafVT3DbL2pCZSy3fiLeF0SEKKp0m6MVaa6nk70CD2U8zGmq/1cEi5NM/7I3X
         DVM4WarHYUHHtzY263A4Kz2rszp3lsNoKs0v2rvv6hfDsyAFR7ILK2Ov1P81G/OXu7+n
         UuW4Sa46ne3mVkOBB09KzfcE/ffd4WXtx3d1ugUwrqtf/VI+0bfPdTMw128tcJ4+X95R
         a1/YA5eKCmN+kkII9t5ISBDNRfN5T4/yLr6NPGd1/mT3rgLbS5u860+VgdrpyHIxNta2
         A1sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2G1kdri23kWnlj1enPufIZN1leyxpMasJ2EyRU0acfw=;
        b=NXnCuJBOwvWguOJFx7y33gqrKsjkoonVytNu0mvAtTpbyVnxr/RJNBCe0FCseZ5toY
         hSDlW4ntQatClg4+Ubguq2/DCNm0ZBXRK30e9Y/cruOKWMCYOK7GowOkUnNKfxl45qjg
         rQBlSTBablsSuYAIynsRCvAq9KpgOPfXlMvTeOH6tj2D58xokiXQNeUkwo+X5gZ+R1tE
         4V1MpWKUdyrkAMcttKrrNEPa6g55D0TrMPDvdAqtJOVRv60KwqLu4nLFe5wzBMOygtlo
         ojxgnn5inxu5lUVtM5KHX1FS3Xeyq9dssgkEs83o3LH12TvgXtG/MuX7KSwP9/vJpOvR
         iWlA==
X-Gm-Message-State: AOAM531C2bzl/ZKkjDSWsq4PzxBbFwx3TbHYjdIqA+2kU86ylTPlVm8D
        RkeuECv4ZTcz8wkkFdRhzjLkUYNkhWI=
X-Google-Smtp-Source: ABdhPJxR3R8hw1YDkPeaq+1XWGII38BdkuxodKSXvnmpG9QGveZCyXnqmGNQGOxR6w5CknBLqcfbnA==
X-Received: by 2002:a63:7514:: with SMTP id q20mr5138672pgc.232.1634680763731;
        Tue, 19 Oct 2021 14:59:23 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id bf7sm139325pjb.14.2021.10.19.14.59.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 14:59:23 -0700 (PDT)
From:   Florian Fainelli <f.fainelli@gmail.com>
To:     linux-kernel@vger.kernel.org
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com (maintainer:BROADCOM
        BCM281XX/BCM11XXX/BCM216XX ARM ARCHITE...),
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        linux-arm-kernel@lists.infradead.org (moderated list:ARM
        SUB-ARCHITECTURES), linux-mips@vger.kernel.org (open list:MIPS),
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE)
Subject: [PATCH v5 14/14] irqchip: Fix kernel-doc parameter typo for IRQCHIP_DECLARE
Date:   Tue, 19 Oct 2021 14:58:55 -0700
Message-Id: <20211019215855.1920099-15-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211019215855.1920099-1-f.fainelli@gmail.com>
References: <20211019215855.1920099-1-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The documentation refers to "compstr" when we have the parameter named
"compat", fix the typo.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 include/linux/irqchip.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/irqchip.h b/include/linux/irqchip.h
index 67351aac65ef..ccf32758ea85 100644
--- a/include/linux/irqchip.h
+++ b/include/linux/irqchip.h
@@ -23,7 +23,7 @@
  *
  * @name: name that must be unique across all IRQCHIP_DECLARE of the
  * same file.
- * @compstr: compatible string of the irqchip driver
+ * @compat: compatible string of the irqchip driver
  * @fn: initialization function
  */
 #define IRQCHIP_DECLARE(name, compat, fn) OF_DECLARE_2(irqchip, name, compat, fn)
-- 
2.25.1

