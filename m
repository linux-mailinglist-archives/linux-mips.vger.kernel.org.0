Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 95CC2190C24
	for <lists+linux-mips@lfdr.de>; Tue, 24 Mar 2020 12:15:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727297AbgCXLOp (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 24 Mar 2020 07:14:45 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:43133 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727303AbgCXLOn (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 24 Mar 2020 07:14:43 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20200324111439euoutp0113a40a564fd2b62a86d4b48ba1ce5b59~-OTG7sUqn0293702937euoutp01P
        for <linux-mips@vger.kernel.org>; Tue, 24 Mar 2020 11:14:39 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20200324111439euoutp0113a40a564fd2b62a86d4b48ba1ce5b59~-OTG7sUqn0293702937euoutp01P
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1585048479;
        bh=m771JCPoRTsA5p+KuB0lE8yop6dn4Z3GGmdKM1i8Ap4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=feQLktMtbpgcEJKM4nt7ZMWbzdTT/lb79ekRsVGMqfr7LHsSH4cltHpIGkei81l3D
         hszQCSmIoI4xRTeMU26Vnz+NOlt+YFPAFmScN10fERPsQVMg3+YhXbhF3MVbiuZnod
         Z7ZsM6txE/Zvj3fcQ0yG2grEy5xLfERkENYB8K80=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20200324111439eucas1p1399fcd1a1cb5e1abeb677961199d9dbd~-OTGgngtN2373023730eucas1p1K;
        Tue, 24 Mar 2020 11:14:39 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id EB.1D.61286.F9BE97E5; Tue, 24
        Mar 2020 11:14:39 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20200324111438eucas1p20e45db250af6e2419e97f8a0e3e3e065~-OTGEG-9x1838518385eucas1p2r;
        Tue, 24 Mar 2020 11:14:38 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20200324111438eusmtrp2db8a69ab698f5735a9c8311661360354~-OTGDfMuN0435704357eusmtrp21;
        Tue, 24 Mar 2020 11:14:38 +0000 (GMT)
X-AuditID: cbfec7f2-f0bff7000001ef66-14-5e79eb9f0bf2
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 97.BE.07950.E9BE97E5; Tue, 24
        Mar 2020 11:14:38 +0000 (GMT)
Received: from AMDC3058.digital.local (unknown [106.120.51.71]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20200324111438eusmtip1a63813eb2f9ed78b174cad1dc03fa8e1~-OTFe1QQq0893908939eusmtip1K;
        Tue, 24 Mar 2020 11:14:38 +0000 (GMT)
From:   Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     "David S . Miller" <davem@davemloft.net>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Manuel Lauss <manuel.lauss@gmail.com>,
        Christoph Hellwig <hch@lst.de>, linux-ide@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, b.zolnierkie@samsung.com,
        Paul Burton <paulburton@kernel.org>
Subject: [PATCH v2 2/3] MIPS: Alchemy: remove no longer used au1xxx_ide.h
 header
Date:   Tue, 24 Mar 2020 12:14:19 +0100
Message-Id: <20200324111420.31793-3-b.zolnierkie@samsung.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200324111420.31793-1-b.zolnierkie@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA01Se0hTYRzt27139zqaXKfgl4XRqEjBFwZd1ESh8lJBL4gIUpfeVHTTdtVc
        JIjvDdTU8LEUrSR1PpuPfFE6dT6CJBPJ0sIppukq1CTDVtuulv+d3/md853zg49ARO8xJyJK
        Fs/IZZIYMV+Atus3x9wqlhXBnj/nMOpZSRNGzfdmAapsLB2lausGeVT+8CpKPcqsQil9h4FH
        ve0q41NKbRugJtcNOJW7rEeo7I1ylBrvOUz1p/YhAbZ0xng1SrfWTvHoTvUMTms1Sj49WNvA
        o7unUvj0k9xCjF4emEXp3FYNoNe0zhcF1wV+4UxMVCIj9/APFUQOaRfRuGHfpNTyCTwF6D1V
        wIaA5HG40LuBqYCAEJE1AHYZBgE3rANoaOzic8MagL2rDfiOpb6qD+EW1QDmTRRh/yyNlUae
        RcUnfWB+lgZYsAPpDZvauq0ihOxEYL1BbRXZk5fhinELsWCUPAI7Bh6gKoATQvIkLHHkwg7C
        to1VzIJtSH/YMtRofVJI2sGR0nnUghGzJq3tobUQJI041H5Qbjc9BSdKe1AO28MvQ63b/AH4
        p7OCxxkaAfydvbjtfg5gdaGJz6l84fTrX2ZMmCNcYFOXB0cHwpQanZWGpC18Z7TjStjCgvZi
        hKOFMDtTxKmPwuanzfydWFVnLcJhGo4Wl+P3wSH1rnPUu85R/8+tBIgGODIJrDSCYb1kzB13
        ViJlE2QR7mGxUi0w/7hXpqHVDvBj/KYOkAQQ7xUem1UEizBJIquQ6gAkELGDsIVJChYJwyWK
        u4w8NkSeEMOwOrCfQMWOQu/HSzdEZIQknolmmDhGvrPlETZOKcD141panPMZLEyfPCG5tBKl
        LTLppTXEd5/PZ0f6567ONOtH2r3eDHwtq9vKjLW/MJq5R/wi41zep3vXavAE0nt4qafFFDKT
        Q22aNMoTBVief4D/QqtbgS5eMZ0YmuPy0tiXHJcevS/o1vlvLg5+QbcNaaFuk6Hp6adDVgKv
        IJO+YpSNlHi5InJW8hdiekmWbQMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKIsWRmVeSWpSXmKPExsVy+t/xu7rzXlfGGaxbrWGxccZ6VosnB9oZ
        Leacb2GxWLn6KJPFxBOfWCwWti1hsTi24xGTxeVdc9gsOjdtZbS49uURu0Xf62PMFh3f5rJY
        XNqjYnG46SCzA59H66XlLB5bVt5k8tg56y67x6ZVnWweR1euZfLYfbOBzWNx32RWj9dHHrJ4
        9G1ZxejxeZNcAFeUnk1RfmlJqkJGfnGJrVK0oYWRnqGlhZ6RiaWeobF5rJWRqZK+nU1Kak5m
        WWqRvl2CXsbxTS9YCk5YVzTNvcLewHjMoIuRk0NCwERizZKDzF2MXBxCAksZJQ6+/8LSxcgB
        lJCROL6+DKJGWOLPtS42iJpPjBJv9p9nAkmwCVhJTGxfxQhiiwgYS6zfupsVxGYWOMos0Xvb
        E8QWFgiQaL3Tzg5iswioSuw4MgVoPjsHr4CtxAxxiPHyElu/fQLr5BSwk9h8fB3YRCGgilef
        PoN18goISpyc+YQFYrq8RPPW2cwTGAVmIUnNQpJawMi0ilEktbQ4Nz232EivODG3uDQvXS85
        P3cTIzAKtx37uWUHY9e74EOMAhyMSjy8Gg8r44RYE8uKK3MPMUpwMCuJ8G5OrYgT4k1JrKxK
        LcqPLyrNSS0+xGgK9MJEZinR5HxggsgriTc0NTS3sDQ0NzY3NrNQEuftEDgYIySQnliSmp2a
        WpBaBNPHxMEp1cAo2nw4afE9qweW7ZubhHL6FRXef3JkP1nA5GL2b/4d2zlHlDsOPd9j5xSq
        2S/0rkSCxbG9NcN09epw+avqH9a+X9ViI7JlowvXCWFr4a3xumUHmlb39Vz3tY0V2jox7Z3P
        SpWguB/1r0+wvLzz6Un8wsU3PkVvfflIK7R1WcvKo5XMZ0sOGhcrsRRnJBpqMRcVJwIAtTPK
        09gCAAA=
X-CMS-MailID: 20200324111438eucas1p20e45db250af6e2419e97f8a0e3e3e065
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200324111438eucas1p20e45db250af6e2419e97f8a0e3e3e065
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200324111438eucas1p20e45db250af6e2419e97f8a0e3e3e065
References: <20200324111420.31793-1-b.zolnierkie@samsung.com>
        <CGME20200324111438eucas1p20e45db250af6e2419e97f8a0e3e3e065@eucas1p2.samsung.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Since the only user of this header (au1xxx-ide IDE host driver) is
now gone it can also be removed.

Acked-by: Paul Burton <paulburton@kernel.org>
Acked-by: Manuel Lauss <manuel.lauss@gmail.com>
Acked-by: Christoph Hellwig <hch@lst.de>
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

