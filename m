Return-Path: <linux-mips+bounces-8505-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A95FA7D644
	for <lists+linux-mips@lfdr.de>; Mon,  7 Apr 2025 09:40:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6B13716E7FE
	for <lists+linux-mips@lfdr.de>; Mon,  7 Apr 2025 07:38:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D82EC224259;
	Mon,  7 Apr 2025 07:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="Q0k5QL/A"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpbgeu2.qq.com (smtpbgeu2.qq.com [18.194.254.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1D67188A0E;
	Mon,  7 Apr 2025 07:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.194.254.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744011473; cv=none; b=B2gWhIP3VRra7yu+5WzGLUTU3x8GEqLwK9QqTeRswAJ/u4bTeBcjDlzwfDLK1jZGBYO/5oqpV7Ld1mRto2ZFiHin8g0dOOC1mJV1euKAyTUA9LtAJinRNkosE1XtcNNhCUHOWAw2pCP1MW0I4Z1d66WXDf/Z8OZ5s1JCAcZk8gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744011473; c=relaxed/simple;
	bh=DwnHJKjSRTcNroFg/p73E0l/JHIa6S8hPby+gFI9qpQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qknbfd/QYiF7FZHPe/bscmLYbJftFOOBIxaehogHF3nnjB0BJYz1iCf0dFXwt/eqm4w49fTsPgaXMVFp6s6Hf9X0YkAULx6/WZVzm+ana+iD2CXeuOJAGMyAVyZ9apit2Bj6VC1mj5Q79/LlLylNlAXPXb+4BfU/jF2NHi9ReuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=Q0k5QL/A; arc=none smtp.client-ip=18.194.254.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1744011458;
	bh=/kCJEwIi51vpS2czRIPch3YPYBe5K2hVZT8aTmupNNc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=Q0k5QL/AWnylzSxbsCFRGPtiddCY0RRYmvVfzQL6GYP+6KLmHYQC/2E6H0kf5Toz/
	 UmvTBCJkg0hV1nIkSfpA0vcPADFc1y53GTuOhbHgGjKSeVlOuha+5kQbs+/gF2BWzY
	 zMj1Xb7AZ0vPXDcCKrAaZ+oZ8NN+Osr3eaNnr5j8=
X-QQ-mid: bizesmtpip3t1744011416tbc663f
X-QQ-Originating-IP: aifn0QqkGRDezjlwEBPrZYX2Hwx4AiQwqXLoVEOdu+8=
Received: from localhost.localdomain ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 07 Apr 2025 15:36:54 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 4261902041819720357
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
Subject: [PATCH 5/6] MIPS: decstation_64_defconfig: Update configs dependencies
Date: Mon,  7 Apr 2025 15:36:21 +0800
Message-ID: <A1BEFFDD76F10352+20250407073622.495364-5-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <11740B01E659CAFF+20250407073158.493183-1-wangyuli@uniontech.com>
References: <11740B01E659CAFF+20250407073158.493183-1-wangyuli@uniontech.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: OQEfmBmUqqJ6PHpOw5d8M7stjhVxp3Bt00DGNKzexOplmwl/ANzPzvbk
	tTrfDxoqarc67UiwkvjqJDiL6coiBxGBtaE317aAr/9fBcGoO6Y3g5vVLxnCcRaeuqMWrTF
	lux0ZjvgQIkN7bFtzzF0q52LpHyfKxGV4t1MAxr+QnXNJGdhG90HJXiaIbOH3C5rfty9X8u
	wmTjlsCU6sATtDPXuIR9AhvC886nm9/XGzSmzMS+UTCeQyytai5VeXcUxvs9esAUWesMN8I
	zX8aOI1LaODY/sjHZy5DtHBEho8IM6u17zkGMDgaNLQgl4ZTTZ5Lo8h2/XYZ9JfBt3j55JN
	mPjYa9XvSZt/8G9JE4TAVZYoIoLu9cyvSk7SOKankcFPHffl/uYnLWvE8RR0wLLOWVom5WB
	3A3wv0/VDV3J3bXDxzqUNm8QAZbvEH1/is7HVGONasMZYdFTJkz9eqmzYAlDCAGhGTiD71y
	GkSUUnluexHrQMhFUm9aL19YEdeJWArfWvLIxwUqMl9EsiHCySTECf6VlDSGDMmyetX5h6b
	an6C32V7m90ysaSbFC4/zSnqoxuIslcXKmgM9Ifej3zfDaAT6tWH2CANGL5Zc0zIthquHlO
	snpnZpJ/AEA+bfP829mRKM1Cz019pZQqVPdfJgNPBgMKTCxM7wI4wCl5+gz/xpcBnJ+1Cdo
	SE4l4/SGyIu11vKrHkTwkWAvJ8tFThIMmuKC7GOaXUfLsu11seDqeWN8oGrMmiXpI2gK76P
	mpga+WbB/W2sSkhHX7w+Zkj9yaZo3ynfqY80mvyTTn+6VC2JzKRnsJ7jd8S28f24tYcoBr0
	nAXzRjmgPg9eO7n/9ELiWXD8KwPUGlecmOY+eDrAGvq9CeMumM8r/zzsbcX6aBxD/BhccMF
	DGqOcD+nYfXjcpzVe36Zw20tZiK0xrs8s94W+yK4DcBnesdA8pfU0l6ldBQ91A/ddxodSE3
	ZLxKcuy9AubumtmpVlEfTTChPSOmpeTqKi9DT5pHZVGMNH6wZuOwJDamZUMFyMI1PjqH6wX
	o6y/oG8LmlyNImlU7t9UXYJU5fSLk=
X-QQ-XMRINFO: OWPUhxQsoeAVDbp3OJHYyFg=
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


