Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5331D43532C
	for <lists+linux-mips@lfdr.de>; Wed, 20 Oct 2021 20:51:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231732AbhJTSxQ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 20 Oct 2021 14:53:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231546AbhJTSxC (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 20 Oct 2021 14:53:02 -0400
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9383DC061760;
        Wed, 20 Oct 2021 11:50:47 -0700 (PDT)
Received: by mail-pf1-x435.google.com with SMTP id d9so3742621pfl.6;
        Wed, 20 Oct 2021 11:50:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2G1kdri23kWnlj1enPufIZN1leyxpMasJ2EyRU0acfw=;
        b=GwRLeZAgQyhWzXBve39ZZ8disRmnwjqnXMZrtjJMr8p4bDJiS2ak5weMfmJWh4MMF1
         cq1/VRmUkqMvbTD+bm9Xg5RJbYvwNbf/h5GWAXSuTwfUG9m3yZqFj3kLughJlaEwbCbq
         WFX0GhuK3476jKxhv3jTzDHrHCShNSSIOsFVIF9Ndy3E6htLHlNHaieXIAa7pZXzOu9h
         69dpFXdbwAua8TZBAHkSUtNyZPHrdjbLLUeZnFIYjQ6fQCZpPWLg3mSMikvXWH/LX7pd
         NYI+WYr37cWoONmgtB2i+Am1E6mVnAcBpx7SXwWfVvOmXo2YcV4MxuNwZwMpskTePTFG
         RaKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2G1kdri23kWnlj1enPufIZN1leyxpMasJ2EyRU0acfw=;
        b=lIHQll+5u0v/L4z5CM8pZBbOre9X+ksZ9hNmz27iBdEEORQKqMl+yA15D46HM+nJ/q
         QQZMewyuhX30+ygUf2XiZLIigE85LL6Rofpsknk8xil3qV/uJoaJcB+/Pk+HxKqlgRV5
         HwN3TA5zHh2t41U71X6a1qM2r8kF3v90QpQT03bxodAg/KBmkpv8MkJzIdHGaBmUemue
         1jV2U6O0lYaZmI872E0Ok85UqY20UU4jLYTLSVO9reP4O9cl1J5vSFy5KadRJZQbKNKY
         lvO/GnFyJ9Yv0DY53xlQTbpxV/5JzEB/XbdQ4xmlBf1g00VzGsI4vMiGzHNUr1PbSSk0
         obYw==
X-Gm-Message-State: AOAM531K0f3ZRofskxbBWD2PYvEw/MJv0PQRz3zZaV7Et5cUHzOlWQRd
        wm982YFdfSUeYGFWVi3Pw/wGYZeXbyY=
X-Google-Smtp-Source: ABdhPJzTBKlnu/SAxrtzo9ELZ3GXRd222mBb2VFjfNED53MAdRSpGCiwjE3SxrYBR4O4pWV+SP/xyg==
X-Received: by 2002:a63:8c19:: with SMTP id m25mr794397pgd.164.1634755846750;
        Wed, 20 Oct 2021 11:50:46 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id o127sm3267863pfb.216.2021.10.20.11.50.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Oct 2021 11:50:46 -0700 (PDT)
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
Subject: [PATCH v6 13/13] irqchip: Fix kernel-doc parameter typo for IRQCHIP_DECLARE
Date:   Wed, 20 Oct 2021 11:48:59 -0700
Message-Id: <20211020184859.2705451-14-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211020184859.2705451-1-f.fainelli@gmail.com>
References: <20211020184859.2705451-1-f.fainelli@gmail.com>
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

