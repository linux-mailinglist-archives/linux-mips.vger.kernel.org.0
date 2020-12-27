Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B03982E322E
	for <lists+linux-mips@lfdr.de>; Sun, 27 Dec 2020 18:30:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726314AbgL0R2h (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 27 Dec 2020 12:28:37 -0500
Received: from mail-m975.mail.163.com ([123.126.97.5]:58852 "EHLO
        mail-m975.mail.163.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726463AbgL0R2g (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 27 Dec 2020 12:28:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=ItJdw
        Ha/xBb2E0WdvUWjPTOrT99PTYL9nuANszvM5PI=; b=KoVCdO7IeLudJwYM5f585
        e7qHQETbkq94lvi+RRVpBBuZ+FNn75WkU8T6bSVDZ8+K336SP73pAr6pZhh36IjE
        O++6P4G+eokIb8Ok7JjPNVeg2c62Uu3yDSugUYf5HyA5S3G2WuvEuc1S0TxpKj6b
        Aqr5CqXdqMdBpMULlKeoOs=
Received: from JiadeiMac-Pro.lan (unknown [112.64.60.201])
        by smtp5 (Coremail) with SMTP id HdxpCgC37xr0w+hfeGmrAQ--.48331S2;
        Mon, 28 Dec 2020 01:27:17 +0800 (CST)
From:   jiaqingtong97@163.com
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Jia Qingtong <jiaqingtong97@163.com>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] MIPS: OCTEON: Make PCIe work with Little Endian kernel
Date:   Mon, 28 Dec 2020 01:27:12 +0800
Message-Id: <20201227172713.16848-1-jiaqingtong97@163.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: HdxpCgC37xr0w+hfeGmrAQ--.48331S2
X-Coremail-Antispam: 1Uf129KBjvJXoW3ArWxCr47uFW7uFWxXr43ZFb_yoW3ArWDp3
        yrJrZFyFyxKFyfJws5tFy7Xr45Casay347Cw1xGw42va18WrnYyFWjvrnxCr45WFsxta4a
        gryv9r47Grn0vrDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jJ_-QUUUUU=
X-Originating-IP: [112.64.60.201]
X-CM-SenderInfo: 5mld1xpqjw00rjzxqiywtou0bp/1tbiWBYIb1uHu61HYAAAsE
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Jia Qingtong <jiaqingtong97@163.com>

Supply little-endian address bit definitions as well as
set proper endian swapping modes.

Signed-off-by: Jia Qingtong <jiaqingtong97@163.com>
---
fix pcie setup error when Octeon in little-endian mode

[<ffffffff81bee02c>] octeon_pcie_setup+0x264/0x4e8
[<ffffffff81100514>] do_one_initcall+0x54/0x190
[<ffffffff81bbee7c>] kernel_init_freeable+0x1bc/0x230
[<ffffffff8188b674>] kernel_init+0x10/0x104
[<ffffffff81115350>] ret_from_kernel_thread+0x14/0x1c

 arch/mips/pci/pcie-octeon.c | 85 +++++++++++++++++++++++++++++++------
 1 file changed, 73 insertions(+), 12 deletions(-)

diff --git a/arch/mips/pci/pcie-octeon.c b/arch/mips/pci/pcie-octeon.c
index d919a0d813a1..512df1e0063a 100644
--- a/arch/mips/pci/pcie-octeon.c
+++ b/arch/mips/pci/pcie-octeon.c
@@ -39,6 +39,7 @@ static int enable_pcie_bus_num_war[2];
 
 union cvmx_pcie_address {
 	uint64_t u64;
+#ifdef __BIG_ENDIAN_BITFIELD
 	struct {
 		uint64_t upper:2;	/* Normally 2 for XKPHYS */
 		uint64_t reserved_49_61:13;	/* Must be zero */
@@ -90,8 +91,68 @@ union cvmx_pcie_address {
 		uint64_t reserved_36_39:4;	/* Must be zero */
 		uint64_t address:36;	/* PCIe Mem address */
 	} mem;
+#else
+	struct {
+		/*
+		 * Selects a register in the configuration space of
+		 * the target.
+		 */
+		uint64_t reg:12;
+		/* Target function number sent in the ID in the request. */
+		uint64_t func:3;
+		/*
+		 * Target device number sent in the ID in the
+		 * request. Note that Dev must be zero for type 0
+		 * configuration requests.
+		 */
+		uint64_t dev:5;
+		/* Target bus number sent in the ID in the request. */
+		uint64_t bus:8;
+		/*
+		 * Selects the type of the configuration request (0 = type 0,
+		 * 1 = type 1).
+		 */
+		uint64_t ty:1;
+		uint64_t reserved_29_31:3;	/* Must be zero */
+		uint64_t port:2;	/* PCIe port 0,1 */
+		uint64_t es:2;	/* Endian swap = 1 */
+		uint64_t reserved_36_39:4;	/* Must be zero */
+		uint64_t subdid:3;	/* PCIe SubDID = 1 */
+		uint64_t did:5; /* PCIe DID = 3 */
+		uint64_t io:1;	/* 1 for IO space access */
+		uint64_t reserved_49_61:13;	/* Must be zero */
+		uint64_t upper:2;	/* Normally 2 for XKPHYS */
+	} config;
+	struct {
+		uint64_t address:32;	/* PCIe IO address */
+		uint64_t port:2;	/* PCIe port 0,1 */
+		uint64_t es:2;	/* Endian swap = 1 */
+		uint64_t reserved_36_39:4;	/* Must be zero */
+		uint64_t subdid:3;	/* PCIe SubDID = 2 */
+		uint64_t did:5; /* PCIe DID = 3 */
+		uint64_t io:1;	/* 1 for IO space access */
+		uint64_t reserved_49_61:13;	/* Must be zero */
+		uint64_t upper:2;	/* Normally 2 for XKPHYS */
+	} io;
+	struct {
+		uint64_t address:36;	/* PCIe Mem address */
+		uint64_t reserved_36_39:4;	/* Must be zero */
+		uint64_t subdid:3;	/* PCIe SubDID = 3-6 */
+		uint64_t did:5; /* PCIe DID = 3 */
+		uint64_t io:1;	/* 1 for IO space access */
+		uint64_t reserved_49_61:13;	/* Must be zero */
+		uint64_t upper:2;	/* Normally 2 for XKPHYS */
+	} mem;
+#endif
 };
 
+/* Endian swap mode. */
+#ifdef __BIG_ENDIAN_BITFIELD
+#define _CVMX_PCIE_ES 1
+#else
+#define _CVMX_PCIE_ES 0
+#endif
+
 static int cvmx_pcie_rc_initialize(int pcie_port);
 
 /**
@@ -102,7 +163,7 @@ static int cvmx_pcie_rc_initialize(int pcie_port);
  *
  * Returns 64bit Octeon IO base address for read/write
  */
-static inline uint64_t cvmx_pcie_get_io_base_address(int pcie_port)
+static uint64_t cvmx_pcie_get_io_base_address(int pcie_port)
 {
 	union cvmx_pcie_address pcie_addr;
 	pcie_addr.u64 = 0;
@@ -110,7 +171,7 @@ static inline uint64_t cvmx_pcie_get_io_base_address(int pcie_port)
 	pcie_addr.io.io = 1;
 	pcie_addr.io.did = 3;
 	pcie_addr.io.subdid = 2;
-	pcie_addr.io.es = 1;
+	pcie_addr.io.es = _CVMX_PCIE_ES;
 	pcie_addr.io.port = pcie_port;
 	return pcie_addr.u64;
 }
@@ -241,7 +302,7 @@ static inline uint64_t __cvmx_pcie_build_config_addr(int pcie_port, int bus,
 	pcie_addr.config.io = 1;
 	pcie_addr.config.did = 3;
 	pcie_addr.config.subdid = 1;
-	pcie_addr.config.es = 1;
+	pcie_addr.config.es = _CVMX_PCIE_ES;
 	pcie_addr.config.port = pcie_port;
 	pcie_addr.config.ty = (bus > pciercx_cfg006.s.pbnum);
 	pcie_addr.config.bus = bus;
@@ -889,8 +950,8 @@ static int __cvmx_pcie_rc_initialize_gen1(int pcie_port)
 	mem_access_subid.u64 = 0;
 	mem_access_subid.s.port = pcie_port; /* Port the request is sent to. */
 	mem_access_subid.s.nmerge = 1;	/* Due to an errata on pass 1 chips, no merging is allowed. */
-	mem_access_subid.s.esr = 1;	/* Endian-swap for Reads. */
-	mem_access_subid.s.esw = 1;	/* Endian-swap for Writes. */
+	mem_access_subid.s.esr = _CVMX_PCIE_ES;	/* Endian-swap for Reads. */
+	mem_access_subid.s.esw = _CVMX_PCIE_ES;	/* Endian-swap for Writes. */
 	mem_access_subid.s.nsr = 0;	/* Enable Snooping for Reads. Octeon doesn't care, but devices might want this more conservative setting */
 	mem_access_subid.s.nsw = 0;	/* Enable Snoop for Writes. */
 	mem_access_subid.s.ror = 0;	/* Disable Relaxed Ordering for Reads. */
@@ -925,7 +986,7 @@ static int __cvmx_pcie_rc_initialize_gen1(int pcie_port)
 	bar1_index.u32 = 0;
 	bar1_index.s.addr_idx = (CVMX_PCIE_BAR1_PHYS_BASE >> 22);
 	bar1_index.s.ca = 1;	   /* Not Cached */
-	bar1_index.s.end_swp = 1;  /* Endian Swap mode */
+	bar1_index.s.end_swp = _CVMX_PCIE_ES;  /* Endian Swap mode */
 	bar1_index.s.addr_v = 1;   /* Valid entry */
 
 	base = pcie_port ? 16 : 0;
@@ -965,7 +1026,7 @@ static int __cvmx_pcie_rc_initialize_gen1(int pcie_port)
 		union cvmx_npei_ctl_port1 npei_ctl_port;
 		npei_ctl_port.u64 = cvmx_read_csr(CVMX_PEXP_NPEI_CTL_PORT1);
 		npei_ctl_port.s.bar2_enb = 1;
-		npei_ctl_port.s.bar2_esx = 1;
+		npei_ctl_port.s.bar2_esx = _CVMX_PCIE_ES;
 		npei_ctl_port.s.bar2_cax = 0;
 		npei_ctl_port.s.ptlp_ro = 1;
 		npei_ctl_port.s.ctlp_ro = 1;
@@ -976,7 +1037,7 @@ static int __cvmx_pcie_rc_initialize_gen1(int pcie_port)
 		union cvmx_npei_ctl_port0 npei_ctl_port;
 		npei_ctl_port.u64 = cvmx_read_csr(CVMX_PEXP_NPEI_CTL_PORT0);
 		npei_ctl_port.s.bar2_enb = 1;
-		npei_ctl_port.s.bar2_esx = 1;
+		npei_ctl_port.s.bar2_esx = _CVMX_PCIE_ES;
 		npei_ctl_port.s.bar2_cax = 0;
 		npei_ctl_port.s.ptlp_ro = 1;
 		npei_ctl_port.s.ctlp_ro = 1;
@@ -1341,8 +1402,8 @@ static int __cvmx_pcie_rc_initialize_gen2(int pcie_port)
 	mem_access_subid.u64 = 0;
 	mem_access_subid.s.port = pcie_port; /* Port the request is sent to. */
 	mem_access_subid.s.nmerge = 0;	/* Allow merging as it works on CN6XXX. */
-	mem_access_subid.s.esr = 1;	/* Endian-swap for Reads. */
-	mem_access_subid.s.esw = 1;	/* Endian-swap for Writes. */
+	mem_access_subid.s.esr = _CVMX_PCIE_ES;	/* Endian-swap for Reads. */
+	mem_access_subid.s.esw = _CVMX_PCIE_ES;	/* Endian-swap for Writes. */
 	mem_access_subid.s.wtype = 0;	/* "No snoop" and "Relaxed ordering" are not set */
 	mem_access_subid.s.rtype = 0;	/* "No snoop" and "Relaxed ordering" are not set */
 	/* PCIe Adddress Bits <63:34>. */
@@ -1392,7 +1453,7 @@ static int __cvmx_pcie_rc_initialize_gen2(int pcie_port)
 	pemx_bar_ctl.u64 = cvmx_read_csr(CVMX_PEMX_BAR_CTL(pcie_port));
 	pemx_bar_ctl.s.bar1_siz = 3;  /* 256MB BAR1*/
 	pemx_bar_ctl.s.bar2_enb = 1;
-	pemx_bar_ctl.s.bar2_esx = 1;
+	pemx_bar_ctl.s.bar2_esx = _CVMX_PCIE_ES;
 	pemx_bar_ctl.s.bar2_cax = 0;
 	cvmx_write_csr(CVMX_PEMX_BAR_CTL(pcie_port), pemx_bar_ctl.u64);
 	sli_ctl_portx.u64 = cvmx_read_csr(CVMX_PEXP_SLI_CTL_PORTX(pcie_port));
@@ -1408,7 +1469,7 @@ static int __cvmx_pcie_rc_initialize_gen2(int pcie_port)
 	bar1_index.u64 = 0;
 	bar1_index.s.addr_idx = (CVMX_PCIE_BAR1_PHYS_BASE >> 22);
 	bar1_index.s.ca = 1;	   /* Not Cached */
-	bar1_index.s.end_swp = 1;  /* Endian Swap mode */
+	bar1_index.s.end_swp = _CVMX_PCIE_ES;  /* Endian Swap mode */
 	bar1_index.s.addr_v = 1;   /* Valid entry */
 
 	for (i = 0; i < 16; i++) {
-- 
2.28.0

