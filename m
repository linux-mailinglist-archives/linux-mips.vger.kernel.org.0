Return-Path: <linux-mips+bounces-3814-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A11E91195E
	for <lists+linux-mips@lfdr.de>; Fri, 21 Jun 2024 06:28:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8CCB7284CDC
	for <lists+linux-mips@lfdr.de>; Fri, 21 Jun 2024 04:28:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A121D12D1EA;
	Fri, 21 Jun 2024 04:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="ys/8q9O6"
X-Original-To: linux-mips@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FDF212C54B
	for <linux-mips@vger.kernel.org>; Fri, 21 Jun 2024 04:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718944076; cv=none; b=Xg6VACcSsKxf+vZGF+pwW5Vx2vTbGNZBqKHzl+Qtkz052QSSdk8Ye8n9FiwRtmfFhDxxCvB/mKFbOYDJ7WV8wxKoL7+H8Fk644udGG0uDVJa7hv9p0BEx+MgVchIJkXW9UKr4n2iyDIxedO23S2Jwwaklv+we0SPtB/gwJM1HLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718944076; c=relaxed/simple;
	bh=j9cfhGPeNNzwHFsKVIxKJ4hFt2Rb+og8vZCdAcUsZlY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NyE6jk+g6Oc8YvxDIoBewJ1+5+F2BQUaI25QluFO5qYG8BTQ1eZYM3W639k8tKJFx+JQIsSVtEq+nxqBpgVEtBlHlBLnX/wBMkIOL6dbC3jcJ9EczFj92njoYNAz/6Vqe99FEWreiTyS/4kjQMcJuxxZTl59ldRbrIxgaDAHg18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=ys/8q9O6; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id EA7452C041E;
	Fri, 21 Jun 2024 16:27:44 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1718944064;
	bh=F9+7tn6Gsy+6UHgAGBNvzQ5YZ4XmyKTPWhdbnt/NO9A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ys/8q9O6zQSSSgMekKu9mMfKvycQH0MISxHmrvNhEuJsGX6r4Kc7DlhbW70gpiNMu
	 nzmP1lOEzhkrbqLGlpZLaLNCtotL1bfh5Vhq2rKS7jQsGxN5sc5R+mR0NOw4KWM49+
	 ER6SWd/J1Eu8xa7YmV19yN9O4ppDjqFpuTranRJmlAmk8OoUkexR07LSdOMnE7oDyY
	 Ida6xEstWhNmPoKbei6n5vdFKOtm+qC8j4JHZqIEyNfW9M/KRUaDADq5nwu7SozxyY
	 0eQN2/ghrXT2LfPWoWAQ0Wcgh7Iy3lD7f/5bl/5TPcZgpzA06g5CqOXx7iECFsgqbP
	 +RuT+KF32IN3Q==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B667501400005>; Fri, 21 Jun 2024 16:27:44 +1200
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id 58A8613EE8E;
	Fri, 21 Jun 2024 16:27:44 +1200 (NZST)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
	id 56580280BEA; Fri, 21 Jun 2024 16:27:44 +1200 (NZST)
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
To: tglx@linutronix.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	tsbogend@alpha.franken.de,
	daniel.lezcano@linaro.org,
	paulburton@kernel.org,
	peterz@infradead.org,
	mail@birger-koblitz.de,
	bert@biot.com,
	john@phrozen.org,
	sander@svanheule.net
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	kabel@kernel.org,
	ericwouds@gmail.com,
	Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH 5/6] mips: generic: add fdt fixup for Realtek reference board
Date: Fri, 21 Jun 2024 16:27:36 +1200
Message-ID: <20240621042737.674128-6-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240621042737.674128-1-chris.packham@alliedtelesis.co.nz>
References: <20240621042737.674128-1-chris.packham@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.4 cv=CvQccW4D c=1 sm=1 tr=0 ts=66750140 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=T1WGqf2p2xoA:10 a=x-EMvBfK1kxHbq4Brr4A:9 a=3ZKOabzyN94A:10
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat

The bootloader used on the Realtek RTL9302C boards is an ancient vendor
fork of U-Boot that doesn't understand device trees. So to run a modern
kernel it is necessary use one of the APPENDED_DTB options.

When appending the DTB the inintrd information, if present, needs to be
inserted into the /chosen device tree node. The bootloader provides the
initrd start/size via the firmware environment. Add a fdt fixup that
will update the device tree with the initrd information.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---
 arch/mips/generic/Makefile        |  1 +
 arch/mips/generic/board-realtek.c | 81 +++++++++++++++++++++++++++++++
 2 files changed, 82 insertions(+)
 create mode 100644 arch/mips/generic/board-realtek.c

diff --git a/arch/mips/generic/Makefile b/arch/mips/generic/Makefile
index 56011d738441..ea0e4ad5e600 100644
--- a/arch/mips/generic/Makefile
+++ b/arch/mips/generic/Makefile
@@ -13,3 +13,4 @@ obj-$(CONFIG_LEGACY_BOARD_SEAD3)	+=3D board-sead3.o
 obj-$(CONFIG_LEGACY_BOARD_OCELOT)	+=3D board-ocelot.o
 obj-$(CONFIG_MACH_INGENIC)			+=3D board-ingenic.o
 obj-$(CONFIG_VIRT_BOARD_RANCHU)		+=3D board-ranchu.o
+obj-$(CONFIG_MACH_REALTEK_RTL)		+=3D board-realtek.o
diff --git a/arch/mips/generic/board-realtek.c b/arch/mips/generic/board-=
realtek.c
new file mode 100644
index 000000000000..91563efbc61f
--- /dev/null
+++ b/arch/mips/generic/board-realtek.c
@@ -0,0 +1,81 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (C) 2024 Allied Telesis
+ */
+
+#include <linux/errno.h>
+#include <linux/libfdt.h>
+#include <linux/of_address.h>
+#include <linux/types.h>
+
+#include <asm/fw/fw.h>
+#include <asm/machine.h>
+
+static __init int realtek_add_initrd(void *fdt)
+{
+	int node, err;
+	u32 start, size;
+
+	node =3D fdt_path_offset(fdt, "/chosen");
+	if (node < 0) {
+		pr_err("/chosen node not found\n");
+		return -ENOENT;
+	}
+
+	start =3D fw_getenvl("initrd_start");
+	size =3D fw_getenvl("initrd_size");
+
+	if (start =3D=3D 0 && size =3D=3D 0)
+		return 0;
+
+	pr_info("Adding initrd info from environment\n");
+
+	err =3D fdt_setprop_u32(fdt, node, "linux,initrd-start", start);
+	if (err) {
+		pr_err("unable to set initrd-start: %d\n", err);
+		return err;
+	}
+
+	err =3D fdt_setprop_u32(fdt, node, "linux,initrd-end", start + size);
+	if (err) {
+		pr_err("unable to set initrd-end: %d\n", err);
+		return err;
+	}
+
+	return 0;
+}
+
+static const struct mips_fdt_fixup realtek_fdt_fixups[] __initconst =3D =
{
+	{ realtek_add_initrd, "add initrd" },
+	{},
+};
+
+static __init const void *realtek_fixup_fdt(const void *fdt, const void =
*match_data)
+{
+	static unsigned char fdt_buf[16 << 10] __initdata;
+	int err;
+
+	if (fdt_check_header(fdt))
+		panic("Corrupt DT");
+
+	fw_init_cmdline();
+
+	err =3D apply_mips_fdt_fixups(fdt_buf, sizeof(fdt_buf), fdt, realtek_fd=
t_fixups);
+	if (err)
+		panic("Unable to fixup FDT: %d", err);
+
+	return fdt_buf;
+
+}
+
+static const struct of_device_id realtek_of_match[] __initconst =3D {
+	{
+		.compatible =3D "realtek,rtl930x-soc",
+	},
+	{}
+};
+
+MIPS_MACHINE(realtek) =3D {
+	.matches =3D realtek_of_match,
+	.fixup_fdt =3D realtek_fixup_fdt,
+};
--=20
2.45.2


