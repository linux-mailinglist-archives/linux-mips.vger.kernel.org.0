Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6047013DA0C
	for <lists+linux-mips@lfdr.de>; Thu, 16 Jan 2020 13:30:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727003AbgAPMaM (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 16 Jan 2020 07:30:12 -0500
Received: from mailout1.w1.samsung.com ([210.118.77.11]:41961 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726872AbgAPM3z (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 16 Jan 2020 07:29:55 -0500
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20200116122952euoutp013524ccf8801143007cbe3ff81b7bc9d3~qXdXyuT1R1741017410euoutp01f
        for <linux-mips@vger.kernel.org>; Thu, 16 Jan 2020 12:29:52 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20200116122952euoutp013524ccf8801143007cbe3ff81b7bc9d3~qXdXyuT1R1741017410euoutp01f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1579177792;
        bh=85SQMIDRWfHC4no+1JS+JYp1klKeUAJa8DWQODCikpY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=gH1vmT0Yewjgcq4yJCDgH93EEgZw9fSI5A/bynDgDViaWX4jJ45ekE8ml4uf7vasH
         2k9QQqdp8tj2sEu0aqbNGpu75nxYKvTSv2iPCJZ7NfDVbd5zxSEq9v2T5HbVNojjrT
         WfGZimcvw0JAR5OzcM9zcNME/Db/F/TaZMAgSjQM=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20200116122952eucas1p281356f9cb2bfb5415289926866fb0b77~qXdXhtEqJ2194321943eucas1p2T;
        Thu, 16 Jan 2020 12:29:52 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id 9E.9F.61286.047502E5; Thu, 16
        Jan 2020 12:29:52 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20200116122952eucas1p13d84992633afb27c59358c120bc7781e~qXdXUGFje1417614176eucas1p18;
        Thu, 16 Jan 2020 12:29:52 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20200116122952eusmtrp24223bbf93f241b97f42d73684c181c7e~qXdXTdjSt1149911499eusmtrp2J;
        Thu, 16 Jan 2020 12:29:52 +0000 (GMT)
X-AuditID: cbfec7f2-ef1ff7000001ef66-70-5e205740de67
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id C3.32.08375.047502E5; Thu, 16
        Jan 2020 12:29:52 +0000 (GMT)
Received: from AMDC3058.digital.local (unknown [106.120.51.71]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20200116122951eusmtip14fc8478a221ffaecb87aa1867df9efee~qXdWw8jrF0844208442eusmtip1l;
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
Subject: [PATCH 2/3] MIPS: Alchemy: remove no longer used au1xxx_ide.h
 header
Date:   Thu, 16 Jan 2020 13:29:37 +0100
Message-Id: <20200116122938.20789-3-b.zolnierkie@samsung.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200116122938.20789-1-b.zolnierkie@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrBKsWRmVeSWpSXmKPExsWy7djPc7oO4QpxBjcPy1tsnLGe1eLJgXZG
        iznnW1gsJp74xGKxsG0Ji8WxHY+YLC7vmsNm0blpK6NF3+tjzBaX9qg4cHlsWXmTyWPTqk42
        j6Mr1zJ5LO6bzOrx+shDFo++LasYPT5vkgtgj+KySUnNySxLLdK3S+DK6D5zgbFgn1XFzfN7
        2BoYT+t3MXJySAiYSMz73MvYxcjFISSwglHiZcM9VgjnC6PEgsOfWCCcz4wSX19NAHI4wFou
        zGeHiC9nlHjaco8JruPq3bOsIHPZBKwkJravApsrIrCbUeLn893MIA6zwARGiX1nJjCDjBIW
        8Jf4dScBpIFFQFWi/8ZhZhCbV8BWYtGES0wQB8pLbP32CWwop4CdRN+BZ6wQNYISJ2c+YQGx
        mYFqmrfOBpsvIbCPXeL6vw5miGYXiXN7n7FD2MISr45vgbJlJP7vnM8E0bCOUeJvxwuo7u2M
        Essn/2ODqLKWuHPuFxvIpcwCmhLrd0GDzFHi2L1b7JCw4JO48VYQ4gg+iUnbpjNDhHklOtqE
        IKrVJDYs28AGs7Zr50qo0zwkrh/bzT6BUXEWkndmIXlnFsLeBYzMqxjFU0uLc9NTiw3zUsv1
        ihNzi0vz0vWS83M3MQLT0+l/xz/tYPx6KekQowAHoxIP74wghTgh1sSy4srcQ4wSHMxKIrwn
        Z8jGCfGmJFZWpRblxxeV5qQWH2KU5mBREuc1XvQyVkggPbEkNTs1tSC1CCbLxMEp1cDIqR62
        93WgS8lKPfcJB7lC/9ax8HakOMv4FapY71PeEJD2Ok1Aptyno73zxLItL/ZvCVp7x/Heg9tT
        xI6nHdqptobPWf63N8sbw1ah9q3XK6U6TBfe4v2/KMb4o1/JX9Mk07OZ059cuqtxJO2fx/R9
        Vxq8fTNWO7qe7XWezOd2IO5hvHp5xhMlluKMREMt5qLiRABayMunSwMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrKIsWRmVeSWpSXmKPExsVy+t/xu7oO4QpxBrfO8VtsnLGe1eLJgXZG
        iznnW1gsJp74xGKxsG0Ji8WxHY+YLC7vmsNm0blpK6NF3+tjzBaX9qg4cHlsWXmTyWPTqk42
        j6Mr1zJ5LO6bzOrx+shDFo++LasYPT5vkgtgj9KzKcovLUlVyMgvLrFVija0MNIztLTQMzKx
        1DM0No+1MjJV0rezSUnNySxLLdK3S9DL6D5zgbFgn1XFzfN72BoYT+t3MXJwSAiYSFyYz97F
        yMUhJLCUUeLksw52iLiMxPH1ZV2MnECmsMSfa11sEDWfGCX+v/vADJJgE7CSmNi+ihEkISKw
        n1Fi8sIDTCAOs8AURokVZ1qZQKqEBXwlPjdNZASxWQRUJfpvHAbr5hWwlVg04RITxAp5ia3f
        PrGC2JwCdhJ9B56B2UJANXNv7WaFqBeUODnzCQuIzQxU37x1NvMERoFZSFKzkKQWMDKtYhRJ
        LS3OTc8tNtQrTswtLs1L10vOz93ECIyibcd+bt7BeGlj8CFGAQ5GJR7eGUEKcUKsiWXFlbmH
        GCU4mJVEeE/OkI0T4k1JrKxKLcqPLyrNSS0+xGgK9MREZinR5HxghOeVxBuaGppbWBqaG5sb
        m1koifN2CByMERJITyxJzU5NLUgtgulj4uCUamC0nC+0cOMZ75e/GW5Msr7k+WfqS1sv2+iE
        oytmn/pe+2ah0jeh+2vEtjRobvNLnMdbG9Z89eaXiwlV07/xvX17YmljeuCJDzf2KHfeP3uC
        c3Nh1k3HgDcZcw2i3VZ9Xaaze93kjzMsl/M0xUQdSy/aqF9jtGdW1uXTs3ev4f7cOnfWTvf/
        vzPLLymxFGckGmoxFxUnAgBpb6t/uAIAAA==
X-CMS-MailID: 20200116122952eucas1p13d84992633afb27c59358c120bc7781e
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200116122952eucas1p13d84992633afb27c59358c120bc7781e
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200116122952eucas1p13d84992633afb27c59358c120bc7781e
References: <20200116122938.20789-1-b.zolnierkie@samsung.com>
        <CGME20200116122952eucas1p13d84992633afb27c59358c120bc7781e@eucas1p1.samsung.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Since the only user of this header (au1xxx-ide IDE host driver) is
now gone it can also be removed.

Signed-off-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
---
 .../mips/include/asm/mach-au1x00/au1xxx_ide.h | 178 ------------------
 1 file changed, 178 deletions(-)
 delete mode 100644 arch/mips/include/asm/mach-au1x00/au1xxx_ide.h

diff --git a/arch/mips/include/asm/mach-au1x00/au1xxx_ide.h b/arch/mips/include/asm/mach-au1x00/au1xxx_ide.h
deleted file mode 100644
index bb91b8923a49..000000000000
--- a/arch/mips/include/asm/mach-au1x00/au1xxx_ide.h
+++ /dev/null
@@ -1,178 +0,0 @@
-/*
- * include/asm-mips/mach-au1x00/au1xxx_ide.h  version 01.30.00  Aug. 02 2005
- *
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
- *	 Interface and Linux Device Driver" Application Note.
- */
-
-#ifdef CONFIG_BLK_DEV_IDE_AU1XXX_MDMA2_DBDMA
-#define DMA_WAIT_TIMEOUT	100
-#define NUM_DESCRIPTORS		PRD_ENTRIES
-#else /* CONFIG_BLK_DEV_IDE_AU1XXX_PIO_DBDMA */
-#define NUM_DESCRIPTORS		2
-#endif
-
-#ifndef AU1XXX_ATA_RQSIZE
-#define AU1XXX_ATA_RQSIZE	128
-#endif
-
-/* Disable Burstable-Support for DBDMA */
-#ifndef CONFIG_BLK_DEV_IDE_AU1XXX_BURSTABLE_ON
-#define CONFIG_BLK_DEV_IDE_AU1XXX_BURSTABLE_ON	0
-#endif
-
-typedef struct {
-	u32			tx_dev_id, rx_dev_id, target_dev_id;
-	u32			tx_chan, rx_chan;
-	void			*tx_desc_head, *rx_desc_head;
-	ide_hwif_t		*hwif;
-#ifdef CONFIG_BLK_DEV_IDE_AU1XXX_MDMA2_DBDMA
-	ide_drive_t		*drive;
-	struct dbdma_cmd	*dma_table_cpu;
-	dma_addr_t		dma_table_dma;
-#endif
-	int			irq;
-	u32			regbase;
-	int			ddma_id;
-} _auide_hwif;
-
-/******************************************************************************/
-/* PIO Mode timing calculation :					      */
-/*									      */
-/* Static Bus Spec   ATA Spec						      */
-/*	Tcsoe	   =	t1						      */
-/*	Toecs	   =	t9						      */
-/*	Twcs	   =	t9						      */
-/*	Tcsh	   =	t2i | t2					      */
-/*	Tcsoff	   =	t2i | t2					      */
-/*	Twp	   =	t2						      */
-/*	Tcsw	   =	t1						      */
-/*	Tpm	   =	0						      */
-/*	Ta	   =	t1+t2						      */
-/******************************************************************************/
-
-#define TCSOE_MASK		(0x07 << 29)
-#define TOECS_MASK		(0x07 << 26)
-#define TWCS_MASK		(0x07 << 28)
-#define TCSH_MASK		(0x0F << 24)
-#define TCSOFF_MASK		(0x07 << 20)
-#define TWP_MASK		(0x3F << 14)
-#define TCSW_MASK		(0x0F << 10)
-#define TPM_MASK		(0x0F << 6)
-#define TA_MASK			(0x3F << 0)
-#define TS_MASK			(1 << 8)
-
-/* Timing parameters PIO mode 0 */
-#define SBC_IDE_PIO0_TCSOE	(0x04 << 29)
-#define SBC_IDE_PIO0_TOECS	(0x01 << 26)
-#define SBC_IDE_PIO0_TWCS	(0x02 << 28)
-#define SBC_IDE_PIO0_TCSH	(0x08 << 24)
-#define SBC_IDE_PIO0_TCSOFF	(0x07 << 20)
-#define SBC_IDE_PIO0_TWP	(0x10 << 14)
-#define SBC_IDE_PIO0_TCSW	(0x04 << 10)
-#define SBC_IDE_PIO0_TPM	(0x00 << 6)
-#define SBC_IDE_PIO0_TA		(0x15 << 0)
-/* Timing parameters PIO mode 1 */
-#define SBC_IDE_PIO1_TCSOE	(0x03 << 29)
-#define SBC_IDE_PIO1_TOECS	(0x01 << 26)
-#define SBC_IDE_PIO1_TWCS	(0x01 << 28)
-#define SBC_IDE_PIO1_TCSH	(0x06 << 24)
-#define SBC_IDE_PIO1_TCSOFF	(0x06 << 20)
-#define SBC_IDE_PIO1_TWP	(0x08 << 14)
-#define SBC_IDE_PIO1_TCSW	(0x03 << 10)
-#define SBC_IDE_PIO1_TPM	(0x00 << 6)
-#define SBC_IDE_PIO1_TA		(0x0B << 0)
-/* Timing parameters PIO mode 2 */
-#define SBC_IDE_PIO2_TCSOE	(0x05 << 29)
-#define SBC_IDE_PIO2_TOECS	(0x01 << 26)
-#define SBC_IDE_PIO2_TWCS	(0x01 << 28)
-#define SBC_IDE_PIO2_TCSH	(0x07 << 24)
-#define SBC_IDE_PIO2_TCSOFF	(0x07 << 20)
-#define SBC_IDE_PIO2_TWP	(0x1F << 14)
-#define SBC_IDE_PIO2_TCSW	(0x05 << 10)
-#define SBC_IDE_PIO2_TPM	(0x00 << 6)
-#define SBC_IDE_PIO2_TA		(0x22 << 0)
-/* Timing parameters PIO mode 3 */
-#define SBC_IDE_PIO3_TCSOE	(0x05 << 29)
-#define SBC_IDE_PIO3_TOECS	(0x01 << 26)
-#define SBC_IDE_PIO3_TWCS	(0x01 << 28)
-#define SBC_IDE_PIO3_TCSH	(0x0D << 24)
-#define SBC_IDE_PIO3_TCSOFF	(0x0D << 20)
-#define SBC_IDE_PIO3_TWP	(0x15 << 14)
-#define SBC_IDE_PIO3_TCSW	(0x05 << 10)
-#define SBC_IDE_PIO3_TPM	(0x00 << 6)
-#define SBC_IDE_PIO3_TA		(0x1A << 0)
-/* Timing parameters PIO mode 4 */
-#define SBC_IDE_PIO4_TCSOE	(0x04 << 29)
-#define SBC_IDE_PIO4_TOECS	(0x01 << 26)
-#define SBC_IDE_PIO4_TWCS	(0x01 << 28)
-#define SBC_IDE_PIO4_TCSH	(0x04 << 24)
-#define SBC_IDE_PIO4_TCSOFF	(0x04 << 20)
-#define SBC_IDE_PIO4_TWP	(0x0D << 14)
-#define SBC_IDE_PIO4_TCSW	(0x03 << 10)
-#define SBC_IDE_PIO4_TPM	(0x00 << 6)
-#define SBC_IDE_PIO4_TA		(0x12 << 0)
-/* Timing parameters MDMA mode 0 */
-#define SBC_IDE_MDMA0_TCSOE	(0x03 << 29)
-#define SBC_IDE_MDMA0_TOECS	(0x01 << 26)
-#define SBC_IDE_MDMA0_TWCS	(0x01 << 28)
-#define SBC_IDE_MDMA0_TCSH	(0x07 << 24)
-#define SBC_IDE_MDMA0_TCSOFF	(0x07 << 20)
-#define SBC_IDE_MDMA0_TWP	(0x0C << 14)
-#define SBC_IDE_MDMA0_TCSW	(0x03 << 10)
-#define SBC_IDE_MDMA0_TPM	(0x00 << 6)
-#define SBC_IDE_MDMA0_TA	(0x0F << 0)
-/* Timing parameters MDMA mode 1 */
-#define SBC_IDE_MDMA1_TCSOE	(0x05 << 29)
-#define SBC_IDE_MDMA1_TOECS	(0x01 << 26)
-#define SBC_IDE_MDMA1_TWCS	(0x01 << 28)
-#define SBC_IDE_MDMA1_TCSH	(0x05 << 24)
-#define SBC_IDE_MDMA1_TCSOFF	(0x05 << 20)
-#define SBC_IDE_MDMA1_TWP	(0x0F << 14)
-#define SBC_IDE_MDMA1_TCSW	(0x05 << 10)
-#define SBC_IDE_MDMA1_TPM	(0x00 << 6)
-#define SBC_IDE_MDMA1_TA	(0x15 << 0)
-/* Timing parameters MDMA mode 2 */
-#define SBC_IDE_MDMA2_TCSOE	(0x04 << 29)
-#define SBC_IDE_MDMA2_TOECS	(0x01 << 26)
-#define SBC_IDE_MDMA2_TWCS	(0x01 << 28)
-#define SBC_IDE_MDMA2_TCSH	(0x04 << 24)
-#define SBC_IDE_MDMA2_TCSOFF	(0x04 << 20)
-#define SBC_IDE_MDMA2_TWP	(0x0D << 14)
-#define SBC_IDE_MDMA2_TCSW	(0x04 << 10)
-#define SBC_IDE_MDMA2_TPM	(0x00 << 6)
-#define SBC_IDE_MDMA2_TA	(0x12 << 0)
-
-#define SBC_IDE_TIMING(mode) \
-	(SBC_IDE_##mode##_TWCS | \
-	 SBC_IDE_##mode##_TCSH | \
-	 SBC_IDE_##mode##_TCSOFF | \
-	 SBC_IDE_##mode##_TWP | \
-	 SBC_IDE_##mode##_TCSW | \
-	 SBC_IDE_##mode##_TPM | \
-	 SBC_IDE_##mode##_TA)
-- 
2.24.1

