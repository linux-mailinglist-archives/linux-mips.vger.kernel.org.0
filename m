Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7DD842767B
	for <lists+linux-mips@lfdr.de>; Sat,  9 Oct 2021 04:20:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231947AbhJICWZ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 8 Oct 2021 22:22:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232244AbhJICWZ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 8 Oct 2021 22:22:25 -0400
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F1F3C061570;
        Fri,  8 Oct 2021 19:20:29 -0700 (PDT)
Received: by mail-pg1-x536.google.com with SMTP id r201so4809195pgr.4;
        Fri, 08 Oct 2021 19:20:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZKpr+eJivC8g15sf9oBLl2Zow7STuQ1ZFrQJUTWAtCc=;
        b=N21wjv5hFeQjygq6vsRNlVd/tYakI0DyVlNLwMfClDSE/AJiGb1MIOdlSGnyntU/FD
         T/gZMuPvJfyGDxbCT1+PbG9Kzj9R/cgrKUdAJL8IvBnXU66Inelu2SaTaowBpocYX9Rl
         3NVsNtsCfB2kImyzdvaCAzr15cosXOipdX4xJ/TcFfM8EDE1zBhY1zmfVNylAY2GUY8y
         RkD1ylMBQ5tk/cBUdcZtwFVUx8XgVCzYkQNG/VkgXglPnVZdMJ9rFeVe/dPaPo62saSK
         TQef5ldAMsDjIC1KFRZ9TYH1ubkJTxEHqvHprnsKClbYfgenCAd65i71D9RTNvkZBrOO
         9NrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZKpr+eJivC8g15sf9oBLl2Zow7STuQ1ZFrQJUTWAtCc=;
        b=g0AHNvUiP2ijvpXXEPRUKQ1V4yM33zG9sC4HBjQ8lMIV1iGHCXr2vcCMbHiaxQq1dc
         eTthfkyW5EK7QYeLqRSvWalxZ/QExGZNpu9++yLZdBoQSOV1hDLQXA3KGY18vjtXhop8
         P7JNClK4QNy8cKj/AAsdkzEhxwtf/2HnYV+cpKPdsSxVu7v3PpAhq+LM0DkKE6DItOdk
         nC8OQQz5xoZK4mRoKKSPvdPSZjRBXKYabLyaMfWniNLNFQkwxRGQgESlvKLDYRASJpXY
         rdRNqeKIWC8e1M8D0Y6chxnd3NpVogHWY4U0Wa6MsRhPYXZ0wGFDbBWHeULEXx6hQFpZ
         a7Gg==
X-Gm-Message-State: AOAM532md2nEZwMwKTYRTTR8UZy2n8bty+MWQHJBIeqMQArJ1KMeANbi
        TOZYKy1JZqJkNpSlq/byDpl3HA3tY7w=
X-Google-Smtp-Source: ABdhPJw/mxJJdN8HBDaC5hxAcXmg952HetavT3+JY2+jsB8RwtUiwFVMBHbX8FyAeyp+UfszGWKrNw==
X-Received: by 2002:aa7:8bd3:0:b0:44c:68b3:a52e with SMTP id s19-20020aa78bd3000000b0044c68b3a52emr13680694pfd.74.1633746028370;
        Fri, 08 Oct 2021 19:20:28 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id pi9sm444692pjb.31.2021.10.08.19.20.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Oct 2021 19:20:27 -0700 (PDT)
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
Subject: [PATCH v4 00/14] Modular Broadcom irqchip drivers
Date:   Fri,  8 Oct 2021 19:20:09 -0700
Message-Id: <20211009022023.3796472-1-f.fainelli@gmail.com>
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
  MIPS: BMIPS: Remove use of irq_cpu_offline
  irqchip/irq-bcm7038-l1: Remove .irq_cpu_offline()
  irqchip/irq-bcm7038-l1: Use irq_get_irq_data()
  irqchip/irq-bcm7038-l1: Gate use of CPU logical map to MIPS
  irqchip/irq-bcm7038-l1: Restrict affinity setting to MIPS
  irqchip/irq-bcm7038-l1: Switch to IRQCHIP_PLATFORM_DRIVER
  genirq: Export irq_gc_{unmask_enable,mask_disable}_reg
  irqchip/irq-brcmstb-l2: Switch to IRQCHIP_PLATFORM_DRIVER
  irqchip: Provide platform_device to of_irq_init_cb_t
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
 drivers/irqchip/irq-bcm7038-l1.c | 47 ++++++++------------------------
 drivers/irqchip/irq-bcm7120-l2.c | 28 +++++++++++--------
 drivers/irqchip/irq-brcmstb-l2.c | 16 ++++++-----
 drivers/irqchip/irqchip.c        |  2 +-
 drivers/irqchip/qcom-pdc.c       |  3 +-
 drivers/of/irq.c                 |  2 +-
 include/linux/irqchip.h          |  2 +-
 include/linux/of_irq.h           |  5 +++-
 kernel/irq/generic-chip.c        |  3 ++
 14 files changed, 60 insertions(+), 71 deletions(-)

-- 
2.25.1

