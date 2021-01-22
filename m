Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A73A8301031
	for <lists+linux-mips@lfdr.de>; Fri, 22 Jan 2021 23:44:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728298AbhAVWmb (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 22 Jan 2021 17:42:31 -0500
Received: from mout.gmx.net ([212.227.17.21]:46091 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730412AbhAVToL (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 22 Jan 2021 14:44:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1611344559;
        bh=U3lkMM71Iy1wCy7no+CQo7p8zFw8Xj0w/nEAOLHAws0=;
        h=X-UI-Sender-Class:Date:From:To:Cc:Subject;
        b=lTzJmqAGptq7A3RsZOCnOAbTJNOnKr1QYlxGSnr4+Em+iZJC+uAv2enH+gkR2eqIH
         t/Go+MpOJcHlltpnnqFuvzvFrG8HxnB6JQ3cTzpA6RxqPi3UcxqunMQ+rCTA+fed1u
         hPHXgLO5IUjsa2m0E3K5m4IOZQ3JUAO1q8FFW3fo=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from Valinor ([82.203.161.65]) by mail.gmx.net (mrgmx105
 [212.227.17.174]) with ESMTPSA (Nemesis) id 1M72oB-1l5WbB0UZj-008ZyW; Fri, 22
 Jan 2021 20:32:06 +0100
Date:   Fri, 22 Jan 2021 21:33:46 +0200
From:   Lauri Kasanen <cand@gmx.com>
To:     linux-mips@vger.kernel.org
Cc:     tsbogend@alpha.franken.de, axboe@kernel.dk,
        linux-block@vger.kernel.org, Keith Busch <kbusch@kernel.org>,
        Christoph Hellwig <hch@infradead.org>
Subject: [PATCH v10] block: Add n64 cart driver
Message-Id: <20210122213346.774020bb9393ebded17e7412@gmx.com>
X-Mailer: Sylpheed 3.5.0 (GTK+ 2.18.6; x86_64-unknown-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:c1bAfQ8dClaNyvNivuD7YfmcQQJcQwy5e6Cw1j/N7GPpm5bNucB
 9EBbPfooDFrzuK/Cv49lPiiSQ4BPN84RBdf9iunLd80Kd715lJ6Ft24Yn3zctVR3QNoucal
 lCRYohumG2hE4NbnFB1n6ZRXQ8WQYexOVWp+TGACu2HwAyzHGP3gnwnWz43knsZkjnIupcd
 GdPDBRVlCe7jUlw6CZ+CA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:hrHm+AseKgk=:eAA6cZ7JtOZ+0DHhHQL7X8
 fYbaLQgt21wBPkIL2tf5QOBdAQkzK0osc869uOUwrFlK3UU+rL1qS6TngxsuZdzIH4F6BqvSA
 IOvCF38KuJMa6I7qr2siFq9fekXqhWDCUR3lkImSydZnsvfsINT4yxfEwS6c7OJ93+NMeFO0t
 aWI+X53iDz6glNo1jpTVL7aBCQ+wzLk4o7B0sTHIDMfoJQ3zY9fkegzjeTkXNP5VDx4vSI9wC
 BqkA+brhKZfBjOr6+L6Xcev5BZIIBDzosJXzn4zI9cngK1mndUFt6TSkMr6PfaR1jKpmJZVft
 vhT8RDh4TqFFDNMv02GaaEnTjk4uEPs21VkTVhSS/2EHMM6rxF+5nLvnTJ5sNLiYNBK8Nl6bV
 EufjQK+/DTF6OX31MifUoOVUt1aFJZYFz45WnZEYZyWG35wk8rUDPJ1zfY/0YX7WDjhNf9X7f
 RwkOwi5mGlQind/gmTXMKGSmU5zYZzIckwhU6xb7KIb1sXeqwuLfeHGm+SKQVUNkDs3GiOhuW
 I3aJzItZ4QqCjEQeI9P695TIe7fqJiU+E8qZ5PMj/3OXP3is5u+HkFxBFV2v8rUNF1dbR+IAa
 +t49b5aU4WvNyXZ2Gyn0TYNyVKr3gmVlBvV6eTqK12j6AowIBpyqgGwb5nZgdxVhiprHjcQHS
 JhGh907wX0GyC2gceuPupPCEkFm4LjlzZmGBHDg4hOYtc4DhnjIjEKR+4eGO167NkdnGsbbt6
 OmGv3NrLvkhAAGWosv3dHfO8ULRq+pf4nA6lOP3VhTl7nyZTwtZ/khQmz9YM2jUGPGyGBpAn8
 opWgbCbuzwlBmzXebuQcaLclxDKMP7MtTNSl7HWieIyWY4j/5TL+UlRy4kco23UVaBg6Jgumw
 JNhBGiyC09fzDrbB7oxA==
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
 drivers/block/n64cart.c | 198 +++++++++++++++++++++++++++++++++++++++++++=
+++++
 3 files changed, 205 insertions(+)
 create mode 100644 drivers/block/n64cart.c

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
index 0000000..db80fe5
=2D-- /dev/null
+++ b/drivers/block/n64cart.c
@@ -0,0 +1,198 @@
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
+static int n64cart_do_bvec(struct device *dev, struct bio_vec *bv,
+			   unsigned int len, unsigned int off,
+			   u32 pos)
+{
+	dma_addr_t dma_addr;
+	const u32 bstart =3D pos + start;
+
+	dma_addr =3D dma_map_bvec(dev, bv, DMA_FROM_DEVICE, 0);
+	if (dma_mapping_error(dev, dma_addr))
+		return 1;
+
+	n64cart_wait_dma();
+
+	n64cart_write_reg(PI_DRAM_REG, dma_addr + off);
+	n64cart_write_reg(PI_CART_REG, (bstart | CART_DOMAIN) & CART_MAX);
+	n64cart_write_reg(PI_WRITE_REG, len - 1);
+
+	n64cart_wait_dma();
+
+	dma_unmap_page(dev, dma_addr, len, DMA_FROM_DEVICE);
+	return 0;
+}
+
+static blk_qc_t n64cart_submit_bio(struct bio *bio)
+{
+	struct bio_vec bvec;
+	u32 pos;
+	struct bvec_iter iter;
+
+	pos =3D bio->bi_iter.bi_sector << SECTOR_SHIFT;
+	if (bio_end_sector(bio) > get_capacity(bio->bi_disk))
+		goto io_error;
+
+	bio_for_each_segment(bvec, bio, iter) {
+		unsigned int len =3D bvec.bv_len;
+		int err;
+
+		/* Alignment check */
+		WARN_ON_ONCE((bvec.bv_offset & (MIN_ALIGNMENT - 1)) ||
+				(len & (MIN_ALIGNMENT - 1)));
+
+		err =3D n64cart_do_bvec(dev, &bvec, len,
+				      bvec.bv_offset, pos);
+		if (err)
+			goto io_error;
+		pos +=3D len;
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

