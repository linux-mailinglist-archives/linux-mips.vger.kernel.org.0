Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7795F3013CD
	for <lists+linux-mips@lfdr.de>; Sat, 23 Jan 2021 08:54:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726702AbhAWHxs (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 23 Jan 2021 02:53:48 -0500
Received: from mout.gmx.net ([212.227.15.15]:37721 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726558AbhAWHxr (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 23 Jan 2021 02:53:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1611388305;
        bh=I7y8lgtQprGrYsFRSWeEo7QY//ZQ3LUijxm4+cjWkeY=;
        h=X-UI-Sender-Class:Date:From:To:Cc:Subject;
        b=XQotjEe3vc0r5r674rsNuV3fyIAmse4yzhcNFRBCdo1TTbu8NDBUvQaP8fKb39gUy
         MbaBen1lTUvMEb+NsLgBLBYR7b3iiXaSBedDV7EX3pZyfuq5bTQJUuCSEIcKVLEmmS
         i6CM9q9ANNIvYOhyhX/YqjQ/SNGXEXM+NHZGdC8s=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from Valinor ([82.203.161.65]) by mail.gmx.net (mrgmx005
 [212.227.17.184]) with ESMTPSA (Nemesis) id 1N2mFi-1m1Y4b2fM4-0134Om; Sat, 23
 Jan 2021 08:51:45 +0100
Date:   Sat, 23 Jan 2021 09:53:27 +0200
From:   Lauri Kasanen <cand@gmx.com>
To:     linux-mips@vger.kernel.org
Cc:     tsbogend@alpha.franken.de, axboe@kernel.dk,
        linux-block@vger.kernel.org, Keith Busch <kbusch@kernel.org>,
        Christoph Hellwig <hch@infradead.org>
Subject: [PATCH v11] block: Add n64 cart driver
Message-Id: <20210123095327.58e5ab6c05f38e9080a79bd3@gmx.com>
X-Mailer: Sylpheed 3.5.0 (GTK+ 2.18.6; x86_64-unknown-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:QLR8caUaHO+Gglm0BoG3y+jpcJMs847lZOJQJQklBmPO/DBdzlI
 pbNX3wXZPbR5uryCGxo3cmMeTgdwB2rScX3PUGhW+OIoUFvahl3RATERR2UCLiU2VYWc5FM
 Q3LErVsckCYsOwyop5KRwWKwk6ZTzCKTE1rOK3P8aG22JYQqtqADcCT3Y1siJ9eZ3/jTg/k
 Ynv0q1TbsyC3BfZGJEi3w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:OpvZIb/0nfw=:7R8P1unyf2KkiGnj3pKocu
 oX6EGF6tz9sNs9onskI8KOcb1pmAATRu2tDmXUQgF1rd/oDx59dFe85dT8KBuAqIyjpEeBKYn
 g3lSibKXscinfPeqmjpSCJvHMNGYB1Fpwg/7g6qs6FopIGltqpa7bB/Ter4LmPxqtXVhtohlR
 i3hWHQEb6MtBPDW/Q6NATIWMsixev5iVhvc+7Wk/28JY0dh46oDoTPX6R+4+mAK0VDP7gh0o8
 AO9GelGRhvqtVDNz/ItC9rfiMPdQz6hc80uEZmVyoRwKB7ixL+HDfJGKmr+CN0oW4SZTHUvC8
 6d6oQLepiYlRIplrXarpfBlV9PQB/PKKLkESL/IXimNbLBXO+KvsXWBbNFTq2BFO2vpIJkyYs
 TUgQajtZmNLqF661oFDaQk9YCUf26CBa5f6ZW9kjkQmoB4KS1fX7+a3HMxDDe1tLVVf7KlZz0
 mtzpK0XyGJFxxq6zfL6FHoKsNUi4S9Un53MQSxr4dDxnmWRY9m8QzcEu7bABy/i+RGYHksKEg
 pP9LRYP9Bub1ZXbzTQFGkI2v0ecaHaB5AFmpRL2uy46WrXnXNLMrDs1GgmRXAsYhTyI0W1StV
 thxq/3ySsd15zQbVGjGSLeRHsjVq47q/i+mSHGNEw2F+NkBtzUoNr6Xdq07nI4mGspo/dQJu1
 9v1lazoWjtlxJNuoUpFbQm4REflpMr4qOIoS8dr0MYVUA2s6jwOj9QDzFS6UzAdDoEVXJkDCj
 ucz7JUql+C2nmW1kR0YNNtGwec4unji5bDAbJA6TwdiLEGfDSTa4GIYlMENwDhgoTzTRAoBUV
 L77mAOSdhmOMhtpi3Zz6+sYfrtj8K6sbjAx5DUNwnFly3hmYPw2pWSA0wnVwhvKUfbqlItXSy
 BQms0rPvX5kSnOaeBDDA==
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This adds support for the Nintendo 64 console's carts. Carts are a
read-only media ranging from 8mb to 64mb.

Only one cart can be connected at once, and switching it requires a
reboot.

No module support to save RAM, as the target has 8mb RAM.

Signed-off-by: Lauri Kasanen <cand@gmx.com>
=2D--
 drivers/block/Kconfig   |   6 ++
 drivers/block/Makefile  |   1 +
 drivers/block/n64cart.c | 189 +++++++++++++++++++++++++++++++++++++++++++=
+++++
 3 files changed, 196 insertions(+)
 create mode 100644 drivers/block/n64cart.c

v11:
bool n64cart_do_bvec
remove bio_end_sector() > get_capacity() check
pass bvec to helper, remove some local vars

v10:
convert to bio
DMA directly to the bio buffer

v9:
cosmetics
min_t

v8:
SZ_64K
remove barriers
add defines for block domain constants
__blk_mq_end_request
remove register_blkdev via GENHD_FL_EXT_DEVT
dma_alloc_noncoherent, sync

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
index 0000000..e76722a
=2D-- /dev/null
+++ b/drivers/block/n64cart.c
@@ -0,0 +1,189 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Support for the N64 cart.
+ *
+ * Copyright (c) 2021 Lauri Kasanen
+ */
+
+#include <linux/bitops.h>
+#include <linux/blkdev.h>
+#include <linux/dma-mapping.h>
+#include <linux/init.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+
+MODULE_AUTHOR("Lauri Kasanen <cand@gmx.com>");
+MODULE_DESCRIPTION("Driver for the N64 cart");
+MODULE_LICENSE("GPL");
+
+static unsigned int start, size;
+static u32 __iomem *reg_base;
+static struct device *dev;
+
+#define PI_DRAM_REG		0
+#define PI_CART_REG		1
+#define PI_READ_REG		2
+#define PI_WRITE_REG		3
+#define PI_STATUS_REG		4
+
+#define PI_STATUS_DMA_BUSY	(1 << 0)
+#define PI_STATUS_IO_BUSY	(1 << 1)
+
+#define CART_DOMAIN		0x10000000
+#define CART_MAX		0x1FFFFFFF
+
+#define MIN_ALIGNMENT		8
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
+/*
+ * Process a single bvec of a bio.
+ */
+static bool n64cart_do_bvec(struct device *dev, struct bio_vec *bv, u32 p=
os)
+{
+	dma_addr_t dma_addr;
+	const u32 bstart =3D pos + start;
+
+	/* Alignment check */
+	WARN_ON_ONCE((bv->bv_offset & (MIN_ALIGNMENT - 1)) ||
+		     (bv->bv_len & (MIN_ALIGNMENT - 1)));
+
+	dma_addr =3D dma_map_bvec(dev, bv, DMA_FROM_DEVICE, 0);
+	if (dma_mapping_error(dev, dma_addr))
+		return false;
+
+	n64cart_wait_dma();
+
+	n64cart_write_reg(PI_DRAM_REG, dma_addr + bv->bv_offset);
+	n64cart_write_reg(PI_CART_REG, (bstart | CART_DOMAIN) & CART_MAX);
+	n64cart_write_reg(PI_WRITE_REG, bv->bv_len - 1);
+
+	n64cart_wait_dma();
+
+	dma_unmap_page(dev, dma_addr, bv->bv_len, DMA_FROM_DEVICE);
+	return true;
+}
+
+static blk_qc_t n64cart_submit_bio(struct bio *bio)
+{
+	struct bio_vec bvec;
+	u32 pos;
+	struct bvec_iter iter;
+
+	pos =3D bio->bi_iter.bi_sector << SECTOR_SHIFT;
+
+	bio_for_each_segment(bvec, bio, iter) {
+		if (!n64cart_do_bvec(dev, &bvec, pos))
+			goto io_error;
+		pos +=3D bvec.bv_len;
+	}
+
+	bio_endio(bio);
+	return BLK_QC_T_NONE;
+io_error:
+	bio_io_error(bio);
+	return BLK_QC_T_NONE;
+}
+
+static const struct block_device_operations n64cart_fops =3D {
+	.owner		=3D THIS_MODULE,
+	.submit_bio	=3D n64cart_submit_bio,
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
+	struct request_queue *queue;
+	struct gendisk *disk;
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
+	queue =3D blk_alloc_queue(NUMA_NO_NODE);
+	if (!queue) {
+		return -ENOMEM;
+	}
+
+	reg_base =3D devm_platform_ioremap_resource(pdev, 0);
+	if (!reg_base) {
+		err =3D -EINVAL;
+		goto fail_queue;
+	}
+
+	disk =3D alloc_disk(0);
+	if (!disk) {
+		err =3D -ENOMEM;
+		goto fail_queue;
+	}
+
+	dev =3D &pdev->dev;
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

