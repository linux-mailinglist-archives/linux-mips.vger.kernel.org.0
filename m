Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D73A41B5F9
	for <lists+linux-mips@lfdr.de>; Tue, 28 Sep 2021 20:23:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242175AbhI1SYj (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 28 Sep 2021 14:24:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242230AbhI1SY0 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 28 Sep 2021 14:24:26 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F3D0C06174E;
        Tue, 28 Sep 2021 11:22:44 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id bb10so14807836plb.2;
        Tue, 28 Sep 2021 11:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=T26BgQWn/9mqdmIjsWawB6f+e1Yr/GOlus2xPhKaou0=;
        b=RhuXW/WrvdSvfA58ICAu0BTKmIcI5wLVZB6iD8y8Wx+S1F5LwMRHCB0mieSVudR9U2
         Hmdwdxke9QyW/2z9Amt1BKbC1E9JjfSKObvhoH2+eVGxShWx0iIb/gz0rE1NDsqMBxSO
         ufsONr358HP5fTCK2y1RQcSt33qerPulnSWUZBCcbibXBu/SHvEB9Tz2T6J0vHsmF8eO
         0Te7SJIzgXGLLMz6PTIrTctBdVPmruGQ8WiZZJc+S6WGZ2LdxEFrVqJwhMFLRslqAWAR
         7UbfA4eq9eECcKJ08qSwzxncTpug2P3x5HX4JE+nkK//p7fvNBHXazTfBNxK8v5OoVZj
         0GSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=T26BgQWn/9mqdmIjsWawB6f+e1Yr/GOlus2xPhKaou0=;
        b=CUu0coJXG6DCNF7cvvBSK03iUrQioNpXy5X5rMa+hfK4QiLbJRuMLMUHy/jSNFjnSE
         +RflmStQipksT5XYI8r6Fo3Se5lt8tXMNrGGcjvsxldROddZV9Bmc0/jrxqI6c4zCqgS
         TMEoZI0H22KnYCLugbRVcHfUo4aoVIQKL/HbniT+2UlNZNz/XQJTvOSbHJsJ2qMwHfcE
         CepS5MEX+o/NnR23X9uOxY42ftykGUngYofWtC5fjEcF6Xu0s1AWliNoK/YhXRx+Z+xm
         E+xH3/Qxn/HgPpzEjtmlvyJqc7y/vpMoL4Fz0fOa+MM+B9ERVh2GVaUILlvN5jSE+avg
         na/Q==
X-Gm-Message-State: AOAM531DniQyLiAUtSZTj2PmGRq/NTmXSFwmqTrPTFiXPo+O2Mwzlvem
        Hd5SjAAw4HMPKSV63/TIcL9jced+4+4=
X-Google-Smtp-Source: ABdhPJyOgDfKEUX2wbPsA3GK0AJrY9DGZLrVCNUZ2532DUtclW4D9RAcuPdX7AkDmsWUn3PocI0sCA==
X-Received: by 2002:a17:902:c3c5:b0:13d:efe4:c10a with SMTP id j5-20020a170902c3c500b0013defe4c10amr6402436plj.54.1632853363287;
        Tue, 28 Sep 2021 11:22:43 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id x19sm20855288pfn.105.2021.09.28.11.22.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Sep 2021 11:22:42 -0700 (PDT)
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
Subject: [PATCH v3 14/14] irqchip: Fix kernel-doc parameter typo for IRQCHIP_DECLARE
Date:   Tue, 28 Sep 2021 11:21:39 -0700
Message-Id: <20210928182139.652896-15-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210928182139.652896-1-f.fainelli@gmail.com>
References: <20210928182139.652896-1-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The documentation refers to "compstr" when we have the argument named
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

