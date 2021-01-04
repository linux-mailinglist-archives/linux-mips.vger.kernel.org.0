Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57C012E9C6A
	for <lists+linux-mips@lfdr.de>; Mon,  4 Jan 2021 18:56:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726336AbhADR4J (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 4 Jan 2021 12:56:09 -0500
Received: from mout.gmx.net ([212.227.15.15]:43293 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726328AbhADR4J (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 4 Jan 2021 12:56:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1609782873;
        bh=gjFTTDat1qJgr22nsGdNgz5lA0v+pEyxihvKYIf+G6s=;
        h=X-UI-Sender-Class:Date:From:To:Cc:Subject;
        b=L2oEWn0BjsJIhji0r7ATGE6pqLkaVKPaD3EbbBC5qppjyLp3uy/QIsRQ3hoWL4J67
         a0fNuQHb9XDlspNPsqGtudP+kLXpxe0Tpg8FvcXCOX7VLrCpwCDcLBzzRYn+1H/qg+
         Kj7TMOpUhU6PzIGb27xsh7KdCoNAyR/KvojN4PQA=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from Valinor ([82.128.181.212]) by mail.gmx.com (mrgmx005
 [212.227.17.184]) with ESMTPSA (Nemesis) id 1Mt75H-1k7gtE2P61-00tXT1; Mon, 04
 Jan 2021 18:54:33 +0100
Date:   Mon, 4 Jan 2021 19:56:11 +0200
From:   Lauri Kasanen <cand@gmx.com>
To:     linux-mips@vger.kernel.org
Cc:     tsbogend@alpha.franken.de, axboe@kernel.dk,
        linux-block@vger.kernel.org, Keith Busch <kbusch@kernel.org>
Subject: [PATCH 6/6 v2] block: Add n64 cart driver
Message-Id: <20210104195611.61997e86092b3559c95f36fc@gmx.com>
X-Mailer: Sylpheed 3.5.0 (GTK+ 2.18.6; x86_64-unknown-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:XPdh3lN5swXrQl6Lgxsj922itiGDO6wK9cYaYy8X1/ndefp6xIW
 3J6J0VQ1KKxWEFynye5gmeVcpUjf8KBvz95euNaswzFHoJ0nogQhYtQK54kJt9zNPpXm+1K
 rjrC9njGAi4ljRT/9xj9vVXPMVlZJ/TP4HtlKiW2Ky0ptbD0Mxvkv+SvWRvQg194ClhnWfv
 JyHKJs0ZbrA5/FLwKOYBg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:VIMSl3csASE=:YlQo9aFWfVck0AsIFmf4mU
 wGSbuU9UX9CZ3E8QbJTopIe2MtDLCdrs82HMUHAqTigDKzdlKJsLHS/Z5kbE4kxDTUvfAS0Pr
 MJ1VBtuPvC0BR94P2I+XeiOAeB33+roy5pPVKHfJD5iAJwyOcLM4oJpzGlaLUDGqXtNJxWnI2
 Q7ItenEALF+29jnwG+qiw5qlbH99hoAKi97lstK+LB0uJD1R8WTwT0zvG1f/GZXradviyKXYj
 RCULsiZBYYnLgL4iZXxnLJmkrDsDcH7NX+sKHi1BUKVbqQ9YoPOaVxhmYKGl9OiSSK89ACESi
 280eNyDdM4mie/EZGE/Glk9IGkjLp2dyiV0iW/SJWgbAHDT03HLT9PzgZ4chPheGoi0/CzAN0
 OP7OFWd4Fo2vZxQ8AliZsb1BWpyEMgLba97htF7laqSzmrahxJhHuf2se9MdsExcBGZw7GT1r
 Z7wrMbdOTyt9dCPxEIsUY/A9TvAOI9B+47Y4KtqMdG5FyrrICh2xDa14JzSYPHY1mO8QxrcfI
 ShAdick7RnyadP+AzQdNxTd586ynR88yZqU/dKWJgTZVLXF0u7o6pHAtCZlWgSwRha7KPvxlv
 UqDyOS+yU5lxJfnBZ+3fEiLVcPQeeiax3ED/IVCRxRP6obF5/Z7Ee7zBdKzb+8scnSS6fKT8X
 C52uk8wvk5gY6Gz2UPtoKolbV36aOHsPV3y6OlndJiQnQ+TxRQmtGcKhgq17KNTfnws/Njw4d
 SNAsuXiX3D0X5oQakWcs83YHo3LNQYQPlJNy5cZQHaj7SzyTfnRgrm0RW6LneJK7mbPh8ipZf
 TpsjvcxTOuR+m4NHmmqbd5p4B+acxJlqAJmVvVRXb2QzRCzZIJ4bmQ04tkTpBNPgoFJA3KsrQ
 0cMYb8f1+6bQAD3NRgww==
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This adds support for the Nintendo 64 console's carts.
Carts are a read-only media ranging from 8mb to 64mb.

Only one cart can be connected at once, and switching
it requires a reboot.

No module support to save RAM, as the target has 8mb RAM.

Signed-off-by: Lauri Kasanen <cand@gmx.com>
=2D--

v2:
cpu relax
ro
spinlock gone, queue depth 1
BLK_MQ_F_BLOCKING

 drivers/block/Kconfig   |   6 ++
 drivers/block/Makefile  |   1 +
 drivers/block/n64cart.c | 197 +++++++++++++++++++++++++++++++++++++++++++=
+++++
 3 files changed, 204 insertions(+)
 create mode 100644 drivers/block/n64cart.c

diff --git a/drivers/block/Kconfig b/drivers/block/Kconfig
index ecceaaa..924d768 100644
=2D-- a/drivers/block/Kconfig
+++ b/drivers/block/Kconfig
@@ -72,6 +72,12 @@ config AMIGA_Z2RAM
 	  To compile this driver as a module, choose M here: the
 	  module will be called z2ram.

+config N64CART
+	bool "N64 cart support"
+	depends on MACH_NINTENDO64
+	help
+	  Support for the N64 cart.
+
 config CDROM
 	tristate
 	select BLK_SCSI_REQUEST
diff --git a/drivers/block/Makefile b/drivers/block/Makefile
index e1f6311..b9642cf 100644
=2D-- a/drivers/block/Makefile
+++ b/drivers/block/Makefile
@@ -17,6 +17,7 @@ obj-$(CONFIG_PS3_DISK)		+=3D ps3disk.o
 obj-$(CONFIG_PS3_VRAM)		+=3D ps3vram.o
 obj-$(CONFIG_ATARI_FLOPPY)	+=3D ataflop.o
 obj-$(CONFIG_AMIGA_Z2RAM)	+=3D z2ram.o
+obj-$(CONFIG_N64CART)		+=3D n64cart.o
 obj-$(CONFIG_BLK_DEV_RAM)	+=3D brd.o
 obj-$(CONFIG_BLK_DEV_LOOP)	+=3D loop.o
 obj-$(CONFIG_XILINX_SYSACE)	+=3D xsysace.o
diff --git a/drivers/block/n64cart.c b/drivers/block/n64cart.c
new file mode 100644
index 0000000..6bcd795
=2D-- /dev/null
+++ b/drivers/block/n64cart.c
@@ -0,0 +1,197 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Support for the N64 cart.
+ *
+ * Copyright (c) 2020 Lauri Kasanen
+ */
+
+#include <linux/bitops.h>
+#include <linux/blk-mq.h>
+#include <linux/dma-mapping.h>
+#include <linux/init.h>
+#include <linux/major.h>
+#include <linux/module.h>
+
+#include <asm/addrspace.h>
+#include <asm/io.h>
+
+MODULE_AUTHOR("Lauri Kasanen <cand@gmx.com>");
+MODULE_DESCRIPTION("Driver for the N64 cart");
+MODULE_LICENSE("GPL");
+
+#define BUFSIZE (64 * 1024)
+
+static unsigned int start, size;
+static int major;
+static struct request_queue *queue;
+static struct blk_mq_tag_set tag_set;
+static struct gendisk *disk;
+
+static void *buf;
+static dma_addr_t dma_addr;
+
+#define REG_BASE ((u32 *) TO_UNCAC(0x4600000))
+
+#define PI_DRAM_REG 0
+#define PI_CART_REG 1
+#define PI_READ_REG 2
+#define PI_WRITE_REG 3
+#define PI_STATUS_REG 4
+
+#define PI_STATUS_DMA_BUSY (1 << 0)
+#define PI_STATUS_IO_BUSY (1 << 1)
+
+static void n64cart_write_reg(const u8 reg, const u32 value)
+{
+	__raw_writel(value, REG_BASE + reg);
+}
+
+static u32 n64cart_read_reg(const u8 reg)
+{
+	return __raw_readl(REG_BASE + reg);
+}
+
+static void n64cart_wait_dma(void)
+{
+	while (n64cart_read_reg(PI_STATUS_REG) &
+		(PI_STATUS_DMA_BUSY | PI_STATUS_IO_BUSY))
+		cpu_relax();
+}
+
+static blk_status_t get_seg(struct request *req)
+{
+	u32 bstart =3D blk_rq_pos(req) * 512;
+	u32 len =3D blk_rq_cur_bytes(req);
+	void *dst =3D bio_data(req->bio);
+
+	if (bstart + len > size)
+		return BLK_STS_IOERR;
+
+	bstart +=3D start;
+
+	while (len) {
+		const u32 curlen =3D len < BUFSIZE ? len : BUFSIZE;
+
+		dma_cache_inv((unsigned long) buf, curlen);
+
+		n64cart_wait_dma();
+
+		barrier();
+		n64cart_write_reg(PI_DRAM_REG, dma_addr);
+		barrier();
+		n64cart_write_reg(PI_CART_REG, (bstart | 0x10000000) & 0x1FFFFFFF);
+		barrier();
+		n64cart_write_reg(PI_WRITE_REG, curlen - 1);
+		barrier();
+
+		n64cart_wait_dma();
+
+		memcpy(dst, buf, curlen);
+
+		len -=3D curlen;
+		dst +=3D curlen;
+		bstart +=3D curlen;
+	}
+
+	return BLK_STS_OK;
+}
+
+static blk_status_t n64cart_queue_rq(struct blk_mq_hw_ctx *hctx,
+				     const struct blk_mq_queue_data *bd)
+{
+	struct request *req =3D bd->rq;
+	blk_status_t err;
+
+	blk_mq_start_request(req);
+
+	do {
+		err =3D get_seg(req);
+	} while (blk_update_request(req, err, blk_rq_cur_bytes(req)));
+
+	blk_mq_end_request(req, BLK_STS_OK);
+	return BLK_STS_OK;
+}
+
+static const struct blk_mq_ops n64cart_mq_ops =3D {
+	.queue_rq =3D n64cart_queue_rq,
+};
+
+static const struct block_device_operations n64cart_fops =3D {
+	.owner		=3D THIS_MODULE,
+};
+
+static int __init n64cart_init(void)
+{
+	int err;
+
+	if (!start || !size) {
+		pr_err("n64cart: start and size not specified\n");
+		return -ENODEV;
+	}
+
+	if (size & 4095) {
+		pr_err("n64cart: size must be a multiple of 4K\n");
+		return -ENODEV;
+	}
+
+	major =3D register_blkdev(0, "n64cart");
+	if (major <=3D 0) {
+		pr_err("n64cart: unable to get major number\n");
+		return -EBUSY;
+	}
+
+	queue =3D blk_mq_init_sq_queue(&tag_set, &n64cart_mq_ops, 1,
+				     BLK_MQ_F_SHOULD_MERGE | BLK_MQ_F_BLOCKING);
+	if (IS_ERR(queue)) {
+		err =3D PTR_ERR(queue);
+		goto fail_reg;
+	}
+
+	buf =3D kmalloc(BUFSIZE, GFP_DMA | GFP_KERNEL);
+	if (!buf) {
+		err =3D -ENOMEM;
+		goto fail_queue;
+	}
+	dma_addr =3D virt_to_phys(buf);
+
+	disk =3D alloc_disk(1);
+	if (!disk) {
+		err =3D -ENOMEM;
+		goto fail_dma;
+	}
+
+	disk->major =3D major;
+	disk->first_minor =3D 0;
+	disk->queue =3D queue;
+	disk->flags =3D GENHD_FL_NO_PART_SCAN;
+	disk->fops =3D &n64cart_fops;
+	strcpy(disk->disk_name, "n64cart");
+
+	set_capacity(disk, size / 512);
+	set_disk_ro(disk, 1);
+
+	blk_queue_flag_set(QUEUE_FLAG_NONROT, queue);
+	blk_queue_physical_block_size(queue, 4096);
+	blk_queue_logical_block_size(queue, 4096);
+
+	add_disk(disk);
+
+	pr_info("n64cart: %u kb disk\n", size / 1024);
+
+	return 0;
+fail_dma:
+	kfree(buf);
+fail_queue:
+	blk_cleanup_queue(queue);
+fail_reg:
+	unregister_blkdev(major, "n64cart");
+	return err;
+}
+
+module_param(start, uint, 0);
+MODULE_PARM_DESC(start, "Start address of the cart block data");
+
+module_param(size, uint, 0);
+MODULE_PARM_DESC(size, "Size of the cart block data, in bytes");
+
+module_init(n64cart_init);
=2D-
2.6.2

