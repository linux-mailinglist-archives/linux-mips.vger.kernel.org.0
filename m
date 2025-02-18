Return-Path: <linux-mips+bounces-7823-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F100A39CAA
	for <lists+linux-mips@lfdr.de>; Tue, 18 Feb 2025 14:01:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CF31D1886366
	for <lists+linux-mips@lfdr.de>; Tue, 18 Feb 2025 13:01:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C78E52500BF;
	Tue, 18 Feb 2025 13:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="fzy9j2gS"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpbgjp3.qq.com (smtpbgjp3.qq.com [54.92.39.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 040DE2253A5;
	Tue, 18 Feb 2025 13:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.92.39.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739883673; cv=none; b=qGr2grirnQ1lxSwZReyDoHdyBj1wlU8nFH+m2HbymZkX0X58kQNvXw14n/QsOYmj0qFylqi49Ge0QuR2BUXIXZPr3puCijj41oPA9SZ77YRS+E1yq4JTjfhwCNSX264Bk8Blf165mmD4Kf4hwwNVYPUKPEWEMvxqDOV8c/YodyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739883673; c=relaxed/simple;
	bh=6oqF+bCib8jf2lrqQ8/zJqdQhhDGEGbmmLqkfrsSLwU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jIvzeASip1XfZIYICKEc8NsXN686zDY+W2kp2+E+A42nJ7zB0XZknu1BnY9AHfgPwL7I8s74HQb5qUwzJJtdtCBnGSi09zbrnUXEISkxgbA4xrGvhl8tnUNwIqJEGxIhiYfVYi4CeHu8NVE4ecZZD79/MQNkQf2K5ceehA3LZPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=fzy9j2gS; arc=none smtp.client-ip=54.92.39.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1739883632;
	bh=FVTQvr+bap4HyVov/2H0FaSNFcTDofmgSdWA3HYCwqg=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=fzy9j2gSxMl0gK3VAvx9OV+RY5I/KIUfMQ09/1kHtqkoaxs1gSbURlkWJrOMOTwMY
	 VO+sJ/wSkrTEca5rxMQIion7lVqyma4CHstkJT0uUtNiUJHPVuWnXT6xTua27xITKd
	 Ggn6Qqg9DmExd5cxq4lD19hn5YUh9f/Tngz7WH2o=
X-QQ-mid: bizesmtpip4t1739883620tb3evc5
X-QQ-Originating-IP: X8Fb7ROc3JbjtPvGkKmQ0fYqstYop3KbEVdlmrLr8V0=
Received: from localhost.localdomain ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 18 Feb 2025 21:00:18 +0800 (CST)
X-QQ-SSF: 0002000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 7438870900586338920
From: WangYuli <wangyuli@uniontech.com>
To: wangyuli@uniontech.com
Cc: chenlinxuan@uniontech.com,
	guanwentao@uniontech.com,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	macro@orcam.me.uk,
	niecheng1@uniontech.com,
	tsbogend@alpha.franken.de,
	zhanjun@uniontech.com,
	geert@linux-m68k.org,
	herbert@gondor.apana.org.au,
	ebiggers@google.com,
	ardb@kernel.org
Subject: [PATCH 6/7] MIPS: decstation_64_defconfig: Update configs dependencies
Date: Tue, 18 Feb 2025 21:00:14 +0800
Message-ID: <5375F1C4E430D0ED+20250218130015.668651-1-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <487CE8AA937621E2+20250218125101.663980-1-wangyuli@uniontech.com>
References: <487CE8AA937621E2+20250218125101.663980-1-wangyuli@uniontech.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: MfVCm2vBFdjBln10IsKUr57RzD7KcXxpg3/i0OlNnK7AiV0Td0sDdJtT
	C4L5C0vOQZC7tc8HYLfKxzVaEQVC7lwEZRDMoT/5ikkBOGfBx4wkIV5fcEX094cms5iiWRu
	J15h2+FnaNTY9mJK335tMf/FgO0VVP/T93kjTqdOHEWB32okSEeXESKUNqBGRZzJm3qKyBa
	f3cJrTq7eAX/cuEz6whUI6fPOeCKLIuovmoW5Esr1lY4HaGdmtxI+ZorfjFgksQ/yXomdYx
	kMAJ1fnQu+dlCPWYNQsAGFIgocGzEtI1hhyNjFUozFRgo7ydTefNdC8J02xxyddV2wrKNl6
	EkYSg8Q/N4y7WXvaPO3wrkpXuWvrMChicYy+r28bUElJERh2VK22KqzaVrT/9M4C59Z64fp
	e/XZozedWqb62d44bSnzOc0L7QLPHcTAEJjZ5ai5CbTecPkLKlsLs46J8yVkCzKlyemBLCP
	bdj8QSk+bkvVgVARJ5v6M8AR2JfQZwdwdq2mf055R1FspGd7Egju/918sBYXAtz4xiIfokR
	xi2ULW0h7h+Rq/o/HM4rEPKGnihpvHaaSM8a+rm3ZDb2xlvjXpafKIznIE8/02hfX7oYjrh
	THwag0Sf6tHJQS9xKBBD8/ZBInl9cfKHFiRNTV0s6uYG8yelE4PObztRjwKgu9pABjj19m8
	GcB/wXqZRey/zN4QKXZj1zr1imQ6TDGx0ihrjkKVuAByhGFeHmuPeLijqoosRd0RM3lRs16
	k5GDSaNXhVfNPOC33vh5WJAMFVTO/EyLoB0VTV65ybDAFi87cO4fY1phTMP+vNpf5zLyMfv
	UzMfse092QjITgvkJhF2AQmmGgK/YRbzmvfngA0rYERewo6IsamLgGlcl9O8NhVZnc7H75A
	i7VhaV63FDOpk+zP+KKxLCc0gI14hkN4JTqIedVmiUDtR67wDdJyyxJSwvH+0bZqJbYjOrS
	iCFk40eweK5Ogpy5yqwPPEFGirHpd6X/12cir3Zznq3pzxV1hUjOxlxorKyH3lf/LfKbD9D
	tUQis1xowGhP9HvNA+mti2jIQ2ChW+epea08TJyzf6BiWtrzy9
X-QQ-XMRINFO: Mp0Kj//9VHAxr69bL5MkOOs=
X-QQ-RECHKSPAM: 0

Due to long-term changes in kernel build configurations,
run 'make savedefconfig' to update the build configuration
dependencies.

This commit does not affect the actual .config file content,
in preparation for future modifications to decstation_64_defconfig.

Signed-off-by: WangYuli <wangyuli@uniontech.com>
---
 arch/mips/configs/decstation_64_defconfig | 44 +++++++++--------------
 1 file changed, 17 insertions(+), 27 deletions(-)

diff --git a/arch/mips/configs/decstation_64_defconfig b/arch/mips/configs/decstation_64_defconfig
index da51b9731db0..cf8e72164e40 100644
--- a/arch/mips/configs/decstation_64_defconfig
+++ b/arch/mips/configs/decstation_64_defconfig
@@ -1,27 +1,27 @@
 CONFIG_SYSVIPC=y
 CONFIG_POSIX_MQUEUE=y
 CONFIG_HIGH_RES_TIMERS=y
+CONFIG_BPF_SYSCALL=y
 CONFIG_BSD_PROCESS_ACCT=y
 CONFIG_BSD_PROCESS_ACCT_V3=y
 CONFIG_LOG_BUF_SHIFT=15
 CONFIG_EXPERT=y
 # CONFIG_SGETMASK_SYSCALL is not set
 # CONFIG_SYSFS_SYSCALL is not set
-CONFIG_BPF_SYSCALL=y
-# CONFIG_COMPAT_BRK is not set
 CONFIG_MACH_DECSTATION=y
 CONFIG_64BIT=y
-CONFIG_PAGE_SIZE_16KB=y
 CONFIG_TC=y
 CONFIG_MIPS32_O32=y
 CONFIG_MIPS32_N32=y
 # CONFIG_SUSPEND is not set
+CONFIG_PAGE_SIZE_16KB=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 CONFIG_MODULE_SRCVERSION_ALL=y
 CONFIG_PARTITION_ADVANCED=y
 CONFIG_OSF_PARTITION=y
 # CONFIG_EFI_PARTITION is not set
+# CONFIG_COMPAT_BRK is not set
 CONFIG_TRANSPARENT_HUGEPAGE=y
 CONFIG_NET=y
 CONFIG_PACKET=y
@@ -49,7 +49,6 @@ CONFIG_NETWORK_SECMARK=y
 CONFIG_IP_SCTP=m
 CONFIG_VLAN_8021Q=m
 # CONFIG_WIRELESS is not set
-# CONFIG_UEVENT_HELPER is not set
 # CONFIG_FW_LOADER is not set
 # CONFIG_ALLOW_DEV_COREDUMP is not set
 CONFIG_MTD=m
@@ -83,9 +82,9 @@ CONFIG_DECLANCE=y
 # CONFIG_NET_VENDOR_MICREL is not set
 # CONFIG_NET_VENDOR_MICROCHIP is not set
 # CONFIG_NET_VENDOR_MICROSEMI is not set
+# CONFIG_NET_VENDOR_NI is not set
 # CONFIG_NET_VENDOR_NATSEMI is not set
 # CONFIG_NET_VENDOR_NETRONOME is not set
-# CONFIG_NET_VENDOR_NI is not set
 # CONFIG_NET_VENDOR_QUALCOMM is not set
 # CONFIG_NET_VENDOR_RENESAS is not set
 # CONFIG_NET_VENDOR_ROCKER is not set
@@ -114,7 +113,6 @@ CONFIG_FB_TGA=y
 CONFIG_FB_PMAG_AA=y
 CONFIG_FB_PMAG_BA=y
 CONFIG_FB_PMAGB_B=y
-# CONFIG_VGA_CONSOLE is not set
 CONFIG_DUMMY_CONSOLE_COLUMNS=160
 CONFIG_DUMMY_CONSOLE_ROWS=64
 CONFIG_FRAMEBUFFER_CONSOLE=y
@@ -167,37 +165,29 @@ CONFIG_NLS_ISO8859_13=m
 CONFIG_NLS_ISO8859_14=m
 CONFIG_NLS_ISO8859_15=m
 CONFIG_NLS_UTF8=m
-CONFIG_CRYPTO_RSA=m
 CONFIG_CRYPTO_MANAGER=y
-CONFIG_CRYPTO_CCM=m
-CONFIG_CRYPTO_GCM=m
-CONFIG_CRYPTO_CHACHA20POLY1305=m
+CONFIG_CRYPTO_RSA=m
+CONFIG_CRYPTO_BLOWFISH=m
+CONFIG_CRYPTO_CAMELLIA=m
+CONFIG_CRYPTO_CAST5=m
+CONFIG_CRYPTO_CAST6=m
+CONFIG_CRYPTO_FCRYPT=m
+CONFIG_CRYPTO_SERPENT=m
+CONFIG_CRYPTO_TWOFISH=m
 CONFIG_CRYPTO_CTS=m
 CONFIG_CRYPTO_LRW=m
-CONFIG_CRYPTO_OFB=m
 CONFIG_CRYPTO_PCBC=m
 CONFIG_CRYPTO_XTS=m
+CONFIG_CRYPTO_CHACHA20POLY1305=m
+CONFIG_CRYPTO_CCM=m
 CONFIG_CRYPTO_CMAC=m
-CONFIG_CRYPTO_XCBC=m
-CONFIG_CRYPTO_CRC32=m
-CONFIG_CRYPTO_CRCT10DIF=m
 CONFIG_CRYPTO_MD4=m
 CONFIG_CRYPTO_MICHAEL_MIC=m
 CONFIG_CRYPTO_RMD160=m
-CONFIG_CRYPTO_SHA512=m
 CONFIG_CRYPTO_WP512=m
-CONFIG_CRYPTO_ANUBIS=m
-CONFIG_CRYPTO_ARC4=m
-CONFIG_CRYPTO_BLOWFISH=m
-CONFIG_CRYPTO_CAMELLIA=m
-CONFIG_CRYPTO_CAST5=m
-CONFIG_CRYPTO_CAST6=m
-CONFIG_CRYPTO_FCRYPT=m
-CONFIG_CRYPTO_KHAZAD=m
-CONFIG_CRYPTO_SEED=m
-CONFIG_CRYPTO_SERPENT=m
-CONFIG_CRYPTO_TEA=m
-CONFIG_CRYPTO_TWOFISH=m
+CONFIG_CRYPTO_XCBC=m
+CONFIG_CRYPTO_CRC32=m
+CONFIG_CRYPTO_CRCT10DIF=m
 CONFIG_CRYPTO_LZO=m
 CONFIG_CRYPTO_842=m
 CONFIG_CRYPTO_LZ4=m
-- 
2.47.2


