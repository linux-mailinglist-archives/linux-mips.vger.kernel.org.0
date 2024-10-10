Return-Path: <linux-mips+bounces-5849-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BEB04997E47
	for <lists+linux-mips@lfdr.de>; Thu, 10 Oct 2024 09:03:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6722C1F27638
	for <lists+linux-mips@lfdr.de>; Thu, 10 Oct 2024 07:03:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0ECF21BDAA0;
	Thu, 10 Oct 2024 07:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Q9YOUPVl";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="TAio2B7l"
X-Original-To: linux-mips@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B00EB1BC9FE;
	Thu, 10 Oct 2024 07:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728543728; cv=none; b=BX+kSS+YlfLa0fuJzN6kI1zgcOvHLEioJ1fw11zRvxzECH5qqnMIAQZocg1uCwF2zcQjmOSP2ZUtxj5Wp3urtZOMPQdBQSknhkiU9qLygekrBNwbgdR7v3OxQ+ZMHZuoMja6g4VsL9eR1XVh49ikiRiPNLA0RYig8aZSpeIkcSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728543728; c=relaxed/simple;
	bh=kTMXixxVJlfX+2o4JjaS2yYnPzAKaCOR1RKXEsusUJ0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=C/x0DotuR8MfzlwGWqMJjFPJxopADbBcj/Ong6rTnea5iPeI6fbnqHxQmtb9YUP+fJVTN57uG5MKZ76dQAJHIpsCnAdDoVzoKpfJjFa7ntVPeGr3/bctmDjZXZEhrEQoG2tccbCiScEuGVH03okHerjFmDRn1c3JrjCj4KNXJrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Q9YOUPVl; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=TAio2B7l; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1728543725;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GhJhmDhOtFZRa5lN3xjZ1GIvTXwzfeBQ6s2WuntEo2A=;
	b=Q9YOUPVlbRgarYFZCEn3UByLmZ+tdONBS0jm2Njl7NuYL217YwE9aEGuhhDzPYtI8auXWI
	6EUH0gAxMTswBA+hCJ/uSBXpp7rUJ8dUnVNaSglS6YJ/pO2jv181FiW9TruX1n6wnuoymG
	QBNjWPWFl1HtIKdmgkFMRMM/SW/gJLEcl8Z/NpCXVDRm+Pxerg1xyOrNdLRu8a7tLi/yaQ
	MWZJoK6aQUPZXe+0hirbZKdMT4aFxmGegPMU1LhVE1mlW2YU9zKGaO6JXofmppA0mqxP2D
	O6Q6Q4kN//3QwEoHxIC/FfTFI6FZqd3kyhX/Z5SgGRZn950eO4RGgG8ruOhaTQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1728543725;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GhJhmDhOtFZRa5lN3xjZ1GIvTXwzfeBQ6s2WuntEo2A=;
	b=TAio2B7lTV1K9VxvAcZ6eNE+Q36Yw79samXTeYefVjIJKo5jhM0OyGWf0mAgAZBaDq9RrV
	oo6TB75HhFT+wsDQ==
Date: Thu, 10 Oct 2024 09:01:11 +0200
Subject: [PATCH 09/28] MIPS: vdso: Avoid name conflict around "vdso_data"
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241010-vdso-generic-base-v1-9-b64f0842d512@linutronix.de>
References: <20241010-vdso-generic-base-v1-0-b64f0842d512@linutronix.de>
In-Reply-To: <20241010-vdso-generic-base-v1-0-b64f0842d512@linutronix.de>
To: Guo Ren <guoren@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, 
 Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Russell King <linux@armlinux.org.uk>, Huacai Chen <chenhuacai@kernel.org>, 
 WANG Xuerui <kernel@xen0n.name>, Theodore Ts'o <tytso@mit.edu>, 
 "Jason A. Donenfeld" <Jason@zx2c4.com>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, 
 Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>, 
 linux-csky@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-s390@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-riscv@lists.infradead.org, loongarch@lists.linux.dev, 
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728543717; l=1337;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=kTMXixxVJlfX+2o4JjaS2yYnPzAKaCOR1RKXEsusUJ0=;
 b=HVksjM017my4j/baEMdnqIYnTkC5X6ULTM3kipfeka7LvdRE8rDfL1D4EZZQQ5t3NMAkzyRXH
 Z4a3SXUt+vfCNgB3baUfOvVrwy2M2av2cDJKG1sBSM0vWJN6JEF8iOb
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

The generic vdso/datapage.h declares a symbol named "vdso_data".
Avoid a conflict by renaming the identically named variable in genvdso.c.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/mips/vdso/genvdso.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/mips/vdso/genvdso.c b/arch/mips/vdso/genvdso.c
index 09e30eb4be8605581f9ea40b757dd4e576ed0c2a..d47412ea6e6736b8714f7db7e4cfe7c18bf12c04 100644
--- a/arch/mips/vdso/genvdso.c
+++ b/arch/mips/vdso/genvdso.c
@@ -270,7 +270,7 @@ int main(int argc, char **argv)
 
 	/* Write out the stripped VDSO data. */
 	fprintf(out_file,
-		"static unsigned char vdso_data[PAGE_ALIGN(%zu)] __page_aligned_data = {\n\t",
+		"static unsigned char vdso_image_data[PAGE_ALIGN(%zu)] __page_aligned_data = {\n\t",
 		vdso_size);
 	for (i = 0; i < vdso_size; i++) {
 		if (!(i % 10))
@@ -286,7 +286,7 @@ int main(int argc, char **argv)
 
 	fprintf(out_file, "struct mips_vdso_image vdso_image%s%s = {\n",
 		(vdso_name[0]) ? "_" : "", vdso_name);
-	fprintf(out_file, "\t.data = vdso_data,\n");
+	fprintf(out_file, "\t.data = vdso_image_data,\n");
 	fprintf(out_file, "\t.size = PAGE_ALIGN(%zu),\n", vdso_size);
 	fprintf(out_file, "\t.mapping = {\n");
 	fprintf(out_file, "\t\t.name = \"[vdso]\",\n");

-- 
2.47.0


