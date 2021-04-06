Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C270D35500A
	for <lists+linux-mips@lfdr.de>; Tue,  6 Apr 2021 11:36:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244889AbhDFJg4 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 6 Apr 2021 05:36:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:54972 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S241239AbhDFJgc (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 6 Apr 2021 05:36:32 -0400
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 58EED6135D;
        Tue,  6 Apr 2021 09:36:24 +0000 (UTC)
Received: from 78.163-31-62.static.virginmediabusiness.co.uk ([62.31.163.78] helo=why.lan)
        by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94)
        (envelope-from <maz@kernel.org>)
        id 1lTi8E-005owA-4b; Tue, 06 Apr 2021 10:36:22 +0100
From:   Marc Zyngier <maz@kernel.org>
To:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-sh@vger.kernel.org
Cc:     Daniel Mack <daniel@zonque.org>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH 0/9] Cleaning up some of the irqdomain features
Date:   Tue,  6 Apr 2021 10:35:48 +0100
Message-Id: <20210406093557.1073423-1-maz@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 62.31.163.78
X-SA-Exim-Rcpt-To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org, daniel@zonque.org, robert.jarzmik@free.fr, haojian.zhuang@gmail.com, ysato@users.sourceforge.jp, dalias@libc.org, tsbogend@alpha.franken.de, mpe@ellerman.id.au, tglx@linutronix.de
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The irqdomain subsystem has grown quite a lot over the years, and some
of its features are either oddly used or just pretty useless. Some
other helpers expose internals that are likely to change soon.

Here are the bits that I'm trying to get rid of:

- irq_linear_revmap exposes the internals of the domains, and only
  works for linear domains. The supposed speed improvement really
  isn't an argument, as it gets in the way of more significant
  optimisations. Reimplemented in terms of irq_find_mapping, which
  always works, and will eventually go at some point.

- irq_create_strict_mappings is just a way to constraint the
  allocation of irqdescs into a given range, which is better served by
  creating a legacy irqdomain, and shows that the platform really
  needs to catch up with the 21st century.

- irq_create_identity mapping is just a variation on the above, with
  irq==hwirq, although the way it is used is a gross hack in the SH
  code that needs to go.

- irq_domain_add_legacy_isa is, as the names shows, a variation on
  irq_domain_add_legacy with a reservation of 16 interrupts. This is
  only used in the PPC code.

The patches address all of the above, touching some of the ARM, PPC,
and SH code that is affected. Another couple of patches address a MIPS
platform that could use the generic code, and clean some of the
comments in the irqdomain code.

Unless anyone shouts, I'd like to take this into 5.13, as it is the
basis of some further (and deeper) changes in the way irqdomains work.

	M.

Marc Zyngier (9):
  irqdomain: Reimplement irq_linear_revmap() with irq_find_mapping()
  ARM: PXA: Kill use of irq_create_strict_mappings()
  irqchip/jcore-aic: Kill use of irq_create_strict_mappings()
  sh: intc: Drop the use of irq_create_identity_mapping()
  irqdomain: Kill
    irq_create_strict_mappings()/irq_create_identity_mapping()
  mips: netlogic: Use irq_domain_simple_ops for XLP PIC
  irqdomain: Drop references to recusive irqdomain setup
  powerpc: Convert irq_domain_add_legacy_isa use to
    irq_domain_add_legacy
  irqdomain: Kill irq_domain_add_legacy_isa

 Documentation/core-api/irq/irq-domain.rst |  1 -
 arch/arm/mach-pxa/pxa_cplds_irqs.c        | 24 +++++------
 arch/mips/netlogic/common/irq.c           |  6 +--
 arch/powerpc/include/asm/irq.h            |  4 +-
 arch/powerpc/platforms/ps3/interrupt.c    |  4 +-
 arch/powerpc/sysdev/i8259.c               |  3 +-
 arch/powerpc/sysdev/mpic.c                |  2 +-
 arch/powerpc/sysdev/tsi108_pci.c          |  3 +-
 arch/powerpc/sysdev/xics/xics-common.c    |  2 +-
 drivers/irqchip/irq-jcore-aic.c           |  4 +-
 drivers/sh/intc/core.c                    | 50 ++++++++++-------------
 include/linux/irqdomain.h                 | 42 ++++---------------
 kernel/irq/irqdomain.c                    | 49 +++-------------------
 13 files changed, 59 insertions(+), 135 deletions(-)

-- 
2.29.2

