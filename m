Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 453F84340FC
	for <lists+linux-mips@lfdr.de>; Tue, 19 Oct 2021 23:59:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229791AbhJSWBW (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 19 Oct 2021 18:01:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229723AbhJSWBO (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 19 Oct 2021 18:01:14 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1D78C061749;
        Tue, 19 Oct 2021 14:59:01 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id q10-20020a17090a1b0a00b001a076a59640so2678340pjq.0;
        Tue, 19 Oct 2021 14:59:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GdOGRI80K+wNQEjH3mPOPndE64P/y5ts/hX6lqyqGHE=;
        b=FJbpe1ThVKgK6MS4bNq8xHuuagQlHijb/figYTP/jVqNMoEnokVQdeC0QWMDdB/dcE
         3YNGiBzjQBM6Su6L10jQmpKPpNsDiaR0GdBKUZT4wjtPtpCJvqqSSq3lkyZn8oZxWg9i
         JTrQ0k98O2grey5ucoE9e8cK5C97bNNWVzOWPFCDRznTERj+JJ9ia9AmKeNyk0eLIhEx
         o3rVF8s1jiZ821ZQ02AdgpB7W8IfPeSgPHIo+GNudaAWiSAmV6c51LDhA0yt9vDYFCmO
         cRt5z47xg+x3walWNaNG4BEUzHR2SR85ecpREzXvETG+t7Fm0q36R32knWNu+k8HVpi3
         KD1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GdOGRI80K+wNQEjH3mPOPndE64P/y5ts/hX6lqyqGHE=;
        b=z4BcMAIAsLOK8+XAcLtSZMVzvhblDbE1ojWp9OVMKfqqnYoEjj0ONN0GONyXFY+XND
         +T6yXmQoYsrWUnrNpESAO1D2dpeAlFfNVlRPZN5hyWDxP6o1RNbcKOkMEL28mwTbCBo2
         k9gsPU2QnVBbIHUV1uDhhyMqDfuxZ7aJ0H9PYsJ87d9tH84oxPeHW6Dh8QBwE6qNk9BM
         Ln62sufnqwB3wPeOTDHSXuWHzWmIVvbt/DA+BMwgGvgYpKb13YeakA/V7tAbTgHgKYAL
         w/n+7YQa0rABCB4qiVt7nqJuiA+3I8vrLhsoq4yMumG+LutMTXQ0l0GqgLALvVm++80w
         tO2w==
X-Gm-Message-State: AOAM532ASeOnJDxHXGwtq1oWUIMm9QlX1VFBh3Zx26oYPNyigp/M3TEs
        oC79oz7mwEBsl9287lQS/7QWoMV48UA=
X-Google-Smtp-Source: ABdhPJxk/TBEHPy4xHiREvckqvcnxHedFfzlc96UOB0+wIsECd+5WtpAEMkEndnF/MHz8xW5EVQbjw==
X-Received: by 2002:a17:90a:307:: with SMTP id 7mr2755164pje.176.1634680740810;
        Tue, 19 Oct 2021 14:59:00 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id bf7sm139325pjb.14.2021.10.19.14.58.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 14:59:00 -0700 (PDT)
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
Subject: [PATCH v5 00/14] Modular Broadcom irqchip drivers
Date:   Tue, 19 Oct 2021 14:58:41 -0700
Message-Id: <20211019215855.1920099-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Thomas, Marc,

This patch series aims at allowing the 3 interrupt controller drivers
used on Broadcom STB platforms to be built as modules in order for those
to be shipped in a GKI enabled system (Android).

The irq-bcm7038-l1 requires us to export a number of symbols, which is
not great, but there are not obvious solutions other than adding
accessor functions to get the same information.

Assuming you are happy with the changes though, please do take the last
two changes as well through your tree.

Thanks!

Changes in v5:

- put patch #9 as the first one
- add missing platform_device argument to the irq-bcm7038-l1 and
  irq-brcmstb-l2 drivers (Marc)

Changes in v4:

- added Thomas' Acked-by for patch #1
- added Rob's Reviewed-by for patch 9 and updated qcom-pdc.c as
  suggested
- s/argument/parameter/ in patch #14 as suggested by Sergey

Changes in v3:

- avoid the use of the cpu_logical_map array for platforms other than
  MIPS
- removed the bogus irq_set_affinity callback for platforms other than
  MIPS
- bring-back the export of irq_gc_noop() lost in the v2

Changes in v2:

- avoid using irq_to_desc() and use irq_get_irq_data() instead
- re-order patches to avoid linking failure for irq-brcmstb-l2
- removed the use of .irq_cpu_offline() and converted BMIPS to use
  irq_migrate_all_off_this_cpu()
- avoid exporting of_irq_count() and use a platform device passed
  down from the irqchip platform driver registration code instead
- added kernel-doc fix

Florian Fainelli (14):
  irqchip: Provide platform_device to of_irq_init_cb_t
  MIPS: BMIPS: Remove use of irq_cpu_offline
  irqchip/irq-bcm7038-l1: Remove .irq_cpu_offline()
  irqchip/irq-bcm7038-l1: Use irq_get_irq_data()
  irqchip/irq-bcm7038-l1: Gate use of CPU logical map to MIPS
  irqchip/irq-bcm7038-l1: Restrict affinity setting to MIPS
  irqchip/irq-bcm7038-l1: Switch to IRQCHIP_PLATFORM_DRIVER
  genirq: Export irq_gc_{unmask_enable,mask_disable}_reg
  irqchip/irq-brcmstb-l2: Switch to IRQCHIP_PLATFORM_DRIVER
  genirq: Export irq_gc_noop()
  irqchip/irq-bcm7120-l2: Switch to IRQCHIP_PLATFORM_DRIVER
  arm64: broadcom: Removed forced select of interrupt controllers
  ARM: bcm: Removed forced select of interrupt controllers
  irqchip: Fix kernel-doc parameter typo for IRQCHIP_DECLARE

 arch/arm/mach-bcm/Kconfig        |  4 ---
 arch/arm64/Kconfig.platforms     |  3 --
 arch/mips/Kconfig                |  1 +
 arch/mips/kernel/smp-bmips.c     |  3 +-
 drivers/irqchip/Kconfig          | 12 ++++++--
 drivers/irqchip/irq-bcm7038-l1.c | 50 +++++++++-----------------------
 drivers/irqchip/irq-bcm7120-l2.c | 28 ++++++++++--------
 drivers/irqchip/irq-brcmstb-l2.c | 22 ++++++++------
 drivers/irqchip/irqchip.c        |  2 +-
 drivers/irqchip/qcom-pdc.c       |  3 +-
 drivers/of/irq.c                 |  2 +-
 include/linux/irqchip.h          |  2 +-
 include/linux/of_irq.h           |  5 +++-
 kernel/irq/generic-chip.c        |  3 ++
 14 files changed, 66 insertions(+), 74 deletions(-)

-- 
2.25.1

