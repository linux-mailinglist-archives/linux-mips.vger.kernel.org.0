Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3A0744346A
	for <lists+linux-mips@lfdr.de>; Tue,  2 Nov 2021 18:13:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230382AbhKBRPx (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 2 Nov 2021 13:15:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:56586 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234158AbhKBRPx (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 2 Nov 2021 13:15:53 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2F84561050;
        Tue,  2 Nov 2021 17:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635873198;
        bh=QC4eoJ/UG6mp2LiLFOrPYp4zA5ytGJ6WUW2xwUjtOD0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ZMuMmAMJAeyQrtEKoziuIV/TSTSlU7ZYp6HMLIe2wulQIkOWfWrSWUWj8PaeNKAgm
         TwQ4HToRcHn83IrcnlQeL3DB2SLvXfIoBliuiPX6P+WDW2BeQIA54KK2bBxgkQ3Wnq
         tnh53bP9RPuJngq5fr21zYITGV0Nr9MXD9u0sXZYwmjdzMMyXwj/PiuKkC/qUrNjBr
         oNgIESxEz6OG/ze0ZDIEVPv+UzzIqScDGJPlq0y4H0r3IAxVoSRqZmPIwAHPbu9vV8
         Q2fCVuOjSs7jmoGTe1bdZrWFBql0Bipxkjjd7Hr+Y6GZSmvslQE6QQbQMf0gKytymg
         j2/6mhNNkM7jA==
Received: by pali.im (Postfix)
        id 64F3A1E29; Tue,  2 Nov 2021 18:13:16 +0100 (CET)
From:   =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] MIPS: Cobalt: Explain GT64111 early PCI fixup
Date:   Tue,  2 Nov 2021 18:12:59 +0100
Message-Id: <20211102171259.9590-2-pali@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211102171259.9590-1-pali@kernel.org>
References: <20211101150405.14618-1-pali@kernel.org>
 <20211102171259.9590-1-pali@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Properly document why changing PCI Class Code for GT64111 device to Host
Bridge is required as important details were after 20 years forgotten.

Signed-off-by: Pali Rohár <pali@kernel.org>

---
Changes in v2:
* Split from ARM changes
* Removal of Kconfig changes
* Explanation is completely rewritten as as this MIPS Cobalt device
  predates ARM Orion devices and reason is slightly different.
---
 arch/mips/pci/fixup-cobalt.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/mips/pci/fixup-cobalt.c b/arch/mips/pci/fixup-cobalt.c
index 44be65c3e6bb..00206ff52988 100644
--- a/arch/mips/pci/fixup-cobalt.c
+++ b/arch/mips/pci/fixup-cobalt.c
@@ -36,6 +36,21 @@
 #define VIA_COBALT_BRD_ID_REG  0x94
 #define VIA_COBALT_BRD_REG_to_ID(reg)	((unsigned char)(reg) >> 4)
 
+/*
+ * Default value of PCI Class Code on GT64111 is PCI_CLASS_MEMORY_OTHER (0x0580)
+ * instead of PCI_CLASS_BRIDGE_HOST (0x0600). Galileo explained this choice in
+ * document "GT-64111 System Controller for RC4640, RM523X and VR4300 CPUs",
+ * section "6.5.3 PCI Autoconfiguration at RESET":
+ *
+ *   Some PCs refuse to configure host bridges if they are found plugged into
+ *   a PCI slot (ask the BIOS vendors why...). The "Memory Controller" Class
+ *   Code does not cause a problem for these non-compliant BIOSes, so we used
+ *   this as the default in the GT-64111.
+ *
+ * So fix the incorrect default value of PCI Class Code. More details are on:
+ * https://lore.kernel.org/r/20211102154831.xtrlgrmrizl5eidl@pali/
+ * https://lore.kernel.org/r/20211102150201.GA11675@alpha.franken.de/
+ */
 static void qube_raq_galileo_early_fixup(struct pci_dev *dev)
 {
 	if (dev->devfn == PCI_DEVFN(0, 0) &&
-- 
2.20.1

