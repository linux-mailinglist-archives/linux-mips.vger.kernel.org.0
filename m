Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9B474276A6
	for <lists+linux-mips@lfdr.de>; Sat,  9 Oct 2021 04:23:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244446AbhJICZL (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 8 Oct 2021 22:25:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244680AbhJICXN (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 8 Oct 2021 22:23:13 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDC37C061794;
        Fri,  8 Oct 2021 19:20:52 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id n2so7245342plk.12;
        Fri, 08 Oct 2021 19:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2G1kdri23kWnlj1enPufIZN1leyxpMasJ2EyRU0acfw=;
        b=CfX1XQ9OItoC+Tck4KAw3dX6II/+kBQdyoYgzKxz7SbcfRxZRwW/6EdJYv7NEYHCBs
         my1ca7Qgs4lOy4TQWZYFbVw8rz2Le1VIt9aadwb6p0eMsbhussjUrnXIiIhityMik7q1
         /zpGuL2BwJBMwVNCjPMMYks/EKT8COzsVTHA6zbb7JrfzlMDRoleh44YMllSGX8KBD8y
         HdQqqjjjtOiU2Rgc1oB4PaUD7ulGDvsKp6WZ35I1EGat0Z9eWuX1OnPQ5hdYdCT0pDFj
         CiS0r1f/FwCfkTFsVeZrqPIsag+JDjjCrmtnMGXHAg5ag87bYTRE6yXRdHLLd3eJVTP3
         a7FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2G1kdri23kWnlj1enPufIZN1leyxpMasJ2EyRU0acfw=;
        b=KBJPIsktn4ZFNVJ2P5ZDwgqNP0j1n7QP3ckZlFNjexlqOw62iZorct4RCBemew2WU+
         vfEDzSAiWmf/JkKuSM87MuBYte8Dnc775ohZtGh5D4SXHv6nDe2a9ucM1G/oZtpYB0rq
         twOIUu5xykIqMocdEQF7r+9sH4sPpw0Bc16aGwEXncOUsMsXKrJizswHdVpvmDOQXPZa
         hdfQRoIHxeUtHKSG1IcFMjiNeRK59+rKadIFqvZxPBCnqcXI5GkMUhF3QWlDAK1oOfvv
         BO+twzBrKCI+oKoJYv+DZo0TCOAJdYB1ijwKww+ECnW5MqiBwLshAqN4VeY41q2ypbHt
         fldA==
X-Gm-Message-State: AOAM531LKpUhkW77LGV0B8DCgTGWwJDb9R+pM4pkEivya0VlOnO7MNd6
        Jw8LemDzqHhLghDlO6BPU2Mq/n912Cg=
X-Google-Smtp-Source: ABdhPJyhyJrlh/qrD1jpXbGniDULsoIKlimYb+RyOYtlOTE14n47zNMHqFBwjExwM0cBXcvomzkauQ==
X-Received: by 2002:a17:903:2287:b0:13e:5d9f:1ebf with SMTP id b7-20020a170903228700b0013e5d9f1ebfmr12380907plh.75.1633746052048;
        Fri, 08 Oct 2021 19:20:52 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id pi9sm444692pjb.31.2021.10.08.19.20.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Oct 2021 19:20:51 -0700 (PDT)
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
Subject: [PATCH v4 14/14] irqchip: Fix kernel-doc parameter typo for IRQCHIP_DECLARE
Date:   Fri,  8 Oct 2021 19:20:23 -0700
Message-Id: <20211009022023.3796472-15-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211009022023.3796472-1-f.fainelli@gmail.com>
References: <20211009022023.3796472-1-f.fainelli@gmail.com>
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

