Return-Path: <linux-mips+bounces-13696-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yDxbNqMjuGk8ZgEAu9opvQ
	(envelope-from <linux-mips+bounces-13696-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 16 Mar 2026 16:37:07 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A49529C879
	for <lists+linux-mips@lfdr.de>; Mon, 16 Mar 2026 16:37:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D108D314FC0A
	for <lists+linux-mips@lfdr.de>; Mon, 16 Mar 2026 15:27:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2893D3A8757;
	Mon, 16 Mar 2026 15:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="2d2r/9+a"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C68DE3A8726;
	Mon, 16 Mar 2026 15:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773674775; cv=none; b=l88SZNJkIm2Gi4qVGbKkw8abcqwmVkN0H0fEj9x/bh0q7eFiFN7Gghr+tVpSp3jnB7U7V565XSZSsnwa2Wd+96vB4y6U729zL1yN6kd7e1Vve8rE8C3raY8TBMtcJCsXykgEiy8z4s5jvit664bePIXfevo3sme6r/XgUJ/0y+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773674775; c=relaxed/simple;
	bh=RhC9nQTjuM1c6KM2njaLTbGCv79R48+DtMxYZo0IQ8c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=a/9ePTZdST13tGejeu6M4wDWPdTPLqjagSeeTiAWwNDUzy69Une9WNf+HuiosXt7HxhGHH0UlxymWYEOElr5cG/WlgKNtABoMMrGXhPpO/x4Ft+YOK9JhiKkOfA50cXsOj0MYD7xHAsSvWZ4bmh0f0lsLuZsefr/IWFpAZ2gCko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=2d2r/9+a; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 812454E426C0;
	Mon, 16 Mar 2026 15:26:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5724B5FC4A;
	Mon, 16 Mar 2026 15:26:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 91926103721F6;
	Mon, 16 Mar 2026 16:26:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773674771; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=DMNcbL6zBp+PTc5h/KNHwWosR3kMnkkAB0mP2EbbEFc=;
	b=2d2r/9+axM3NevtzGhWnfrAYCzuRwqMHvpasKDNDMHqnDga1eSWq5PJqeRuQJUjXQVyRak
	L3QvHA12SmSYSB2wD1WpDaklC1l3Ne+4NHEx0cCjRBVFMl11uhMgmzXTX0UiBMBWlaTo5g
	ss62wpzZMw9Jr5u0wdqZUaZS5t/y/KLV4ldIoE7xlJPcSb8MLS8P+LrP6GjrJ/+GbEezle
	mliK6Vsh77b9Y7+8uhP4tNYVR3YqgHZFDhxq4uqL5wqhfBxJIBWr9+thu1CBiZrGihgJFT
	lOEZbZ52jFRklVQDzhLXWqyI4fOOdHJMiqT+GJo/V8P5uZCSCjSQjcxSuYCk3Q==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Date: Mon, 16 Mar 2026 16:25:49 +0100
Subject: [PATCH v4 12/13] MIPS: config: add eyeq6lplus_defconfig
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260316-eyeq6lplus-v4-12-bf44dfc7a261@bootlin.com>
References: <20260316-eyeq6lplus-v4-0-bf44dfc7a261@bootlin.com>
In-Reply-To: <20260316-eyeq6lplus-v4-0-bf44dfc7a261@bootlin.com>
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Linus Walleij <linusw@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, linux-mips@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13696-lists,linux-mips=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[bootlin.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[benoit.monin@bootlin.com,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bootlin.com:dkim,bootlin.com:email,bootlin.com:mid]
X-Rspamd-Queue-Id: 4A49529C879
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add a default configuration for Mobileye EyeQ6Lplus evaluation board.

Signed-off-by: Benoît Monin <benoit.monin@bootlin.com>
---
 arch/mips/configs/eyeq6lplus_defconfig | 117 +++++++++++++++++++++++++++++++++
 1 file changed, 117 insertions(+)

diff --git a/arch/mips/configs/eyeq6lplus_defconfig b/arch/mips/configs/eyeq6lplus_defconfig
new file mode 100644
index 000000000000..39430ebf8e60
--- /dev/null
+++ b/arch/mips/configs/eyeq6lplus_defconfig
@@ -0,0 +1,117 @@
+CONFIG_SYSVIPC=y
+CONFIG_NO_HZ_IDLE=y
+CONFIG_HIGH_RES_TIMERS=y
+CONFIG_BPF_SYSCALL=y
+CONFIG_TASKSTATS=y
+CONFIG_IKCONFIG=y
+CONFIG_IKCONFIG_PROC=y
+CONFIG_MEMCG=y
+CONFIG_BLK_CGROUP=y
+CONFIG_CFS_BANDWIDTH=y
+CONFIG_RT_GROUP_SCHED=y
+CONFIG_CGROUP_PIDS=y
+CONFIG_CGROUP_FREEZER=y
+CONFIG_CPUSETS=y
+CONFIG_CGROUP_DEVICE=y
+CONFIG_CGROUP_CPUACCT=y
+CONFIG_NAMESPACES=y
+CONFIG_USER_NS=y
+CONFIG_SCHED_AUTOGROUP=y
+CONFIG_BLK_DEV_INITRD=y
+CONFIG_EXPERT=y
+CONFIG_EYEQ=y
+CONFIG_MACH_EYEQ6LPLUS=y
+CONFIG_MIPS_CPS=y
+CONFIG_CPU_HAS_MSA=y
+CONFIG_NR_CPUS=16
+CONFIG_MIPS_RAW_APPENDED_DTB=y
+CONFIG_JUMP_LABEL=y
+CONFIG_PAGE_SIZE_16KB=y
+CONFIG_COMPAT_32BIT_TIME=y
+CONFIG_MODULES=y
+CONFIG_MODULE_UNLOAD=y
+CONFIG_TRIM_UNUSED_KSYMS=y
+# CONFIG_COMPAT_BRK is not set
+CONFIG_USERFAULTFD=y
+CONFIG_NET=y
+CONFIG_PACKET=y
+CONFIG_UNIX=y
+CONFIG_INET=y
+CONFIG_IP_PNP=y
+CONFIG_IP_PNP_DHCP=y
+CONFIG_NETFILTER=y
+CONFIG_CAN=y
+CONFIG_PCI=y
+CONFIG_PCI_MSI=y
+CONFIG_PCI_DEBUG=y
+CONFIG_PCI_ENDPOINT=y
+CONFIG_DEVTMPFS=y
+CONFIG_DEVTMPFS_MOUNT=y
+CONFIG_CONNECTOR=y
+CONFIG_MTD=y
+CONFIG_MTD_SPI_NAND=y
+CONFIG_MTD_UBI=y
+CONFIG_MTD_UBI_BLOCK=y
+CONFIG_SCSI=y
+CONFIG_NETDEVICES=y
+CONFIG_MACVLAN=y
+CONFIG_IPVLAN=y
+CONFIG_MACB=y
+CONFIG_MARVELL_PHY=y
+CONFIG_MICREL_PHY=y
+CONFIG_CAN_M_CAN=y
+CONFIG_SERIAL_8250=y
+CONFIG_SERIAL_8250_CONSOLE=y
+CONFIG_SERIAL_8250_DW=y
+CONFIG_HW_RANDOM=y
+CONFIG_I2C=y
+CONFIG_I2C_CHARDEV=y
+CONFIG_I2C_DESIGNWARE_CORE=y
+CONFIG_SPI=y
+CONFIG_SPI_CADENCE_QUADSPI=y
+CONFIG_SPI_DESIGNWARE=y
+CONFIG_SPI_DW_MMIO=y
+CONFIG_SPI_SPIDEV=y
+CONFIG_SPI_SLAVE=y
+# CONFIG_PTP_1588_CLOCK is not set
+CONFIG_PINCTRL=y
+CONFIG_GPIOLIB=y
+CONFIG_GPIO_DWAPB=y
+CONFIG_MFD_SYSCON=y
+CONFIG_HID_A4TECH=y
+CONFIG_HID_BELKIN=y
+CONFIG_HID_CHERRY=y
+CONFIG_HID_CYPRESS=y
+CONFIG_HID_EZKEY=y
+CONFIG_HID_ITE=y
+CONFIG_HID_KENSINGTON=y
+CONFIG_HID_REDRAGON=y
+CONFIG_HID_MICROSOFT=y
+CONFIG_HID_MONTEREY=y
+CONFIG_MMC=y
+CONFIG_MMC_SDHCI=y
+CONFIG_MMC_SDHCI_PLTFM=y
+CONFIG_MMC_SDHCI_CADENCE=y
+# CONFIG_IOMMU_SUPPORT is not set
+CONFIG_RESET_CONTROLLER=y
+# CONFIG_NVMEM is not set
+CONFIG_EXT4_FS=y
+CONFIG_EXT4_FS_POSIX_ACL=y
+CONFIG_EXT4_FS_SECURITY=y
+CONFIG_FS_ENCRYPTION=y
+CONFIG_FUSE_FS=y
+CONFIG_CUSE=y
+CONFIG_MSDOS_FS=y
+CONFIG_VFAT_FS=y
+CONFIG_TMPFS=y
+CONFIG_TMPFS_POSIX_ACL=y
+CONFIG_UBIFS_FS=y
+CONFIG_NFS_FS=y
+CONFIG_NFS_V3_ACL=y
+CONFIG_NFS_V4=y
+CONFIG_NFS_V4_2=y
+CONFIG_ROOT_NFS=y
+CONFIG_FRAME_WARN=1024
+CONFIG_DEBUG_FS=y
+# CONFIG_RCU_TRACE is not set
+# CONFIG_FTRACE is not set

-- 
2.53.0


