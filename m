Return-Path: <linux-mips+bounces-9533-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 96BAEAEB26A
	for <lists+linux-mips@lfdr.de>; Fri, 27 Jun 2025 11:14:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8102656241A
	for <lists+linux-mips@lfdr.de>; Fri, 27 Jun 2025 09:14:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60D282D9794;
	Fri, 27 Jun 2025 09:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="TSg0uwLZ"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D83B829347C;
	Fri, 27 Jun 2025 09:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751015397; cv=none; b=CrTkGac9ZsN1mUZl8X+uE14jPI+JbisR8qpZdGdN1mMXNMIGbzPC35aqZgzVYI9vgz7HMUaPC1lv63lpd806MhdQUi0jp6q/55M4KfVb0CD22LVhfRGdz6nysRTi8gFOgzaw2VeprJ8qBxvFFx7/HhDFia3XTzgGfmBwIEO2dGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751015397; c=relaxed/simple;
	bh=HTTqKIl1ruJyDw2Z8g78b+mPI9ZkBt4y8Eycbe1HcvA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YgjLfn1KEZKie8KeAwSrgpUnW3C8ZJitGHeDMYM3ZILXUw+zqxtpjlWj8H0LpOiWXNPrE9fAar9jAQidnwB7n75zdSqPM4V9ygFkrvn+AJa1pIoVk7i6aG+vl7OWDsxVneQUr/XDL/XlcHF2cSaZDOV8L3VLjw4sbHXGcZ69p0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=TSg0uwLZ; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id E92EC43917;
	Fri, 27 Jun 2025 09:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1751015393;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yFyDvKihiO8/365UCwZVhjDjhTUdM3RtaA4+iqNm6Zg=;
	b=TSg0uwLZXLskSpP8EYGNlcLfLrwVCHVwsSbdzN436o4CmrbpA8BmxZGtG1jIemrtq10gWT
	EhQDIPAtoVIV/9gYN38rJi/nYJ2D08D93Q3ttNJizNqknc2qNQ8cLQRWzQksoLoqvhBMO4
	9CymUawJ2YTtOECmYyNAC7J8LP/5nYltF14TuCQiI1bFUuozVQb0/XjIU2dwsjIVltA+jy
	J72aQgm7i+zrrnPc1tLgOBwladZC8ipzy+a6WVdIoe9IHC7xH4QeKmR9tEzqu7THWMu3sh
	gT+DQwvdYkq7abvy4JohXbEx6YvtRIfCj4EVCnHob6P+Oq7rlv0RnaTxE7Ziww==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Fri, 27 Jun 2025 11:09:02 +0200
Subject: [PATCH net-next v2 16/18] MIPS: mobileye: add EyeQ5 DMA IOCU
 support
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250627-macb-v2-16-ff8207d0bb77@bootlin.com>
References: <20250627-macb-v2-0-ff8207d0bb77@bootlin.com>
In-Reply-To: <20250627-macb-v2-0-ff8207d0bb77@bootlin.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Samuel Holland <samuel.holland@sifive.com>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, 
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, 
 Harini Katakam <harini.katakam@xilinx.com>, 
 Rafal Ozieblo <rafalo@cadence.com>, 
 Haavard Skinnemoen <hskinnemoen@atmel.com>, Jeff Garzik <jeff@garzik.org>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-mips@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddvieeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepvfhhrohoucfnvggsrhhunhcuoehthhgvohdrlhgvsghruhhnsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeelvefhkeeufedvkefghefhgfdukeejlefgtdehtdeivddtteetgedvieelieeuhfenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeiieegsgemfhdtfhhfmehfvgdutdemlegvfhgunecuvehluhhsthgvrhfuihiivgepudehnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemieeigegsmehftdhffhemfhgvuddtmeelvghfugdphhgvlhhopegludelvddrudeikedruddtrddvudegngdpmhgrihhlfhhrohhmpehthhgvohdrlhgvsghruhhnsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefvddprhgtphhtthhopehrihgthhgrrhgutghotghhrhgrnhesghhmrghilhdrtghomhdprhgtphhtthhopehnvghtuggvvhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehvlhgrughimhhirhdrkhhonhgurhgrthhivghvsehmohgsihhlvgihvgdrt
 ghomhdprhgtphhtthhopegrohhusegvvggtshdrsggvrhhkvghlvgihrdgvughupdhrtghpthhtohepphgruhhlrdifrghlmhhslhgvhiesshhifhhivhgvrdgtohhmpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhssghoghgvnhgusegrlhhphhgrrdhfrhgrnhhkvghnrdguvgdprhgtphhtthhopehprggsvghnihesrhgvughhrghtrdgtohhm
X-GND-Sasl: theo.lebrun@bootlin.com

Both Cadence GEM Ethernet controllers on EyeQ5 are hardwired through CM3
IO Coherency Units (IOCU). For DMA coherent accesses, BIT(36) must be
set in DMA addresses.

Implement that in platform-specific dma_map_ops which get attached to
both instances of `cdns,eyeq5-gem` through a notifier block.

Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
 MAINTAINERS                         |   2 +-
 arch/mips/mobileye/Kconfig          |   1 +
 arch/mips/mobileye/Makefile         |   2 +
 arch/mips/mobileye/eyeq5-iocu-dma.c | 160 ++++++++++++++++++++++++++++++++++++
 4 files changed, 164 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index bb9df569a3fff41ab40d7da5843f1e8564b47bf2..7ee68d7f8e8d0632846f59579412458e301bd8fb 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16789,7 +16789,7 @@ F:	Documentation/devicetree/bindings/mips/mobileye.yaml
 F:	Documentation/devicetree/bindings/soc/mobileye/
 F:	arch/mips/boot/dts/mobileye/
 F:	arch/mips/configs/eyeq5_defconfig
-F:	arch/mips/mobileye/board-epm5.its.S
+F:	arch/mips/mobileye/
 F:	drivers/clk/clk-eyeq.c
 F:	drivers/pinctrl/pinctrl-eyeq5.c
 F:	drivers/reset/reset-eyeq.c
diff --git a/arch/mips/mobileye/Kconfig b/arch/mips/mobileye/Kconfig
index f9abb2d6e1787dbc5a173db48606ed5a02088e41..b9040f3a9b3ddc7f5addcd8e5f110cb9c775b6b1 100644
--- a/arch/mips/mobileye/Kconfig
+++ b/arch/mips/mobileye/Kconfig
@@ -9,6 +9,7 @@ choice
 
 	config MACH_EYEQ5
 		bool "Mobileye EyeQ5 SoC"
+		select ARCH_HAS_DMA_OPS
 
 	config MACH_EYEQ6H
 		bool "Mobileye EyeQ6H SoC"
diff --git a/arch/mips/mobileye/Makefile b/arch/mips/mobileye/Makefile
index 315c06b689cfbb83f9f205d1140ecf5058e2aa02..50fc7d0ae167c3fb3dc8585bcd45583c6cc3f2d2 100644
--- a/arch/mips/mobileye/Makefile
+++ b/arch/mips/mobileye/Makefile
@@ -1 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0-or-later
+
+obj-$(CONFIG_MACH_EYEQ5)               += eyeq5-iocu-dma.o
diff --git a/arch/mips/mobileye/eyeq5-iocu-dma.c b/arch/mips/mobileye/eyeq5-iocu-dma.c
new file mode 100644
index 0000000000000000000000000000000000000000..71d1c35f911636db141c4467dccc405af69835ec
--- /dev/null
+++ b/arch/mips/mobileye/eyeq5-iocu-dma.c
@@ -0,0 +1,160 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/bits.h>
+#include <linux/device.h>
+#include <linux/device/bus.h>
+#include <linux/dma-direct.h>
+#include <linux/dma-direction.h>
+#include <linux/dma-map-ops.h>
+#include <linux/dma-mapping.h>
+#include <linux/errno.h>
+#include <linux/export.h>
+#include <linux/gfp_types.h>
+#include <linux/init.h>
+#include <linux/mm.h>
+#include <linux/mm_types.h>
+#include <linux/notifier.h>
+#include <linux/pfn.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
+#include <linux/scatterlist.h>
+#include <linux/types.h>
+
+static void *eyeq5_iocu_alloc(struct device *dev, size_t size,
+			      dma_addr_t *dma_handle, gfp_t gfp,
+			      unsigned long attrs)
+{
+	void *p = dma_direct_alloc(dev, size, dma_handle, gfp, attrs);
+
+	*dma_handle |= BIT_ULL(36);
+	return p;
+}
+
+static void eyeq5_iocu_free(struct device *dev, size_t size,
+			    void *vaddr, dma_addr_t dma_handle,
+			    unsigned long attrs)
+{
+	dma_handle &= ~BIT_ULL(36);
+	dma_direct_free(dev, size, vaddr, dma_handle, attrs);
+}
+
+static int eyeq5_iocu_mmap(struct device *dev, struct vm_area_struct *vma,
+			   void *cpu_addr, dma_addr_t dma_addr, size_t size,
+			   unsigned long attrs)
+{
+	unsigned long pfn = PHYS_PFN(dma_to_phys(dev, dma_addr));
+	unsigned long count = PAGE_ALIGN(size) >> PAGE_SHIFT;
+	unsigned long user_count = vma_pages(vma);
+	int ret;
+
+	vma->vm_page_prot = dma_pgprot(dev, vma->vm_page_prot, attrs);
+
+	if (dma_mmap_from_dev_coherent(dev, vma, cpu_addr, size, &ret))
+		return ret;
+
+	if (vma->vm_pgoff >= count || user_count > count - vma->vm_pgoff)
+		return -ENXIO;
+
+	return remap_pfn_range(vma, vma->vm_start, pfn + vma->vm_pgoff,
+			       user_count << PAGE_SHIFT, vma->vm_page_prot);
+}
+
+static int eyeq5_iocu_get_sgtable(struct device *dev, struct sg_table *sgt,
+				  void *cpu_addr, dma_addr_t dma_addr, size_t size,
+				  unsigned long attrs)
+{
+	struct page *page = virt_to_page(cpu_addr);
+	int ret;
+
+	ret = sg_alloc_table(sgt, 1, GFP_KERNEL);
+	if (!ret)
+		sg_set_page(sgt->sgl, page, PAGE_ALIGN(size), 0);
+	return ret;
+}
+
+static dma_addr_t eyeq5_iocu_map_page(struct device *dev, struct page *page,
+				      unsigned long offset, size_t size,
+				      enum dma_data_direction dir,
+				      unsigned long attrs)
+{
+	phys_addr_t phys = page_to_phys(page) + offset;
+
+	/* BIT(36) toggles routing through IOCU for DMA operations. */
+	return phys_to_dma(dev, phys) | BIT_ULL(36);
+}
+
+static void eyeq5_iocu_unmap_page(struct device *dev, dma_addr_t dma_handle,
+				  size_t size, enum dma_data_direction dir,
+		unsigned long attrs)
+{
+}
+
+static int eyeq5_iocu_map_sg(struct device *dev, struct scatterlist *sgl,
+			     int nents, enum dma_data_direction dir,
+			     unsigned long attrs)
+{
+	struct scatterlist *sg;
+	int i;
+
+	for_each_sg(sgl, sg, nents, i) {
+		sg->dma_address = eyeq5_iocu_map_page(dev, sg_page(sg),
+						      sg->offset, sg->length,
+						      dir, attrs);
+		if (sg->dma_address == DMA_MAPPING_ERROR)
+			return 0; /* No cleanup because ->unmap_page() is a no-op. */
+		sg_dma_len(sg) = sg->length;
+	}
+
+	return nents;
+}
+
+static void eyeq5_iocu_unmap_sg(struct device *dev, struct scatterlist *sgl,
+				int nents, enum dma_data_direction dir,
+				unsigned long attrs)
+{
+	/* We know page ->unmap_page() is a no-op. */
+}
+
+const struct dma_map_ops eyeq5_iocu_ops = {
+	.alloc			= eyeq5_iocu_alloc,
+	.free			= eyeq5_iocu_free,
+	.alloc_pages_op		= dma_direct_alloc_pages,
+	.free_pages		= dma_direct_free_pages,
+	.mmap			= eyeq5_iocu_mmap,
+	.get_sgtable		= eyeq5_iocu_get_sgtable,
+	.map_page		= eyeq5_iocu_map_page,
+	.unmap_page		= eyeq5_iocu_unmap_page,
+	.map_sg			= eyeq5_iocu_map_sg,
+	.unmap_sg		= eyeq5_iocu_unmap_sg,
+	.get_required_mask	= dma_direct_get_required_mask,
+};
+EXPORT_SYMBOL(eyeq5_iocu_ops);
+
+static int eyeq5_iocu_notifier(struct notifier_block *nb,
+			       unsigned long event,
+			       void *data)
+{
+	struct device *dev = data;
+
+	/*
+	 * IOCU routing is hardwired; we must use our above custom
+	 * routines for cache-coherent DMA on ethernet interfaces.
+	 */
+	if (event == BUS_NOTIFY_ADD_DEVICE &&
+	    device_is_compatible(dev, "mobileye,eyeq5-gem")) {
+		set_dma_ops(dev, &eyeq5_iocu_ops);
+		return NOTIFY_OK;
+	}
+
+	return NOTIFY_DONE;
+}
+
+static struct notifier_block eyeq5_iocu_nb = {
+	.notifier_call = eyeq5_iocu_notifier,
+};
+
+static int __init eyeq5_iocu_init(void)
+{
+	return bus_register_notifier(&platform_bus_type, &eyeq5_iocu_nb);
+}
+postcore_initcall(eyeq5_iocu_init);

-- 
2.50.0


