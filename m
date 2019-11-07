Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C24ADF235C
	for <lists+linux-mips@lfdr.de>; Thu,  7 Nov 2019 01:36:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727801AbfKGAgK (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 6 Nov 2019 19:36:10 -0500
Received: from forward101j.mail.yandex.net ([5.45.198.241]:37890 "EHLO
        forward101j.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727684AbfKGAgK (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 6 Nov 2019 19:36:10 -0500
Received: from forward103q.mail.yandex.net (forward103q.mail.yandex.net [IPv6:2a02:6b8:c0e:50:0:640:b21c:d009])
        by forward101j.mail.yandex.net (Yandex) with ESMTP id A1BAB1BE0623;
        Thu,  7 Nov 2019 03:36:04 +0300 (MSK)
Received: from mxback1q.mail.yandex.net (mxback1q.mail.yandex.net [IPv6:2a02:6b8:c0e:39:0:640:25b3:aea5])
        by forward103q.mail.yandex.net (Yandex) with ESMTP id 9727561E0008;
        Thu,  7 Nov 2019 03:36:04 +0300 (MSK)
Received: from vla1-5ff4bc6b92b2.qloud-c.yandex.net (vla1-5ff4bc6b92b2.qloud-c.yandex.net [2a02:6b8:c0d:4201:0:640:5ff4:bc6b])
        by mxback1q.mail.yandex.net (mxback/Yandex) with ESMTP id k9BSR2EgXn-a4jO0oEg;
        Thu, 07 Nov 2019 03:36:04 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; s=mail; t=1573086964;
        bh=0Lq6YwOkfrlpCshPIicsfPK85Gw3mJANsusjyAh4AFE=;
        h=From:To:Subject:CC:References:Date:In-Reply-To:Message-ID;
        b=sjCi6TAV4u82WZ/hff7MhhJxOolG1r5XZ/xDCX2o/7UAHSF7WBQk9y0cyAkACgifr
         kBzHO0TSv6+SgIEE3mAzyz8nFDcB696tGCe90N6iaXOfgi5l+9XoECVBlTqARKtk9h
         ZkI/RMa89sCwbU62pvBNa2QifNOqqCQb4EJN05X0=
Authentication-Results: mxback1q.mail.yandex.net; dkim=pass header.i=@flygoat.com
Received: by vla1-5ff4bc6b92b2.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA id TouxWHQ1UQ-a2VCkA8f;
        Thu, 07 Nov 2019 03:36:02 +0300
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (Client certificate not present)
Date:   Thu, 07 Nov 2019 08:35:48 +0800
User-Agent: K-9 Mail for Android
In-Reply-To: <1573056341-21159-1-git-send-email-yangtiezhu@loongson.cn>
References: <1573056341-21159-1-git-send-email-yangtiezhu@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] MIPS: Scan the DMI system information
To:     Tiezhu Yang <yangtiezhu@loongson.cn>,
        Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        James Hogan <jhogan@kernel.org>
CC:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Yinglu Yang <yangyinglu@loongson.cn>
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <480995AF-A678-479F-A3EA-11662474E600@flygoat.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



=E4=BA=8E 2019=E5=B9=B411=E6=9C=887=E6=97=A5 GMT+08:00 =E4=B8=8A=E5=8D=881=
2:05:41, Tiezhu Yang <yangtiezhu@loongson=2Ecn> =E5=86=99=E5=88=B0:
>Enable DMI scanning on the MIPS architecture, this setups DMI
>identifiers
>(dmi_system_id) for printing it out on task dumps and prepares DIMM
>entry
>information (dmi_memdev_info) from the SMBIOS table=2E With this patch,
>the
>driver can easily match various of mainboards=2E
>
>In the SMBIOS reference specification, the table anchor string "_SM_"
>is
>present in the address range 0xF0000 to 0xFFFFF on a 16-byte boundary,
>but there exists a special case for loongson platform, when call
>function
>dmi_early_remap, it should specify the start address to 0xFFFE000 due
>to
>it is reserved for SMBIOS and can be normally access in the BIOS=2E
>
>Co-developed-by: Yinglu Yang <yangyinglu@loongson=2Ecn>
>Signed-off-by: Yinglu Yang <yangyinglu@loongson=2Ecn>
>Signed-off-by: Tiezhu Yang <yangtiezhu@loongson=2Ecn>
>---
> arch/mips/Kconfig           | 12 ++++++++++++
>arch/mips/include/asm/dmi=2Eh | 43
>+++++++++++++++++++++++++++++++++++++++++++
> arch/mips/kernel/setup=2Ec    |  2 ++
> 3 files changed, 57 insertions(+)
> create mode 100644 arch/mips/include/asm/dmi=2Eh
>
>diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
>index 7cb8947=2E=2E0a67b18 100644
>--- a/arch/mips/Kconfig
>+++ b/arch/mips/Kconfig
>@@ -2757,6 +2757,18 @@ config HW_PERF_EVENTS
> 	  Enable hardware performance counter support for perf events=2E If
> 	  disabled, perf events will use software events only=2E
>=20
>+# Mark as expert because too many people got it wrong=2E
>+# The code disables itself when not needed=2E
>+config DMI
>+	default y
>+	select DMI_SCAN_MACHINE_NON_EFI_FALLBACK
>+	bool "Enable DMI scanning" if EXPERT
>+	help
>+	  Enabled scanning of DMI to identify machine quirks=2E Say Y
>+	  here unless you have verified that your setup is not
>+	  affected by entries in the DMI blacklist=2E Required by PNP
>+	  BIOS code=2E
>+
> config SMP
> 	bool "Multi-Processing support"
> 	depends on SYS_SUPPORTS_SMP
>diff --git a/arch/mips/include/asm/dmi=2Eh b/arch/mips/include/asm/dmi=2E=
h
>new file mode 100644
>index 0000000=2E=2E1f3da37
>--- /dev/null
>+++ b/arch/mips/include/asm/dmi=2Eh
>@@ -0,0 +1,43 @@
>+/* SPDX-License-Identifier: GPL-2=2E0 */
>+#ifndef _ASM_MIPS_DMI_H
>+#define _ASM_MIPS_DMI_H
>+
>+#define dmi_early_remap		mips_early_memremap
>+#define dmi_early_unmap		mips_early_memunmap
>+#define dmi_remap(_x, _l)	mips_memremap(_x, _l, MEMREMAP_WB)
>+#define dmi_unmap(_x)		mips_memunmap(_x)
>+
>+#define dmi_alloc(l)		memblock_alloc_low(l, PAGE_SIZE)
>+
>+void __init *mips_early_memremap(resource_size_t phys_addr, unsigned
>long size)
>+{
>+#if defined(CONFIG_MACH_LOONGSON64)
>+	if (phys_addr =3D=3D 0xF0000)
>+		phys_addr =3D 0xFFFE000;
>+
>+	return (void *)TO_CAC(phys_addr);
>+#else
>+	return NULL;
>+#endif
>+}

Hi Tiezhu,

It is really tricky to hijack dmi address here during remap=2E
I think we should set the dmi table address at  dmi_scan=2Ec by a marco or=
 something else rather than hijack it during remap=2E

Btw: Probably we should set DMI default y when MACH_LOONGSON64 is set?

Thanks=2E

--=20
Jiaxun Yang
