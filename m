Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1A6E435304
	for <lists+linux-mips@lfdr.de>; Wed, 20 Oct 2021 20:50:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231278AbhJTSwo (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 20 Oct 2021 14:52:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230076AbhJTSwn (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 20 Oct 2021 14:52:43 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 438ADC06161C;
        Wed, 20 Oct 2021 11:50:29 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id q10-20020a17090a1b0a00b001a076a59640so4307871pjq.0;
        Wed, 20 Oct 2021 11:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jCTb2WHpCoALHksNWsQaKHhY8JPhECfpgoUvgy9th8Y=;
        b=iJguvjx1coWd0eNGdUNUyqXo+TUzvTVmLESIXbT/pGmTkUWVWvBHDtPOD2cM69N/KW
         MYWrYzeyAwV0MX3vupC221ZIIrqg5E8rYb04svCyOiQIPY20v0BeXleS1pfFPAMFbonG
         HQuLiiHt3SPaRO734w2e4lbPR0YNB3fQi23n0a6jiGNbcI7Nbs3c8a7ZgJLzbXJjCS89
         dQNxwu9Nj6kY0QfNjM3VXQdWgvsxusUCpbSnlB3rnblBY4Z8qXCnahCq+IUcfLdNZTFP
         OXus2dfyXIC6LJSvxjGT8wobH+ysVoeCzrL0b5BjQZAftRDUiVQgee2+Sml7DFfgbJFm
         iYpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jCTb2WHpCoALHksNWsQaKHhY8JPhECfpgoUvgy9th8Y=;
        b=tAmZDZd1JBVg2sEkvCJjCW4jIc1TrfKyiGNvEIuYOOoeS1xnlQjZmfbhKbHL+TFxmb
         T+vDzSDjhGzRj9A0NX2A4PziGSj3LhImZS47SfRVHP4PyhwxX3Nq7gh5gvJnVraThtCz
         Lr4/5/b/ERr7+t+NJUWhdDvqQ0Tw56noZrmg/u86ymcZ3umbZZkMSFKOAc3umRHVez5g
         PnSOTfdmiwreJMQb2njJSr2f7s6lNqsnqPyHjow+5ogCxmOZt9MiTpOYkdjRBNqtQAw0
         T3lRexhoN185pCY7ODs8hw/vs3NfIN1FwEiZORenIIT+A2f/VmxjG4ljtuqszUhV+/6u
         vorg==
X-Gm-Message-State: AOAM533VqitDo4witB9qIj0ZSpg3HMbspDPTaRSwDeaAC1RKRGyYcI2r
        NllsqyN35iLDYTyNdmJ1Omgp0DiW6Ns=
X-Google-Smtp-Source: ABdhPJxsrSXaveNPHaZktrIOBkh5ClOyOONpYSte2ljo9Suw+qbalLBZqIShPizPhoBJRQkU9Ngtaw==
X-Received: by 2002:a17:902:e5cb:b0:13f:25b7:4d50 with SMTP id u11-20020a170902e5cb00b0013f25b74d50mr719178plf.38.1634755828325;
        Wed, 20 Oct 2021 11:50:28 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id o127sm3267863pfb.216.2021.10.20.11.50.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Oct 2021 11:50:27 -0700 (PDT)
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
Subject: [PATCH v6 00/13] Modular Broadcom irqchip drivers
Date:   Wed, 20 Oct 2021 11:48:46 -0700
Message-Id: <20211020184859.2705451-1-f.fainelli@gmail.com>
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

Changes in v6:

- dropped changing the prototype of of_init_irq_cb and instead
  resolved the platform_device from irq-bcm7120-l2 since this is
  the only driver that needs this to call platform_irq_count()

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


Florian Fainelli (13):
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
 drivers/irqchip/irq-bcm7038-l1.c | 47 ++++++++------------------------
 drivers/irqchip/irq-bcm7120-l2.c | 21 ++++++++++----
 drivers/irqchip/irq-brcmstb-l2.c | 16 ++++++-----
 include/linux/irqchip.h          |  2 +-
 kernel/irq/generic-chip.c        |  3 ++
 10 files changed, 51 insertions(+), 61 deletions(-)

-- 
2.25.1

