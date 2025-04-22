Return-Path: <linux-mips+bounces-8692-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BDD1A965CB
	for <lists+linux-mips@lfdr.de>; Tue, 22 Apr 2025 12:24:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5DD9C3B57B1
	for <lists+linux-mips@lfdr.de>; Tue, 22 Apr 2025 10:24:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDFE2201262;
	Tue, 22 Apr 2025 10:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="Vq+IwI1+"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpbgau2.qq.com (smtpbgau2.qq.com [54.206.34.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2D6E2116EB;
	Tue, 22 Apr 2025 10:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.34.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745317456; cv=none; b=g8feHiCcGKK7Iz0oZxINvlJFH31CqXPjPXCsHv6hn/wnfKfBPeoY5+XpdjZdS/sK/qQemmZS5cyr1F/OxXe8FsMJUl8g0KgGfBNRmKL8VMjQ2susGxgmuIYJgGuu0SfCjXkCX38FID1oY1jjnWzYfbDeSBR8MUAPU1SbfY4JGTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745317456; c=relaxed/simple;
	bh=DwnHJKjSRTcNroFg/p73E0l/JHIa6S8hPby+gFI9qpQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=alHPgJB2icgzaj2LUenpe4xQf9ODNk9fLMSTXlbug1Pa+7cE1VP0yUuFa0KawqbCUHVR4SmhvWZE9sp8wzIOoJr2FiT1M6osxuJeee+rkevO0mwao1XpDot2cd2ubD28ONHd0OJLrdDg6KEZje1XehNAsH1PhOAa5fG2BzKcv5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=Vq+IwI1+; arc=none smtp.client-ip=54.206.34.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1745317443;
	bh=/kCJEwIi51vpS2czRIPch3YPYBe5K2hVZT8aTmupNNc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=Vq+IwI1+QZnq4aI3jWuCzmCbbb0chMcG+Kc5FSX/WdIFq3+Xo1lCqshdEb+rATwt+
	 fko10VuHRcCjATiEuePR+pIMjUlsL3S3Okn7lipPoj0bz9ucPYRzO0gwTcWbZws44r
	 QcePHnS6APk6zyvuHjxTZbfhVXeFJp3nkV3OR1gM=
X-QQ-mid: zesmtpip4t1745317404t5b5a4381
X-QQ-Originating-IP: S0t1emq2KGXtxj+2JIdNqT7E9gubmHp4di/k3CSucoY=
Received: from localhost.localdomain ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 22 Apr 2025 18:23:22 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 8795362617588376660
EX-QQ-RecipientCnt: 8
From: WangYuli <wangyuli@uniontech.com>
To: wangyuli@uniontech.com
Cc: guanwentao@uniontech.com,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	macro@orcam.me.uk,
	niecheng1@uniontech.com,
	tsbogend@alpha.franken.de,
	zhanjun@uniontech.com
Subject: [PATCH v2 5/6] MIPS: decstation_64_defconfig: Update configs dependencies
Date: Tue, 22 Apr 2025 18:22:52 +0800
Message-ID: <566F2D64350C960C+20250422102253.137944-5-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <24EC7D2CA58B25F5+20250422101855.136675-1-wangyuli@uniontech.com>
References: <24EC7D2CA58B25F5+20250422101855.136675-1-wangyuli@uniontech.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: MvUCj+jJbjsSURhWTNu2YlJFciUNDpBoc1mQEO9goJzhtElPaBVqfmG4
	uf/U4rzgizlgPh0E27qM97ob4qIUcshhtW6V/0I1GN+rxHnj40alBVhUSa+Oj7szuymcVpn
	LMIQNlVRZG/230cPM4m2vkLe6iNLSDz6Vp2pIL/2RnEAHzklcwMlVzCHuDBQxNbBUa3jioA
	Z88qMVW0gsmXoGkEY4DLUMkJbHP080UCpC4GH9djt4d7ZM238Tr/fGoAoo13QwOe6yyO3F1
	IRHhVcflyiCMxtaR6gGjgGh1hQP+jbiP6HnC/vWqjpHOg1Lid1/+3+yYpTs3RJn3Gpme48v
	ZJBqXmtO8re3KVsOlYPBYT/wB0mCLJjaH1GG8KwJQ8xlgAKRHkxiLJ6gQx4Q2IbkTGObEhm
	gG83BaqdOkJSd5rkSf3872wutl+3hm9rjhx1BbruloEIUxys8phP5mh9cYQRAHV/pLzbTIm
	d0Ngj+WFVx8is+7vYKakXdquQZXgHvGY/VDf1Sv3YDNXJs2vvveV5w0P8TXI5qjxN54iJUh
	QTRUVvstI3e/1viIiiD8QMqsKKwVqSlzIs9PkKmQN/dRL5J9Ku4cYwBzuoUg13m+YdISozP
	m4IYERequYXbkZCqULj8InZFccBwsynA/0AWsAF2sivWci8JSs3oi61NySdeRFvqaYJ9Fvb
	BjvNmyaRSe0qpKRB3cRg0KdeT3xKhUq2GEcOSYM+tp1SvkFDWFEyxpOC+hrv+cGUBDbYU8x
	6dS6q++gZjSrN3FFwLxQBgLtMed5iOEy9sjgY24xp1ppFJJi9/Jx/PcxFXeX+O3Vhul8JR/
	/TmjhIqrfRKCUwCatWgq9U7oe8rA5UfQb6wOmLCksVvvfq/UT8qbEmYj/NVzmWxS5ebs0dp
	e7P+Zg57BRaNzV2n2g/gcEK0eLsUe5i25+rIHorwW7E0h2tmCdtJjE7rhGXRb8Bz+Yd8c3n
	4YUzrj3aj0K2JFMSobsQzoS8PbXiVJS1UxjKqUezUWRHmlRWhqFJi88iq/QalyafBoB8zrs
	JHLsW6wNx3OGb2UTLj+X2ZQKe3H6pepw0guxTH4VPxCH2hXlEWpCMm511cF2U=
X-QQ-XMRINFO: MPJ6Tf5t3I/ycC2BItcBVIA=
X-QQ-RECHKSPAM: 0

Due to long-term changes in kernel build configurations,
run 'make savedefconfig' to update the build configuration
dependencies.

This commit does not affect the actual .config file content,
in preparation for future modifications to decstation_64_defconfig.

Signed-off-by: WangYuli <wangyuli@uniontech.com>
---
 arch/mips/configs/decstation_64_defconfig | 42 +++++++++--------------
 1 file changed, 16 insertions(+), 26 deletions(-)

diff --git a/arch/mips/configs/decstation_64_defconfig b/arch/mips/configs/decstation_64_defconfig
index 9655567614aa..bf579866cf4b 100644
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
@@ -167,36 +165,28 @@ CONFIG_NLS_ISO8859_13=m
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
 CONFIG_CRYPTO_LZO=m
 CONFIG_CRYPTO_842=m
 CONFIG_CRYPTO_LZ4=m
-- 
2.49.0


