Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC1AE2F4E48
	for <lists+linux-mips@lfdr.de>; Wed, 13 Jan 2021 16:16:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726238AbhAMPPI (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 13 Jan 2021 10:15:08 -0500
Received: from mout.gmx.net ([212.227.17.20]:45289 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726531AbhAMPPG (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 13 Jan 2021 10:15:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1610550810;
        bh=h04l1+sWPKPAwhjVSAZUr5CU46wuJzYkH3K+JynbfOM=;
        h=X-UI-Sender-Class:Date:From:To:Cc:Subject;
        b=cphnYPpFTCFu0NbkmAaowLeNV6hQ2vsDZkMqbVzio94z6seVbzeSzYk5T/Eo6Mj5a
         UZ8quHor+BQoodmUGuf1Hsqhd8Ucg8hAkyejAtA0189iMe0ddRa/q3jdLcU1QlyAuD
         g3g9wTPSkaiyhz5QuAvyjUTtZ7Nb0cBaBF2AEBFg=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from Valinor ([82.203.161.65]) by mail.gmx.com (mrgmx105
 [212.227.17.174]) with ESMTPSA (Nemesis) id 1MLiCu-1kiAzB2u5w-00HgPM; Wed, 13
 Jan 2021 16:13:29 +0100
Date:   Wed, 13 Jan 2021 17:13:59 +0200
From:   Lauri Kasanen <cand@gmx.com>
To:     linux-mips@vger.kernel.org
Cc:     tsbogend@alpha.franken.de, axboe@kernel.dk,
        linux-block@vger.kernel.org, Keith Busch <kbusch@kernel.org>
Subject: [PATCH 6/6 v6] block: Add n64 cart driver
Message-Id: <20210113171359.489f6a94ecbaa9244f10e26e@gmx.com>
X-Mailer: Sylpheed 3.5.0 (GTK+ 2.18.6; x86_64-unknown-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:HftX1ENzjFmWj4iceLdAhmGTnD0GerpMr/W7B9mdG3287f5cR4T
 PsnblnEFVT3LD434gyqpjpL8E/+VDbe6tucSRCwyQwFkxxP6wsPT8egvh9xOEHQ5RIRIsou
 QKzl8zlnR3fU7iGMOG/eWtmNLceAbebmxhh0nd3zMM2TgH+LInY+wGPMNFYjROuT534Sj/x
 FbUXS1l7pwqXMrYZbYNaw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:/eQoRQHhqwU=:jSrTbdtCLSG6uiSz6kHQgR
 TjQL2GY60BWwr804hzmnhJ+3r+sB9q5IGsi+jcb11KU8clCfCegNpEr1AQn4zgcGLRZ3gQjKz
 aNYorXMdsRTlZacTU4XokDf6eUC+c5FI3Yaoo0w/wcZ207uVysm2TlTCoqbb1JULZyDGuYQlC
 A9+RBpz6LSfjBBt9zlie45AdpGlbc4H38DJpXpSsGQuW5xbTxdzbBhAhpTmOQC6vV9dq95fFX
 c2kNfBvngRYKgqEHrGYf8TXOAPCymkxGgWKpK9cRaOnXd3UMupSHmY+rjzYfOkACZxEK2SxYT
 lQVkAR8chu8rTdA7SO25NTHQ7oogCmFrJ7kzOWAO6gj/2o4Uon1UYeAGHLJh/Arjom7BEDju2
 uCgcVODq7RT6vIA2TS8wxgqpI3rRIu7nrMAeyQ0cD7KzFkdzSjuxeLBOCJ3ApRvMWjGiSZfIY
 ZzGnSEcJoGCyqhZCEY1jixJQOPdFIhhNl+yP4RB/f5n1ZZDhX6LzqHi/SmIh0HM1eUtSGKszZ
 9v72jvSXsoMbR/Hyut/lk7PCnLIEftxfG8kfr5Hj7fv25apk0vl9+XNQZdNKWxvN07ZGMoS0x
 /y18ShvHcjl0fo2JGKcFk3E4pBIC+1lgV/przQ8CMHdry+mkMDUTkQzUl3mQkawuYhzdsrD/W
 ZfvkxifgmLOYOpPO/VZUSZbOcMi24KMBaVZlr8lH856oVeahUy3BPDXKiy7UM0l1YhKBxKS2X
 3rh3kUvcRhJ/xWHNcu50KGPAN17Oj1Wr2AemXkqhvkSgnJ1DeHPYzSpaVuynfbGwQzvhzMVIq
 rjqBwHf98jDBj/WZ3bN+pe6AdZU3YW+sTIf07KrNMN9Scy8fLd6CkrCJDQ3LRNg3oCpOLP4kE
 7RsLGcvDWTv7qOtY1wHA==
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
 drivers/block/Kconfig   |   6 ++
 drivers/block/Makefile  |   1 +
 drivers/block/n64cart.c | 217 +++++++++++++++++++++++++++++++++++++++++++=
+++++
 3 files changed, 224 insertions(+)
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
index 0000000..f8c17b0
=2D-- /dev/null
+++ b/drivers/block/n64cart.c
@@ -0,0 +1,217 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Support for the N64 cart.
+ *
+ * Copyright (c) 2021 Lauri Kasanen
+ */
+
+#include <linux/bitops.h>
+#include <linux/blk-mq.h>
+#include <linux/dma-mapping.h>
+#include <linux/init.h>
+#include <linux/major.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
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
+static u32 __iomem *reg_base;
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
+	writel(value, reg_base + reg);
+}
+
+static u32 n64cart_read_reg(const u8 reg)
+{
+	return readl(reg_base + reg);
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
+/*
+ * The target device is embedded and RAM-constrained. We save RAM
+ * by initializing in __init code that gets dropped late in boot.
+ * For the same reason there is no module or unloading support.
+ */
+static int __init n64cart_probe(struct platform_device *pdev)
+{
+	struct resource *res;
+	unsigned long len;
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
+	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	len =3D res->end - res->start + 1;
+	reg_base =3D ioremap(res->start, len);
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
+static struct platform_driver n64cart_driver =3D {
+	.driver =3D {
+		.name =3D "n64cart",
+	},
+};
+
+static int __init n64cart_init(void)
+{
+	return platform_driver_probe(&n64cart_driver, n64cart_probe);
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

