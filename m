Return-Path: <linux-mips+bounces-7725-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F1EBA30DC8
	for <lists+linux-mips@lfdr.de>; Tue, 11 Feb 2025 15:09:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6EC901661C2
	for <lists+linux-mips@lfdr.de>; Tue, 11 Feb 2025 14:09:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7ABB24E4A5;
	Tue, 11 Feb 2025 14:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="PptvngAB"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpbgbr2.qq.com (smtpbgbr2.qq.com [54.207.22.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF15024C693;
	Tue, 11 Feb 2025 14:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.207.22.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739282931; cv=none; b=mgVO2RqcR8QV2S+DIFSMsVCp9suxmoVbjQA7wRLkeW7Ifget+f7kM4pLaeHBMk6B2Ohl7QB252REPMDNEomQdxQtOhUrV5S3Jp9wnjhNMopZ/aFC+GwtEA3siKvbKDHY+utB624Bv/pEg4xypz6Suivxo3XZaCkmBj6NYd+Y/lA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739282931; c=relaxed/simple;
	bh=WtJVMQ8yDwCl7UipIjMdTEXhTCs6Dshe3buPZGiM+pM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=in0Z06i+K1MJioWkVz9t0z4ePZR9qifWOU95NJs6jNYZGrTsYzJHucmofaBbA5WPSjjT6MbHxowfgYvRe4I2QEvct6bJ1ZnlGZV8zgpwkOOFLUcDz30zHjPM6oaU+2etvPwAnCsBmNr0n08H8o0Phr5JoQIENZNsxM/1ch0B/mU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=PptvngAB; arc=none smtp.client-ip=54.207.22.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1739282892;
	bh=WoRh/PPiIYouSfJbTU6aDWpN1x1Ps0+hunfZbraMdHg=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=PptvngAB96zgzEDukQaKZKU5eIyGBVoA5VWEbqo4xHSTpunABn84uHOwVskUySSqf
	 WNvtKYkML3wtbRqsfs5l1Ibm16m3bjBGgNcWamrF2tugOolFTAMS4xV16LrgEbKhhX
	 Z5MXBDuA9VTKJeU22fs9nBulR+cV2tB8CnrdbF/8=
X-QQ-mid: bizesmtpip3t1739282881tuk3cxa
X-QQ-Originating-IP: oClZrs5x708hcG28Y/AVu/UM56g1mXGABjx0bdi4ObU=
Received: from localhost.localdomain ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 11 Feb 2025 22:07:52 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 10022984226363110058
From: WangYuli <wangyuli@uniontech.com>
To: wangyuli@uniontech.com
Cc: tsbogend@alpha.franken.de,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	macro@orcam.me.uk,
	masahiroy@kernel.org,
	jiaxun.yang@flygoat.com,
	zhanjun@uniontech.com,
	guanwentao@uniontech.com,
	Chen Linxuan <chenlinxuan@uniontech.com>
Subject: [PATCH 2/2] MIPS: Explicitly check KBUILD_SYM32=n
Date: Tue, 11 Feb 2025 22:07:40 +0800
Message-ID: <D23DC9B8BD1C245D+20250211140740.1812778-2-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <41107E6D3A125047+20250211135616.1807966-1-wangyuli@uniontech.com>
References: <41107E6D3A125047+20250211135616.1807966-1-wangyuli@uniontech.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: NiFdmnmiW14ny/S2xcUarv1Rczmj5gFNP2I7aS+K3xT57ZHhaO4rkENo
	yka5BbrqGVDSph/qZQndq7CCK43bfi3btA723iypO/uhME/2mZX8NGxf2+qpUkenrwCBg7Q
	/jcBLUFxQzxeFjk1YMcOZaxuxvlP61gcG/5XVnvO8JyB5jVVJsnHA+O8szo2kR8Opyhnexb
	ZeZBFU3+NGMyzQBsEbmX8kdPGXl0yqOl6JO1TDjUoIjvRZ8htUWQQQpnYAPk6o7ixsysoWM
	ZyRNo5E3Oc8k7mzkaBZUI3krekun8fMI/7p+E+MnfNePcVoeRsrA/+9Cm+/tjmpVwRy3xIA
	yfNCuwCmpD52fX7615ApCnbVN1Lcyw9vBMkUvnNfWvQ3IxkeEq0sQx9mFHarPp8Gd2MXB6I
	aG8JAmLWP+EeHaBTcUpuTqPW2jpRFxUpH7JMkrjiBpVaVxRcLGO4FpH5qGxvNVbTYBzqkB8
	eATEOCAmdSxSTp/Jq/qHFNGDTJNTGInJCyh2xF8FkpjL++BSCiq8NJDJvNZvnNtJd0yynMs
	a7rAg9RlnC2nlmUmg/jsJV6uxRmEe1WJjsskXTWGxZDzy2y3rmTRbgzSJGXo9qMWCs+fUdd
	fjoAJoXE/TanRqzeCRkSV37mARpkgHGJUNSnOZwfb8uyb53CF+vahw2WIMwIOr5FpdiNx6O
	Js2GWyXmWNgk16pQB/fg9lNUbCR61GY7/6tJoQH/3XJMKiczBBT1j6Z4N4Znn6eJeuI8L7P
	rt9F+ZpjexivHZcT2tz7vf5Zs1hAepXmwwXEy6gA5flqkDE0Hi/G5D5D7KRi3jiaWr4bJWq
	AamvxPsNFgeKGlcfvKysgC1GaOJJU2E033MECIeu37zobNiXmunQlKLaExY4YW4liU/jbdj
	fQRlcH0YWhYJ5dNgFq/bQBB4KbANKU+ENYjopLuXpwsWa8/jBNtE78OzhSeRdQlK/abtAIs
	p/h4UhvCe5A47mus9JhT8SuAeRSsiSvZNO6IBwANeAodVLqAKMJl7WUit4MBb9wqjzfhli/
	ExmgAQo8h0aXAYQG40
X-QQ-XMRINFO: Nq+8W0+stu50PRdwbJxPCL0=
X-QQ-RECHKSPAM: 0

During make module_install, the need_compiler variable becomes 0,
so Makefile.compiler isn't included.

This results in call cc-option-yn returning nothing.

Add a check for KBUILD_SYM32=n to avoid the
"CONFIG_CPU_DADDI_WORKAROUNDS unsupported without -msym32" error
when KBUILD_SYM32 is unset (meaning it's not 'y' or 'n').

Fixes: 805b2e1d427a ("kbuild: include Makefile.compiler only when compiler is needed")
Fixes: 18ca63a2e23c ("MIPS: Probe toolchain support of -msym32")
Reported-by: Maciej W. Rozycki <macro@orcam.me.uk>
Closes: https://lore.kernel.org/all/alpine.DEB.2.21.2501030535080.49841@angie.orcam.me.uk/
Co-developed-by: Chen Linxuan <chenlinxuan@uniontech.com>
Signed-off-by: Chen Linxuan <chenlinxuan@uniontech.com>
Signed-off-by: WangYuli <wangyuli@uniontech.com>
---
 arch/mips/Makefile | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/mips/Makefile b/arch/mips/Makefile
index 962eb749ed23..2a0bf69c842b 100644
--- a/arch/mips/Makefile
+++ b/arch/mips/Makefile
@@ -304,8 +304,13 @@ ifdef CONFIG_64BIT
   ifeq ($(KBUILD_SYM32), y)
     cflags-y += -msym32 -DKBUILD_64BIT_SYM32
   else
-    ifeq ($(CONFIG_CPU_DADDI_WORKAROUNDS), y)
-      $(error CONFIG_CPU_DADDI_WORKAROUNDS unsupported without -msym32)
+# During make module_install, the need_compiler variable
+# becomes 0, so Makefile.compiler isn't included.
+# This results in call cc-option-yn returning nothing.
+    ifeq ($(KBUILD_SYM32), n)
+      ifeq ($(CONFIG_CPU_DADDI_WORKAROUNDS), y)
+        $(error CONFIG_CPU_DADDI_WORKAROUNDS unsupported without -msym32)
+      endif
     endif
   endif
 endif
-- 
2.47.2


