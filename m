Return-Path: <linux-mips+bounces-6622-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 336069BA583
	for <lists+linux-mips@lfdr.de>; Sun,  3 Nov 2024 14:04:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 72830B20A8F
	for <lists+linux-mips@lfdr.de>; Sun,  3 Nov 2024 13:04:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8F961632F3;
	Sun,  3 Nov 2024 13:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="oMOZbE5+"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpbg154.qq.com (smtpbg154.qq.com [15.184.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CF611CAAC;
	Sun,  3 Nov 2024 13:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=15.184.224.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730639050; cv=none; b=pAmlwRNl5ho3jdPOeXY2ks32QUBUoY38/Ct9UmWY74N9R/JWYxxl5oC+6ThKPsOvyGmgPuYJTBm1/G6ugM+RVuHz0TS3GSEM0SQfCFDesdgztg39sj4glDNWqXyMFWkqE/1ztg6aBN8Mdub3MMEhHt4od7cn3LXPuvAf89om/K4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730639050; c=relaxed/simple;
	bh=rFOC205H2srLLVCs27oP/ElTrphCxTjGhIZf/hK7SUM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fbUgMBuxwoZwdG0KHrm64sxQAO/i64zsnQY+T14Jb/sJ/RIPQYI68Prnz3C0OgNfHh608GHW7IUuyL55XggSbM9adtTxofgLuMPzxgc6CwPLPpct1R1P5HpxmQ7InFo5NOAtYfUwG07b/6Gf1gq3Nf/e7mQpBGMRAhXMyRyPQCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=oMOZbE5+; arc=none smtp.client-ip=15.184.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1730638910;
	bh=cxCjNrZOXvKqymc/34w+JGr3RzWncHfZwZje6AA6RfA=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=oMOZbE5+fZK4M8GOzilnlUW6h6abC9wpCLrBVY1dvnEWlCJuc+t+kTb0dl4IDeH8Y
	 l+7IrFYUMqLHc11EDCrov1OtG4gwBQCtmQZGytMy1TpczfW+bTyc3Iho0iADk8FyHl
	 WQpO16XS2kUbJ8eR+o92C2alo1gOTr5AUrxSm4+A=
X-QQ-mid: bizesmtpip4t1730638855t3qcri9
X-QQ-Originating-IP: FAnA4kvJphbcXjpc55wFV0jM8WQDm0z9yk8N8+vFCKg=
Received: from avenger-OMEN-by-HP-Gaming-Lapto ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sun, 03 Nov 2024 21:00:53 +0800 (CST)
X-QQ-SSF: 0002000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 10277963561446323498
From: WangYuli <wangyuli@uniontech.com>
To: tsbogend@alpha.franken.de,
	wangyuli@uniontech.com,
	dhowells@redhat.com,
	jlayton@kernel.org
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	jiaxun.yang@flygoat.com,
	guanwentao@uniontech.com,
	zhanjun@uniontech.com,
	xuerpeng@uniontech.com,
	maqianga@uniontech.com,
	baimingcong@uniontech.com
Subject: [PATCH 1/2] MIPS: loongson3_defconfig: Update configs dependencies
Date: Sun,  3 Nov 2024 21:00:04 +0800
Message-ID: <12C089E57B973E9A+0dff65692bd28013d5bab52f3d0d5ba5710dfb07.1730638429.git.wangyuli@uniontech.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1730638429.git.wangyuli@uniontech.com>
References: <cover.1730638429.git.wangyuli@uniontech.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: NOIkHYnr7Vzdu6tf6eqLU/toG3SmzqWGoJ9tvFfWti/c86SyC0UsAdwA
	GfnDQcrpjjA1WTfqGosCrtWovTB79ABN/9NEMY7FPo60ixlY1RzZXheCkpU0tkqp715s/oU
	l1LfkFAai8KWc11cM5OaUT8XteIpihXrzpTQcuMlHGWUq0fSyXQuSOniqpQXbVXZukfrTZU
	c0E07dYxk9VTHr2nf3YT9QvrYHG6zDeLsvxrGXxmiBoI4tOj42qr+X7rcLqtsmBFXatGBTR
	aHr0sDxrTJXf9Wbx3jMFIUGfPMLc0jKXke6hfKgymQL5+czrCZe5IqgsI31mRBBOyKng2Fj
	/O1iEZT0OgTlreyYa2+sRK4BK5O+Z85fthnG3Z6JnS1TbsQt+4J53K9l0GDcM4DwIiGfWIG
	/N2eWTeNme2M5f6jtE5YTnMzBC5YaFOZ5HK1+ZK02XuctKbvDvGbsb3lG9bFznKrEsO7vZA
	dj/6V2Zg4RE3cuZCLKmnskd0ZuveXdYFQqZv2ER55tZ5WGJ18FryIyevLRdh9Jaq6cOrSuo
	YzRclWRuijSLr2Top7MJtb5NqkxkIpvJj+Qt9uUuR0QNEE/uYbU3TORMGsljcd0i8IXi0Nw
	4H+40cAPUkhUjArhMIanu4QJvyP0g5ERvMhwIQxJC0RI9dprE63IAp3GUyR++qmkyIpzJHk
	A5oP2i00g4RNRaucjsWR2wo/dTNjX/D9eNGeDQR9puWh5s2HEXOAIvsdxE03d9IZpEvUWZ6
	SKdgQYtM0TAJzhgTnmPi1HXdlciL28UcVOqWu45JJQxNTDyjbjk7rUpzWjgrWj3v24Qq7Sq
	xwG4HhRGxsoAd5UaXf2MfWLxkz+gPLXGk0fptR3pHw96plUnCEJWx7JepHsHQfVf5Uey2fb
	KVnDhTVGVKZUGap3AjSWzg0AiQEAQDrPKM/YsoOQ8ey4tenvhEXXDkTMipSFhaGOlj7SK9f
	7A2J2+1jXuzoX5PCzJ8cz1NV1KqfQE7zUSd8YwFgQX3bTBoEhKPnW8icwipjmiwNyTz91Lf
	X5MvmWye/TwlSFwPPCeZr0q2C0LPjcH2uLTQIjk05OWQF77+63zuNdoJLwslEV/GK3MLC33
	SPYP+bKOSvK
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
X-QQ-RECHKSPAM: 0

Due to long-term changes in kernel build configurations,
run 'make savedefconfig' to update the build configuration
dependencies.

This commit does not affect the actual .config file content,
in preparation for future modifications to loongson3_defconfig.

Signed-off-by: WangYuli <wangyuli@uniontech.com>
---
 arch/mips/configs/loongson3_defconfig | 31 +++++++--------------------
 1 file changed, 8 insertions(+), 23 deletions(-)

diff --git a/arch/mips/configs/loongson3_defconfig b/arch/mips/configs/loongson3_defconfig
index 78f498752066..30837f3b6acd 100644
--- a/arch/mips/configs/loongson3_defconfig
+++ b/arch/mips/configs/loongson3_defconfig
@@ -5,6 +5,8 @@ CONFIG_POSIX_MQUEUE=y
 CONFIG_AUDIT=y
 CONFIG_NO_HZ=y
 CONFIG_HIGH_RES_TIMERS=y
+CONFIG_BPF_SYSCALL=y
+CONFIG_BPF_JIT=y
 CONFIG_PREEMPT=y
 CONFIG_BSD_PROCESS_ACCT=y
 CONFIG_BSD_PROCESS_ACCT_V3=y
@@ -22,18 +24,16 @@ CONFIG_CGROUP_CPUACCT=y
 CONFIG_NAMESPACES=y
 CONFIG_USER_NS=y
 CONFIG_SCHED_AUTOGROUP=y
-CONFIG_SYSFS_DEPRECATED=y
 CONFIG_RELAY=y
 CONFIG_BLK_DEV_INITRD=y
-CONFIG_BPF_SYSCALL=y
 CONFIG_EXPERT=y
 CONFIG_PERF_EVENTS=y
+CONFIG_KEXEC=y
 CONFIG_MACH_LOONGSON64=y
 CONFIG_CPU_HAS_MSA=y
 CONFIG_NUMA=y
 CONFIG_NR_CPUS=16
 CONFIG_HZ_256=y
-CONFIG_KEXEC=y
 CONFIG_MIPS32_O32=y
 CONFIG_MIPS32_N32=y
 CONFIG_VIRTUALIZATION=y
@@ -47,15 +47,12 @@ CONFIG_MODVERSIONS=y
 CONFIG_PARTITION_ADVANCED=y
 CONFIG_MQ_IOSCHED_DEADLINE=m
 CONFIG_IOSCHED_BFQ=y
-CONFIG_BFQ_GROUP_IOSCHED=y
 CONFIG_BINFMT_MISC=m
 CONFIG_KSM=y
 CONFIG_NET=y
 CONFIG_PACKET=y
-CONFIG_UNIX=y
 CONFIG_XFRM_USER=y
 CONFIG_NET_KEY=y
-CONFIG_INET=y
 CONFIG_IP_MULTICAST=y
 CONFIG_IP_ADVANCED_ROUTER=y
 CONFIG_IP_MULTIPLE_TABLES=y
@@ -106,7 +103,6 @@ CONFIG_IP_NF_TARGET_ECN=m
 CONFIG_IP_NF_TARGET_TTL=m
 CONFIG_IP_NF_RAW=m
 CONFIG_IP_NF_SECURITY=m
-CONFIG_IP_NF_ARPTABLES=m
 CONFIG_IP_NF_ARPFILTER=m
 CONFIG_IP_NF_ARP_MANGLE=m
 CONFIG_NF_TABLES_IPV6=y
@@ -128,7 +124,6 @@ CONFIG_L2TP=m
 CONFIG_BRIDGE=m
 CONFIG_VSOCKETS=m
 CONFIG_VIRTIO_VSOCKETS=m
-CONFIG_BPF_JIT=y
 CONFIG_CFG80211=m
 CONFIG_CFG80211_WEXT=y
 CONFIG_MAC80211=m
@@ -167,12 +162,10 @@ CONFIG_SATA_AHCI=y
 CONFIG_PATA_ATIIXP=y
 CONFIG_MD=y
 CONFIG_BLK_DEV_MD=m
-CONFIG_MD_LINEAR=m
 CONFIG_MD_RAID0=m
 CONFIG_MD_RAID1=m
 CONFIG_MD_RAID10=m
 CONFIG_MD_RAID456=m
-CONFIG_MD_MULTIPATH=m
 CONFIG_BLK_DEV_DM=m
 CONFIG_DM_CRYPT=m
 CONFIG_DM_SNAPSHOT=m
@@ -196,7 +189,6 @@ CONFIG_VIRTIO_NET=m
 # CONFIG_NET_VENDOR_ARC is not set
 # CONFIG_NET_VENDOR_ATHEROS is not set
 # CONFIG_NET_VENDOR_BROADCOM is not set
-# CONFIG_NET_VENDOR_BROCADE is not set
 # CONFIG_NET_VENDOR_CHELSIO is not set
 # CONFIG_NET_VENDOR_CIRRUS is not set
 # CONFIG_NET_VENDOR_CISCO is not set
@@ -216,6 +208,7 @@ CONFIG_IXGBE=y
 # CONFIG_NET_VENDOR_NVIDIA is not set
 # CONFIG_NET_VENDOR_OKI is not set
 # CONFIG_NET_VENDOR_QLOGIC is not set
+# CONFIG_NET_VENDOR_BROCADE is not set
 # CONFIG_NET_VENDOR_RDC is not set
 CONFIG_8139CP=m
 CONFIG_8139TOO=m
@@ -242,7 +235,6 @@ CONFIG_PPPOL2TP=m
 CONFIG_PPP_ASYNC=m
 CONFIG_PPP_SYNC_TTY=m
 CONFIG_ATH9K=m
-CONFIG_HOSTAP=m
 CONFIG_INPUT_SPARSEKMAP=y
 CONFIG_INPUT_MOUSEDEV=y
 CONFIG_INPUT_MOUSEDEV_PSAUX=y
@@ -276,23 +268,20 @@ CONFIG_MEDIA_SUPPORT=m
 CONFIG_MEDIA_USB_SUPPORT=y
 CONFIG_USB_VIDEO_CLASS=m
 CONFIG_DRM=y
+CONFIG_DRM_RADEON=m
 CONFIG_DRM_AMDGPU=m
 CONFIG_DRM_AMDGPU_SI=y
 CONFIG_DRM_AMDGPU_CIK=y
 CONFIG_DRM_AMDGPU_USERPTR=y
 CONFIG_DRM_AMD_ACP=y
-CONFIG_DRM_AMD_DC=y
 CONFIG_DRM_AMD_DC_SI=y
 CONFIG_DRM_AST=m
-CONFIG_DRM_RADEON=m
 CONFIG_DRM_QXL=y
 CONFIG_DRM_VIRTIO_GPU=y
 CONFIG_FB=y
 CONFIG_FB_RADEON=y
 CONFIG_LCD_CLASS_DEVICE=y
 CONFIG_LCD_PLATFORM=m
-# CONFIG_VGA_CONSOLE is not set
-CONFIG_FRAMEBUFFER_CONSOLE=y
 CONFIG_FRAMEBUFFER_CONSOLE_ROTATION=y
 CONFIG_LOGO=y
 CONFIG_SOUND=y
@@ -350,13 +339,11 @@ CONFIG_EXT3_FS_SECURITY=y
 CONFIG_XFS_FS=y
 CONFIG_XFS_POSIX_ACL=y
 CONFIG_QUOTA=y
-# CONFIG_PRINT_QUOTA_WARNING is not set
 CONFIG_QFMT_V1=m
 CONFIG_QFMT_V2=m
 CONFIG_AUTOFS_FS=y
 CONFIG_FUSE_FS=m
 CONFIG_VIRTIO_FS=m
-CONFIG_NETFS_SUPPORT=m
 CONFIG_FSCACHE=y
 CONFIG_ISO9660_FS=m
 CONFIG_JOLIET=y
@@ -391,23 +378,21 @@ CONFIG_SECURITY_NETWORK=y
 CONFIG_SECURITY_PATH=y
 CONFIG_SECURITY_SELINUX=y
 CONFIG_SECURITY_SELINUX_BOOTPARAM=y
-CONFIG_SECURITY_SELINUX_DISABLE=y
 CONFIG_DEFAULT_SECURITY_DAC=y
-CONFIG_CRYPTO_HMAC=y
-CONFIG_CRYPTO_MD5=y
-CONFIG_CRYPTO_WP512=m
 CONFIG_CRYPTO_BLOWFISH=m
 CONFIG_CRYPTO_CAST5=m
 CONFIG_CRYPTO_CAST6=m
 CONFIG_CRYPTO_SERPENT=m
 CONFIG_CRYPTO_TWOFISH=m
+CONFIG_CRYPTO_HMAC=y
+CONFIG_CRYPTO_MD5=y
+CONFIG_CRYPTO_WP512=m
 CONFIG_CRYPTO_DEFLATE=m
 CONFIG_PRINTK_TIME=y
 CONFIG_STRIP_ASM_SYMS=y
 CONFIG_MAGIC_SYSRQ=y
 CONFIG_DEBUG_FS=y
 # CONFIG_SCHED_DEBUG is not set
-# CONFIG_DEBUG_PREEMPT is not set
 CONFIG_FUNCTION_TRACER=y
 CONFIG_FTRACE_SYSCALLS=y
 CONFIG_CMDLINE_BOOL=y
-- 
2.45.2


