Return-Path: <linux-mips+bounces-12915-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 29A17D1D042
	for <lists+linux-mips@lfdr.de>; Wed, 14 Jan 2026 09:06:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5107B307CEDE
	for <lists+linux-mips@lfdr.de>; Wed, 14 Jan 2026 08:02:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 415F537C0F0;
	Wed, 14 Jan 2026 08:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="4oIgJruX";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="yJSrzBvn"
X-Original-To: linux-mips@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 523A637C103;
	Wed, 14 Jan 2026 08:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768377719; cv=none; b=SgsSN7IpZ8ou337Lye/1C6Ncce+s2pJ57Ya4MZ37EXEgegw60vrJurSt2F3tWp91+TZ+6Ezj772p9SSnm3nobCcwx1bqcHL8cn5IvGXmXw9OsSOyOH0xS4dCnZbEgx9lUACzazRgjayT84vIK+hEh3ORe3e6Gvs11S9mRZH6Ccs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768377719; c=relaxed/simple;
	bh=6/mNsjAlKjxQ4RplTzUqjF/4vooh/hplxS2bcWKZqDo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FGUhPAjxf/CozAh3A36Z3z0BQPBqP3MwVPhVrp8gMrTyJALGQNAC8ceY2yz+KtxENbhBkufUW2lryQ4OtTFCoO4p3n3+/4LF3jGo/+UU3JVFa0sBx+owKZaWXPoiCJ531lv52akuslBbsRK2sAiQ6tuklu/iqlY2/8bsco/EcxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=4oIgJruX; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=yJSrzBvn; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1768377708;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GGpYGZ/EN2AZqYN0WEm5UmRFd5B8Bamrz8S6pn+n13E=;
	b=4oIgJruX9Pma58VWDp5HIJutiSb9llrWOkO8f5GeeoDW36Trzbl5sBwpMip4aW5JGAOXX6
	J2i2qbx5qxIFfruEl5dqDFk92gMuh/vEJX91+t/xTTdlFMWzLJDKrgS1DP8JTejizodoSi
	gWUzK/4lFD/BXUfnGC0aPcmMKSbCDPAVEQZDDBTallOrB/EEazs7Q3yvzu44EQFbyJK6Nv
	d0uD5fzNKNBko7wv4oEUdFniXwbSpT9743mg4ACQl1D06tz37IO3MUjNbAxnHDFQQxSh3K
	vbrMOrCYrlLLVYFNJWYSB4FuwRRtT4z/G4pLMrokuQssj9Z1MnvUjILuZrrDtw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1768377708;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GGpYGZ/EN2AZqYN0WEm5UmRFd5B8Bamrz8S6pn+n13E=;
	b=yJSrzBvnUM6qYm9C3OI9GWcdK6AbNFlRyVNEpoMooh8VO4N/VpKJHMLOY5V9rDz7XM2trs
	UncTbn21uHBkCrCg==
Date: Wed, 14 Jan 2026 09:01:43 +0100
Subject: [PATCH 11/15] vdso/helpers: Explicitly include vdso/processor.h
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260114-vdso-header-cleanups-v1-11-803b80ee97b4@linutronix.de>
References: <20260114-vdso-header-cleanups-v1-0-803b80ee97b4@linutronix.de>
In-Reply-To: <20260114-vdso-header-cleanups-v1-0-803b80ee97b4@linutronix.de>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Theodore Ts'o <tytso@mit.edu>, "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, 
 linux-mips@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768377702; l=694;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=6/mNsjAlKjxQ4RplTzUqjF/4vooh/hplxS2bcWKZqDo=;
 b=WKou+6nB5sbu+Wcr76Etle4+RUtUJQds56pKfoSvq8eG7qKUXBH17sbcep/48mSG8Sid8fFHB
 t8hjfmA67GLDNiNtzGetCc81wu1tJRHvXqlouD33bhoD+v11ZohncEZ
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

The usage of cpu_relax() requires vdso/processor.h. Currently
this header is included transitively, but that transitive inclusion is
about to go away.

Explicitly include the header.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 include/vdso/helpers.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/vdso/helpers.h b/include/vdso/helpers.h
index 1a5ee9d9052c..a1c995af4696 100644
--- a/include/vdso/helpers.h
+++ b/include/vdso/helpers.h
@@ -6,6 +6,7 @@
 
 #include <asm/barrier.h>
 #include <vdso/datapage.h>
+#include <vdso/processor.h>
 
 static __always_inline u32 vdso_read_begin(const struct vdso_clock *vc)
 {

-- 
2.52.0


