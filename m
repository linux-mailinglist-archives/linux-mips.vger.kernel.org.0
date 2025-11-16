Return-Path: <linux-mips+bounces-12261-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BCAD0C61259
	for <lists+linux-mips@lfdr.de>; Sun, 16 Nov 2025 11:09:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5E6463B10E5
	for <lists+linux-mips@lfdr.de>; Sun, 16 Nov 2025 10:09:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5618323507C;
	Sun, 16 Nov 2025 10:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BAEOfpH0"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2943417A2E6;
	Sun, 16 Nov 2025 10:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763287780; cv=none; b=rWw6v/vzZCwF758ENk3ZjlbbQjtRD3wUM4450b1AAkJROBB5ip2xejPzwMvCP+Ik69rLbxQq9phRFTvPW3TcKYc0HbiA3Jz0X6j7lJ/Uh2DuFlAlZjM0v//VjNS4Up8tqsGJ2omNQ2cpN0HPP2JvxT5u/P6iKAccZEgYEll1a9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763287780; c=relaxed/simple;
	bh=5kUmgilcmGpbmCeuJnOjgcZwywaUiuDJFZ7OJOkKnx0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=MRaBELQjKUztnvdV64XRPDF5Y4KehDGZL/sNA9IKSj4+Dbg8rxWAwGO8iJVEQGjTE4iX8kahMBVNnHIj6eUzfJfiGZcHpl+63FjpKqACD3hei1CflpzJ31cRBvHDfhb50ij5wg2b0XI0EdfMA2SMTchTUpfCAMtJ8ZCFgvECluw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BAEOfpH0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9A37BC4CEFB;
	Sun, 16 Nov 2025 10:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763287779;
	bh=5kUmgilcmGpbmCeuJnOjgcZwywaUiuDJFZ7OJOkKnx0=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=BAEOfpH0eiWE4hWI+0Mkyc+erer6K0jnuqqUtjFsBOp1AASvU8PkwY7gFI9RBzPxP
	 0wU1+a+WjLq4J78XzKeC6ihhcD1OTTiIbl/i0Gaf+HZnYqYhmmCUlEI3zbrVmXf3em
	 U23d0vqXI+fAFzBRqi1VpSlVTzpy7L6Jhod6n269G5xUSnqePSyhr76wUrloUg32vQ
	 BFkXTvqGHpwFUpUjgbZ44/KRhRGVRanmU5l5z0cpFi2yeP46zBVzILxIFuCNundeG+
	 2uLF3xvx28KCh85dtGZhLUS2K/npCeyr3X9w9N4NIEsP5VS20UTzMQ0jdTBvS5YmmG
	 qQJ+GAbAg1H0g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87EC6CEBF61;
	Sun, 16 Nov 2025 10:09:39 +0000 (UTC)
From: Keguang Zhang via B4 Relay <devnull+keguang.zhang.gmail.com@kernel.org>
Date: Sun, 16 Nov 2025 18:08:33 +0800
Subject: [PATCH] mips: configs: loongson1: Update defconfig
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251116-loongson1_defconfig-v1-1-e1d546e00bb4@gmail.com>
X-B4-Tracking: v=1; b=H4sIAKCiGWkC/x3MQQqEMAxA0atI1hYmGSrqVUSkaNoJSCItiCDe3
 TLLt/j/hsJZuMDY3JD5lCKmFdg2sP6CJnayVQN9yCNi53YzTcUUl43jaholuUDB45cIh76HWh6
 Zo1z/6zQ/zwvrkaq6ZQAAAA==
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Binbin Zhou <zhoubinbin@loongson.cn>, 
 Vladimir Oltean <vladimir.oltean@nxp.com>, 
 Faizal Rahim <faizal.abdul.rahim@linux.intel.com>, 
 Choong Yong Liang <yong.liang.choong@linux.intel.com>, 
 Tony Nguyen <anthony.l.nguyen@intel.com>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Keguang Zhang <keguang.zhang@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763287778; l=3001;
 i=keguang.zhang@gmail.com; s=20231129; h=from:subject:message-id;
 bh=8uojbtslaA91YSaKby/lQsU31Nd5Xc8jz2Khpi1aP5g=;
 b=VTZ+bmwzeVFKL3xuqgpkkEjvNaI4somzCXdkzidJ4N69wFFP0IDgubCkPac4T4S7bIKDnZtjV
 vSXXY0/sl/FCJWDkSn28/6bNJBwY82KN9yNDEGCvFXbgjAuvNzXT2iF
X-Developer-Key: i=keguang.zhang@gmail.com; a=ed25519;
 pk=FMKGj/JgKll/MgClpNZ3frIIogsh5e5r8CeW2mr+WLs=
X-Endpoint-Received: by B4 Relay for keguang.zhang@gmail.com/20231129 with
 auth_id=102
X-Original-From: Keguang Zhang <keguang.zhang@gmail.com>
Reply-To: keguang.zhang@gmail.com

From: Keguang Zhang <keguang.zhang@gmail.com>

Update loongson1_defconfig to reflect recent Kconfig changes:
- Replace CONFIG_MTD_NAND_LOONGSON1 with CONFIG_MTD_NAND_LOONGSON,
  since commit 7a1e3a452a57 ("mtd: rawnand: loongson1: Rename the
  prefix from ls1x to loongson").
- Enable CONFIG_ETHTOOL_NETLINK, since commit 9ff2aa4206ef ("net:
  ethtool: mm: extract stmmac verification logic into common library")
  makes STMMAC_ETH depend on it.

In addition:
- Enable CONFIG_JUMP_LABEL to allow optimized static branch handling.
- Disable unnecessary options.
- Enable CONFIG_TEST_DHRY as a module.

Fixes: 7a1e3a452a57 ("mtd: rawnand: loongson1: Rename the prefix from ls1x to loongson")
Fixes: 9ff2aa4206ef ("net: ethtool: mm: extract stmmac verification logic into common library")
Signed-off-by: Keguang Zhang <keguang.zhang@gmail.com>
---
 arch/mips/configs/loongson1_defconfig | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/arch/mips/configs/loongson1_defconfig b/arch/mips/configs/loongson1_defconfig
index 81acae6f61c8..02d29110f702 100644
--- a/arch/mips/configs/loongson1_defconfig
+++ b/arch/mips/configs/loongson1_defconfig
@@ -13,6 +13,7 @@ CONFIG_EXPERT=y
 CONFIG_PERF_EVENTS=y
 CONFIG_MACH_LOONGSON32=y
 # CONFIG_SUSPEND is not set
+CONFIG_JUMP_LABEL=y
 # CONFIG_SECCOMP is not set
 # CONFIG_GCC_PLUGINS is not set
 CONFIG_MODULES=y
@@ -30,8 +31,8 @@ CONFIG_IP_PNP_DHCP=y
 CONFIG_SYN_COOKIES=y
 # CONFIG_INET_DIAG is not set
 # CONFIG_IPV6 is not set
+# CONFIG_BQL is not set
 # CONFIG_WIRELESS is not set
-# CONFIG_ETHTOOL_NETLINK is not set
 CONFIG_DEVTMPFS=y
 CONFIG_DEVTMPFS_MOUNT=y
 # CONFIG_STANDALONE is not set
@@ -39,7 +40,7 @@ CONFIG_MTD=y
 CONFIG_MTD_CMDLINE_PARTS=y
 CONFIG_MTD_BLOCK=y
 CONFIG_MTD_RAW_NAND=y
-CONFIG_MTD_NAND_LOONGSON1=y
+CONFIG_MTD_NAND_LOONGSON=y
 CONFIG_MTD_UBI=y
 CONFIG_BLK_DEV_LOOP=y
 CONFIG_SCSI=m
@@ -72,6 +73,7 @@ CONFIG_NETDEVICES=y
 # CONFIG_NET_VENDOR_MICROCHIP is not set
 # CONFIG_NET_VENDOR_MICROSEMI is not set
 # CONFIG_NET_VENDOR_MICROSOFT is not set
+# CONFIG_NET_VENDOR_MUCSE is not set
 # CONFIG_NET_VENDOR_NI is not set
 # CONFIG_NET_VENDOR_NATSEMI is not set
 # CONFIG_NET_VENDOR_NETRONOME is not set
@@ -166,15 +168,11 @@ CONFIG_ROOT_NFS=y
 CONFIG_NLS_CODEPAGE_437=m
 CONFIG_NLS_ISO8859_1=m
 # CONFIG_CRYPTO_HW is not set
-# CONFIG_XZ_DEC_X86 is not set
-# CONFIG_XZ_DEC_POWERPC is not set
-# CONFIG_XZ_DEC_ARM is not set
-# CONFIG_XZ_DEC_ARMTHUMB is not set
-# CONFIG_XZ_DEC_ARM64 is not set
-# CONFIG_XZ_DEC_SPARC is not set
-# CONFIG_XZ_DEC_RISCV is not set
 CONFIG_DYNAMIC_DEBUG=y
 # CONFIG_DEBUG_MISC is not set
 CONFIG_MAGIC_SYSRQ=y
+# CONFIG_SLUB_DEBUG is not set
+# CONFIG_RCU_TRACE is not set
 # CONFIG_FTRACE is not set
 # CONFIG_EARLY_PRINTK is not set
+CONFIG_TEST_DHRY=m

---
base-commit: e9a6fb0bcdd7609be6969112f3fbfcce3b1d4a7c
change-id: 20251116-loongson1_defconfig-a2a513221988

Best regards,
-- 
Keguang Zhang <keguang.zhang@gmail.com>



