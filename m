Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CA2C7190662
	for <lists+linux-mips@lfdr.de>; Tue, 24 Mar 2020 08:36:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725869AbgCXHgp (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 24 Mar 2020 03:36:45 -0400
Received: from sender3-op-o12.zoho.com.cn ([124.251.121.243]:17868 "EHLO
        sender3-op-o12.zoho.com.cn" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725905AbgCXHgp (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Tue, 24 Mar 2020 03:36:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1585035374;
        s=mail; d=flygoat.com; i=jiaxun.yang@flygoat.com;
        h=Date:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:To:CC:From:Message-ID;
        bh=N7IWVAlNNWp4EVuigm8wn2SOA7IIe22WZ4zksUHg6AI=;
        b=W0uk+Ri/vVVHLIRpFpRRLijwQHMACh8UuZNg25jmrt41390+ifWZEqeRYLJGyDlr
        XWl1hD6SPQ6NNotlSmXKY6FseUYMwgOizLCc2BGw7WqTFxn0wzzUJCr6w7lE2rRTjkK
        BQf6OPHh70USaSqfbSHjbzo7vZXMe2E20mjNNoHA=
Received: from [10.233.233.252] (183.157.60.227 [183.157.60.227]) by mx.zoho.com.cn
        with SMTPS id 1585035371619500.95368307954584; Tue, 24 Mar 2020 15:36:11 +0800 (CST)
Date:   Tue, 24 Mar 2020 15:36:04 +0800
User-Agent: K-9 Mail for Android
In-Reply-To: <1584932355-3642-2-git-send-email-yangtiezhu@loongson.cn>
References: <1584932355-3642-1-git-send-email-yangtiezhu@loongson.cn> <1584932355-3642-2-git-send-email-yangtiezhu@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 1/3] MIPS: Loongson: Get host bridge information
To:     Tiezhu Yang <yangtiezhu@loongson.cn>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>
CC:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <C251FD7C-87F0-454E-83D7-5198A6E060E2@flygoat.com>
X-ZohoCNMailClient: External
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



=E4=BA=8E 2020=E5=B9=B43=E6=9C=8823=E6=97=A5 GMT+08:00 =E4=B8=8A=E5=8D=881=
0:59:13, Tiezhu Yang <yangtiezhu@loongson=2Ecn> =E5=86=99=E5=88=B0:
>Read the address of HyperTransport Configuration Space to get the
>vendor ID
>and device ID of bridge chip, and then we can distinguish various types
>of
>bridge chip such as Loongson 7A1000 or AMD RS780E=2E
>
>Signed-off-by: Tiezhu Yang <yangtiezhu@loongson=2Ecn>
>---
> arch/mips/include/asm/mach-loongson64/boot_param=2Eh |  6 ++++++
>arch/mips/loongson64/env=2Ec                         | 16
>++++++++++++++++
> 2 files changed, 22 insertions(+)
>
>diff --git a/arch/mips/include/asm/mach-loongson64/boot_param=2Eh
>b/arch/mips/include/asm/mach-loongson64/boot_param=2Eh
>index 8c286be=2E=2E5e8c70d 100644
>--- a/arch/mips/include/asm/mach-loongson64/boot_param=2Eh
>+++ b/arch/mips/include/asm/mach-loongson64/boot_param=2Eh
>@@ -190,6 +190,11 @@ struct boot_params {
> 	struct efi_reset_system_t reset_system;
> };
>=20
>+enum loongson_bridge_type {
>+	RS780E =3D 1,
>+	LS7A1000 =3D 2
>+};
>+
> struct loongson_system_configuration {
> 	u32 nr_cpus;
> 	u32 nr_nodes;
>@@ -198,6 +203,7 @@ struct loongson_system_configuration {
> 	u16 boot_cpu_id;
> 	u16 reserved_cpus_mask;
> 	enum loongson_cpu_type cputype;
>+	enum loongson_bridge_type bridgetype;
> 	u64 ht_control_base;
> 	u64 pci_mem_start_addr;
> 	u64 pci_mem_end_addr;
>diff --git a/arch/mips/loongson64/env=2Ec b/arch/mips/loongson64/env=2Ec
>index 0daeb7b=2E=2E42542c7 100644
>--- a/arch/mips/loongson64/env=2Ec
>+++ b/arch/mips/loongson64/env=2Ec
>@@ -19,6 +19,8 @@
> #include <boot_param=2Eh>
> #include <workarounds=2Eh>
>=20
>+#define HT1_LO_BUS_CONFIG_BASE	0x90000efdfe000000
>+
> u32 cpu_clock_freq;
> EXPORT_SYMBOL(cpu_clock_freq);
> struct efi_memory_map_loongson *loongson_memmap;
>@@ -42,6 +44,8 @@ void __init prom_init_env(void)
> 	struct system_loongson *esys;
> 	struct efi_cpuinfo_loongson *ecpu;
> 	struct irq_source_routing_table *eirq_source;
>+	u32 id;
>+	u16 vendor, device;
>=20
> 	/* firmware arguments are initialized in head=2ES */
> 	boot_p =3D (struct boot_params *)fw_arg2;
>@@ -155,4 +159,16 @@ void __init prom_init_env(void)
> 		memcpy(loongson_sysconf=2Esensors, esys->sensors,
> 			sizeof(struct sensor_device) * loongson_sysconf=2Enr_sensors);
> 	pr_info("CpuClock =3D %u\n", cpu_clock_freq);
>+
>+	id =3D readl((u32 *)HT1_LO_BUS_CONFIG_BASE);

Is that pointer cast required?

And you'd better add a comment here like
/* Read HT PCI 00:00:00 Host Bridge's ID to detect bridge model */
Otherwise it's hard for others to understand what you are doing=2E

>+	vendor =3D id & 0xffff;
>+	device =3D (id >> 16) & 0xffff;
>+
>+	if (vendor =3D=3D 0x0014 && device =3D=3D 0x7a00) {

Please confirm with hardware design guys that bridge chip in future will h=
ave different dev ID=2E

Thanks=2E

>+		pr_info("The bridge chip is Loongson 7A1000\n");
>+		loongson_sysconf=2Ebridgetype =3D LS7A1000;
>+	} else {
>+		pr_info("The bridge chip is AMD RS780E or SR5690\n");
>+		loongson_sysconf=2Ebridgetype =3D RS780E;
>+	}
> }

--=20
Jiaxun Yang
