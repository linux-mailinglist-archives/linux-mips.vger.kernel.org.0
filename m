Return-Path: <linux-mips+bounces-11712-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 00765BD994F
	for <lists+linux-mips@lfdr.de>; Tue, 14 Oct 2025 15:12:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E773B1887879
	for <lists+linux-mips@lfdr.de>; Tue, 14 Oct 2025 13:09:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EDE9314A97;
	Tue, 14 Oct 2025 13:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="L6TpQNh7";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="C8AAY+K/"
X-Original-To: linux-mips@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D1EB30C371;
	Tue, 14 Oct 2025 13:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760447154; cv=none; b=peqrYPMMbaK0/xdkxyvOgES2F5O1j2ukn8Wfcx9dQ1ANbd9PPChZzSboYIigEx0ARQ7lVdEpFf5BM95RRuCvxX0vVXxwRL4tHj/COdUVZZhFoywwRfa1n0JjhSQX98SFjNI3pFwwWE+BswaF94uCbDugsjkqbr5hNMhJJjihfI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760447154; c=relaxed/simple;
	bh=IDhCA1BagrOzAKjk7RuNtb+m/Zg87sOWHgJNO4N/lzs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D14ud+ygD7rgKs412m2klwfGPnxsNKyEjcFQpWcg4sY2s6mEEkCk6lz/1In9Q6zZnLzeeke6X/W1100hDixR/IP/YbKfiDaYBglntAc4EA+iIPFgI3Yof5JXZ/VLZb6A69hvD2maxtHuRp9sYjBXAdys2Vq02XlvoFoKdDF3FIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=L6TpQNh7; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=C8AAY+K/; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1760447150;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rmWsgXe/EUJlh3Oqic3jAEqEyRP4824MK4HzVDJVrYI=;
	b=L6TpQNh7Vb8hlDonYQwENXkD64j52H59yc/Kb8VjJ6hEGCsGrURA/TSoLYPqPKPy+v7+CF
	i5QpAoY/QaDuIQtziFgIqe3wuE7blMwjVWQ3xuxQYy9vzsoiT1LWrkdUbSOTZ8sR1FjDtZ
	fKLXrqO7/b4QvE/vyglIm6iTxIzdRvaA7+7nv32D75VtEcv9SS4GfR8Fw5lhnzsd8BRwuR
	7F87BGld5J/KWnpMWzEXYt03tOWSrAxX1xUG9y/pDcBeAlVS9SaqFzm53ra9MB+ObiCjID
	9AVH20CII2f5VWgO0tZAZwwbzbhuWa4CIEyVtaoyndKBAsU9wOXROlw3UyK1HA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1760447150;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rmWsgXe/EUJlh3Oqic3jAEqEyRP4824MK4HzVDJVrYI=;
	b=C8AAY+K/Vpov18nnCiOgJypH4XE/Z4j8vzRNImlx/xoZGX4JCR77rgTkUawUW8aIh3iarf
	XBuD81oOW8Hum1DA==
Date: Tue, 14 Oct 2025 15:05:16 +0200
Subject: [PATCH v2 01/10] kbuild: don't enable CC_CAN_LINK if the dummy
 program generates warnings
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251014-kbuild-userprogs-bits-v2-1-faeec46e887a@linutronix.de>
References: <20251014-kbuild-userprogs-bits-v2-0-faeec46e887a@linutronix.de>
In-Reply-To: <20251014-kbuild-userprogs-bits-v2-0-faeec46e887a@linutronix.de>
To: Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nicolas.schier@linux.dev>, Nicolas Schier <nsc@kernel.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 "David S. Miller" <davem@davemloft.net>, 
 Andreas Larsson <andreas@gaisler.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Masahiro Yamada <masahiroy@kernel.org>, linux-riscv@lists.infradead.org, 
 linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-mips@vger.kernel.org, sparclinux@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760447149; l=1486;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=IDhCA1BagrOzAKjk7RuNtb+m/Zg87sOWHgJNO4N/lzs=;
 b=2GBDxIG9QU3kONJteRcQFaut1ha2ZM7A46rDztSe+RBbZ/fhVoTctHwgcHlR3TApjkzsEu0sX
 faVc067JB5BDIb+TLHZhVg0TdYAJhlc1qUyldatX+RhG2bGSRhmA55P
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

It is possible that the kernel toolchain generates warnings when used
together with the system toolchain. This happens for example when the
older kernel toolchain does not handle new versions of sframe debug
information. While these warnings where ignored during the evaluation
of CC_CAN_LINK, together with CONFIG_WERROR the actual userprog build
will later fail.

Example warning:

.../x86_64-linux/13.2.0/../../../../x86_64-linux/bin/ld:
error in /lib/../lib64/crt1.o(.sframe); no .sframe will be created
collect2: error: ld returned 1 exit status

Make sure that the very simple example program does not generate
warnings already to avoid breaking the userprog compilations.

Fixes: ec4a3992bc0b ("kbuild: respect CONFIG_WERROR for linker and assembler")
Fixes: 3f0ff4cc6ffb ("kbuild: respect CONFIG_WERROR for userprogs")
Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 scripts/cc-can-link.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/cc-can-link.sh b/scripts/cc-can-link.sh
index 6efcead3198989d2ab2ab6772c72d8bb61c89c4e..e67fd8d7b6841e53341045b28dc5196cc1327cbe 100755
--- a/scripts/cc-can-link.sh
+++ b/scripts/cc-can-link.sh
@@ -1,7 +1,7 @@
 #!/bin/sh
 # SPDX-License-Identifier: GPL-2.0
 
-cat << "END" | $@ -x c - -o /dev/null >/dev/null 2>&1
+cat << "END" | $@ -Werror -Wl,--fatal-warnings -x c - -o /dev/null >/dev/null 2>&1
 #include <stdio.h>
 int main(void)
 {

-- 
2.51.0


