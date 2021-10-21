Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15CF04368A3
	for <lists+linux-mips@lfdr.de>; Thu, 21 Oct 2021 19:04:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231701AbhJURGo (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 21 Oct 2021 13:06:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:36390 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229968AbhJURGm (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 21 Oct 2021 13:06:42 -0400
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2572861037;
        Thu, 21 Oct 2021 17:04:26 +0000 (UTC)
Received: from sofa.misterjones.org ([185.219.108.64] helo=why.lan)
        by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <maz@kernel.org>)
        id 1mdbUN-000lAU-Vx; Thu, 21 Oct 2021 18:04:24 +0100
From:   Marc Zyngier <maz@kernel.org>
To:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Serge Semin <fancer.lancer@gmail.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>, f.fainelli@gmail.com,
        Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH 0/3] genirq: Make irq_cpu_{on,off}line() an Octeon-special
Date:   Thu, 21 Oct 2021 18:04:11 +0100
Message-Id: <20211021170414.3341522-1-maz@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, tsbogend@alpha.franken.de, fancer.lancer@gmail.com, chenhuacai@kernel.org, jiaxun.yang@flygoat.com, f.fainelli@gmail.com, tglx@linutronix.de
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Now that Florian has updated BMIPS to not rely on irq_cpu_offline [1],
it is pretty tempting to totally get of this misfeature. We can't
really do that because Octeon uses it like crazy, but the couple of
other users are easy to convert.

Once this is done, these helpers are hidden behind a config symbol
that depends on the Octeon platform being selected. When Octeon is
finally removed from the tree, we'll be able to drop this as well.


Marc Zyngier (3):
  MIPS: loongson64: Drop call to irq_cpu_offline()
  irqchip/mips-gic: Get rid of the reliance on irq_cpu_online()
  genirq: Hide irq_cpu_{on,off}line() behind a deprecated option

 arch/mips/loongson64/smp.c     |  1 -
 drivers/irqchip/irq-mips-gic.c | 37 ++++++++++++++++++++++++----------
 include/linux/irq.h            |  5 ++++-
 kernel/irq/Kconfig             |  7 +++++++
 kernel/irq/chip.c              |  2 ++
 5 files changed, 39 insertions(+), 13 deletions(-)

-- 
2.30.2

