Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB335434114
	for <lists+linux-mips@lfdr.de>; Tue, 19 Oct 2021 23:59:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230200AbhJSWBm (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 19 Oct 2021 18:01:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230070AbhJSWBd (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 19 Oct 2021 18:01:33 -0400
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A95DC061770;
        Tue, 19 Oct 2021 14:59:18 -0700 (PDT)
Received: by mail-pf1-x42e.google.com with SMTP id c29so1172475pfp.2;
        Tue, 19 Oct 2021 14:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HFON70fhXDszaD5v9yYPo/8gY6ecjeQthvGng5DXIkI=;
        b=NUH8PhewK1rIp/oj2+fAqEIqilcPjyVTvAvaV67rQFbGcZBQukOVGLuKdVj2Tt44SO
         jUasWzYA85KMUC4ohthpa9Rq3Cyll2wuzWbp6LEsgo8fEZsf1omxm6BU93Iw+6zfUvo4
         YpH2jDWJStutIcTGBBHbaYzsbhLErWWOx7A4VqzuuB8aFeZzLLD/w0ZkW9j6g3Z3QDC4
         O0h80Y2k4Nx/z2gSLHlgHhzpi0Unalvou52ci2AFLCgM2rhSiWijUGdvXXLNfrjQmHKc
         upsegXX6KN5MwV+kMMJPU6Vc+Rx6gGTLuAyO54dnBVkr7OHyMzvbaQFIgXUWvXa5YTUl
         QrxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HFON70fhXDszaD5v9yYPo/8gY6ecjeQthvGng5DXIkI=;
        b=mpix7RdtGb95QuyK5lAcoSicDTVNseKAsFTuT2VF/MsKYQlmO/t12aNe4vxiPvaMS2
         8HirY9wSK4V3Tjb1jSgaCcXK/AutnzxEy12bciDhik5KbWjJSyBTwBPplt7Z8sjHXn5m
         N7jwe9WGu7aVMQQGfkZcPGnmzMk5NtS/LU06vseJE+KXvt/LC7Okfj1FoqzoepPvJ0Mc
         G+M0LfdfIFEm/zdJRH55ZEt+YXcMuoKP23MmBIrTpeQJeypU2ow+FsEcb/cxgCta5XxI
         bGNJ+CQKWJr4sinJGb5x0RQMW0o4LzWdsSGkL0qK4jcoXjIVHVx1tTLhMwppL00uWtPd
         z7xQ==
X-Gm-Message-State: AOAM5308vErvQzNfRUItdMExquFRb4mnwoCIZ8zwnzVp5jLnhcC5D2Wn
        bcpOFoX02Fxw0SGIgGkJcysENswgdak=
X-Google-Smtp-Source: ABdhPJxu9CgzVTcZCjgwFxlmhCuf1nnhd3NDbzSWdoFwOrZQKasg47nSSV4dr8wa0FneiDUPY+Pvkg==
X-Received: by 2002:a62:27c7:0:b0:44d:b86:54f2 with SMTP id n190-20020a6227c7000000b0044d0b8654f2mr2435129pfn.68.1634680757552;
        Tue, 19 Oct 2021 14:59:17 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id bf7sm139325pjb.14.2021.10.19.14.59.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 14:59:17 -0700 (PDT)
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
Subject: [PATCH v5 10/14] genirq: Export irq_gc_noop()
Date:   Tue, 19 Oct 2021 14:58:51 -0700
Message-Id: <20211019215855.1920099-11-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211019215855.1920099-1-f.fainelli@gmail.com>
References: <20211019215855.1920099-1-f.fainelli@gmail.com>
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

