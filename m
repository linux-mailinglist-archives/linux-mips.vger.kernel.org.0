Return-Path: <linux-mips+bounces-5429-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D7759706BC
	for <lists+linux-mips@lfdr.de>; Sun,  8 Sep 2024 12:50:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1C84B1F2157E
	for <lists+linux-mips@lfdr.de>; Sun,  8 Sep 2024 10:50:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0A7D1531E3;
	Sun,  8 Sep 2024 10:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="rxIxt1zv";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="sJ4LhjYM"
X-Original-To: linux-mips@vger.kernel.org
Received: from fhigh2-smtp.messagingengine.com (fhigh2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49631152176;
	Sun,  8 Sep 2024 10:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725792589; cv=none; b=WpnUu3QV7sYwMO3GzdfslCN4wQk1GDH5BmLxaeHKvMLQSF7NvstJ4++q/Vy3FYi6a4JRu7ZJxpl5yOeIqSrY3bfA3PxuchUJPWnh8lQvK09GY0Z8Jsg/6+j3th3SuqlrOs1YKGdIJ5lNTWZaEHKFVJQsoPFdpxrLZx7CUGEzU9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725792589; c=relaxed/simple;
	bh=3KRdXo0Yoblv1+C/nMOt0XvyZkKnvZsM6lAjdumm6SA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GUpb7Rm3jZY39I8zKDup5enu8vkIegesL5XxuzTbx2JVxAMG/fOwZ7rPpQMDKsoUmmSng9RFTjtoZGhUKyCATdv+JipbAvGGdRG1UYIy7wRfTILTRJyEh9daj9CTFMEFf6VuJQmYe4rmxQ/QILeAXCnp3fUyjxcreNkcH0y035E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=rxIxt1zv; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=sJ4LhjYM; arc=none smtp.client-ip=103.168.172.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from phl-compute-11.internal (phl-compute-11.phl.internal [10.202.2.51])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 7348211402A8;
	Sun,  8 Sep 2024 06:49:47 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-11.internal (MEProxy); Sun, 08 Sep 2024 06:49:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1725792587;
	 x=1725878987; bh=d5f/16wXObtnjNXxokE78TTUnWRghhQQ15g6S3jFNwU=; b=
	rxIxt1zvSSOOu6sxP5kw0CjoA0TjgZtZ01dp6EyvcVCodxSzWmCncMwNPTtXiWyD
	K/iRQl8n4P1lffaByWpOKBAxAvsy9AIrSw4C6bd5u4CjiSJUzalJPO3d8kHSFq4o
	ObJs3l+BtLdIHcpxWgm4RkjHcWN9iyVaaHGMIxbkzK7QowMp4sd6ILYcI6GdfHXX
	fyhvcCX0OpvzsLZSIGntADh50w81XFrf9eqgxeuE9x7pEFU2F1VOopYl2BJrSGQK
	xuqq8u9PcVs5VXsBLvWMSdnz1KV7RdB+Y966fIaEZVv3l0Ro7Z+0QgcQeGDDvrGd
	eGmeyoJVG6aGbEYY5RHuZA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1725792587; x=
	1725878987; bh=d5f/16wXObtnjNXxokE78TTUnWRghhQQ15g6S3jFNwU=; b=s
	J4LhjYM/7WKl2AAuOFRwAOBkAIVEKD5VkVQFJbV+9zQfaYBAW4eBAcFLYRFA39YC
	mPew7JHYs9O6BFrzOTNSBrqr3GeEj+G5R1HAjD3GyyGHVtBKAA0FYS9NEl6aHomq
	IIktQn9j2g+9RYKwEBAgathp3Y1C64+6jl0h8zsY8ZIVx8zpHhq7RegtwTjr7X2E
	LGOtrIqMvlzCYwK+M+Y4ZywvxllPD43VIbJr5qHsu11nyD6B8eYkfipm1IfDvC5r
	ltsalIWk1gFKNSTbF4mVFFaBUk/OrkTmseE3xoH6Ac594LfbzS315IXdvQ9nhPbs
	pKFOZpLJx+YHWy1q4ucJw==
X-ME-Sender: <xms:S4HdZjRSKzk2zDLS7U1gNOM4lRxVJDCyMTjJLwN-KpG4dpV8fgYArw>
    <xme:S4HdZkzUMmuOZqF7YlbVC4FqIP74d_92pgGTjAldZQCkQduZ953JZb9Cc2qtQpQ1g
    FfdThfoAw27WS6vVI4>
X-ME-Received: <xmr:S4HdZo0E0eQOYetnn50fpI5i4WKievW2CP6bE69sXqRKHPB-9n-UH0wdUCO6cpWj6Wc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudeihedgfedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdej
    necuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhi
    hgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepvdekiefhfeevkeeuveetfeelffek
    gedugefhtdduudeghfeuveegffegudekjeelnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdr
    tghomhdpnhgspghrtghpthhtohepgedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoh
    epjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomhdprhgtphhtthhopehlihhn
    uhigqdhmihhpshesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuh
    igqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehtshgs
    ohhgvghnugesrghlphhhrgdrfhhrrghnkhgvnhdruggv
X-ME-Proxy: <xmx:S4HdZjAK9fOdjWX4w2lD353z1Xj9xHHCllQW2LWJGyWF8_m-WtyfbQ>
    <xmx:S4HdZsg6AEcroPpcC4mn2AinYNvgv5__NC_QA_kcLQrEOT5jDeps3Q>
    <xmx:S4HdZnpTL5Gk8k2SwmYhUaWHiQYTJIv_XFTTzfrDXMx6g5Kr7R8-2w>
    <xmx:S4HdZni4O4k18hLJvx4OIuvRiIO3NjWebBUNlXmp3q-IBbsYWUmYww>
    <xmx:S4HdZkfejk5dcTpue5I-zJ3cnwjR2cgEocVDl--izDZQ9T1lYRYuTglo>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 8 Sep 2024 06:49:46 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Sun, 08 Sep 2024 11:49:43 +0100
Subject: [PATCH 2/2] MIPS: kprobes: Massage previous delay slot detection
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240908-mips-chore-v1-2-9239c783f233@flygoat.com>
References: <20240908-mips-chore-v1-0-9239c783f233@flygoat.com>
In-Reply-To: <20240908-mips-chore-v1-0-9239c783f233@flygoat.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1141;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=3KRdXo0Yoblv1+C/nMOt0XvyZkKnvZsM6lAjdumm6SA=;
 b=owGbwMvMwCXmXMhTe71c8zDjabUkhrS7jR7pLwpZWTNTLPeyxh45Ur9Sr9l/cvSvnI0PnlX48
 ecZr7rTUcrCIMbFICumyBIioNS3ofHigusPsv7AzGFlAhnCwMUpABPpUmT4X20jO3/5CRXxxCmV
 peVR3s6t++4sc6+TKfvyMLfptx1vG8NfqUmR5v7fbn1q9lzd+i7JI3Pn3Lg5eyJUD2f8z78pEmj
 MDAA=
X-Developer-Key: i=jiaxun.yang@flygoat.com; a=openpgp;
 fpr=980379BEFEBFBF477EA04EF9C111949073FC0F67

Expand the if condition into cascaded ifs to make code
readable.

Also use sizeof(union mips_instruction) instead of
sizeof(mips_instruction) to match the code context.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/kernel/kprobes.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/mips/kernel/kprobes.c b/arch/mips/kernel/kprobes.c
index dc39f5b3fb83..96139adefad2 100644
--- a/arch/mips/kernel/kprobes.c
+++ b/arch/mips/kernel/kprobes.c
@@ -89,12 +89,12 @@ int arch_prepare_kprobe(struct kprobe *p)
 		goto out;
 	}
 
-	if (copy_from_kernel_nofault(&prev_insn, p->addr - 1,
-			sizeof(mips_instruction)) == 0 &&
-	    insn_has_delayslot(prev_insn)) {
-		pr_notice("Kprobes for branch delayslot are not supported\n");
-		ret = -EINVAL;
-		goto out;
+	if (!copy_from_kernel_nofault(&prev_insn, p->addr - 1, sizeof(union mips_instruction))) {
+		if (insn_has_delayslot(prev_insn)) {
+			pr_notice("Kprobes for branch delayslot are not supported\n");
+			ret = -EINVAL;
+			goto out;
+		}
 	}
 
 	if (__insn_is_compact_branch(insn)) {

-- 
2.46.0


