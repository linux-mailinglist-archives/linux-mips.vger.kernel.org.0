Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 591B52F77C5
	for <lists+linux-mips@lfdr.de>; Fri, 15 Jan 2021 12:38:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727111AbhAOLhz (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 15 Jan 2021 06:37:55 -0500
Received: from mout.gmx.net ([212.227.17.20]:46213 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726918AbhAOLhy (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 15 Jan 2021 06:37:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1610710578;
        bh=6/R+MOPQf+TvFBrzGya2wMdpyErzbvc4ip6wJAtA1qk=;
        h=X-UI-Sender-Class:Date:From:To:Cc:Subject;
        b=Ry3Gq0ZUaC2BIMgYbKi2Wu0V2xsphgQy9e2gFTr6sZMTrcJYT7KkRDBOahJ8QQjh0
         nt+yJyE/TTFOmPJbaz6uI7N1jYfBHvi3PxZ1KBasUtDHjrrcARRyYuud2IlJU4Ls3m
         npKsWEyOXxRRsQjqpcu02TZICoxShvMcDcCSgWuo=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from Valinor ([82.203.161.65]) by mail.gmx.com (mrgmx105
 [212.227.17.174]) with ESMTPSA (Nemesis) id 1MvsEx-1lsc102ls7-00syWy; Fri, 15
 Jan 2021 12:36:17 +0100
Date:   Fri, 15 Jan 2021 13:35:59 +0200
From:   Lauri Kasanen <cand@gmx.com>
To:     linux-mips@vger.kernel.org
Cc:     tsbogend@alpha.franken.de, axboe@kernel.dk,
        linux-block@vger.kernel.org, Keith Busch <kbusch@kernel.org>
Subject: [PATCH 3/3 v7] block: Add n64 cart driver
Message-Id: <20210115133559.84b2997dc326c277c4d91503@gmx.com>
X-Mailer: Sylpheed 3.5.0 (GTK+ 2.18.6; x86_64-unknown-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ELM/U8DGftx+Y1TkG0B8k2n8mJVB718kbZbQv8COJJrrfjGlRWH
 z8jq1zAspSi6y2LFh5wWok9/LQCMqRbZsdwyvYtDDBSPT2lJiSW0C8oy3Mqs14gX2u5mTas
 GP97g4vLDtdotEO2/wqTfhvFgqm6PWGRDIRAcqrSJWpG13VS7QfwDJRSrFUiNhv16zDYGO/
 P3EuoZeflondktEkN3YiQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:hTHrhDxLB1Q=:1bYuyTiv30TVB2bgWsBPl6
 pYeBndfMcWMf8o+klE3NyXKK1V7eEzuNYVPyGjgGpD4a03rZbtKEZRMW5PY9fsBMvqPfKoqhZ
 XtzpnxU66KWtdhiN8KfQ+Tym48qEW4mFtmE+DFZVmaHvaaeN/ZCk0TA87J8904rEK3fBHya5a
 fuVy5Gx/uAWrguEq1vFeFZw3ibGMt2DuCtnrOONER1zB+SseUYSjC8eKcjoiwgskTI04DnZdO
 12Qon6lCl1HGESjphykPE7Z3s9P9fW18EV1fwSR9kkNZ99G1wp/koJigtDW2u6tZe3MyaZnlo
 GP9RnndkLAW8mzrKDUQaGrVX0m3HQ0eXNrWvmFlWZqBxuCUx0N4vT1JAKO/zao3vsMYf5/e34
 gOZJRVxrBkgkYpFsGrik0z+FMzCw2Bw2soU78x0/mduKRO6DKhFSyl4VXGUA1pU98Hx4wxc9n
 5ubKU3LYzfW++ok68kJJ15Kyl0UC0KYlB6w9KsSApUFiZnP65esUbE42oU1G5I7e2HAmejxz/
 bOeIJChXqqKBGfwHuwizVZveIDxmfLrUmRgc8ShheabgC9cPHW4298i4uBrx77n39nEOZJ1G0
 Zr3Y+nvCKJojESmxi4biZ/7RK/8EReT1vPS1pMM9r+0UMOkoQ37WV1w/gFGJNzqqMIk4Qq64e
 xuXa68nlHyf6gWXF9Lkr6/oqi2ASXH2m+eVgq54Pjp9bUYpyquX3NFLRgYhKwL69SIr3yfKHG
 uempujEpwSYX3kG3T+MwJfT53oGD0ZwbUPYK74GoP92eRzLUfLsEGSHDBHnNgD898bQL5+eCZ
 avosWcYMVCG33QLXDboy+NiI5h4FVWV2ZeEVSfPQIDZxdY38kmHie0m2I1eg2qslZ5Ez1VahX
 iYRW/hczU363UvM6MdDQ==
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

v7:
use devm_platform_ioremap_resource

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
index 0000000..a0c1f1e
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
+	reg_base =3D devm_platform_ioremap_resource(pdev, 0);
+	if (!reg_base) {
+		err =3D -EINVAL;
+		goto fail_dma;
+	}
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

