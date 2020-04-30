Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 758251BEEA6
	for <lists+linux-mips@lfdr.de>; Thu, 30 Apr 2020 05:24:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726454AbgD3DYT (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 29 Apr 2020 23:24:19 -0400
Received: from sender3-op-o12.zoho.com.cn ([124.251.121.243]:17787 "EHLO
        sender3-op-o12.zoho.com.cn" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726431AbgD3DYT (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Wed, 29 Apr 2020 23:24:19 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1588217013; cv=none; 
        d=zoho.com.cn; s=zohoarc; 
        b=GIo2wREN+iNYh7ww3JMjajB8fxE2ua7+9eAs2AL5CT7kU1kY9mZDvCKr6NgwxprjtHBiWDPTiQU771eFHpC+DpbEuxNXXS+sP75I2jBMdaSp1LltXrRti87iOZN8BJPS5cWGdUiVVLaeJe7FrDCQos0NGBLxxGg23EJvizq7dYM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com.cn; s=zohoarc; 
        t=1588217013; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:References:Subject:To; 
        bh=eLjXJXbz1KqXBB+PX8paWXxS+pm36WZwqQB5RB0gzc4=; 
        b=kU35dfu1ZfVQUBXZZYa/xnUZyK7EXz20woVjX7+YcIbjQLoSpDdwOvBT9+u6lOMjaYaFA1JZCY/PN60O5Fx7NF0jzGgYPzOrvgVcHa5lEYXcwpGhSTtjzuele+/aawHieY6gLrYbllkD46vSC+Z+EMXu176E8c1rJ4D3TIhFwAM=
ARC-Authentication-Results: i=1; mx.zoho.com.cn;
        dkim=pass  header.i=flygoat.com;
        spf=pass  smtp.mailfrom=jiaxun.yang@flygoat.com;
        dmarc=pass header.from=<jiaxun.yang@flygoat.com> header.from=<jiaxun.yang@flygoat.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1588217013;
        s=mail; d=flygoat.com; i=jiaxun.yang@flygoat.com;
        h=Date:From:To:CC:Subject:Reply-to:In-Reply-To:References:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
        bh=eLjXJXbz1KqXBB+PX8paWXxS+pm36WZwqQB5RB0gzc4=;
        b=NlihTNgyqLczwA1v+v1MFrPx1/vo9MoD705bQsciEhRGnl7foAbLiH/TLwUNZ9Hk
        P6egaA6nD1FXiwLWLiHztFWMKVQ5DAes5SX0myXg/8RZLNg4F4yqmHhWeMhUb5JnSWj
        rkj8EjijCQzYuML/KpfT/MhrqgaJhl1rM9QZ8cKE=
Received: from [127.0.0.1] (115.205.241.207 [115.205.241.207]) by mx.zoho.com.cn
        with SMTPS id 1588217010321100.41453220362018; Thu, 30 Apr 2020 11:23:30 +0800 (CST)
Date:   Thu, 30 Apr 2020 11:23:25 +0800
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     Tiezhu Yang <yangtiezhu@loongson.cn>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Christoph Hellwig <hch@infradead.org>,
        Huacai Chen <chenhc@lemote.com>
CC:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>
Subject: Re: [PATCH v6] MIPS: Loongson: Add DMA support for LS7A
User-Agent: K-9 Mail for Android
Reply-to: jiaxun.yang@flygoat.com
In-Reply-To: <1588213867-32274-1-git-send-email-yangtiezhu@loongson.cn>
References: <1588213867-32274-1-git-send-email-yangtiezhu@loongson.cn>
Message-ID: <E8789D5E-1CBB-4D11-A4B9-16F20A0BE111@flygoat.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-ZohoCNMailClient: External
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



=E4=BA=8E 2020=E5=B9=B44=E6=9C=8830=E6=97=A5 GMT+08:00 =E4=B8=8A=E5=8D=881=
0:31:07, Tiezhu Yang <yangtiezhu@loongson=2Ecn> =E5=86=99=E5=88=B0:
>In the current market, the most used bridge chip on the Loongson
>platform are RS780E and LS7A, the RS780E bridge chip is already
>supported by the mainline kernel=2E
>
>In order to use the default implementation of __phys_to_dma() and
>__dma_to_phys() in dma-direct=2Eh, remove CONFIG_ARCH_HAS_PHYS_TO_DMA
>and then set the bus's DMA limit to 36 bit for RS780E to maintain
>downward compatibility=2E
>
>Signed-off-by: Tiezhu Yang <yangtiezhu@loongson=2Ecn>
>---
>
>Hi Christoph and Jiaxun,
>
>Thank you very much for your suggestions=2E

I'm probably going to refine this before we implement full devicetree boot=
,
but that's in far future=2E

LGTM to me for now=2E

Thanks=2E

Reviewed-by: Jiaxun Yang <jiaxun=2Eyang@flygoat=2Ecom>

>
>v5:
>  - use the default implementation of __phys_to_dma()
>    and __dma_to_phys() in dma-direct=2Eh
>
>v6:
>  - make loongson_dma_config() static
>  - put ls7a things before rs780 things
>
> arch/mips/Kconfig                                  |  1 -
> arch/mips/include/asm/mach-loongson64/boot_param=2Eh |  5 +++++
> arch/mips/loongson64/dma=2Ec                         | 22 +++++++++++---=
--------
> arch/mips/loongson64/env=2Ec                         |  2 ++
> 4 files changed, 18 insertions(+), 12 deletions(-)
>
>diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
>index 9f15539=2E=2E12b6bdb 100644
>--- a/arch/mips/Kconfig
>+++ b/arch/mips/Kconfig
>@@ -1454,7 +1454,6 @@ choice
> config CPU_LOONGSON64
> 	bool "Loongson 64-bit CPU"
> 	depends on SYS_HAS_CPU_LOONGSON64
>-	select ARCH_HAS_PHYS_TO_DMA
> 	select CPU_MIPSR2
> 	select CPU_HAS_PREFETCH
> 	select CPU_SUPPORTS_64BIT_KERNEL
>diff --git a/arch/mips/include/asm/mach-loongson64/boot_param=2Eh b/arch/=
mips/include/asm/mach-loongson64/boot_param=2Eh
>index f082d87=2E=2E0c07a96 100644
>--- a/arch/mips/include/asm/mach-loongson64/boot_param=2Eh
>+++ b/arch/mips/include/asm/mach-loongson64/boot_param=2Eh
>@@ -197,6 +197,7 @@ enum loongson_bridge_type {
> 	RS780E =3D 2
> };
>=20
>+struct pci_dev;
> struct loongson_system_configuration {
> 	u32 nr_cpus;
> 	u32 nr_nodes;
>@@ -221,9 +222,13 @@ struct loongson_system_configuration {
> 	u32 nr_sensors;
> 	struct sensor_device sensors[MAX_SENSORS];
> 	u64 workarounds;
>+	void (*dma_config)(struct pci_dev *pdev);
> };
>=20
> extern struct efi_memory_map_loongson *loongson_memmap;
> extern struct loongson_system_configuration loongson_sysconf;
>=20
>+extern void ls7a_dma_config(struct pci_dev *pdev);
>+extern void rs780e_dma_config(struct pci_dev *pdev);
>+
> #endif
>diff --git a/arch/mips/loongson64/dma=2Ec b/arch/mips/loongson64/dma=2Ec
>index 5e86635=2E=2Eef40b0d 100644
>--- a/arch/mips/loongson64/dma=2Ec
>+++ b/arch/mips/loongson64/dma=2Ec
>@@ -1,24 +1,24 @@
> // SPDX-License-Identifier: GPL-2=2E0
>-#include <linux/dma-direct=2Eh>
>+#include <linux/pci=2Eh>
> #include <linux/init=2Eh>
> #include <linux/swiotlb=2Eh>
>=20
>-dma_addr_t __phys_to_dma(struct device *dev, phys_addr_t paddr)
>+void ls7a_dma_config(struct pci_dev *pdev)
> {
>-	/* We extract 2bit node id (bit 44~47, only bit 44~45 used now) from
>-	 * Loongson-3's 48bit address space and embed it into 40bit */
>-	long nid =3D (paddr >> 44) & 0x3;
>-	return ((nid << 44) ^ paddr) | (nid << 37);
> }
>=20
>-phys_addr_t __dma_to_phys(struct device *dev, dma_addr_t daddr)
>+void rs780e_dma_config(struct pci_dev *pdev)
> {
>-	/* We extract 2bit node id (bit 44~47, only bit 44~45 used now) from
>-	 * Loongson-3's 48bit address space and embed it into 40bit */
>-	long nid =3D (daddr >> 37) & 0x3;
>-	return ((nid << 37) ^ daddr) | (nid << 44);
>+	pdev->dev=2Ebus_dma_limit =3D DMA_BIT_MASK(36);
> }
>=20
>+static void loongson_dma_config(struct pci_dev *pdev)
>+{
>+	loongson_sysconf=2Edma_config(pdev);
>+}
>+
>+DECLARE_PCI_FIXUP_EARLY(PCI_ANY_ID, PCI_ANY_ID, loongson_dma_config);
>+
> void __init plat_swiotlb_setup(void)
> {
> 	swiotlb_init(1);
>diff --git a/arch/mips/loongson64/env=2Ec b/arch/mips/loongson64/env=2Ec
>index 71f4aaf=2E=2E496f401 100644
>--- a/arch/mips/loongson64/env=2Ec
>+++ b/arch/mips/loongson64/env=2Ec
>@@ -192,8 +192,10 @@ void __init prom_init_env(void)
> 	if (vendor =3D=3D PCI_VENDOR_ID_LOONGSON && device =3D=3D 0x7a00) {
> 		pr_info("The bridge chip is LS7A\n");
> 		loongson_sysconf=2Ebridgetype =3D LS7A;
>+		loongson_sysconf=2Edma_config =3D ls7a_dma_config;
> 	} else {
> 		pr_info("The bridge chip is RS780E or SR5690\n");
> 		loongson_sysconf=2Ebridgetype =3D RS780E;
>+		loongson_sysconf=2Edma_config =3D rs780e_dma_config;
> 	}
> }

--=20
Jiaxun Yang
