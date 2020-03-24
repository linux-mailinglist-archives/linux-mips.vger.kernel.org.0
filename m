Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F2AED190639
	for <lists+linux-mips@lfdr.de>; Tue, 24 Mar 2020 08:29:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725951AbgCXH3G (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 24 Mar 2020 03:29:06 -0400
Received: from sender3-op-o12.zoho.com.cn ([124.251.121.243]:17861 "EHLO
        sender3-op-o12.zoho.com.cn" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727358AbgCXH3G (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Tue, 24 Mar 2020 03:29:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1585034917;
        s=mail; d=flygoat.com; i=jiaxun.yang@flygoat.com;
        h=Date:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:To:CC:From:Message-ID;
        bh=YPD6yt9xo/Nwly3IRwv1NZqu6qfrT1ijo7UwAXpjSNQ=;
        b=IWZIHhykikweBGGqnDrymmBs9mCVENFjFYZqNLMoiOqfEryLE20nkmMMGy3cVdhw
        mw3l/8sfSsVH+TDdWtBp3K3k+y/CzEJGP9cgOE1JJL3IS+WX4zeXsDasZnXFf/l2/oO
        5n8d3RtR0YMW3Daou0WfFk95Fb/lg1b6Nn0ojeko=
Received: from [10.233.233.252] (183.157.60.227 [183.157.60.227]) by mx.zoho.com.cn
        with SMTPS id 158503491607548.52417154082593; Tue, 24 Mar 2020 15:28:36 +0800 (CST)
Date:   Tue, 24 Mar 2020 15:28:27 +0800
User-Agent: K-9 Mail for Android
In-Reply-To: <1584932355-3642-4-git-send-email-yangtiezhu@loongson.cn>
References: <1584932355-3642-1-git-send-email-yangtiezhu@loongson.cn> <1584932355-3642-4-git-send-email-yangtiezhu@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 3/3] MIPS: Loongson: Add PCI support for 7A1000
To:     Tiezhu Yang <yangtiezhu@loongson.cn>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>
CC:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <2518452B-57E0-4327-8154-0FBD9D2EC27A@flygoat.com>
X-ZohoCNMailClient: External
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



=E4=BA=8E 2020=E5=B9=B43=E6=9C=8823=E6=97=A5 GMT+08:00 =E4=B8=8A=E5=8D=881=
0:59:15, Tiezhu Yang <yangtiezhu@loongson=2Ecn> =E5=86=99=E5=88=B0:
>Add PCI support for 7A1000 to detect PCI device=2E
>
>Signed-off-by: Tiezhu Yang <yangtiezhu@loongson=2Ecn>

Hi Tiezhu,

See my comments below=2E

>---
> arch/mips/include/asm/mach-loongson64/boot_param=2Eh |  9 +++
> arch/mips/loongson64/env=2Ec                         |  2 +
>arch/mips/pci/ops-loongson3=2Ec                      | 72
>++++++++++++++++++++--
> 3 files changed, 79 insertions(+), 4 deletions(-)
>
>diff --git a/arch/mips/include/asm/mach-loongson64/boot_param=2Eh
>b/arch/mips/include/asm/mach-loongson64/boot_param=2Eh
>index c759b7c=2E=2Ed766a36 100644
>--- a/arch/mips/include/asm/mach-loongson64/boot_param=2Eh
>+++ b/arch/mips/include/asm/mach-loongson64/boot_param=2Eh
>@@ -195,6 +195,7 @@ enum loongson_bridge_type {
> 	LS7A1000 =3D 2
> };
>=20
>+struct pci_bus;
> struct loongson_system_configuration {
> 	u32 nr_cpus;
> 	u32 nr_nodes;
>@@ -220,6 +221,8 @@ struct loongson_system_configuration {
> 	struct sensor_device sensors[MAX_SENSORS];
> 	u64 workarounds;
> 	void (*early_config)(void);
>+	int (*pci_config_access)(unsigned char access_type, struct pci_bus
>*bus,
>+				 unsigned int devfn, int where, u32 *data);
> };
>=20
> extern struct efi_memory_map_loongson *loongson_memmap;
>@@ -228,5 +231,11 @@ extern struct loongson_system_configuration
>loongson_sysconf;
> extern u32 node_id_offset;
> extern void rs780e_early_config(void);
> extern void ls7a1000_early_config(void);
>+extern int rs780e_pci_config_access(unsigned char access_type,
>+		struct pci_bus *bus, unsigned int devfn,
>+		int where, u32 *data);
>+extern int ls7a1000_pci_config_access(unsigned char access_type,
>+		struct pci_bus *bus, unsigned int devfn,
>+		int where, u32 *data);
>=20
> #endif
>diff --git a/arch/mips/loongson64/env=2Ec b/arch/mips/loongson64/env=2Ec
>index 32a3822=2E=2E1c27f46 100644
>--- a/arch/mips/loongson64/env=2Ec
>+++ b/arch/mips/loongson64/env=2Ec
>@@ -168,9 +168,11 @@ void __init prom_init_env(void)
> 		pr_info("The bridge chip is Loongson 7A1000\n");
> 		loongson_sysconf=2Ebridgetype =3D LS7A1000;
> 		loongson_sysconf=2Eearly_config =3D ls7a1000_early_config;
>+		loongson_sysconf=2Epci_config_access =3D ls7a1000_pci_config_access;
> 	} else {
> 		pr_info("The bridge chip is AMD RS780E or SR5690\n");
> 		loongson_sysconf=2Ebridgetype =3D RS780E;
> 		loongson_sysconf=2Eearly_config =3D rs780e_early_config;
>+		loongson_sysconf=2Epci_config_access =3D rs780e_pci_config_access;
> 	}
> }
>diff --git a/arch/mips/pci/ops-loongson3=2Ec
>b/arch/mips/pci/ops-loongson3=2Ec
>index 2f6ad36=2E=2E0b8fc5e 100644
>--- a/arch/mips/pci/ops-loongson3=2Ec
>+++ b/arch/mips/pci/ops-loongson3=2Ec
>@@ -13,7 +13,10 @@
> #define HT1LO_PCICFG_BASE      0x1a000000
> #define HT1LO_PCICFG_BASE_TP1  0x1b000000
>=20
>-static int loongson3_pci_config_access(unsigned char access_type,
>+#define HT1LO_PCICFG_BASE_EXT 0xefe00000000
>+#define HT1LO_PCICFG_BASE_TP1_EXT 0xefe10000000
>+
>+int rs780e_pci_config_access(unsigned char access_type,
> 		struct pci_bus *bus, unsigned int devfn,
> 		int where, u32 *data)
> {
>@@ -62,11 +65,72 @@ static int loongson3_pci_config_access(unsigned
>char access_type,
> 	return PCIBIOS_SUCCESSFUL;
> }
>=20
>+
>+int ls7a1000_pci_config_access(unsigned char access_type,
>+		struct pci_bus *bus, unsigned int devfn,
>+		int where, u32 *data)
>+{
>+	u_int64_t addr;
>+	void *addrp;
>+	unsigned char busnum =3D bus->number;
>+	int device =3D PCI_SLOT(devfn);
>+	int function =3D PCI_FUNC(devfn);
>+	int reg =3D where & ~3;
>+
>+	if (where >=3D PCI_CFG_SPACE_EXP_SIZE)
>+		return PCIBIOS_DEVICE_NOT_FOUND;
>+
>+	if (busnum =3D=3D 0 && device > 23)
>+		return PCIBIOS_DEVICE_NOT_FOUND;
>+
>+	if (where < PCI_CFG_SPACE_SIZE) { /* standard config */
>+		addr =3D (busnum << 16) | (device << 11) | (function << 8) | reg;
>+		if (busnum =3D=3D 0) {
>+			addr =3D HT1LO_PCICFG_BASE | addr;
>+			addrp =3D (void *)TO_UNCAC(addr);
>+		} else {
>+			addr =3D HT1LO_PCICFG_BASE_TP1 | addr;
>+			addrp =3D (void *)TO_UNCAC(addr);
>+		}
>+	} else { /* extended config */
>+		reg =3D (reg & 0xff) | ((reg & 0xf00) << 16);
>+		addr =3D (busnum << 16) | (device << 11) | (function << 8) | reg;
>+		if (busnum =3D=3D 0) {
>+			addr =3D HT1LO_PCICFG_BASE_EXT | addr;
>+			addrp =3D (void *)TO_UNCAC(addr);
>+		} else {
>+			addr =3D HT1LO_PCICFG_BASE_TP1_EXT | addr;
>+			addrp =3D (void *)TO_UNCAC(addr);
>+		}
>+	}
>+
>+	if (access_type =3D=3D PCI_ACCESS_WRITE)
>+		*(unsigned int *)addrp =3D cpu_to_le32(*data);
>+	else {
>+		*data =3D le32_to_cpu(*(unsigned int *)addrp);
>+		if (*data =3D=3D 0xffffffff) {
>+			*data =3D -1;
>+			return PCIBIOS_DEVICE_NOT_FOUND;
>+		}
>+	}
>+
>+	return PCIBIOS_SUCCESSFUL;
>+}
>+
>+static void ls7a1000_pci_class_quirk(struct pci_dev *dev)
>+{
>+	dev->class =3D PCI_CLASS_BRIDGE_PCI << 8;
>+}
>+
>+DECLARE_PCI_FIXUP_EARLY(0x0014, 0x7a09, ls7a1000_pci_class_quirk);
>+DECLARE_PCI_FIXUP_EARLY(0x0014, 0x7a19, ls7a1000_pci_class_quirk);
>+DECLARE_PCI_FIXUP_EARLY(0x0014, 0x7a29, ls7a1000_pci_class_quirk);

Please place them to fixup-loongson3=2Ec,
don't mess up with operations=2E

And you've already added vendor ID to pci_ids=2Eh=2E
You can use it and tell us "it depends on pci-next tree's commit"=2E

>+
>static int loongson3_pci_pcibios_read(struct pci_bus *bus, unsigned int
>devfn,
> 				 int where, int size, u32 *val)
> {
> 	u32 data =3D 0;
>-	int ret =3D loongson3_pci_config_access(PCI_ACCESS_READ,
>+	int ret =3D loongson_sysconf=2Epci_config_access(PCI_ACCESS_READ,
> 			bus, devfn, where, &data);
>=20
> 	if (ret !=3D PCIBIOS_SUCCESSFUL)
>@@ -91,7 +155,7 @@ static int loongson3_pci_pcibios_write(struct
>pci_bus *bus, unsigned int devfn,
> 	if (size =3D=3D 4)
> 		data =3D val;
> 	else {
>-		ret =3D loongson3_pci_config_access(PCI_ACCESS_READ,
>+		ret =3D loongson_sysconf=2Epci_config_access(PCI_ACCESS_READ,
> 				bus, devfn, where, &data);
> 		if (ret !=3D PCIBIOS_SUCCESSFUL)
> 			return ret;
>@@ -104,7 +168,7 @@ static int loongson3_pci_pcibios_write(struct
>pci_bus *bus, unsigned int devfn,
> 			    (val << ((where & 3) << 3));
> 	}
>=20
>-	ret =3D loongson3_pci_config_access(PCI_ACCESS_WRITE,
>+	ret =3D loongson_sysconf=2Epci_config_access(PCI_ACCESS_WRITE,
> 			bus, devfn, where, &data);
>=20
> 	return ret;

--=20
Jiaxun Yang
