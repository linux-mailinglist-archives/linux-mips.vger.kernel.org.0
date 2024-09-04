Return-Path: <linux-mips+bounces-5336-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6481D96C4D5
	for <lists+linux-mips@lfdr.de>; Wed,  4 Sep 2024 19:04:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8FCE7B23821
	for <lists+linux-mips@lfdr.de>; Wed,  4 Sep 2024 17:04:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CB9E1E0B99;
	Wed,  4 Sep 2024 17:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XMng1+N5"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DBFC1E0B86;
	Wed,  4 Sep 2024 17:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725469459; cv=none; b=W+p7WJ1O3bz4E/W0RCv5D/IEQDRDZJ9OODBaLFs7DjTuD2AiH+mBXCU73qNYTMxsACa0M3Ajfd42f2QcMyzHISSY9qH+gk/UieX7qsDXGazcZ9DF1EHNsv0qbn9a8w28wjAoKqdIlUUW83sf9o7Rt0h5BLuVGWMhctleE9nJcYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725469459; c=relaxed/simple;
	bh=6l7d6i2Hr/t16H3e0PM6ntsqOX0xtByvRrAFpx2RPdc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kESPip5BobWZIhi9sdTWSUOLp0o3/V7ELFNUx8a3i7S4lx6VE9ILANOyBUCfsP0xt+IBslYSwVHKKuOm8hEYvtKdmwepAGKHd0aq/8Aao8j9ZNZxc4NqXYgeXOjUOpBlZDGKRe+INadF43Acih7pUdSG2lK171zZcdSkPfkM4Ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XMng1+N5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E2ECC4CECB;
	Wed,  4 Sep 2024 17:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725469458;
	bh=6l7d6i2Hr/t16H3e0PM6ntsqOX0xtByvRrAFpx2RPdc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=XMng1+N5KmI2Uyam4ahGOmJ7SA6LJYTXKVjx7qG8VnUZ/zUuGhRBCUkXKze2d/h2W
	 qvk9lXkZAy6Y05LO0D8t2nFprSfQ7TcDWzQJu8SE80qNBE+/r6k3g83BIKWOzMfOt/
	 Dvpd5qWmKHpFvZ2SytdtRA/ewzxfCdXGeHxRiiWyHN4p2CWQTl0lHTEU4UgysXWzN2
	 eTOvyqyDhTsz/6ctIBuFArpRcUT1qm+ZYrAJVgsZe+irs/+81QH88lWveZJX5wrZrg
	 OTOm7mY8GpWO9fbBe5Sz+TeGAp/qLFj/uFen9cZ5SvcQauQXuNRCmgGBYLVs1L2zqm
	 CIGueYv9nSccQ==
From: Mark Brown <broonie@kernel.org>
Date: Wed, 04 Sep 2024 17:58:01 +0100
Subject: [PATCH v2 3/3] mm: Care about shadow stack guard gap when getting
 an unmapped area
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240904-mm-generic-shadow-stack-guard-v2-3-a46b8b6dc0ed@kernel.org>
References: <20240904-mm-generic-shadow-stack-guard-v2-0-a46b8b6dc0ed@kernel.org>
In-Reply-To: <20240904-mm-generic-shadow-stack-guard-v2-0-a46b8b6dc0ed@kernel.org>
To: Richard Henderson <richard.henderson@linaro.org>, 
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, 
 Matt Turner <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>, 
 Russell King <linux@armlinux.org.uk>, Guo Ren <guoren@kernel.org>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>, 
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, 
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
 "David S. Miller" <davem@davemloft.net>, 
 Andreas Larsson <andreas@gaisler.com>, Thomas Gleixner <tglx@linutronix.de>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, Chris Zankel <chris@zankel.net>, 
 Max Filippov <jcmvbkbc@gmail.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-csky@vger.kernel.org, loongarch@lists.linux.dev, 
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, linux-mm@kvack.org, 
 Rick Edgecombe <rick.p.edgecombe@intel.com>, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=openpgp-sha256; l=2551; i=broonie@kernel.org;
 h=from:subject:message-id; bh=6l7d6i2Hr/t16H3e0PM6ntsqOX0xtByvRrAFpx2RPdc=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBm2JLp8oAy9lYwTYiPgligR57zoDd7L+at5nOq93BI
 UyufcpKJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZtiS6QAKCRAk1otyXVSH0OADB/
 0ch6Ppo1cUyP74KOdaZaA30djq+AGYfXlBTOUWViXVC9fGK3bpaqsBB0Cfo7Fu6OsGVc21oO0/yUH1
 YrAVYn6NPOHjgywpcI1TnkgqUaxfBOur+h4alPeKfO22P8IGuFmDQWUyfu/9w5PhhvsetXQF8HjY3+
 VA0L3qH2XKq516PsycNgfFI7aYDz9EL8tCzzuTsMp8jhgeTHcVNNcxzbWDDBDU5qQBsU5P9IwQfOAx
 OuEH/w/+Xqho79dLxhqBNChGpSjBv7foaNTf0PLA9gi1zV9CAxhWJ6oVaByM60hUmP9mC93njCQXlg
 DUm9swJvc4113Ub/xAIxFMCk0q1OCk
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

As covered in the commit log for c44357c2e76b ("x86/mm: care about shadow
stack guard gap during placement") our current mmap() implementation does
not take care to ensure that a new mapping isn't placed with existing
mappings inside it's own guard gaps. This is particularly important for
shadow stacks since if two shadow stacks end up getting placed adjacent to
each other then they can overflow into each other which weakens the
protection offered by the feature.

On x86 there is a custom arch_get_unmapped_area() which was updated by the
above commit to cover this case by specifying a start_gap for allocations
with VM_SHADOW_STACK. Both arm64 and RISC-V have equivalent features and
use the generic implementation of arch_get_unmapped_area() so let's make
the equivalent change there so they also don't get shadow stack pages
placed without guard pages. x86 uses a single page guard, this is also
sufficient for arm64 where we either do single word pops and pushes or
unconstrained writes.

Architectures which do not have this feature will define VM_SHADOW_STACK
to VM_NONE and hence be unaffected.

Suggested-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
Acked-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 mm/mmap.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/mm/mmap.c b/mm/mmap.c
index b06ba847c96e..050c5ae2f80f 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -1753,6 +1753,18 @@ static unsigned long unmapped_area_topdown(struct vm_unmapped_area_info *info)
 	return gap;
 }
 
+/*
+ * Determine if the allocation needs to ensure that there is no
+ * existing mapping within it's guard gaps, for use as start_gap.
+ */
+static inline unsigned long stack_guard_placement(vm_flags_t vm_flags)
+{
+	if (vm_flags & VM_SHADOW_STACK)
+		return PAGE_SIZE;
+
+	return 0;
+}
+
 /*
  * Search for an unmapped address range.
  *
@@ -1814,6 +1826,7 @@ generic_get_unmapped_area(struct file *filp, unsigned long addr,
 	info.length = len;
 	info.low_limit = mm->mmap_base;
 	info.high_limit = mmap_end;
+	info.start_gap = stack_guard_placement(vm_flags);
 	return vm_unmapped_area(&info);
 }
 
@@ -1863,6 +1876,7 @@ generic_get_unmapped_area_topdown(struct file *filp, unsigned long addr,
 	info.length = len;
 	info.low_limit = PAGE_SIZE;
 	info.high_limit = arch_get_mmap_base(addr, mm->mmap_base);
+	info.start_gap = stack_guard_placement(vm_flags);
 	addr = vm_unmapped_area(&info);
 
 	/*

-- 
2.39.2


