Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C641A2E16DF
	for <lists+linux-mips@lfdr.de>; Wed, 23 Dec 2020 04:10:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731455AbgLWDDN (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 22 Dec 2020 22:03:13 -0500
Received: from mail.kernel.org ([198.145.29.99]:45510 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728645AbgLWCT3 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 22 Dec 2020 21:19:29 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1DC7422285;
        Wed, 23 Dec 2020 02:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1608689936;
        bh=0MXOZf7yd2wC/JO392G22Rc0EIixdSQRG1LJ3EE8zhk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=gkoRmc7fwe+1VnxmFRUlQTeTJ/1GBNkSuR1rzvg8gBTJ97lNPNv/EfhcWWTC8eVMN
         MBrBqZ44/2dPhxKfaTEDGS5rUXwhEHl+sq0JKHMuNgX0gX5DW40kHcJ8Q6rXmBKyCd
         0kfmuWwZxwl8FxDI6MLmCQtB7kSforZorKehhkrsoOu2hthWGgREFWsEaGMRLf1Ysw
         7eGJt5qmora1yMTGt6sWLGBlTG3hLYb9f1f6GAMmnAEBr9Xp9jSCeWxnsLnjoKz55o
         shzQ/cGuF3Ih46+Y6xIROxNDD/b+HteLeNNPCU+z88BqvIBR+/5KBfJhiYItVnqdxe
         94jSv002zHYiA==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Necip Fazil Yildiran <fazilyildiran@gmail.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Sasha Levin <sashal@kernel.org>, linux-mips@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 033/130] MIPS: BMC47xx: fix kconfig dependency bug for BCM47XX_SSB
Date:   Tue, 22 Dec 2020 21:16:36 -0500
Message-Id: <20201223021813.2791612-33-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201223021813.2791612-1-sashal@kernel.org>
References: <20201223021813.2791612-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Necip Fazil Yildiran <fazilyildiran@gmail.com>

[ Upstream commit 09a48cbcd7af9203296938044f1100bb113ce01a ]

When BCM47XX_SSB is enabled and SSB_PCIHOST is disabled, it results in the
following Kbuild warning:

WARNING: unmet direct dependencies detected for SSB_B43_PCI_BRIDGE
  Depends on [n]: SSB [=y] && SSB_PCIHOST [=n]
  Selected by [y]:
  - BCM47XX_SSB [=y] && BCM47XX [=y] && PCI [=y]

The reason is that BCM47XX_SSB selects SSB_B43_PCI_BRIDGE without
depending on or selecting SSB_PCIHOST while SSB_B43_PCI_BRIDGE depends on
SSB_PCIHOST. This can also fail building the kernel as demonstrated in a
bug report.

Honor the kconfig dependency to remove unmet direct dependency warnings
and avoid any potential build failures.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=210051
Signed-off-by: Necip Fazil Yildiran <fazilyildiran@gmail.com>
Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/mips/bcm47xx/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/bcm47xx/Kconfig b/arch/mips/bcm47xx/Kconfig
index 6889f74e06f54..40876654423c6 100644
--- a/arch/mips/bcm47xx/Kconfig
+++ b/arch/mips/bcm47xx/Kconfig
@@ -9,6 +9,7 @@ config BCM47XX_SSB
 	select SSB_DRIVER_MIPS
 	select SSB_DRIVER_EXTIF
 	select SSB_EMBEDDED
+	select SSB_PCIHOST if PCI
 	select SSB_B43_PCI_BRIDGE if PCI
 	select SSB_DRIVER_PCICORE if PCI
 	select SSB_PCICORE_HOSTMODE if PCI
-- 
2.27.0

