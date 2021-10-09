Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C43A9427699
	for <lists+linux-mips@lfdr.de>; Sat,  9 Oct 2021 04:21:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232244AbhJICXD (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 8 Oct 2021 22:23:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244574AbhJICWm (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 8 Oct 2021 22:22:42 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1CC1C061772;
        Fri,  8 Oct 2021 19:20:45 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id i65so6670312pfe.12;
        Fri, 08 Oct 2021 19:20:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HFON70fhXDszaD5v9yYPo/8gY6ecjeQthvGng5DXIkI=;
        b=ausIkCFGPbENw4fedQTfZPBRbHku2qqNzrF2dJaGXzJy/KWRfzy1m5YE3L4MIOQ8Ly
         inkTJv1ZYWR6QHIu01MeDGWQvHn831m8ZoEiKPbZy8nzBXC0Z7ImNduozSOBX0WrWB+V
         d5bG0dSAoBkEQhlW8aEdkJOpw4+g3FKlTrP6ONLjtQd5/maQuirUVJgiIL81QktZFU1M
         XlYC2/ET4kZFIl6YO3vvRNJauJAWS/3VUwoRIl8QIUGOTQv/okMNZpxSUP+Nbe0Agl+M
         4o+6gGnwiPxQc7M4KlIsIkGC218ChGodQZTCqSQdvjY2tLsSumL74wDaQyDC+D0xMJLv
         5U7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HFON70fhXDszaD5v9yYPo/8gY6ecjeQthvGng5DXIkI=;
        b=g8pA/zVv7YP22F/p/bwIjIHcjlyXUpZweiZoRQrXLV9zFk+5oi0HcHj7XjEy+r0ZKj
         TwnMaBlMZTQdbgusWN3BG4cFrJoVijiUSRSxjTk8zGUDNCqcP3pjcEjK/EL/x4F4lzBY
         gWTVFdwaUsaNAvvcMyAivUJ0MYGn3+zkmaEmJ9cviFtAzGwp0Tlzvk40aDaXEEcA0pLP
         OPbCMVAfXhvriTjDULJmRteIKa9q6aMfqZJn2DPXchaBT+Sy8lHpAfQTgAZcIAE2CvdW
         CLl1JDHkkMQqsNGQKppXT+ZCUr6RbQ7AvgZuLLrcg28JdmYO/JreVRep/NgHtQLVnKV7
         hILg==
X-Gm-Message-State: AOAM532Wp9L2vgK3UJYgS4R/XS7vgAx8dwWO9TGiO3GbBlkpqG5pe4RU
        /ZCBYC8ZqhWRKoH68g0zj7SrXsuHz6k=
X-Google-Smtp-Source: ABdhPJzvROA2sOizAdWSh8eS2axz46xfjaBZ2sui7arqkGPAV1Aqc0JHKkBn+v1NulMnuGscFyLqfg==
X-Received: by 2002:a63:470b:: with SMTP id u11mr7494988pga.441.1633746045144;
        Fri, 08 Oct 2021 19:20:45 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id pi9sm444692pjb.31.2021.10.08.19.20.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Oct 2021 19:20:44 -0700 (PDT)
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
Subject: [PATCH v4 10/14] genirq: Export irq_gc_noop()
Date:   Fri,  8 Oct 2021 19:20:19 -0700
Message-Id: <20211009022023.3796472-11-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211009022023.3796472-1-f.fainelli@gmail.com>
References: <20211009022023.3796472-1-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

In order to build drivers/irqchip/irq-bcm7120-l2.c as a module which
references irq_gc_noop(), we need to export it towards modules.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 kernel/irq/generic-chip.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/kernel/irq/generic-chip.c b/kernel/irq/generic-chip.c
index 4c011c21bb1a..6f29bf4c8515 100644
--- a/kernel/irq/generic-chip.c
+++ b/kernel/irq/generic-chip.c
@@ -25,6 +25,7 @@ static DEFINE_RAW_SPINLOCK(gc_lock);
 void irq_gc_noop(struct irq_data *d)
 {
 }
+EXPORT_SYMBOL_GPL(irq_gc_noop);
 
 /**
  * irq_gc_mask_disable_reg - Mask chip via disable register
-- 
2.25.1

