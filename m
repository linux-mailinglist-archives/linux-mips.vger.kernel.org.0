Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F7202E2BF2
	for <lists+linux-mips@lfdr.de>; Fri, 25 Dec 2020 18:05:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725953AbgLYRFr (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 25 Dec 2020 12:05:47 -0500
Received: from mout.gmx.net ([212.227.17.22]:41023 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726164AbgLYRFr (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 25 Dec 2020 12:05:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1608915854;
        bh=w7OHd5Xbuoj7IWGUrgbsqC8PhQlGXU05DPLOUYyzVNY=;
        h=X-UI-Sender-Class:Date:From:To:Cc:Subject;
        b=AYwAfuEpORCp9riZdJQh3JVzQaXmYLASVV0wMVHaSG/Wmcn7ktf+VWXoJKsDaNt+3
         8KVAFLPhGjd82/+IcsNS4iafp3WRhzrpVBNgqusVgVpHLtnsCfU39dbM3M7UmhvrT7
         c5ghuTCavLTfF81FlRV+zEqFwUWaIJhGCPOrSdIw=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from Valinor ([82.128.181.212]) by mail.gmx.com (mrgmx104
 [212.227.17.174]) with ESMTPSA (Nemesis) id 1MoO24-1kHatS186i-00onyF; Fri, 25
 Dec 2020 18:04:14 +0100
Date:   Fri, 25 Dec 2020 19:01:58 +0200
From:   Lauri Kasanen <cand@gmx.com>
To:     linux-mips@vger.kernel.org
Cc:     tsbogend@alpha.franken.de
Subject: [PATCH 6/6] block: Add n64 cart driver
Message-Id: <20201225190158.f94c679d21c4a2020c40adb4@gmx.com>
X-Mailer: Sylpheed 3.5.0 (GTK+ 2.18.6; x86_64-unknown-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:93oi1qlI6UdnzR+iv441jF7MCBTNdhKfi5vxx/zPfFCFA1vF7GY
 6Aeh1E54yGJ4/QPuFpiX68BfqgJdE2IyezInq6cTmqt4/fngNWzF2AlU9nVvsgnWymbdVcF
 IwfTjkj6bD4jB7QJEMaK8LX5qr3W39MbL0oYhxYVOjwXAX2U8sW9RdxrwIXrnsl3S38JHRA
 bvVB5uBOpi2tpeUsLuFpw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:rgijOwOeQfc=:WeDJkhdfYQGsXwo57ruFjw
 AOMNYwkfG92lg2XaBgNPXPqgBFhTWPDSTBx5tGhp9afxEfT8mWWHl1AemcyIOrMkXF6btBWlv
 Egj2vgVe/DeN8wVuId1ZUDs1K+xud9KQsTpPwHDRSFuNXclVcfAdwxrnuB7Zmx90NUTc6Dulm
 YT9DlOgkttVScMu+D3XwtSv4uxdn0WSE4OtjWOLijr6vABiglO1SjP4HR7yrODH7GNuGnQB9R
 2W2Y69UOC2yWtu6GZAmqXGyMXQWgj15aLJ9w4kTBsbMFDf6/oL07h2+HcZ1ZsNlfu/guB3AcE
 BTfG/3njf72TMJc5ND0HXqRlydtfjDCMfZUDREJV2AthkleQOCaWU9mIObCtBITY4COzT4WxP
 66q2OZhsYjLbPqxw/XUYeSRz7CZYAFEr7aaFH/48Bm9bz9kgXzC3h4BYP+4G5R9VaymxKlQfG
 p9ALe9D0UJaIQm1ARi5jNkb2PVjARejWjwVA8YocQGYSoDcb2T89+lZL6j/FqmhTlNZyLioMp
 Ivo0VMHBAGCgodecQVDtVZiWn0LjU9SfYIcO47uswnKaHh4xapaBzeQvx+oAmQ8FLbmQbY1tu
 otUsPYQmVhLR35/JARS457NKMgRw3PLn2BYzfVJw/srNTAeHtQdsOwSWie1Bm7DZu2lcmzgm5
 S9dum8YktNDAoQJMMGT47AkU7KT0GRhBuPP4olw4oe5wRilYQJcGuZ6xz5TzpPy0IdxuIzD0y
 JIhNSl7VCiPNiFYm9DOHhQydtXJROYQrIIhiX1mVYhz3IXC+lYleYwcQuuLcSSOsaMTmA3QwU
 3Ukldx0GbXf527V+0hp29qalmArLRapjCm8qo8STEvOGTV1CXcCIhLSkKy7rj0NHAKbdhbHZr
 3LhIv1cvcWoXZMbzB6Kg==
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Signed-off-by: Lauri Kasanen <cand@gmx.com>
=2D--
 drivers/block/Kconfig   |   6 ++
 drivers/block/Makefile  |   1 +
 drivers/block/n64cart.c | 203 +++++++++++++++++++++++++++++++++++++++++++=
+++++
 3 files changed, 210 insertions(+)
 create mode 100644 drivers/block/n64cart.c

diff --git a/drivers/block/Kconfig b/drivers/block/Kconfig
index ecceaaa..28a0bad 100644
=2D-- a/drivers/block/Kconfig
+++ b/drivers/block/Kconfig
@@ -72,6 +72,12 @@ config AMIGA_Z2RAM
 	  To compile this driver as a module, choose M here: the
 	  module will be called z2ram.

+config N64CART
+	bool "N64 cart support"
+	depends on MIPS_N64
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
index 0000000..83acfe2
=2D-- /dev/null
+++ b/drivers/block/n64cart.c
@@ -0,0 +1,203 @@
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
+#include <linux/spinlock.h>
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
+static DEFINE_SPINLOCK(n64cart_lock);
+
+#define REG_BASE ((u32 *) CKSEG1ADDR(0xA4600000))
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
+		;
+}
+
+static blk_status_t get_seg(struct request *req)
+{
+	u32 bstart =3D blk_rq_pos(req) * 512;
+	u32 len =3D blk_rq_cur_bytes(req);
+	void *dst =3D bio_data(req->bio);
+
+	if (bstart + len > size || rq_data_dir(req) =3D=3D WRITE)
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
+	unsigned long flags;
+	struct request *req =3D bd->rq;
+	blk_status_t err;
+
+	blk_mq_start_request(req);
+
+	spin_lock_irqsave(&n64cart_lock, flags);
+
+	do {
+		err =3D get_seg(req);
+	} while (blk_update_request(req, err, blk_rq_cur_bytes(req)));
+
+	spin_unlock_irqrestore(&n64cart_lock, flags);
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
+	queue =3D blk_mq_init_sq_queue(&tag_set, &n64cart_mq_ops, 16,
+				     BLK_MQ_F_SHOULD_MERGE);
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

