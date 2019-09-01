Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7742CA4A4E
	for <lists+linux-mips@lfdr.de>; Sun,  1 Sep 2019 17:57:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726260AbfIAP5S (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 1 Sep 2019 11:57:18 -0400
Received: from pio-pvt-msa2.bahnhof.se ([79.136.2.41]:58288 "EHLO
        pio-pvt-msa2.bahnhof.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726552AbfIAP5S (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 1 Sep 2019 11:57:18 -0400
Received: from localhost (localhost [127.0.0.1])
        by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTP id B502C402D7
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 17:57:14 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -1.899
X-Spam-Level: 
X-Spam-Status: No, score=-1.899 tagged_above=-999 required=6.31
        tests=[BAYES_00=-1.9, URIBL_BLOCKED=0.001]
        autolearn=ham autolearn_force=no
Received: from pio-pvt-msa2.bahnhof.se ([127.0.0.1])
        by localhost (pio-pvt-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 3AJvnQ-zMmvQ for <linux-mips@vger.kernel.org>;
        Sun,  1 Sep 2019 17:57:13 +0200 (CEST)
Received: from localhost (h-41-252.A163.priv.bahnhof.se [46.59.41.252])
        (Authenticated sender: mb547485)
        by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id D5A863FC34
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 17:57:13 +0200 (CEST)
Date:   Sun, 1 Sep 2019 17:57:12 +0200
From:   Fredrik Noring <noring@nocrew.org>
To:     linux-mips@vger.kernel.org
Subject: [PATCH 052/120] MIPS: PS2: SIF: Sub-system interface reset of the
 I/O processor (IOP)
Message-ID: <fb79dab2db2bfa9a06e96c211d27423d0c51399c.1567326213.git.noring@nocrew.org>
References: <cover.1567326213.git.noring@nocrew.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cover.1567326213.git.noring@nocrew.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The sub-system interface (SIF) is the interface to exchange data between
the sub (input/output) processor (IOP) and the main (R5900) processor and
other devices connected to the main bus[1]. The IOP handles, in whole or
in part, most of the peripheral devices, including for example USB OHCI
interrupts.

DMA controllers (DMACs) for the IOP and the R5900 operate in cooperation
through a bidirectional FIFO in the SIF. There are three DMA channels:
SIF0 (sub-to-main), SIF1 (main-to-sub) and SIF2 (bidirectional).

Data is transferred in packets with a tag attached to each packet. The
tag contains the memory addresses in the IOP and R5900 address spaces
and the size of the data to transfer.

There are two mailbox type registers, the SMFLAG (sub-to-main) and
MSFLAG (main-to-sub), used to indicate certain events. The MAINADDR
and SUBADDR registers indicate the R5900 and IOP addresses where SIF
commands are transferred by the DMAC.

The IOP can assert interrupts via IRQ_INTC_SBUS.

This SIF kernel module resets the IOP during initialisation. The IOP
follows a certain boot protocol, with the following steps:

1. The kernel allocates a DMA memory buffer that the IOP can use to send
   commands. The kernel advertises this buffer by writing to the MAINADDR
   register.

2. The kernel reads the provisional SUBADDR register to obtain the
   corresponding command buffer for the IOP.

3. The kernel clears the SIF_STATUS_BOOTEND flag in the SMFLAG register.

4. The kernel issues the SIF_CMD_RESET_CMD command to the IOP.

5. The kernel indicates that the SIF and system commands are ready by
   setting the SIF_STATUS_SIFINIT and SIF_STATUS_CMDINIT flags in the
   SMFLAG register.

6. The kernel waits for the IOP to set the SIF_STATUS_BOOTEND flag in
   the SMFLAG register.

7. The kernel indicates that the boot is completed by writing updating
   its MAINADDR and setting the SIF_STATUS_CMDINIT and SIF_STATUS_BOOTEND
   flags in the MSFLAG register. The SIF_UNKNF260 register is set to 0xff.

8. The kernel reads the final SUBADDR register to obtain the command
   buffer for the IOP.

References:

[1] "EE Overview", version 6.0, Sony Computer Entertainment Inc., p. 47.

Signed-off-by: Fredrik Noring <noring@nocrew.org>
---
 arch/mips/include/asm/mach-ps2/sif.h |  72 +++++
 drivers/ps2/Makefile                 |   1 +
 drivers/ps2/sif.c                    | 414 +++++++++++++++++++++++++++
 3 files changed, 487 insertions(+)
 create mode 100644 arch/mips/include/asm/mach-ps2/sif.h
 create mode 100644 drivers/ps2/sif.c

diff --git a/arch/mips/include/asm/mach-ps2/sif.h b/arch/mips/include/asm/mach-ps2/sif.h
new file mode 100644
index 000000000000..94da96bd21d1
--- /dev/null
+++ b/arch/mips/include/asm/mach-ps2/sif.h
@@ -0,0 +1,72 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * PlayStation 2 sub-system interface (SIF)
+ *
+ * The SIF is an interface unit to the input/output processor (IOP).
+ *
+ * Copyright (C) 2019 Fredrik Noring
+ */
+
+#ifndef __ASM_MACH_PS2_SIF_H
+#define __ASM_MACH_PS2_SIF_H
+
+#include <linux/types.h>
+#include <linux/completion.h>
+
+#include "iop-memory.h"
+
+#define SIF_MAINADDR 		0x1000f200	/* EE to IOP command buffer */
+#define SIF_SUBADDR  		0x1000f210	/* IOP to EE command buffer */
+#define SIF_MSFLAG   		0x1000f220	/* EE to IOP flag */
+#define SIF_SMFLAG   		0x1000f230	/* IOP to EE flag */
+#define SIF_SUBCTRL  		0x1000f240
+#define SIF_UNKNF260		0x1000f260
+
+/* Status flags for the sub-to-main (SM) and main-to-sub (MS) SIF registers. */
+#define SIF_STATUS_SIFINIT	0x10000		/* SIF initialised */
+#define SIF_STATUS_CMDINIT	0x20000		/* SIF CMD initialised */
+#define SIF_STATUS_BOOTEND	0x40000		/* IOP bootup completed */
+
+#define	SIF_CMD_ID_SYS		0x80000000
+#define	SIF_CMD_ID_USR		0x00000000
+
+#define SIF_CMD_CHANGE_SADDR	(SIF_CMD_ID_SYS | 0x00)
+#define SIF_CMD_WRITE_SREG	(SIF_CMD_ID_SYS | 0x01)
+#define SIF_CMD_INIT_CMD	(SIF_CMD_ID_SYS | 0x02)
+#define SIF_CMD_RESET_CMD	(SIF_CMD_ID_SYS | 0x03)
+#define SIF_CMD_RPC_END		(SIF_CMD_ID_SYS | 0x08)
+#define SIF_CMD_RPC_BIND	(SIF_CMD_ID_SYS | 0x09)
+#define SIF_CMD_RPC_CALL	(SIF_CMD_ID_SYS | 0x0a)
+#define SIF_CMD_RPC_RDATA	(SIF_CMD_ID_SYS | 0x0c)
+#define SIF_CMD_IRQ_RELAY	(SIF_CMD_ID_SYS | 0x20)
+#define SIF_CMD_PRINTK		(SIF_CMD_ID_SYS | 0x21)
+
+#define	SIF_SID_ID_SYS		0x80000000
+#define	SIF_SID_ID_USR		0x00000000
+
+#define SIF_SID_FILE_IO		(SIF_SID_ID_SYS | 0x01)
+#define SIF_SID_HEAP		(SIF_SID_ID_SYS | 0x03)
+#define SIF_SID_LOAD_MODULE	(SIF_SID_ID_SYS | 0x06)
+#define SIF_SID_IRQ_RELAY	(SIF_SID_ID_SYS | 0x20)
+
+#define SIF_CMD_PACKET_MAX	112
+#define SIF_CMD_PACKET_DATA_MAX 96
+
+/**
+ * struct sif_cmd_header - 16-byte SIF command header
+ * @packet_size: min 1x16 for header only, max 7*16 bytes
+ * @data_size: data size in bytes
+ * @data_addr: data address or zero
+ * @cmd: command number
+ * @opt: optional argument
+ */
+struct sif_cmd_header
+{
+	u32 packet_size : 8;
+	u32 data_size : 24;
+	u32 data_addr;
+	u32 cmd;
+	u32 opt;
+};
+
+#endif /* __ASM_MACH_PS2_SIF_H */
diff --git a/drivers/ps2/Makefile b/drivers/ps2/Makefile
index e53976ddb3e4..ef561a802bdd 100644
--- a/drivers/ps2/Makefile
+++ b/drivers/ps2/Makefile
@@ -1 +1,2 @@
 obj-m				+= iop-registers.o
+obj-m				+= sif.o
diff --git a/drivers/ps2/sif.c b/drivers/ps2/sif.c
new file mode 100644
index 000000000000..6564af245880
--- /dev/null
+++ b/drivers/ps2/sif.c
@@ -0,0 +1,414 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * PlayStation 2 sub-system interface (SIF)
+ *
+ * Copyright (C) 2019 Fredrik Noring
+ */
+
+/**
+ * DOC: The sub-system interface (SIF) for the input/output processor (IOP)
+ *
+ * The SIF is the interface to exchange data between the sub (input/output)
+ * processor (IOP) and the main (R5900) processor and other devices connected
+ * to the main bus. The IOP handles, in whole or in part, most of the
+ * peripheral devices, including for example USB OHCI interrupts.
+ *
+ * DMA controllers (DMACs) for the IOP and the R5900 operate in cooperation
+ * through a bidirectional FIFO in the SIF. There are three DMA channels:
+ * SIF0 (sub-to-main), SIF1 (main-to-sub) and SIF2 (bidirectional).
+ *
+ * Data is transferred in packets with a tag attached to each packet. The
+ * tag contains the memory addresses in the IOP and R5900 address spaces
+ * and the size of the data to transfer.
+ *
+ * There are two mailbox type registers, the SMFLAG (sub-to-main) and
+ * MSFLAG (main-to-sub), used to indicate certain events. The MAINADDR
+ * and SUBADDR registers indicate the R5900 and IOP addresses where SIF
+ * commands are transferred by the DMAC.
+ *
+ * The IOP can assert interrupts via %IRQ_INTC_SBUS.
+ */
+
+#include <linux/build_bug.h>
+#include <linux/delay.h>
+#include <linux/init.h>
+#include <linux/interrupt.h>
+#include <linux/irq.h>
+#include <linux/module.h>
+#include <linux/sched.h>
+#include <linux/sched/signal.h>
+#include <linux/types.h>
+
+#include <asm/io.h>
+
+#include <asm/mach-ps2/dmac.h>
+#include <asm/mach-ps2/irq.h>
+#include <asm/mach-ps2/sif.h>
+
+#define IOP_RESET_ARGS "rom0:UDNL rom0:OSDCNF"
+
+#define SIF0_BUFFER_SIZE	PAGE_SIZE
+#define SIF1_BUFFER_SIZE	PAGE_SIZE
+
+static iop_addr_t iop_buffer; /* Address of IOP SIF DMA receive address */
+static void *sif0_buffer;
+static void *sif1_buffer;
+
+/**
+ * sif_write_msflag - write to set main-to-sub flag register bits
+ * @mask: MSFLAG register bit values to set
+ */
+static void sif_write_msflag(u32 mask)
+{
+	outl(mask, SIF_MSFLAG);
+}
+
+/**
+ * sif_write_smflag - write to clear sub-to-main flag register bits
+ * @mask: SMFLAG register bit values to clear
+ */
+static void sif_write_smflag(u32 mask)
+{
+	outl(mask, SIF_SMFLAG);
+}
+
+/**
+ * sif_read_smflag - read the sub-to-main flag register
+ *
+ * Return: SMFLAG register value
+ */
+static u32 sif_read_smflag(void)
+{
+	u32 a = inl(SIF_SMFLAG);
+	u32 b;
+
+	do {
+		b = a;
+
+		a = inl(SIF_SMFLAG);
+	} while (a != b);	/* Ensure SMFLAG reading is stable */
+
+	return a;
+}
+
+static bool completed(bool (*condition)(void))
+{
+	const unsigned long timeout = jiffies + 5*HZ;
+
+	do {
+		if (condition())
+			return true;
+
+		msleep(1);
+	} while (time_is_after_jiffies(timeout));
+
+	return false;
+}
+
+static bool sif_smflag_cmdinit(void)
+{
+	return (sif_read_smflag() & SIF_STATUS_CMDINIT) != 0;
+}
+
+static bool sif_smflag_bootend(void)
+{
+	return (sif_read_smflag() & SIF_STATUS_BOOTEND) != 0;
+}
+
+static bool sif1_busy(void)
+{
+	return (inl(DMAC_SIF1_CHCR) & DMAC_CHCR_BUSY) != 0;
+}
+
+static bool sif1_ready(void)
+{
+	size_t countout = 50000;	/* About 5 s */
+
+	while (sif1_busy() && countout > 0) {
+		udelay(100);
+		countout--;
+	}
+
+	return countout > 0;
+}
+
+/* Bytes to 32-bit word count. */
+static u32 nbytes_to_wc(size_t nbytes)
+{
+	const u32 wc = nbytes / 4;
+
+	BUG_ON(nbytes & 0x3);	/* Word count must align */
+	BUG_ON(nbytes != (size_t)wc * 4);
+
+	return wc;
+}
+
+/* Bytes to 128-bit quadword count. */
+static u32 nbytes_to_qwc(size_t nbytes)
+{
+	const size_t qwc = nbytes / 16;
+
+	BUG_ON(nbytes & 0xf);	/* Quadword count must align */
+	BUG_ON(qwc > 0xffff);	/* QWC DMA field is only 16 bits */
+
+	return qwc;
+}
+
+static int sif1_write_ert_int_0(const struct sif_cmd_header *header,
+	bool ert, bool int_0, iop_addr_t dst, const void *src, size_t nbytes)
+{
+	const size_t header_size = header != NULL ? sizeof(*header) : 0;
+	const size_t aligned_size = ALIGN(header_size + nbytes, 16);
+	const struct iop_dma_tag iop_dma_tag = {
+		.ert	= ert,
+		.int_0	= int_0,
+		.addr	= dst,
+		.wc	= nbytes_to_wc(aligned_size)
+	};
+	const size_t dma_nbytes = sizeof(iop_dma_tag) + aligned_size;
+	u8 *dma_buffer = sif1_buffer;
+	dma_addr_t madr;
+
+	if (!aligned_size)
+		return 0;
+	if (dma_nbytes > SIF1_BUFFER_SIZE)
+		return -EINVAL;
+	if (!sif1_ready())
+		return -EBUSY;
+
+	memcpy(&dma_buffer[0], &iop_dma_tag, sizeof(iop_dma_tag));
+	memcpy(&dma_buffer[sizeof(iop_dma_tag)], header, header_size);
+	memcpy(&dma_buffer[sizeof(iop_dma_tag) + header_size], src, nbytes);
+
+	madr = virt_to_phys(dma_buffer);
+	dma_cache_wback((unsigned long)dma_buffer, dma_nbytes);
+
+	outl(madr, DMAC_SIF1_MADR);
+	outl(nbytes_to_qwc(dma_nbytes), DMAC_SIF1_QWC);
+	outl(DMAC_CHCR_SENDN_TIE, DMAC_SIF1_CHCR);
+
+	return 0;
+}
+
+static int sif1_write(const struct sif_cmd_header *header,
+	iop_addr_t dst, const void *src, size_t nbytes)
+{
+	return sif1_write_ert_int_0(header, false, false, dst, src, nbytes);
+}
+
+static int sif1_write_irq(const struct sif_cmd_header *header,
+	iop_addr_t dst, const void *src, size_t nbytes)
+{
+	return sif1_write_ert_int_0(header, true, true, dst, src, nbytes);
+}
+
+static int sif_cmd_opt_copy(u32 cmd_id, u32 opt, const void *pkt,
+	size_t pktsize, iop_addr_t dst, const void *src, size_t nbytes)
+{
+	const struct sif_cmd_header header = {
+		.packet_size = sizeof(header) + pktsize,
+		.data_size   = nbytes,
+		.data_addr   = dst,
+		.cmd         = cmd_id,
+		.opt         = opt
+	};
+	int err;
+
+	if (pktsize > SIF_CMD_PACKET_DATA_MAX)
+		return -EINVAL;
+
+	err = sif1_write(NULL, dst, src, nbytes);
+	if (!err)
+		err = sif1_write_irq(&header, iop_buffer, pkt, pktsize);
+
+	return err;
+}
+
+static int sif_cmd_copy(u32 cmd_id, const void *pkt, size_t pktsize,
+	iop_addr_t dst, const void *src, size_t nbytes)
+{
+	return sif_cmd_opt_copy(cmd_id, 0, pkt, pktsize, dst, src, nbytes);
+}
+
+static int sif_cmd(u32 cmd_id, const void *pkt, size_t pktsize)
+{
+	return sif_cmd_copy(cmd_id, pkt, pktsize, 0, NULL, 0);
+}
+
+static int iop_reset_arg(const char *arg)
+{
+	const size_t arglen = strlen(arg) + 1;
+	struct {
+		u32 arglen;
+		u32 mode;
+		char arg[79 + 1];	/* Including NUL */
+	} reset_pkt = {
+		.arglen = arglen,
+		.mode = 0
+	};
+	int err;
+
+	if (arglen > sizeof(reset_pkt.arg))
+		return -EINVAL;
+	memcpy(reset_pkt.arg, arg, arglen);
+
+	sif_write_smflag(SIF_STATUS_BOOTEND);
+
+	err = sif_cmd(SIF_CMD_RESET_CMD, &reset_pkt, sizeof(reset_pkt));
+	if (err)
+		return err;
+
+	sif_write_smflag(SIF_STATUS_SIFINIT | SIF_STATUS_CMDINIT);
+
+	return completed(sif_smflag_bootend) ? 0 : -EIO;
+}
+
+static int iop_reset(void)
+{
+	return iop_reset_arg(IOP_RESET_ARGS);
+}
+
+static int sif_read_subaddr(dma_addr_t *subaddr)
+{
+	if (!completed(sif_smflag_cmdinit))
+		return -EIO;
+
+	*subaddr = inl(SIF_SUBADDR);
+
+	return 0;
+}
+
+static void sif_write_mainaddr_bootend(dma_addr_t mainaddr)
+{
+	outl(0xff, SIF_UNKNF260);
+	outl(mainaddr, SIF_MAINADDR);
+	sif_write_msflag(SIF_STATUS_CMDINIT | SIF_STATUS_BOOTEND);
+}
+
+static void put_dma_buffers(void)
+{
+	free_page((unsigned long)sif1_buffer);
+	free_page((unsigned long)sif0_buffer);
+}
+
+static int get_dma_buffers(void)
+{
+	sif0_buffer = (void *)__get_free_page(GFP_DMA);
+	sif1_buffer = (void *)__get_free_page(GFP_DMA);
+
+	if (sif0_buffer == NULL ||
+	    sif1_buffer == NULL) {
+		put_dma_buffers();
+		return -ENOMEM;
+	}
+
+	return 0;
+}
+
+static void sif_disable_dma(void)
+{
+	outl(DMAC_CHCR_STOP, DMAC_SIF0_CHCR);
+	outl(0, DMAC_SIF0_MADR);
+	outl(0, DMAC_SIF0_QWC);
+	inl(DMAC_SIF0_QWC);
+
+	outl(DMAC_CHCR_STOP, DMAC_SIF1_CHCR);
+}
+
+/**
+ * sif_init - initialise the SIF with a reset
+ *
+ * The IOP follows a certain boot protocol, with the following steps:
+ *
+ *  1. The kernel allocates a DMA memory buffer that the IOP can use to send
+ *     commands. The kernel advertises this buffer by writing to the MAINADDR
+ *     register.
+ *
+ *  2. The kernel reads the provisional SUBADDR register to obtain the
+ *     corresponding command buffer for the IOP.
+ *
+ *  3. The kernel clears the %SIF_STATUS_BOOTEND flag in the SMFLAG register.
+ *
+ *  4. The kernel issues the %SIF_CMD_RESET_CMD command to the IOP.
+ *
+ *  5. The kernel indicates that the SIF and system commands are ready by
+ *     setting the %SIF_STATUS_SIFINIT and %SIF_STATUS_CMDINIT flags in the
+ *     SMFLAG register.
+ *
+ *  6. The kernel waits for the IOP to set the %SIF_STATUS_BOOTEND flag in
+ *     the SMFLAG register.
+ *
+ *  7. The kernel indicates that the boot is completed by writing updating
+ *     its MAINADDR and setting the %SIF_STATUS_CMDINIT and %SIF_STATUS_BOOTEND
+ *     flags in the MSFLAG register. The %SIF_UNKNF260 register is set to 0xff.
+ *
+ *  8. The kernel reads the final SUBADDR register to obtain the command
+ *     buffer for the IOP.
+ *
+ * Return: 0 on success, otherwise a negative error number
+ */
+static int __init sif_init(void)
+{
+	int err;
+
+	BUILD_BUG_ON(sizeof(struct sif_cmd_header) != 16);
+
+	sif_disable_dma();
+
+	err = get_dma_buffers();
+	if (err) {
+		pr_err("sif: Failed to allocate DMA buffers with %d\n", err);
+		goto err_dma_buffers;
+	}
+
+	/* Read provisional SUBADDR in preparation for the IOP reset. */
+	err = sif_read_subaddr(&iop_buffer);
+	if (err) {
+		pr_err("sif: Failed to read provisional SUBADDR with %d\n",
+			err);
+		goto err_provisional_subaddr;
+	}
+
+	/* Write provisional MAINADDR in preparation for the IOP reset. */
+	sif_write_mainaddr_bootend(virt_to_phys(sif0_buffer));
+
+	err = iop_reset();
+	if (err) {
+		pr_err("sif: Failed to reset the IOP with %d\n", err);
+		goto err_iop_reset;
+	}
+
+	/* Write final MAINADDR and indicate end of boot. */
+	sif_write_mainaddr_bootend(virt_to_phys(sif0_buffer));
+
+	/* Read final SUBADDR. */
+	err = sif_read_subaddr(&iop_buffer);
+	if (err) {
+		pr_err("sif: Failed to read final SUBADDR with %d\n", err);
+		goto err_final_subaddr;
+	}
+
+	return 0;
+
+err_final_subaddr:
+err_iop_reset:
+err_provisional_subaddr:
+	put_dma_buffers();
+
+err_dma_buffers:
+	return err;
+}
+
+static void __exit sif_exit(void)
+{
+	sif_disable_dma();
+
+	put_dma_buffers();
+}
+
+module_init(sif_init);
+module_exit(sif_exit);
+
+MODULE_DESCRIPTION("PlayStation 2 sub-system interface (SIF)");
+MODULE_AUTHOR("Fredrik Noring");
+MODULE_LICENSE("GPL");
-- 
2.21.0

