Return-Path: <linux-mips+bounces-4316-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 91C0093085A
	for <lists+linux-mips@lfdr.de>; Sun, 14 Jul 2024 04:53:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E11791F20F8A
	for <lists+linux-mips@lfdr.de>; Sun, 14 Jul 2024 02:53:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 909378465;
	Sun, 14 Jul 2024 02:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="cfm+Vg/z";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="WzbYRtHY"
X-Original-To: linux-mips@vger.kernel.org
Received: from fhigh1-smtp.messagingengine.com (fhigh1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C76DD441F;
	Sun, 14 Jul 2024 02:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720925592; cv=none; b=mEwxuDCZcMzt6HMkmhUr02cu8GuKbca+s8DtoHXKGyUQ+3htAW1NqXxwEBqz24mbwD0ATxL6VptD8kozCvFDHAi0VOf1JGNlX79dGZ5DSACQz313uAV4xe+dvqKxbF1ZMEcgsSd9oIhVrL+PvnskdbYK4xSi3qyMMJRKngSSu6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720925592; c=relaxed/simple;
	bh=IDUpW95/2ARMF02vlybRkULzBzgFEX0GgJEgh01Lfak=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=rzQ7eoqDe2b121RI0QNfQmDoaFSk35QczxJABzBXlntpN19tNzFRVHcum+Wei3H2qnenc0gxKSUmGYFwpExkaB1kpZw6tawbLRaCRtcyeOptVkBcerLYFV7XB1fy7NF0K22Q4OaaokjsVEKuOAjz3JsQ0Y9+aap2nmjeTbHuhXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=cfm+Vg/z; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=WzbYRtHY; arc=none smtp.client-ip=103.168.172.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id C40351140DF9;
	Sat, 13 Jul 2024 22:53:09 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Sat, 13 Jul 2024 22:53:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm3; t=1720925589; x=1721011989; bh=Uy
	gTsxDMfcLNzfl0JimyxDkLfumfvKKQh5gb5HpUUe0=; b=cfm+Vg/zNt+kNpZOG0
	8rFa4ryYdWTED2P4meflKyWIcWVBCJ2EH7etC2/pELnaW1C64e9iJ74MjGqdtmAo
	gT5M/xP8bS5Omjoowfo6jZJvxFfYuE1CRgBPvXXlw/z6MERW/5eUOiCwItA2Cdp3
	NS5ZjU7jiUhW6dJPFDfLeLpTc00Bp2dUjcs/qPcyhN/KKs931IVszKlr3rvAPtH6
	gRjn6Oq5HFhr6OsT2oELm1F30UCignoqI2fhisOc+7mOBPD0KjowkuylYC1XbcKh
	XTOvEnhP539VvS8jw72QENA/dh8JE26X7cQALNCyQanJmXBaNeU3fbFA0aeSMOeq
	kdZw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1720925589; x=1721011989; bh=UygTsxDMfcLNz
	fl0JimyxDkLfumfvKKQh5gb5HpUUe0=; b=WzbYRtHYjpd09aNn9thTwwzA7Pqeg
	YisXvKQq/6yOjRRlB5/jAEW1dD0You0xmhKa0KtEJZT6OhiXab2Lv1N4UJyIw+zG
	jRU3FR7OoxbXms2uAwQvLeG+Z5G5mu2I0jX+Spu9RENaXnYYr1qE6kcbaPi8kXBQ
	ziE9Pvo1LPDM4/48SSnfIOAzJtEcMDO6nV0A5mL30En7zS70HMNLUCcmrFCrAau2
	MDWEm/vXiMJxTx/oomSAUPjQu1yE7hO4fNlL0BGbuSc0gRCWw5kxsXW4cWSnT/vS
	oXe2UpBhPChAX0SjU0IezoIRNWYU2ZGQcB1PdqxWJw9BJIItsK7ifHnbA==
X-ME-Sender: <xms:lD2TZvleOcgK__A-bfxWTmiMDABeXu3sdD38_6kqKlAFqtFOV2MlWw>
    <xme:lD2TZi1CQ49om0dGEgNeJQmvbRwZ3J-i_vlB-bn9EMfNEi6q-ZuDUojX1pq7n86uc
    s2LYvzG84OBwRJwRgw>
X-ME-Received: <xmr:lD2TZlrz82unXdoDX0AVHnG_1KB0Xr4QWS5DR2nQGn4MFIrHmVFzRIF6uFswIA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrfeelgdeihecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhfffugggtgffkvfevofesthejredtredtjeenucfhrhhomheplfhirgiguhhn
    ucgjrghnghcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqeenucggtf
    frrghtthgvrhhnpefhffegjefgjeeiuefggfdugedvkeffveegueetteegjeevieetieev
    vdffheelgfenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuih
    iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhl
    hihgohgrthdrtghomh
X-ME-Proxy: <xmx:lD2TZnnlXMsrqeTWI0z-qt6M7U7yHH29CeCqfxt8IWrVDmpr8V9sMQ>
    <xmx:lD2TZt0uiMIwqn07pmgaQmtOAY28xGBbBlgOVEXpd7ZyTi_yz287Rg>
    <xmx:lD2TZmseuYgnuM5_dJsLHh2sC0bcjFoa7tBV8yGHeX8pu1e5HEzRfA>
    <xmx:lD2TZhWnZ8_qAouoD09PsSbPz5x4537QZWoQbRJmQCwLySPWbflNbw>
    <xmx:lT2TZl-tSQsgwsEUKpI_Dexb8xF1SHUQBrbKwas6hmkHDEuqt_OI6CKA>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 13 Jul 2024 22:53:06 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Sun, 14 Jul 2024 10:52:57 +0800
Subject: [PATCH] MIPS: Fix fallback march for SB1
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240714-fix-flags-v1-1-63c103e73d43@flygoat.com>
X-B4-Tracking: v=1; b=H4sIAIg9k2YC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDc0MT3bTMCt20nMT0Yl3LNIvUVNMU82QDY2MloPqColSgJNis6NjaWgA
 QM971WwAAAA==
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kernel test robot <lkp@intel.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1228;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=IDUpW95/2ARMF02vlybRkULzBzgFEX0GgJEgh01Lfak=;
 b=owGbwMvMwCXmXMhTe71c8zDjabUkhrTJthNPfXvPIZ32f8LiF5sapEJX7gm48O37kZXHg2Z9i
 o5bXdF6sqOUhUGMi0FWTJElRECpb0PjxQXXH2T9gZnDygQyhIGLUwAmMn82I0Pb5D2qMwOKX9k4
 aXowP9gXadUpMml79M2eL411zz8o7FVg+J+zQ26JitSSescJM3Rn9TUrM1eVZDyZdfmjnv7Ov/n
 9shwA
X-Developer-Key: i=jiaxun.yang@flygoat.com; a=openpgp;
 fpr=980379BEFEBFBF477EA04EF9C111949073FC0F67

Fallback march for SB1 should be mips64 instead of mips64r1.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202407111851.LwDasTcp-lkp@intel.com/
Fixes: bfc0a330c1b4 ("MIPS: Fallback CPU -march flag to ISA level if unsupported")
Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/Makefile b/arch/mips/Makefile
index 80aecba24892..5785a3d5ccfb 100644
--- a/arch/mips/Makefile
+++ b/arch/mips/Makefile
@@ -170,7 +170,7 @@ cflags-$(CONFIG_CPU_NEVADA)	+= $(call cc-option,-march=rm5200,-march=mips4) \
 			-Wa,--trap
 cflags-$(CONFIG_CPU_RM7000)	+= $(call cc-option,-march=rm7000,-march=mips4) \
 			-Wa,--trap
-cflags-$(CONFIG_CPU_SB1)	+= $(call cc-option,-march=sb1,-march=mips64r1) \
+cflags-$(CONFIG_CPU_SB1)	+= $(call cc-option,-march=sb1,-march=mips64) \
 			-Wa,--trap
 cflags-$(CONFIG_CPU_SB1)	+= $(call cc-option,-mno-mdmx)
 cflags-$(CONFIG_CPU_SB1)	+= $(call cc-option,-mno-mips3d)

---
base-commit: 3fe121b622825ff8cc995a1e6b026181c48188db
change-id: 20240714-fix-flags-9f8ee5d7c033

Best regards,
-- 
Jiaxun Yang <jiaxun.yang@flygoat.com>


