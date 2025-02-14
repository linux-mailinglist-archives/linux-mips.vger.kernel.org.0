Return-Path: <linux-mips+bounces-7765-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D957A35AE9
	for <lists+linux-mips@lfdr.de>; Fri, 14 Feb 2025 10:56:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 76E9016EDE8
	for <lists+linux-mips@lfdr.de>; Fri, 14 Feb 2025 09:56:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE1812566D9;
	Fri, 14 Feb 2025 09:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="bghGKZZ4"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpbgau1.qq.com (smtpbgau1.qq.com [54.206.16.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4B4124A05E;
	Fri, 14 Feb 2025 09:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.16.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739526971; cv=none; b=WnEZAwwxmWSYvBCc45i0711p9NQc3+LcNRcdqnjhcPZGK06BtP5mcmru0GsFQTsVVgZHNemH1yMKhzmital+BgN9F2tK19v4jqmrnjcJK9XW6kjgjgZQ7EcPp56ohyaf7SNcBWWtzSoAePVwQx0usgIcLoNWgDMgsw366AQGs1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739526971; c=relaxed/simple;
	bh=2YNumiHDQgsLGO/eMpsKbUryYOlsd0m3vJGnb7NC2cs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iPHk7zn+fy8tyRTW6FdeL495C0zSTl4J37OoTOQ/tTMRytqtJtQvWMQpi8WWt/U0G7PYJ2hHW/w+/mnO4u/eg8TbNsEf8XlcI2NtSCA1fkgGMs3jBwFgH1Kwtv0wVFtj4xTTHoGus/17go9x3jS+3ufcsw4/DZfcylj2+kV5nbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=bghGKZZ4; arc=none smtp.client-ip=54.206.16.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1739526938;
	bh=KyAhd+Ozz1bUuRujVsorLtQnBREnOzf43YRnKS9MjuU=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=bghGKZZ4Fhqqtg5snlwWz+sN/sw4KzOe5gjYybC+FKbAMZsAbFQ9aITxUaGHWK/gP
	 Wfuv90kp9rQtyQC28BA/sVdwyAAZzZM/T/K5cEh94MqzyStmILzdTCr6RykixNhjYc
	 llzD+zVFTNxcuMKDQ3FrvSJwXii63VLT1fD0qJbI=
X-QQ-mid: bizesmtpip2t1739526927t69eqqn
X-QQ-Originating-IP: hmtdFyp/O9tWDE4cU7AaOCslFTvCdVyRTTfhnej2npI=
Received: from localhost.localdomain ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 14 Feb 2025 17:55:25 +0800 (CST)
X-QQ-SSF: 0002000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 11265747007053023021
From: WangYuli <wangyuli@uniontech.com>
To: wangyuli@uniontech.com
Cc: chenlinxuan@uniontech.com,
	guanwentao@uniontech.com,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	macro@orcam.me.uk,
	masahiroy@kernel.org,
	niecheng1@uniontech.com,
	tsbogend@alpha.franken.de,
	zhanjun@uniontech.com
Subject: [PATCH v2 1/2] MIPS: dec: Only check -msym32 when need compiler
Date: Fri, 14 Feb 2025 17:55:22 +0800
Message-ID: <11D1B8A01F6006BF+20250214095523.175229-1-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <F49F5EE9975F29EA+20250214094758.172055-1-wangyuli@uniontech.com>
References: <F49F5EE9975F29EA+20250214094758.172055-1-wangyuli@uniontech.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: NzmZMORfs0iDt6xVM4aGnCBCPTZ0uhdlXzvCD+/g4jnDfnsdzloSjTk/
	iQprFIdWrxf0iYvef0xBlfD+2R4NaJ89bNjX0H7JhL/SBGOnAotAueIaM+mtQuNuN2eTAuO
	BT8r0V//xvXwQh6cVhAukvVzrjiknipTL0BRoD7bKI7hf/hXyGHzhwykb7TPnZdfE25nLj6
	JIpy89KkySy3wmF+eU9ZTqeN7vPlHsKuLbmOjcsGOuA9x/hA8MHn2VuRYKpv+lPX7bhsYCw
	Z7D8E19LWmIMI73I5mt5qFjVjgDWDjDv5VXed8wnE9nEIKHCDI0ku3BcH12Bg1olwPPsBvp
	4U/smbfAJ52lpxhB0pwqES9ijSLcxqpyzmytG5wtdgJL3t00SBmXAsS3YmcuWkAItAWiSON
	8YDhz0krfVkOj6rUsCyvPICj4jUh/RCfo6b6TsnGRPb/zmIyg6WxYNPSJ7TDzcjnkaTzpKe
	aW/DjnSXZ9f0a/xvKNG+PPrPzrUHeBXROkDouh5x32DPLqpK8IJN8i0t0fYqKtK63dD73Tx
	H8VyIZd+TlaxvCHyQTCtSodHbOe8iPA0Lu+PXu3RcLBfBq5mOYTWx68WflDxvUCQU5V25XQ
	AkNPJit7C6cEsyjBXkiBKKVDUTGYwtaJANlKwEeBdyGX8pAGcddWzizRIxGotvPJKueg4tK
	2VVc3eBPsIaxftTudrxefRuDvvscBcUY56VzkCbvE3oyHsohV0/N3iGj/+EHZBL42Z8mPzr
	nsG0yJYmr7dNypvRSqvizbB555CXDPVjbXJPOxgmFTALXDYfXJ6VeL0ODmM/oaeZK/z5uSM
	A1GmKxaky+slcD/TqoaM/ViQFxIxKJ8Nbi009MqxFNIHyuNpFr94efPC2pjdxPmVs43fPjV
	a/22ZjdS8V9Ri/USks1L2Lxhrr9kaa9IAnuuWs+MGYClV2/spB33M1AM6iPOaGIpNxU89tl
	rfiFhVhykNUsDfIKwlxAEdeQe/XqyajO+a4AF2zaQq/uqwxLL2ZoPjZMVNBc23JzVr3mhit
	l8oEAAlcXO5RE3gHE55aKF0Ttj6l0FQ6eTOHyYVNcdSETvsCirt6Hf0AET0uzh1WCh/pq2U
	pF9Ov6bEKPONRfSHHqdMmGoVJARjKBOUiYCfJyV9cHBzWzEx5TTyDKrxpQoT/h7UNJkJ8NG
	HGC6GFy2kxxrfNPbdp/HHpVCSA==
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
X-QQ-RECHKSPAM: 0

During make modules_install, the need-compiler variable becomes null,
so Makefile.compiler isn't included.

This results in call cc-option-yn returning nothing.

To get rid of spurious "CONFIG_CPU_DADDI_WORKAROUNDS unsupported
without -msym32" error, just wrap it into `ifdef need-compiler'.

Link: https://lore.kernel.org/all/alpine.DEB.2.21.2502120612000.65342@angie.orcam.me.uk/
Link: https://lore.kernel.org/all/alpine.DEB.2.21.2307180025120.62448@angie.orcam.me.uk/
Fixes: 805b2e1d427a ("kbuild: include Makefile.compiler only when compiler is needed")
Fixes: 18ca63a2e23c ("MIPS: Probe toolchain support of -msym32")
Reported-by: Maciej W. Rozycki <macro@orcam.me.uk>
Closes: https://lore.kernel.org/all/alpine.DEB.2.21.2501030535080.49841@angie.orcam.me.uk/
Co-developed-by: Chen Linxuan <chenlinxuan@uniontech.com>
Signed-off-by: Chen Linxuan <chenlinxuan@uniontech.com>
Signed-off-by: WangYuli <wangyuli@uniontech.com>
---
 arch/mips/Makefile | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/mips/Makefile b/arch/mips/Makefile
index be8cb44a89fd..4d8339d2f20f 100644
--- a/arch/mips/Makefile
+++ b/arch/mips/Makefile
@@ -304,8 +304,12 @@ ifdef CONFIG_64BIT
   ifeq ($(KBUILD_SYM32), y)
     cflags-$(KBUILD_SYM32) += -msym32 -DKBUILD_64BIT_SYM32
   else
-    ifeq ($(CONFIG_CPU_DADDI_WORKAROUNDS), y)
-      $(error CONFIG_CPU_DADDI_WORKAROUNDS unsupported without -msym32)
+# Do not fiddle with the compilation flags when no compiler is
+# going to be used. To get rid of spurious errors.
+    ifdef need-compiler
+      ifeq ($(CONFIG_CPU_DADDI_WORKAROUNDS), y)
+        $(error CONFIG_CPU_DADDI_WORKAROUNDS unsupported without -msym32)
+      endif
     endif
   endif
 endif
-- 
2.47.2


