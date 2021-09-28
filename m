Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 716A441B5D7
	for <lists+linux-mips@lfdr.de>; Tue, 28 Sep 2021 20:22:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242108AbhI1SYC (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 28 Sep 2021 14:24:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241488AbhI1SYB (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 28 Sep 2021 14:24:01 -0400
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E740FC06161C;
        Tue, 28 Sep 2021 11:22:21 -0700 (PDT)
Received: by mail-pg1-x532.google.com with SMTP id r2so22090216pgl.10;
        Tue, 28 Sep 2021 11:22:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wzjuC9MK57NdGhsmL0/fukugcevUgitff7Z6GFPU/co=;
        b=Z/7OXpyv48Km4EWco0kS+9jL/fhj9B2LOTcklrKlw8AlcK7WmvXQyhQrvBd0Qe4q3M
         sgSMnwgzpm/WY9B2KBcmoiUA+dQw/iMI/dC0CIM7VOiBt1CsYLebhIB7ZCVbggRITJTN
         VJbZ4soPZwUqVyhXpd69kE2y9SRmib+4RwLHR4zvlvgySX14YklDZ2TQ9WOkO8Rso0Ac
         2iLKfM7Bd4EoieHITId2esrSTaenxt7R9VzYcUBVpC4s8AjeBsOJ11+fRun088VyEiSg
         6LW9CbFXJJXsywtk+J7Q2gLKJ5eJA18izMl4ttGCg8PRRa1aVbt7CiAPO0JwD7pRzKnj
         8AdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wzjuC9MK57NdGhsmL0/fukugcevUgitff7Z6GFPU/co=;
        b=C7g9y+kKY9Pd8vyx4irV2dJk/6La9PnWXg4ChfNgtdXuG+FmxlOfFgQdZZs5YWVPfr
         g2cVAW8TjgmUh7HmYC4hXG6V16Pu/DbdJ0QtCImCf9wMTFICGT6IJcDOsV+WYJ4QLYx8
         coTgkvLYy3Mrvrtv/aWJDMrWyljIWi7M6zWWEiDfs5r3rK/z4PcE+K9rXYc/C2TU5YpP
         k6ndkZYoEKd4pV9uQbhtR1nSL3bIwX9Hot2nbhq5I0TnderB4Ztq4fwoaoCug9ItwDrf
         j0JKaDy3SPdhGS2FWLW04vj2VMINr42Uuh4ot6kZoEDAQPgTYk8k9U5MxOxePeXCALQc
         RQaQ==
X-Gm-Message-State: AOAM533uafLiOEgC6YYLDjYkIQDzTEjFle2RXMPOhGcs4eckDXj4LWOC
        MSRK0LLCd0r/JLPiya69ytk/951QQm0=
X-Google-Smtp-Source: ABdhPJwBzY0xo9qskBBGj9uXqE3Fzh3r0jSY28mP6BSvovQo8jxNn+2Y+ODRxEd2SuKKL+GLpPhx5g==
X-Received: by 2002:a62:7a8e:0:b0:447:df71:48b2 with SMTP id v136-20020a627a8e000000b00447df7148b2mr6875148pfc.22.1632853340854;
        Tue, 28 Sep 2021 11:22:20 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id x19sm20855288pfn.105.2021.09.28.11.22.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Sep 2021 11:22:20 -0700 (PDT)
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
Subject: [PATCH v3 00/14] Modular Broadcom irqchip drivers
Date:   Tue, 28 Sep 2021 11:21:25 -0700
Message-Id: <20210928182139.652896-1-f.fainelli@gmail.com>
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
 drivers/of/irq.c                 |  2 +-
 include/linux/irqchip.h          |  2 +-
 include/linux/of_irq.h           |  5 +++-
 kernel/irq/generic-chip.c        |  3 ++
 13 files changed, 58 insertions(+), 70 deletions(-)

-- 
2.25.1

