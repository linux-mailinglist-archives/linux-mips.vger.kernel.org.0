Return-Path: <linux-mips+bounces-3692-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E661909DB6
	for <lists+linux-mips@lfdr.de>; Sun, 16 Jun 2024 15:26:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B895E281B1D
	for <lists+linux-mips@lfdr.de>; Sun, 16 Jun 2024 13:26:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C900F18C353;
	Sun, 16 Jun 2024 13:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="5sZ+v/mw";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="He2QgiyW"
X-Original-To: linux-mips@vger.kernel.org
Received: from wfout1-smtp.messagingengine.com (wfout1-smtp.messagingengine.com [64.147.123.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0604118C326;
	Sun, 16 Jun 2024 13:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718544344; cv=none; b=Qu0jqqUdq0zXnV6AxYBcDfoOQ8YLMrkJXGyzvl+cSHhng7UEFmNfze198jx2T2Gm5Q5l4SVhunKUBPLnKE0U2TaD/Lxzt8EdgOVGdkp0V8XF5FKesjFJQD+a7HagAr9M2xEyteeQHeHp9/eUQxznPW2FbojZbCmyaL8DxiwSw04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718544344; c=relaxed/simple;
	bh=Z94dl7IpamAHQv/0lMzgPz4eZUJaxYmpmOqVkJyuvnY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lJfQEIY8KnZuP69+JYTRRpQt4tnXG2Gv17SU7COWxZn7fyrB+ME2Gu1CGhrn1j0ovTPSHSrMf4da2S7QDyLEJ27/bIh+3pC5wAtrlFZ/FUOJsFBzW+bke+kYzGjkkTB9rlOkpbtew++FziK55vb30dWLb6Jff2it/sNJKeGr5DA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=5sZ+v/mw; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=He2QgiyW; arc=none smtp.client-ip=64.147.123.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailfout.west.internal (Postfix) with ESMTP id C24731C0009A;
	Sun, 16 Jun 2024 09:25:41 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Sun, 16 Jun 2024 09:25:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1718544341;
	 x=1718630741; bh=M+jqqh+E+uc1iXu00gj0bi4c376MoxwluD57W+QxSMU=; b=
	5sZ+v/mwt1SFPw6NQ9TcSEgbRGhgO4IabzausAZSFxYYmfRX0Mtrpft7pJ5tbNhz
	2qeIV3o/V+tNBdNV13bcaxrhVlYldRy6rUwiPUNOPT0KdhErfTxeFn/u1fko6gYn
	SG9GWwsUf4yCaaCf++kLm9oMU56j0kxq/k67Tdrn8UUnWkFAeOs4HHNaPjJnSPPu
	IqrQS+x6k8R8T2YA24J8XYa0vZrpEb9wWbxPNhvDOWkagk7+urwDw7AnZbfi8tHh
	usowR9mIAdEbrq5mvZZMSvTAri3J19/L3MdBJZ/W98FYkfM4PLkyyBnH6QpH/Opr
	TocRSj4U18q5/Jnb6kCSVA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1718544341; x=
	1718630741; bh=M+jqqh+E+uc1iXu00gj0bi4c376MoxwluD57W+QxSMU=; b=H
	e2QgiyW/pv4PUhLZseSEjrtp+8mf0/1gWbTbGrGP7NMVyQ6BnX08R6fkDISp+q6J
	OHKHaysXlTWGIcXbs4uEw6tKtCMqacPtk5PO5YdUZKQmfDDvGGdxT0Uia/W7tJey
	sjd53KWxeRnGrQjDJlTLFBPRL0hidtBX6lAgZW44iIPWHwSiuam0pomaNfmU5kOU
	v/2Ta54fDUDf6P+mhP0F93nIYv4Rg48LCV0wFovSYwaJOVRJboVBTPU4+Ekfuf6D
	gcyWeyUHGbRAOI+/dZkkLAtKi4iezgO1BDaJt0Z7GItLObaqA2J5g7GVWch+lE2X
	pBcQLbATjZza6x5yAmJ5A==
X-ME-Sender: <xms:1eduZuXHOAMaQoUcJCwYW5CGcQPNi9nywo0CNvI6korqQB_OaKwn_Q>
    <xme:1eduZqn21odYBRZP9Mba8bgvlCAzF7XRdZao18eQeG66NlW9tIcV-fSYq30-fLtCr
    E3BUfDIP38J_-Up6eY>
X-ME-Received: <xmr:1eduZiY0T-F6gGiKBQrnmJXqhdg446LP2Lqgv9cA8gF0hy-OP9lLSws>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfedvfedgieehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeflihgr
    gihunhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqne
    cuggftrfgrthhtvghrnhepvdekiefhfeevkeeuveetfeelffekgedugefhtdduudeghfeu
    veegffegudekjeelnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilh
    hfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:1eduZlXEfmOh_TAJ2SpUIZVL3C0vLDyzUAMCDDX4NIJkbwGuBU9BYg>
    <xmx:1eduZom6_TEi2_tQLD8wYGisX01gqS815i4z-psOptVHc2-dTf3MAA>
    <xmx:1eduZqce0oOZWVpAoP-9OpGe6Ty1nAwsGX1BKQhdUiJLtZV5a-sTFA>
    <xmx:1eduZqGokm4foHPp3yCV9ctApezm0ePIgXbzpwsX_bht3CYqfTl0AQ>
    <xmx:1eduZnsV-I7gM4SgJHCgfNNDijhw4coND3Hhwona4DtstXN6HUmGcFGi>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 16 Jun 2024 09:25:40 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Sun, 16 Jun 2024 14:25:03 +0100
Subject: [PATCH fixes 2/4] MIPS: asmmacro: Fix MT ASE macros
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240616-mips-mt-fixes-v1-2-83913e0e60fc@flygoat.com>
References: <20240616-mips-mt-fixes-v1-0-83913e0e60fc@flygoat.com>
In-Reply-To: <20240616-mips-mt-fixes-v1-0-83913e0e60fc@flygoat.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>, stable@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4973;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=Z94dl7IpamAHQv/0lMzgPz4eZUJaxYmpmOqVkJyuvnY=;
 b=owGbwMvMwCXmXMhTe71c8zDjabUkhrS85xct0/KrXvtOOrDN72Udz0XHGa6v5nx3nmFuHqX33
 PKe34q4jlIWBjEuBlkxRZYQAaW+DY0XF1x/kPUHZg4rE8gQBi5OAZjIxm+MDOeM9ulKqluf0a3j
 lhF2WLVtPtMH/ke9B+s+Oc6odpwytYjhr3iAnU5xdKnU9DW5Dz68WnxnwYP96/aw/Xwc+1N1bem
 zu7wA
X-Developer-Key: i=jiaxun.yang@flygoat.com; a=openpgp;
 fpr=980379BEFEBFBF477EA04EF9C111949073FC0F67

Introduce and use parse_r from C inline assembly equivalent to parse
assembly register names properly.

Fix MTTR macro to include h parameter, also mark parameters besides
h mandatory.

Implement MFTC0, MTTC0, MFTGPR, MTTGPR with MTTR.

Rename all macros to prefix with _, as assmbly macros are case
insensitive, we are risking clash with assembler instructions
if we just use capitalized instruction name as macro name.

Cc: stable@vger.kernel.org
Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
This patch has two over long lines on raw instruction words (104),
I don't think it's a good idea to split it into multiple lines
as it only cause difficulties on reading the code.
---
 arch/mips/include/asm/asmmacro.h | 166 ++++++++++++++++++++++++++++++++++-----
 1 file changed, 148 insertions(+), 18 deletions(-)

diff --git a/arch/mips/include/asm/asmmacro.h b/arch/mips/include/asm/asmmacro.h
index 18c2ae58cdf3..6eadd59f53e9 100644
--- a/arch/mips/include/asm/asmmacro.h
+++ b/arch/mips/include/asm/asmmacro.h
@@ -44,6 +44,112 @@
 	.endm
 #endif
 
+/*
+ * parse_r var, r - Helper assembler macro for parsing register names.
+ */
+.macro	parse_r var r
+	\var = -1
+	.ifc \r, $0
+	\var = 0
+	.endif
+	.ifc \r, $1
+	\var = 1
+	.endif
+	.ifc \r, $2
+	\var = 2
+	.endif
+	.ifc \r, $3
+	\var = 3
+	.endif
+	.ifc \r, $4
+	\var = 4
+	.endif
+	.ifc \r, $5
+	\var = 5
+	.endif
+	.ifc \r, $6
+	\var = 6
+	.endif
+	.ifc \r, $7
+	\var = 7
+	.endif
+	.ifc \r, $8
+	\var = 8
+	.endif
+	.ifc \r, $9
+	\var = 9
+	.endif
+	.ifc \r, $10
+	\var = 10
+	.endif
+	.ifc \r, $11
+	\var = 11
+	.endif
+	.ifc \r, $12
+	\var = 12
+	.endif
+	.ifc \r, $13
+	\var = 13
+	.endif
+	.ifc \r, $14
+	\var = 14
+	.endif
+	.ifc \r, $15
+	\var = 15
+	.endif
+	.ifc \r, $16
+	\var = 16
+	.endif
+	.ifc \r, $17
+	\var = 17
+	.endif
+	.ifc \r, $18
+	\var = 18
+	.endif
+	.ifc \r, $19
+	\var = 19
+	.endif
+	.ifc \r, $20
+	\var = 20
+	.endif
+	.ifc \r, $21
+	\var = 21
+	.endif
+	.ifc \r, $22
+	\var = 22
+	.endif
+	.ifc \r, $23
+	\var = 23
+	.endif
+	.ifc \r, $24
+	\var = 24
+	.endif
+	.ifc \r, $25
+	\var = 25
+	.endif
+	.ifc \r, $26
+	\var = 26
+	.endif
+	.ifc \r, $27
+	\var = 27
+	.endif
+	.ifc \r, $28
+	\var = 28
+	.endif
+	.ifc \r, $29
+	\var = 29
+	.endif
+	.ifc \r, $30
+	\var = 30
+	.endif
+	.ifc \r, $31
+	\var = 31
+	.endif
+	.iflt	\var
+	.error "Unable to parse register name \r"
+	.endif
+.endm
+
 #ifdef CONFIG_CPU_HAS_DIEI
 	.macro	local_irq_enable
 	ei
@@ -215,34 +321,58 @@
 /*
  * Temporary until all gas have MT ASE support
  */
-	.macro	DMT	reg=0
-	insn_if_mips	0x41600bc1 | (\reg << 16)
-	insn32_if_mm    0x0000057C | (\reg << 21)
+	.macro	_dmt	reg = $0
+	parse_r		__reg, \reg
+	insn_if_mips	0x41600bc1 | (__reg << 16)
+	insn32_if_mm    0x0000057C | (__reg << 21)
+	.endm
+
+	.macro	_emt	reg = $0
+	parse_r		__reg, \reg
+	insn_if_mips	0x41600be1 | (__reg << 16)
+	insn32_if_mm    0x0000257C | (__reg << 21)
+	.endm
+
+	.macro	_dvpe	reg = $0
+	parse_r		__reg, \reg
+	insn_if_mips	0x41600001 | (__reg << 16)
+	insn32_if_mm    0x0000157C | (__reg << 21)
+	.endm
+
+	.macro	_evpe	reg = $0
+	parse_r		__reg, \reg
+	insn_if_mips	0x41600021 | (__reg << 16)
+	insn32_if_mm    0x0000357C | (__reg << 21)
+	.endm
+
+	.macro	_mftr	rs, rt, u, sel, h = 0
+	parse_r		__rs, \rs
+	parse_r		__rt, \rt
+	insn_if_mips	0x41000000 | (__rt << 16) | (__rs << 11) | (\u << 5) | (\h << 3) | (\sel)
+	insn32_if_mm	0x0000000E | (__rt << 21) | (__rs << 16) | (\u << 10) | (\h << 9) | (\sel << 4)
 	.endm
 
-	.macro	EMT	reg=0
-	insn_if_mips	0x41600be1 | (\reg << 16)
-	insn32_if_mm    0x0000257C | (\reg << 21)
+	.macro	_mttr	rt, rs, u, sel, h = 0
+	parse_r		__rs, \rs
+	parse_r		__rt, \rt
+	insn_if_mips	0x41800000 | (__rt << 16) | (__rs << 11) | (\u << 5) | (\h << 3) | (\sel)
+	insn32_if_mm	0x00000006 | (__rt << 21) | (__rs << 16) | (\u << 10) | (\h << 9) | (\sel << 4)
 	.endm
 
-	.macro	DVPE	reg=0
-	insn_if_mips	0x41600001 | (\reg << 16)
-	insn32_if_mm    0x0000157C | (\reg << 21)
+	.macro	_mftc0	rs, rt, sel = 0
+	_mftr		\rs, \rt, 0, \sel, 0
 	.endm
 
-	.macro	EVPE	reg=0
-	insn_if_mips	0x41600021 | (\reg << 16)
-	insn32_if_mm    0x0000357C | (\reg << 21)
+	.macro	_mttc0	rt, rs, sel = 0
+	_mttr		\rt, \rs, 0, \sel, 0
 	.endm
 
-	.macro	MFTR	rs=0, rt=0, u=0, sel=0
-	insn_if_mips	0x41000000 | (\rt << 16) | (\rs << 11) | (\u << 5) | (\sel)
-	insn32_if_mm	0x0000000E | (\rt << 21) | (\rs << 16) | (\u << 10) | (\sel << 4)
+	.macro	_mftgpr	rs, rt
+	_mftr		\rs, \rt, 1, 0, 0
 	.endm
 
-	.macro	MTTR	rt=0, rs=0, u=0, sel=0
-	insn_if_mips	0x41800000 | (\rt << 16) | (\rs << 11) | (\u << 5) | (\sel)
-	insn32_if_mm	0x00000006 | (\rt << 21) | (\rs << 16) | (\u << 10) | (\sel << 4)
+	.macro	_mttgpr	rs, rt
+	_mttr		\rt, \rs, 1, 0, 0
 	.endm
 
 #ifdef TOOLCHAIN_SUPPORTS_MSA

-- 
2.43.0


