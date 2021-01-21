Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF7C92FE851
	for <lists+linux-mips@lfdr.de>; Thu, 21 Jan 2021 12:05:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729539AbhAULD5 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 21 Jan 2021 06:03:57 -0500
Received: from mout.gmx.net ([212.227.15.15]:50777 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729451AbhAULDN (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 21 Jan 2021 06:03:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1611226829;
        bh=yyD+yHb8ROzIVw/+7DCijTouXGHlJyiM+PtS7yehFQ8=;
        h=X-UI-Sender-Class:Date:From:To:Cc:Subject;
        b=YpKUPFMS6g9Oprefu8E6O5+RGwkdA1XYzaJacx79GleAp1pfQNAgWPh3zOAyBZk+I
         jD4majveibR2mx0NdX0mqYgbA7HcdlGs+d/2snuutLQyJPBkwNbx+rrgqoRmG51aFk
         bLmkTslMo4mNwRssB+WIA4npHS2s7YUdBZ+rK+PU=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from Valinor ([82.203.161.65]) by mail.gmx.net (mrgmx004
 [212.227.17.184]) with ESMTPSA (Nemesis) id 1N0X8o-1lysx70N64-00wYAY; Thu, 21
 Jan 2021 12:00:29 +0100
Date:   Thu, 21 Jan 2021 13:02:05 +0200
From:   Lauri Kasanen <cand@gmx.com>
To:     linux-mips@vger.kernel.org
Cc:     tsbogend@alpha.franken.de, axboe@kernel.dk,
        linux-block@vger.kernel.org, Keith Busch <kbusch@kernel.org>,
        Christoph Hellwig <hch@infradead.org>
Subject: [PATCH v8] block: Add n64 cart driver
Message-Id: <20210121130205.d2810df601bd00536195c87b@gmx.com>
X-Mailer: Sylpheed 3.5.0 (GTK+ 2.18.6; x86_64-unknown-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:dK4pWWs/8zrPhYho9M/sbF9yqRr0tEpYgxF/5wQQ6wbVNSCNZnt
 duahY4I7J8ZY9V0MQkGvnMxnYXncqJuBChygKRp1vxM2AfpGsSWU64FgaYao6dkexOnMaq0
 RIAG02GsMTgouJQgYIwaZE3OmmkKElyJrpnATcTDjP/W8PlwXKY4cNXE9MQbodaV0wAlF0j
 nycc1rmZwfIDg28dcUU2w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:DXfiFztYFKg=:tKHwv9DH2N4tlpkZOymXUa
 /7j31pUYcRhUhbekSLExyIpocmjBIwlnHHIZ9lRw2NfSY7ASYIyLJBOZSxmBNnAE5mvBdndTB
 QyT+X4LNOYJv485QHXxQDwlM7A7E4eDpl8CvQzaO44aUgFwoE9Bh5lWrWv6xCW0ARPTFX8wzJ
 2OVw7huHsDIxLaGuPtxBg9+7IH5GkwPr3ZHkOlU3CH1rnRMnyDMFDFYaQE/v0oRTet1s3wPkA
 ETeGseAZFQSZFOlIFktNTqcoUEJRL2BhuxXgFehFvneQgA1K8C3hPU/bv8ZdVYmt2hT8YFLgf
 GqB4POHGU0ASEFop+krRhhqtZPYvNMY01bMaiecG7PtipQIuH8BL0upMw0hJ9/MMZCaJnFDjT
 jjxil0/qGOwOeW1tx+uXvyQYkboFgIJTLD6mCDKtx/W+7ExgOcRwLa49lxQT3TiaiWx2+KW0H
 U5FECGws6ggBnmkwukczWgnpU0ajzDQ3R8NE1xOZnStqgEadeArs1JP/uB6wY9TqogiTRqnSI
 MNRR2rL/glVg00V4d8OvWnho0eH0FJ6fPMMAOwV9nUlkw+yyF1A/5+a1h7h4rbcMty30iNIq4
 +DNFXPEa8UYAmWlO6RipR4c6CcPyJQ6xZBHBsLSR+eRE+w9sruwKgSj8GPiD3NJsgbJt6rVG/
 gZZWd+OQ9ijwf1PQQ9QcgaqNnlCkpmFkCGgC2/tua5ESo7FeBiYNRf1Cltv/GCI+aZhACMh98
 6ve3dPuWOV8bOqoe04kJpQfDiqk6x8HFgRj09/lNSftxPVRtN4J4YUBTWS8eO9MJqXbPVS6Zq
 hqxEe048ALoLoLHaHgzSyFPWcdDxpcZpNeEkGJKA+XJGURzOhJ2dECOnQrMrkdfIDxjfVsQnJ
 mZAj7cKg3nIPRUHRPnIA==
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
 drivers/block/n64cart.c | 211 +++++++++++++++++++++++++++++++++++++++++++=
+++++
 3 files changed, 218 insertions(+)
 create mode 100644 drivers/block/n64cart.c

v8:
SZ_64K
remove barriers
add defines for block domain constants
__blk_mq_end_request
remove register_blkdev via GENHD_FL_EXT_DEVT
dma_alloc_noncoherent, sync

The driver patches don't depend on each other, so no point in
keeping them in a series anymore.

I don't understand the bio setup sufficiently to do a
conversion to it. Skipping that for now.

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
index 0000000..bf6f072
=2D-- /dev/null
+++ b/drivers/block/n64cart.c
@@ -0,0 +1,211 @@
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
+#include <linux/module.h>
+#include <linux/platform_device.h>
+
+MODULE_AUTHOR("Lauri Kasanen <cand@gmx.com>");
+MODULE_DESCRIPTION("Driver for the N64 cart");
+MODULE_LICENSE("GPL");
+
+#define BUFSIZE SZ_64K
+
+static unsigned int start, size;
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
+#define CART_DOMAIN 0x10000000
+#define CART_MAX 0x1FFFFFFF
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
+		dma_sync_single_for_device(disk_to_dev(disk), dma_addr,
+					   BUFSIZE, DMA_FROM_DEVICE);
+
+		n64cart_wait_dma();
+
+		n64cart_write_reg(PI_DRAM_REG, dma_addr);
+		n64cart_write_reg(PI_CART_REG,
+				  (bstart | CART_DOMAIN) & CART_MAX);
+		n64cart_write_reg(PI_WRITE_REG, curlen - 1);
+
+		n64cart_wait_dma();
+
+		dma_sync_single_for_cpu(disk_to_dev(disk), dma_addr,
+					BUFSIZE, DMA_FROM_DEVICE);
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
+	__blk_mq_end_request(req, BLK_STS_OK);
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
+	queue =3D blk_mq_init_sq_queue(&tag_set, &n64cart_mq_ops, 1,
+				     BLK_MQ_F_SHOULD_MERGE | BLK_MQ_F_BLOCKING);
+	if (IS_ERR(queue)) {
+		return PTR_ERR(queue);
+	}
+
+	buf =3D dma_alloc_noncoherent(&pdev->dev, BUFSIZE, &dma_addr,
+				    DMA_FROM_DEVICE, GFP_KERNEL);
+	if (!buf) {
+		err =3D -ENOMEM;
+		goto fail_queue;
+	}
+
+	reg_base =3D devm_platform_ioremap_resource(pdev, 0);
+	if (!reg_base) {
+		err =3D -EINVAL;
+		goto fail_dma;
+	}
+
+	disk =3D alloc_disk(0);
+	if (!disk) {
+		err =3D -ENOMEM;
+		goto fail_dma;
+	}
+
+	disk->first_minor =3D 0;
+	disk->queue =3D queue;
+	disk->flags =3D GENHD_FL_NO_PART_SCAN | GENHD_FL_EXT_DEVT;
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
+	dma_free_noncoherent(&pdev->dev, BUFSIZE, buf, dma_addr,
+			     DMA_FROM_DEVICE);
+fail_queue:
+	blk_cleanup_queue(queue);
+
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

