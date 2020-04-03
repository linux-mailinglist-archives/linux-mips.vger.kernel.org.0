Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6B0FB19D3E5
	for <lists+linux-mips@lfdr.de>; Fri,  3 Apr 2020 11:39:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727792AbgDCJjM (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 3 Apr 2020 05:39:12 -0400
Received: from sender3-op-o12.zoho.com.cn ([124.251.121.243]:17879 "EHLO
        sender3-op-o12.zoho.com.cn" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727431AbgDCJjM (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 3 Apr 2020 05:39:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1585906718;
        s=mail; d=flygoat.com; i=jiaxun.yang@flygoat.com;
        h=Date:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:To:CC:From:Message-ID;
        bh=oPji02Mj10zIV94105MzH8+cFbH8kX7/x2UDE2ufQdk=;
        b=NFL2gYq6yOwR5PMtxtfMdPV3b9JEIAIDKpJF5SxosIlaHQV/dm5XVW4woY24SDPi
        y8FUtatfGCb0ZHV8lWyWvAKj9Wnr/gz+InFkczzHoXR1JzwjGxojwXklrVtWZjsdXh9
        cwLand8F5BdeATPIPM7d4gLYmm5W7dWEJ5tAB1tg=
Received: from [10.233.233.252] (115.193.87.168 [115.193.87.168]) by mx.zoho.com.cn
        with SMTPS id 1585906716374879.2219004893537; Fri, 3 Apr 2020 17:38:36 +0800 (CST)
Date:   Fri, 03 Apr 2020 17:38:28 +0800
User-Agent: K-9 Mail for Android
In-Reply-To: <1585906191-26037-2-git-send-email-yangtiezhu@loongson.cn>
References: <1585906191-26037-1-git-send-email-yangtiezhu@loongson.cn> <1585906191-26037-2-git-send-email-yangtiezhu@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 1/3] MIPS: Loongson: Get host bridge information
To:     Tiezhu Yang <yangtiezhu@loongson.cn>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>
CC:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <F7C43218-A2A0-47C7-8F90-117DD3247807@flygoat.com>
X-ZohoCNMailClient: External
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



=E4=BA=8E 2020=E5=B9=B44=E6=9C=883=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=8D=885:=
29:49, Tiezhu Yang <yangtiezhu@loongson=2Ecn> =E5=86=99=E5=88=B0:
>Read the address of host bridge configuration space to get the vendor
>ID
>and device ID of host bridge, and then we can distinguish various types
>of host bridge such as LS7A or RS780E=2E

I'm a little bit uncomfortable about this kind of hack=2E

Wish Loongson will establish a elegant boot proctol in future=2E

For this patch,

Reviewed-by: Jiaxun Yang <jiaxun=2Eyang@flygoat=2Ecom>

>
>Signed-off-by: Tiezhu Yang <yangtiezhu@loongson=2Ecn>
>---
>
>v3:
>  - Modify the macro definition HOST_BRIDGE_CONFIG_ADDR and
>    add comment to make it easy to read=2E
>  - Use PCI_VENDOR_ID_LOONGSON in pci_ids=2Eh instead of 0x0014
>
>  PCI_VENDOR_ID_LOONGSON depends on the mainline tree's commit:
>https://git=2Ekernel=2Eorg/pub/scm/linux/kernel/git/torvalds/linux=2Egit/=
commit/?id=3D9acb9fe18d86
>
>v4:
>  - Use LS7A instead of Loongson 7A1000 in the description
>  - Use LS7A or ls7a instead of LS7A1000 or ls7a1000 in the code
>
> arch/mips/include/asm/mach-loongson64/boot_param=2Eh |  6 ++++++
>arch/mips/loongson64/env=2Ec                         | 18
>++++++++++++++++++
> 2 files changed, 24 insertions(+)
>
>diff --git a/arch/mips/include/asm/mach-loongson64/boot_param=2Eh
>b/arch/mips/include/asm/mach-loongson64/boot_param=2Eh
>index 2ed483e=2E=2Efc9f14b 100644
>--- a/arch/mips/include/asm/mach-loongson64/boot_param=2Eh
>+++ b/arch/mips/include/asm/mach-loongson64/boot_param=2Eh
>@@ -192,6 +192,11 @@ struct boot_params {
> 	struct efi_reset_system_t reset_system;
> };
>=20
>+enum loongson_bridge_type {
>+	RS780E =3D 1,
>+	LS7A =3D 2
>+};
>+
> struct loongson_system_configuration {
> 	u32 nr_cpus;
> 	u32 nr_nodes;
>@@ -200,6 +205,7 @@ struct loongson_system_configuration {
> 	u16 boot_cpu_id;
> 	u16 reserved_cpus_mask;
> 	enum loongson_cpu_type cputype;
>+	enum loongson_bridge_type bridgetype;
> 	u64 ht_control_base;
> 	u64 pci_mem_start_addr;
> 	u64 pci_mem_end_addr;
>diff --git a/arch/mips/loongson64/env=2Ec b/arch/mips/loongson64/env=2Ec
>index 2554ef1=2E=2E71f4aaf 100644
>--- a/arch/mips/loongson64/env=2Ec
>+++ b/arch/mips/loongson64/env=2Ec
>@@ -14,12 +14,15 @@
>  * Author: Wu Zhangjin, wuzhangjin@gmail=2Ecom
>  */
> #include <linux/export=2Eh>
>+#include <linux/pci_ids=2Eh>
> #include <asm/bootinfo=2Eh>
> #include <loongson=2Eh>
> #include <boot_param=2Eh>
> #include <builtin_dtbs=2Eh>
> #include <workarounds=2Eh>
>=20
>+#define HOST_BRIDGE_CONFIG_ADDR	((void __iomem *)TO_UNCAC(0x1a000000))
>+
> u32 cpu_clock_freq;
> EXPORT_SYMBOL(cpu_clock_freq);
> struct efi_memory_map_loongson *loongson_memmap;
>@@ -43,6 +46,8 @@ void __init prom_init_env(void)
> 	struct system_loongson *esys;
> 	struct efi_cpuinfo_loongson *ecpu;
> 	struct irq_source_routing_table *eirq_source;
>+	u32 id;
>+	u16 vendor, device;
>=20
> 	/* firmware arguments are initialized in head=2ES */
> 	boot_p =3D (struct boot_params *)fw_arg2;
>@@ -178,4 +183,17 @@ void __init prom_init_env(void)
> 		memcpy(loongson_sysconf=2Esensors, esys->sensors,
> 			sizeof(struct sensor_device) * loongson_sysconf=2Enr_sensors);
> 	pr_info("CpuClock =3D %u\n", cpu_clock_freq);
>+
>+	/* Read the ID of PCI host bridge to detect bridge type */
>+	id =3D readl(HOST_BRIDGE_CONFIG_ADDR);
>+	vendor =3D id & 0xffff;
>+	device =3D (id >> 16) & 0xffff;
>+
>+	if (vendor =3D=3D PCI_VENDOR_ID_LOONGSON && device =3D=3D 0x7a00) {
>+		pr_info("The bridge chip is LS7A\n");
>+		loongson_sysconf=2Ebridgetype =3D LS7A;
>+	} else {
>+		pr_info("The bridge chip is RS780E or SR5690\n");
>+		loongson_sysconf=2Ebridgetype =3D RS780E;
>+	}
> }

--=20
Jiaxun Yang
