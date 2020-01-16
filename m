Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6490313DA12
	for <lists+linux-mips@lfdr.de>; Thu, 16 Jan 2020 13:30:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726785AbgAPMaR (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 16 Jan 2020 07:30:17 -0500
Received: from mailout1.w1.samsung.com ([210.118.77.11]:41941 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726752AbgAPM3y (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 16 Jan 2020 07:29:54 -0500
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20200116122952euoutp0131b06772a0a04c940221dace7ef9e8ab~qXdXkb6aD1739817398euoutp01j
        for <linux-mips@vger.kernel.org>; Thu, 16 Jan 2020 12:29:52 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20200116122952euoutp0131b06772a0a04c940221dace7ef9e8ab~qXdXkb6aD1739817398euoutp01j
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1579177792;
        bh=gGmT7Iw8moT9AjWo8OPW/DJiTRfpVlcfUmex7O5Z1YM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=svdn7RRrA4irdOufrv1tJPUnCS/4r6mbn6seD7E3al2JuRF7D7TzISJiuojFjRQ0w
         +Oi9CJPzRspC7NQ8EkywQY96jWkOl1WS1gHjmWnc6B7xseK/kBhbNOJPCFVHy4wAcx
         mmByrc6IulyCtrj7GMxuoo8UIpbkY4XicXZVxgzE=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20200116122952eucas1p1b34c4048ab6babad4025d04a6761c3a1~qXdXQOU9j1417214172eucas1p1I;
        Thu, 16 Jan 2020 12:29:52 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id 8D.2F.60698.047502E5; Thu, 16
        Jan 2020 12:29:52 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20200116122951eucas1p27bed87e1d46b5e1d8fc91abc33cd013a~qXdWw7xqT1389913899eucas1p23;
        Thu, 16 Jan 2020 12:29:51 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20200116122951eusmtrp2547fcb601b97bf438e32cd54480eaa81~qXdWwFhfr1149911499eusmtrp2G;
        Thu, 16 Jan 2020 12:29:51 +0000 (GMT)
X-AuditID: cbfec7f5-a0fff7000001ed1a-d9-5e205740be3a
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 70.E2.07950.F37502E5; Thu, 16
        Jan 2020 12:29:51 +0000 (GMT)
Received: from AMDC3058.digital.local (unknown [106.120.51.71]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20200116122951eusmtip112150def8fe14025fca0621f9926e938~qXdWMX9TN0721607216eusmtip1G;
        Thu, 16 Jan 2020 12:29:51 +0000 (GMT)
From:   Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
To:     "David S . Miller" <davem@davemloft.net>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     linux-ide@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        b.zolnierkie@samsung.com
Subject: [PATCH 1/3] ide: remove no longer used au1xxx-ide driver
Date:   Thu, 16 Jan 2020 13:29:36 +0100
Message-Id: <20200116122938.20789-2-b.zolnierkie@samsung.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200116122938.20789-1-b.zolnierkie@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrOKsWRmVeSWpSXmKPExsWy7djP87oO4QpxBp2TuS02zljPavHkQDuj
        xZzzLSwWE098YrFY2LaExeLYjkdMFpd3zWGz6Ny0ldGi7/UxZotLe1QcuDy2rLzJ5LFpVSeb
        x9GVa5k8FvdNZvV4feQhi0ffllWMHp83yQWwR3HZpKTmZJalFunbJXBl7N/WylyweBJjxfQ5
        bxkbGBeWdTFyckgImEis//yAHcQWEljBKHHsZFYXIxeQ/YVRYsePlywQzmdGic1rbjLDdHzp
        /8gK0bGcUaJjhRhcx6He42wgCTYBK4mJ7asYQRIiArsZJX4+380M4jALTGCU2HdmApDDwSEs
        4CixsUEZpIFFQFXi98ZZjCA2r4CtxKP9a9kgtslLbP32CWwbp4CdRN+BZ6wQNYISJ2c+YQGx
        mYFqmrfOBpsvIbCPXWLRtR3sEM0uEjM+3WCBsIUlXh3fAhWXkfi/cz4TRMM6Rom/HS+gurcz
        Siyf/A9qtbXEnXO/2EAuZRbQlFi/Sx/ElAA6em9nDYTJJ3HjrSDEDXwSk7ZNZ4YI80p0tAlB
        zFCT2LBsAxvM1q6dK6GB6CGx++hT5gmMirOQfDMLyTezENYuYGRexSieWlqcm55abJyXWq5X
        nJhbXJqXrpecn7uJEZicTv87/nUH474/SYcYBTgYlXh4P4QoxAmxJpYVV+YeYpTgYFYS4T05
        QzZOiDclsbIqtSg/vqg0J7X4EKM0B4uSOK/xopexQgLpiSWp2ampBalFMFkmDk6pBsaT74PN
        b/h8MPVfHOCsv9x4/kVzy6wbb3UPvRSKMJyqsbiy+f8mZn/pLGXBmf26O/UqMmcGhZ5OEeF2
        Drkhl7r3WR7Dkjz55QsP792u7ntNSPVS+hw5a2HDut8mDI2sCxPmFujMOGB550O6j7+u+7qH
        bXKz2VbY31/RFrhLKOOH8GWJa/5zLJRYijMSDbWYi4oTAeOTrRJKAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrKIsWRmVeSWpSXmKPExsVy+t/xu7r24QpxBt/ealpsnLGe1eLJgXZG
        iznnW1gsJp74xGKxsG0Ji8WxHY+YLC7vmsNm0blpK6NF3+tjzBaX9qg4cHlsWXmTyWPTqk42
        j6Mr1zJ5LO6bzOrx+shDFo++LasYPT5vkgtgj9KzKcovLUlVyMgvLrFVija0MNIztLTQMzKx
        1DM0No+1MjJV0rezSUnNySxLLdK3S9DL2L+tlblg8STGiulz3jI2MC4s62Lk5JAQMJH40v+R
        tYuRi0NIYCmjxJlV55i7GDmAEjISx9dD1QhL/LnWxQZiCwl8YpRYdyUKxGYTsJKY2L6KEaRX
        RGA/o8TkhQeYQBxmgSmMEivOtDKBDBIWcJTY2KAM0sAioCrxe+MsRhCbV8BW4tH+tWwQC+Ql
        tn77xApicwrYSfQdeMYKscxWYu6t3awQ9YISJ2c+YQGxmYHqm7fOZp7AKDALSWoWktQCRqZV
        jCKppcW56bnFRnrFibnFpXnpesn5uZsYgVG07djPLTsYu94FH2IU4GBU4uGdEaQQJ8SaWFZc
        mXuIUYKDWUmE9+QM2Tgh3pTEyqrUovz4otKc1OJDjKZAT0xklhJNzgdGeF5JvKGpobmFpaG5
        sbmxmYWSOG+HwMEYIYH0xJLU7NTUgtQimD4mDk6pBsa4wLPfMpZNU7Z6KHzx9fE0veUWJaZT
        PvMpnuLRXx3bdia2LX7hZY5TlZL3iuTdmdbF9/3O/noi+Uf6gud/Tlqmn35XplLM/Uf8XLrr
        10U90TL9CzWadu8Q/iN5KWHCz6P1zzcHM0YGznNoWLBx1n6na0oHGgL+aRzN/xw3+QDHxgI/
        +btNC/qVWIozEg21mIuKEwEKcmScuAIAAA==
X-CMS-MailID: 20200116122951eucas1p27bed87e1d46b5e1d8fc91abc33cd013a
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200116122951eucas1p27bed87e1d46b5e1d8fc91abc33cd013a
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200116122951eucas1p27bed87e1d46b5e1d8fc91abc33cd013a
References: <20200116122938.20789-1-b.zolnierkie@samsung.com>
        <CGME20200116122951eucas1p27bed87e1d46b5e1d8fc91abc33cd013a@eucas1p2.samsung.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Commit 54ff4a1d1732 ("MIPS: Alchemy: pata_platform for DB1200")
from year 2014 converted the only user of au1xxx-ide IDE host
driver (MIPS Alchemy DB1200 platform) to use pata_platform
libata host driver instead. This patch removes dead au1xxx-ide
driver code.

Signed-off-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
---
 drivers/ide/Kconfig      |  17 --
 drivers/ide/Makefile     |   2 -
 drivers/ide/au1xxx-ide.c | 597 ---------------------------------------
 3 files changed, 616 deletions(-)
 delete mode 100644 drivers/ide/au1xxx-ide.c

diff --git a/drivers/ide/Kconfig b/drivers/ide/Kconfig
index 1c227ea8ecd3..ae8574d8c037 100644
--- a/drivers/ide/Kconfig
+++ b/drivers/ide/Kconfig
@@ -662,23 +662,6 @@ config BLK_DEV_IDE_PMAC_ATA100FIRST
 	  CD-ROM on hda. This option changes this to more natural hda for
 	  hard disk and hdc for CD-ROM.
 
-config BLK_DEV_IDE_AU1XXX
-	bool "IDE for AMD Alchemy Au1200"
-	depends on MIPS_ALCHEMY
-	select IDE_XFER_MODE
-choice
-	prompt "IDE Mode for AMD Alchemy Au1200"
-	default BLK_DEV_IDE_AU1XXX_PIO_DBDMA
-	depends on BLK_DEV_IDE_AU1XXX
-
-config BLK_DEV_IDE_AU1XXX_PIO_DBDMA
-	bool "PIO+DbDMA IDE for AMD Alchemy Au1200"
-
-config BLK_DEV_IDE_AU1XXX_MDMA2_DBDMA
-	bool "MDMA2+DbDMA IDE for AMD Alchemy Au1200"
-	depends on BLK_DEV_IDE_AU1XXX
-endchoice
-
 config BLK_DEV_IDE_TX4938
 	tristate "TX4938 internal IDE support"
 	depends on SOC_TX4938
diff --git a/drivers/ide/Makefile b/drivers/ide/Makefile
index cac02db4098d..a0c54f40e157 100644
--- a/drivers/ide/Makefile
+++ b/drivers/ide/Makefile
@@ -109,7 +109,5 @@ obj-$(CONFIG_BLK_DEV_IDE_ICSIDE)	+= icside.o
 obj-$(CONFIG_BLK_DEV_IDE_RAPIDE)	+= rapide.o
 obj-$(CONFIG_BLK_DEV_PALMCHIP_BK3710)	+= palm_bk3710.o
 
-obj-$(CONFIG_BLK_DEV_IDE_AU1XXX)	+= au1xxx-ide.o
-
 obj-$(CONFIG_BLK_DEV_IDE_TX4938)	+= tx4938ide.o
 obj-$(CONFIG_BLK_DEV_IDE_TX4939)	+= tx4939ide.o
diff --git a/drivers/ide/au1xxx-ide.c b/drivers/ide/au1xxx-ide.c
deleted file mode 100644
index 4d181a918d72..000000000000
--- a/drivers/ide/au1xxx-ide.c
+++ /dev/null
@@ -1,597 +0,0 @@
-/*
- * BRIEF MODULE DESCRIPTION
- * AMD Alchemy Au1xxx IDE interface routines over the Static Bus
- *
- * Copyright (c) 2003-2005 AMD, Personal Connectivity Solutions
- *
- * This program is free software; you can redistribute it and/or modify it under
- * the terms of the GNU General Public License as published by the Free Software
- * Foundation; either version 2 of the License, or (at your option) any later
- * version.
- *
- * THIS SOFTWARE IS PROVIDED ``AS IS'' AND ANY EXPRESS OR IMPLIED WARRANTIES,
- * INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND
- * FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE AUTHOR
- * BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
- * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
- * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
- * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
- * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
- * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
- * POSSIBILITY OF SUCH DAMAGE.
- *
- * You should have received a copy of the GNU General Public License along with
- * this program; if not, write to the Free Software Foundation, Inc.,
- * 675 Mass Ave, Cambridge, MA 02139, USA.
- *
- * Note: for more information, please refer "AMD Alchemy Au1200/Au1550 IDE
- *       Interface and Linux Device Driver" Application Note.
- */
-#include <linux/types.h>
-#include <linux/module.h>
-#include <linux/kernel.h>
-#include <linux/delay.h>
-#include <linux/platform_device.h>
-#include <linux/init.h>
-#include <linux/ide.h>
-#include <linux/scatterlist.h>
-
-#include <asm/mach-au1x00/au1000.h>
-#include <asm/mach-au1x00/au1xxx_dbdma.h>
-#include <asm/mach-au1x00/au1xxx_ide.h>
-
-#define DRV_NAME	"au1200-ide"
-#define DRV_AUTHOR	"Enrico Walther <enrico.walther@amd.com> / Pete Popov <ppopov@embeddedalley.com>"
-
-#ifndef IDE_REG_SHIFT
-#define IDE_REG_SHIFT 5
-#endif
-
-/* enable the burstmode in the dbdma */
-#define IDE_AU1XXX_BURSTMODE	1
-
-static _auide_hwif auide_hwif;
-
-#if defined(CONFIG_BLK_DEV_IDE_AU1XXX_PIO_DBDMA)
-
-static inline void auide_insw(unsigned long port, void *addr, u32 count)
-{
-	_auide_hwif *ahwif = &auide_hwif;
-	chan_tab_t *ctp;
-	au1x_ddma_desc_t *dp;
-
-	if (!au1xxx_dbdma_put_dest(ahwif->rx_chan, virt_to_phys(addr),
-				   count << 1, DDMA_FLAGS_NOIE)) {
-		printk(KERN_ERR "%s failed %d\n", __func__, __LINE__);
-		return;
-	}
-	ctp = *((chan_tab_t **)ahwif->rx_chan);
-	dp = ctp->cur_ptr;
-	while (dp->dscr_cmd0 & DSCR_CMD0_V)
-		;
-	ctp->cur_ptr = au1xxx_ddma_get_nextptr_virt(dp);
-}
-
-static inline void auide_outsw(unsigned long port, void *addr, u32 count)
-{
-	_auide_hwif *ahwif = &auide_hwif;
-	chan_tab_t *ctp;
-	au1x_ddma_desc_t *dp;
-
-	if (!au1xxx_dbdma_put_source(ahwif->tx_chan, virt_to_phys(addr),
-				     count << 1, DDMA_FLAGS_NOIE)) {
-		printk(KERN_ERR "%s failed %d\n", __func__, __LINE__);
-		return;
-	}
-	ctp = *((chan_tab_t **)ahwif->tx_chan);
-	dp = ctp->cur_ptr;
-	while (dp->dscr_cmd0 & DSCR_CMD0_V)
-		;
-	ctp->cur_ptr = au1xxx_ddma_get_nextptr_virt(dp);
-}
-
-static void au1xxx_input_data(ide_drive_t *drive, struct ide_cmd *cmd,
-			      void *buf, unsigned int len)
-{
-	auide_insw(drive->hwif->io_ports.data_addr, buf, (len + 1) / 2);
-}
-
-static void au1xxx_output_data(ide_drive_t *drive, struct ide_cmd *cmd,
-			       void *buf, unsigned int len)
-{
-	auide_outsw(drive->hwif->io_ports.data_addr, buf, (len + 1) / 2);
-}
-#endif
-
-static void au1xxx_set_pio_mode(ide_hwif_t *hwif, ide_drive_t *drive)
-{
-	int mem_sttime = 0, mem_stcfg = au_readl(MEM_STCFG2);
-
-	switch (drive->pio_mode - XFER_PIO_0) {
-	case 0:
-		mem_sttime = SBC_IDE_TIMING(PIO0);
-
-		/* set configuration for RCS2# */
-		mem_stcfg |= TS_MASK;
-		mem_stcfg &= ~TCSOE_MASK;
-		mem_stcfg &= ~TOECS_MASK;
-		mem_stcfg |= SBC_IDE_PIO0_TCSOE | SBC_IDE_PIO0_TOECS;
-		break;
-
-	case 1:
-		mem_sttime = SBC_IDE_TIMING(PIO1);
-
-		/* set configuration for RCS2# */
-		mem_stcfg |= TS_MASK;
-		mem_stcfg &= ~TCSOE_MASK;
-		mem_stcfg &= ~TOECS_MASK;
-		mem_stcfg |= SBC_IDE_PIO1_TCSOE | SBC_IDE_PIO1_TOECS;
-		break;
-
-	case 2:
-		mem_sttime = SBC_IDE_TIMING(PIO2);
-
-		/* set configuration for RCS2# */
-		mem_stcfg &= ~TS_MASK;
-		mem_stcfg &= ~TCSOE_MASK;
-		mem_stcfg &= ~TOECS_MASK;
-		mem_stcfg |= SBC_IDE_PIO2_TCSOE | SBC_IDE_PIO2_TOECS;
-		break;
-
-	case 3:
-		mem_sttime = SBC_IDE_TIMING(PIO3);
-
-		/* set configuration for RCS2# */
-		mem_stcfg &= ~TS_MASK;
-		mem_stcfg &= ~TCSOE_MASK;
-		mem_stcfg &= ~TOECS_MASK;
-		mem_stcfg |= SBC_IDE_PIO3_TCSOE | SBC_IDE_PIO3_TOECS;
-
-		break;
-
-	case 4:
-		mem_sttime = SBC_IDE_TIMING(PIO4);
-
-		/* set configuration for RCS2# */
-		mem_stcfg &= ~TS_MASK;
-		mem_stcfg &= ~TCSOE_MASK;
-		mem_stcfg &= ~TOECS_MASK;
-		mem_stcfg |= SBC_IDE_PIO4_TCSOE | SBC_IDE_PIO4_TOECS;
-		break;
-	}
-
-	au_writel(mem_sttime,MEM_STTIME2);
-	au_writel(mem_stcfg,MEM_STCFG2);
-}
-
-static void auide_set_dma_mode(ide_hwif_t *hwif, ide_drive_t *drive)
-{
-	int mem_sttime = 0, mem_stcfg = au_readl(MEM_STCFG2);
-
-	switch (drive->dma_mode) {
-#ifdef CONFIG_BLK_DEV_IDE_AU1XXX_MDMA2_DBDMA
-	case XFER_MW_DMA_2:
-		mem_sttime = SBC_IDE_TIMING(MDMA2);
-
-		/* set configuration for RCS2# */
-		mem_stcfg &= ~TS_MASK;
-		mem_stcfg &= ~TCSOE_MASK;
-		mem_stcfg &= ~TOECS_MASK;
-		mem_stcfg |= SBC_IDE_MDMA2_TCSOE | SBC_IDE_MDMA2_TOECS;
-
-		break;
-	case XFER_MW_DMA_1:
-		mem_sttime = SBC_IDE_TIMING(MDMA1);
-
-		/* set configuration for RCS2# */
-		mem_stcfg &= ~TS_MASK;
-		mem_stcfg &= ~TCSOE_MASK;
-		mem_stcfg &= ~TOECS_MASK;
-		mem_stcfg |= SBC_IDE_MDMA1_TCSOE | SBC_IDE_MDMA1_TOECS;
-
-		break;
-	case XFER_MW_DMA_0:
-		mem_sttime = SBC_IDE_TIMING(MDMA0);
-
-		/* set configuration for RCS2# */
-		mem_stcfg |= TS_MASK;
-		mem_stcfg &= ~TCSOE_MASK;
-		mem_stcfg &= ~TOECS_MASK;
-		mem_stcfg |= SBC_IDE_MDMA0_TCSOE | SBC_IDE_MDMA0_TOECS;
-
-		break;
-#endif
-	}
-
-	au_writel(mem_sttime,MEM_STTIME2);
-	au_writel(mem_stcfg,MEM_STCFG2);
-}
-
-/*
- * Multi-Word DMA + DbDMA functions
- */
-
-#ifdef CONFIG_BLK_DEV_IDE_AU1XXX_MDMA2_DBDMA
-static int auide_build_dmatable(ide_drive_t *drive, struct ide_cmd *cmd)
-{
-	ide_hwif_t *hwif = drive->hwif;
-	_auide_hwif *ahwif = &auide_hwif;
-	struct scatterlist *sg;
-	int i = cmd->sg_nents, count = 0;
-	int iswrite = !!(cmd->tf_flags & IDE_TFLAG_WRITE);
-
-	/* Save for interrupt context */
-	ahwif->drive = drive;
-
-	/* fill the descriptors */
-	sg = hwif->sg_table;
-	while (i && sg_dma_len(sg)) {
-		u32 cur_addr;
-		u32 cur_len;
-
-		cur_addr = sg_dma_address(sg);
-		cur_len = sg_dma_len(sg);
-
-		while (cur_len) {
-			u32 flags = DDMA_FLAGS_NOIE;
-			unsigned int tc = (cur_len < 0xfe00)? cur_len: 0xfe00;
-
-			if (++count >= PRD_ENTRIES) {
-				printk(KERN_WARNING "%s: DMA table too small\n",
-				       drive->name);
-				return 0;
-			}
-
-			/* Lets enable intr for the last descriptor only */
-			if (1==i)
-				flags = DDMA_FLAGS_IE;
-			else
-				flags = DDMA_FLAGS_NOIE;
-
-			if (iswrite) {
-				if (!au1xxx_dbdma_put_source(ahwif->tx_chan,
-					sg_phys(sg), tc, flags)) {
-					printk(KERN_ERR "%s failed %d\n", 
-					       __func__, __LINE__);
-				}
-			} else  {
-				if (!au1xxx_dbdma_put_dest(ahwif->rx_chan,
-					sg_phys(sg), tc, flags)) {
-					printk(KERN_ERR "%s failed %d\n", 
-					       __func__, __LINE__);
-				}
-			}
-
-			cur_addr += tc;
-			cur_len -= tc;
-		}
-		sg = sg_next(sg);
-		i--;
-	}
-
-	if (count)
-		return 1;
-
-	return 0; /* revert to PIO for this request */
-}
-
-static int auide_dma_end(ide_drive_t *drive)
-{
-	return 0;
-}
-
-static void auide_dma_start(ide_drive_t *drive )
-{
-}
-
-
-static int auide_dma_setup(ide_drive_t *drive, struct ide_cmd *cmd)
-{
-	if (auide_build_dmatable(drive, cmd) == 0)
-		return 1;
-
-	return 0;
-}
-
-static int auide_dma_test_irq(ide_drive_t *drive)
-{
-	/* If dbdma didn't execute the STOP command yet, the
-	 * active bit is still set
-	 */
-	drive->waiting_for_dma++;
-	if (drive->waiting_for_dma >= DMA_WAIT_TIMEOUT) {
-		printk(KERN_WARNING "%s: timeout waiting for ddma to complete\n",
-		       drive->name);
-		return 1;
-	}
-	udelay(10);
-	return 0;
-}
-
-static void auide_dma_host_set(ide_drive_t *drive, int on)
-{
-}
-
-static void auide_ddma_tx_callback(int irq, void *param)
-{
-}
-
-static void auide_ddma_rx_callback(int irq, void *param)
-{
-}
-#endif /* end CONFIG_BLK_DEV_IDE_AU1XXX_MDMA2_DBDMA */
-
-static void auide_init_dbdma_dev(dbdev_tab_t *dev, u32 dev_id, u32 tsize,
-				 u32 devwidth, u32 flags, u32 regbase)
-{
-	dev->dev_id          = dev_id;
-	dev->dev_physaddr    = CPHYSADDR(regbase);
-	dev->dev_intlevel    = 0;
-	dev->dev_intpolarity = 0;
-	dev->dev_tsize       = tsize;
-	dev->dev_devwidth    = devwidth;
-	dev->dev_flags       = flags;
-}
-
-#ifdef CONFIG_BLK_DEV_IDE_AU1XXX_MDMA2_DBDMA
-static const struct ide_dma_ops au1xxx_dma_ops = {
-	.dma_host_set		= auide_dma_host_set,
-	.dma_setup		= auide_dma_setup,
-	.dma_start		= auide_dma_start,
-	.dma_end		= auide_dma_end,
-	.dma_test_irq		= auide_dma_test_irq,
-	.dma_lost_irq		= ide_dma_lost_irq,
-};
-
-static int auide_ddma_init(ide_hwif_t *hwif, const struct ide_port_info *d)
-{
-	_auide_hwif *auide = &auide_hwif;
-	dbdev_tab_t source_dev_tab, target_dev_tab;
-	u32 dev_id, tsize, devwidth, flags;
-
-	dev_id	 = hwif->ddma_id;
-
-	tsize    =  8; /*  1 */
-	devwidth = 32; /* 16 */
-
-#ifdef IDE_AU1XXX_BURSTMODE 
-	flags = DEV_FLAGS_SYNC | DEV_FLAGS_BURSTABLE;
-#else
-	flags = DEV_FLAGS_SYNC;
-#endif
-
-	/* setup dev_tab for tx channel */
-	auide_init_dbdma_dev(&source_dev_tab, dev_id, tsize, devwidth,
-			     DEV_FLAGS_OUT | flags, auide->regbase);
- 	auide->tx_dev_id = au1xxx_ddma_add_device( &source_dev_tab );
-
-	auide_init_dbdma_dev(&source_dev_tab, dev_id, tsize, devwidth,
-			     DEV_FLAGS_IN | flags, auide->regbase);
- 	auide->rx_dev_id = au1xxx_ddma_add_device( &source_dev_tab );
-	
-	/* We also need to add a target device for the DMA */
-	auide_init_dbdma_dev(&target_dev_tab, (u32)DSCR_CMD0_ALWAYS, tsize,
-			     devwidth, DEV_FLAGS_ANYUSE, auide->regbase);
-	auide->target_dev_id = au1xxx_ddma_add_device(&target_dev_tab);	
- 
-	/* Get a channel for TX */
-	auide->tx_chan = au1xxx_dbdma_chan_alloc(auide->target_dev_id,
-						 auide->tx_dev_id,
-						 auide_ddma_tx_callback,
-						 (void*)auide);
- 
-	/* Get a channel for RX */
-	auide->rx_chan = au1xxx_dbdma_chan_alloc(auide->rx_dev_id,
-						 auide->target_dev_id,
-						 auide_ddma_rx_callback,
-						 (void*)auide);
-
-	auide->tx_desc_head = (void*)au1xxx_dbdma_ring_alloc(auide->tx_chan,
-							     NUM_DESCRIPTORS);
-	auide->rx_desc_head = (void*)au1xxx_dbdma_ring_alloc(auide->rx_chan,
-							     NUM_DESCRIPTORS);
-
-	/* FIXME: check return value */
-	(void)ide_allocate_dma_engine(hwif);
-	
-	au1xxx_dbdma_start( auide->tx_chan );
-	au1xxx_dbdma_start( auide->rx_chan );
- 
-	return 0;
-} 
-#else
-static int auide_ddma_init(ide_hwif_t *hwif, const struct ide_port_info *d)
-{
-	_auide_hwif *auide = &auide_hwif;
-	dbdev_tab_t source_dev_tab;
-	int flags;
-
-#ifdef IDE_AU1XXX_BURSTMODE 
-	flags = DEV_FLAGS_SYNC | DEV_FLAGS_BURSTABLE;
-#else
-	flags = DEV_FLAGS_SYNC;
-#endif
-
-	/* setup dev_tab for tx channel */
-	auide_init_dbdma_dev(&source_dev_tab, (u32)DSCR_CMD0_ALWAYS, 8, 32,
-			     DEV_FLAGS_OUT | flags, auide->regbase);
- 	auide->tx_dev_id = au1xxx_ddma_add_device( &source_dev_tab );
-
-	auide_init_dbdma_dev(&source_dev_tab, (u32)DSCR_CMD0_ALWAYS, 8, 32,
-			     DEV_FLAGS_IN | flags, auide->regbase);
- 	auide->rx_dev_id = au1xxx_ddma_add_device( &source_dev_tab );
-	
-	/* Get a channel for TX */
-	auide->tx_chan = au1xxx_dbdma_chan_alloc(DSCR_CMD0_ALWAYS,
-						 auide->tx_dev_id,
-						 NULL,
-						 (void*)auide);
- 
-	/* Get a channel for RX */
-	auide->rx_chan = au1xxx_dbdma_chan_alloc(auide->rx_dev_id,
-						 DSCR_CMD0_ALWAYS,
-						 NULL,
-						 (void*)auide);
- 
-	auide->tx_desc_head = (void*)au1xxx_dbdma_ring_alloc(auide->tx_chan,
-							     NUM_DESCRIPTORS);
-	auide->rx_desc_head = (void*)au1xxx_dbdma_ring_alloc(auide->rx_chan,
-							     NUM_DESCRIPTORS);
- 
-	au1xxx_dbdma_start( auide->tx_chan );
-	au1xxx_dbdma_start( auide->rx_chan );
- 	
-	return 0;
-}
-#endif
-
-static void auide_setup_ports(struct ide_hw *hw, _auide_hwif *ahwif)
-{
-	int i;
-	unsigned long *ata_regs = hw->io_ports_array;
-
-	/* FIXME? */
-	for (i = 0; i < 8; i++)
-		*ata_regs++ = ahwif->regbase + (i << IDE_REG_SHIFT);
-
-	/* set the Alternative Status register */
-	*ata_regs = ahwif->regbase + (14 << IDE_REG_SHIFT);
-}
-
-#ifdef CONFIG_BLK_DEV_IDE_AU1XXX_PIO_DBDMA
-static const struct ide_tp_ops au1xxx_tp_ops = {
-	.exec_command		= ide_exec_command,
-	.read_status		= ide_read_status,
-	.read_altstatus		= ide_read_altstatus,
-	.write_devctl		= ide_write_devctl,
-
-	.dev_select		= ide_dev_select,
-	.tf_load		= ide_tf_load,
-	.tf_read		= ide_tf_read,
-
-	.input_data		= au1xxx_input_data,
-	.output_data		= au1xxx_output_data,
-};
-#endif
-
-static const struct ide_port_ops au1xxx_port_ops = {
-	.set_pio_mode		= au1xxx_set_pio_mode,
-	.set_dma_mode		= auide_set_dma_mode,
-};
-
-static const struct ide_port_info au1xxx_port_info = {
-	.init_dma		= auide_ddma_init,
-#ifdef CONFIG_BLK_DEV_IDE_AU1XXX_PIO_DBDMA
-	.tp_ops			= &au1xxx_tp_ops,
-#endif
-	.port_ops		= &au1xxx_port_ops,
-#ifdef CONFIG_BLK_DEV_IDE_AU1XXX_MDMA2_DBDMA
-	.dma_ops		= &au1xxx_dma_ops,
-#endif
-	.host_flags		= IDE_HFLAG_POST_SET_MODE |
-				  IDE_HFLAG_NO_IO_32BIT |
-				  IDE_HFLAG_UNMASK_IRQS,
-	.pio_mask		= ATA_PIO4,
-#ifdef CONFIG_BLK_DEV_IDE_AU1XXX_MDMA2_DBDMA
-	.mwdma_mask		= ATA_MWDMA2,
-#endif
-	.chipset		= ide_au1xxx,
-};
-
-static int au_ide_probe(struct platform_device *dev)
-{
-	_auide_hwif *ahwif = &auide_hwif;
-	struct resource *res;
-	struct ide_host *host;
-	int ret = 0;
-	struct ide_hw hw, *hws[] = { &hw };
-
-#if defined(CONFIG_BLK_DEV_IDE_AU1XXX_MDMA2_DBDMA)
-	char *mode = "MWDMA2";
-#elif defined(CONFIG_BLK_DEV_IDE_AU1XXX_PIO_DBDMA)
-	char *mode = "PIO+DDMA(offload)";
-#endif
-
-	memset(&auide_hwif, 0, sizeof(_auide_hwif));
-	ahwif->irq = platform_get_irq(dev, 0);
-
-	res = platform_get_resource(dev, IORESOURCE_MEM, 0);
-
-	if (res == NULL) {
-		pr_debug("%s %d: no base address\n", DRV_NAME, dev->id);
-		ret = -ENODEV;
-		goto out;
-	}
-	if (ahwif->irq < 0) {
-		pr_debug("%s %d: no IRQ\n", DRV_NAME, dev->id);
-		ret = -ENODEV;
-		goto out;
-	}
-
-	if (!request_mem_region(res->start, resource_size(res), dev->name)) {
-		pr_debug("%s: request_mem_region failed\n", DRV_NAME);
-		ret =  -EBUSY;
-		goto out;
-	}
-
-	ahwif->regbase = (u32)ioremap(res->start, resource_size(res));
-	if (ahwif->regbase == 0) {
-		ret = -ENOMEM;
-		goto out;
-	}
-
-	res = platform_get_resource(dev, IORESOURCE_DMA, 0);
-	if (!res) {
-		pr_debug("%s: no DDMA ID resource\n", DRV_NAME);
-		ret = -ENODEV;
-		goto out;
-	}
-	ahwif->ddma_id = res->start;
-
-	memset(&hw, 0, sizeof(hw));
-	auide_setup_ports(&hw, ahwif);
-	hw.irq = ahwif->irq;
-	hw.dev = &dev->dev;
-
-	ret = ide_host_add(&au1xxx_port_info, hws, 1, &host);
-	if (ret)
-		goto out;
-
-	auide_hwif.hwif = host->ports[0];
-
-	platform_set_drvdata(dev, host);
-
-	printk(KERN_INFO "Au1xxx IDE(builtin) configured for %s\n", mode );
-
- out:
-	return ret;
-}
-
-static int au_ide_remove(struct platform_device *dev)
-{
-	struct resource *res;
-	struct ide_host *host = platform_get_drvdata(dev);
-	_auide_hwif *ahwif = &auide_hwif;
-
-	ide_host_remove(host);
-
-	iounmap((void *)ahwif->regbase);
-
-	res = platform_get_resource(dev, IORESOURCE_MEM, 0);
-	release_mem_region(res->start, resource_size(res));
-
-	return 0;
-}
-
-static struct platform_driver au1200_ide_driver = {
-	.driver = {
-		.name		= "au1200-ide",
-	},
-	.probe 		= au_ide_probe,
-	.remove		= au_ide_remove,
-};
-
-module_platform_driver(au1200_ide_driver);
-
-MODULE_LICENSE("GPL");
-MODULE_DESCRIPTION("AU1200 IDE driver");
-- 
2.24.1

