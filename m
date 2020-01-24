Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D832F1485C6
	for <lists+linux-mips@lfdr.de>; Fri, 24 Jan 2020 14:16:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387452AbgAXNQU (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 24 Jan 2020 08:16:20 -0500
Received: from mx2.suse.de ([195.135.220.15]:51772 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387445AbgAXNQT (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 24 Jan 2020 08:16:19 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 0F1E6AF3F;
        Fri, 24 Jan 2020 13:16:18 +0000 (UTC)
From:   Thomas Bogendoerfer <tbogendoerfer@suse.de>
To:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        James Hogan <jhogan@kernel.org>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] MIPS: PCI: Add detection of IOC3 on IO7, IO8, IO9 and Fuel
Date:   Fri, 24 Jan 2020 14:16:08 +0100
Message-Id: <20200124131609.4569-1-tbogendoerfer@suse.de>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add detection for IOC3 chips in IP35 machines.

Signed-off-by: Thomas Bogendoerfer <tbogendoerfer@suse.de>
---
 arch/mips/include/asm/sn/ioc3.h  |  4 ++++
 arch/mips/pci/pci-xtalk-bridge.c | 24 ++++++++++++++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/arch/mips/include/asm/sn/ioc3.h b/arch/mips/include/asm/sn/ioc3.h
index 3865d3225780..2c09c17cadcd 100644
--- a/arch/mips/include/asm/sn/ioc3.h
+++ b/arch/mips/include/asm/sn/ioc3.h
@@ -598,5 +598,9 @@ struct ioc3_etxd {
 #define	IOC3_SUBSYS_IP30_SYSBOARD	0xc304
 #define	IOC3_SUBSYS_MENET		0xc305
 #define	IOC3_SUBSYS_MENET4		0xc306
+#define	IOC3_SUBSYS_IO7			0xc307
+#define	IOC3_SUBSYS_IO8			0xc308
+#define	IOC3_SUBSYS_IO9			0xc309
+#define	IOC3_SUBSYS_IP34_SYSBOARD	0xc30A
 
 #endif /* MIPS_SN_IOC3_H */
diff --git a/arch/mips/pci/pci-xtalk-bridge.c b/arch/mips/pci/pci-xtalk-bridge.c
index ef5ca7c13ca5..3b2552fb7735 100644
--- a/arch/mips/pci/pci-xtalk-bridge.c
+++ b/arch/mips/pci/pci-xtalk-bridge.c
@@ -499,6 +499,26 @@ static void bridge_setup_menet(struct bridge_controller *bc)
 	bc->ioc3_sid[3] = IOC3_SID(IOC3_SUBSYS_MENET4);
 }
 
+static void bridge_setup_io7(struct bridge_controller *bc)
+{
+	bc->ioc3_sid[4] = IOC3_SID(IOC3_SUBSYS_IO7);
+}
+
+static void bridge_setup_io8(struct bridge_controller *bc)
+{
+	bc->ioc3_sid[4] = IOC3_SID(IOC3_SUBSYS_IO8);
+}
+
+static void bridge_setup_io9(struct bridge_controller *bc)
+{
+	bc->ioc3_sid[1] = IOC3_SID(IOC3_SUBSYS_IO9);
+}
+
+static void bridge_setup_ip34_fuel_sysboard(struct bridge_controller *bc)
+{
+	bc->ioc3_sid[4] = IOC3_SID(IOC3_SUBSYS_IP34_SYSBOARD);
+}
+
 #define BRIDGE_BOARD_SETUP(_partno, _setup)	\
 	{ .match = _partno, .setup = _setup }
 
@@ -516,6 +536,10 @@ static const struct {
 	BRIDGE_BOARD_SETUP("030-0887-", bridge_setup_ip30_sysboard),
 	BRIDGE_BOARD_SETUP("030-1467-", bridge_setup_ip30_sysboard),
 	BRIDGE_BOARD_SETUP("030-0873-", bridge_setup_menet),
+	BRIDGE_BOARD_SETUP("030-1557-", bridge_setup_io7),
+	BRIDGE_BOARD_SETUP("030-1673-", bridge_setup_io8),
+	BRIDGE_BOARD_SETUP("030-1771-", bridge_setup_io9),
+	BRIDGE_BOARD_SETUP("030-1707-", bridge_setup_ip34_fuel_sysboard),
 };
 
 static void bridge_setup_board(struct bridge_controller *bc, char *partnum)
-- 
2.24.1

