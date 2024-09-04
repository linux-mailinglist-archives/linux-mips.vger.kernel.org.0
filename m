Return-Path: <linux-mips+bounces-5333-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D321796C4B4
	for <lists+linux-mips@lfdr.de>; Wed,  4 Sep 2024 19:03:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 89FC81F25E72
	for <lists+linux-mips@lfdr.de>; Wed,  4 Sep 2024 17:03:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3792E1E0B66;
	Wed,  4 Sep 2024 17:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FTaxHHza"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D66B31DA31D;
	Wed,  4 Sep 2024 17:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725469429; cv=none; b=ZIydnDbmKnJa6Hw5ITRylyhl9bqSOoqXFiRfVHWgqypY5I4StwDlD5jFIrdEPi6jhEHcVY8WXRPQcUJ9tr5GNqi9b0QIdQRCsq0DTsTwWG9wn+zl2SVSiHIUOmmwnukTyw1TJkmmF6HOMuYFx2mR2LTzpN5inh4kR4LY4lfi2JI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725469429; c=relaxed/simple;
	bh=bULBmEyxTuexdIoDddURy1JjGZM6ZRxX3SqU1u9O/JQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=IyFhX/BtuSqRowXLEQXdJR6nr0b5gXAT6wOCu/35oSuNbB5BUoB5i/A3MzufNHb4NPIuHT7LIox+UqLgxldamk8CuL/cs5u9zC0yUyyCz4SsPMrgYQ8ZI3a8SeK7Dgnr/cC31YhryLDJMMpMtbkfJv4Iyn9RQXSEUrFs4LRTl/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FTaxHHza; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EDBEC4CEC2;
	Wed,  4 Sep 2024 17:03:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725469428;
	bh=bULBmEyxTuexdIoDddURy1JjGZM6ZRxX3SqU1u9O/JQ=;
	h=From:Subject:Date:To:Cc:From;
	b=FTaxHHzaSOfcI3YLDnf/RnK9wC9qPyShM2HHxP3ePgjXB4NzyW2MkLMNNnsY+7v4Z
	 1BqEDPvdwMr5k02sgsmIGDZzMKjOcEsh9tA142jKOFo1P8ZjN/n52sA4C0wtgY18zF
	 5V5febs0O1ZTA3zWdh8wxr3emx0HgY+VfvCXQQ0XFPkideKAHE4KMLxvNDMJwttmeP
	 APk3LE8irqsbcVBm3HqujP64qpo/YdVuUUvJohvWjWIzT6T3qn8/4A85zZhTf7Ye/F
	 2jIlctaoy6DYrQlGVrAcChy6U0YmO9LTnt160G1xK9EBP6+2LceZefaqQEqp7fNoYI
	 FD/7ShoBEL8oQ==
From: Mark Brown <broonie@kernel.org>
Subject: [PATCH v2 0/3] mm: Care about shadow stack guard gap when getting
 an unmapped area
Date: Wed, 04 Sep 2024 17:57:58 +0100
Message-Id: <20240904-mm-generic-shadow-stack-guard-v2-0-a46b8b6dc0ed@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJeR2GYC/4XNQQ6CMBCF4auQrh1TWknAlfcwLEpnLA3Skimih
 nB3Kx7A5f+S+WYVidhTEudiFUyLTz6GHOpQCNub4Ag85hZKqpOstYRxBEchH1lIvcH4hDQbO4B
 7GEaoOlt1NUpqKhTZmJhu/rX71zZ379Mc+b2/W8rv+pMbqf7ISwkSGmPR6LrTiPoyEAe6HyM70
 W7b9gEGbzW4ywAAAA==
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
 "Liam R. Howlett" <Liam.Howlett@Oracle.com>, 
 Mark Brown <broonie@kernel.org>, 
 Rick Edgecombe <rick.p.edgecombe@intel.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=openpgp-sha256; l=3075; i=broonie@kernel.org;
 h=from:subject:message-id; bh=bULBmEyxTuexdIoDddURy1JjGZM6ZRxX3SqU1u9O/JQ=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBm2JLn9sSIWk3S99ZcZ0LBwVX5IdsXF8juyr4Cy5E1
 KFq4s/aJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZtiS5wAKCRAk1otyXVSH0LHiB/
 9nkgQUOVTlUbAmWo/1GWPj3aVUvDcv0pj9B7z3NcU9N9R9JzbgMMFLrWdQk5jwpTGfHHXkRNANVuvF
 yKig8+IRVvSpGuFpKpsLmegPvrQX1McoVCR659thVX2oLIf6wpdg0LRsBXocswHT36RDNsVfpdTsJM
 X1S72+e1Jt9HIYt4so8I0Zdga/Mt9VqrIg4QrfUtNDzNMYv7a8/AtVY7saHIjeiEwSOdKShaIlDBPV
 aMyaeN6XQhDtvIJQopnxBZsr+uDpt9WM/iq/kDuIa1U6F5kpoObcPaMG4EfjQ3fobknmo/jMH0lBSh
 O0wNT8iXCGWSoD2Q3fN3Rp0pOZQAOP
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
placed without guard pages. The arm64 and RISC-V shadow stack
implementations are currently on the list:

   https://lore.kernel.org/r/20240829-arm64-gcs-v12-0-42fec94743
   https://lore.kernel.org/lkml/20240403234054.2020347-1-debug@rivosinc.com/

Given the addition of the use of vm_flags in the generic implementation
we also simplify the set of possibilities that have to be dealt with in
the core code by making arch_get_unmapped_area() take vm_flags as
standard. This is a bit invasive since the prototype change touches
quite a few architectures but since the parameter is ignored the change
is straightforward, the simplification for the generic code seems worth
it.

Changes in v2:
- Add comment to stack_guard_placement()
- Build fixes for xtensa and MIPS.
- Link to v1: https://lore.kernel.org/r/20240902-mm-generic-shadow-stack-guard-v1-0-9acda38b3dd3@kernel.org

---
Mark Brown (3):
      mm: Make arch_get_unmapped_area() take vm_flags by default
      mm: Pass vm_flags to generic_get_unmapped_area()
      mm: Care about shadow stack guard gap when getting an unmapped area

 arch/alpha/kernel/osf_sys.c       |  2 +-
 arch/arc/mm/mmap.c                |  3 ++-
 arch/arm/mm/mmap.c                |  7 ++---
 arch/csky/abiv1/mmap.c            |  3 ++-
 arch/loongarch/mm/mmap.c          |  5 ++--
 arch/mips/mm/mmap.c               |  5 ++--
 arch/parisc/kernel/sys_parisc.c   |  5 ++--
 arch/parisc/mm/hugetlbpage.c      |  2 +-
 arch/powerpc/mm/book3s64/slice.c  | 10 ++++---
 arch/s390/mm/mmap.c               |  4 +--
 arch/sh/mm/mmap.c                 |  5 ++--
 arch/sparc/kernel/sys_sparc_32.c  |  2 +-
 arch/sparc/kernel/sys_sparc_64.c  |  4 +--
 arch/x86/include/asm/pgtable_64.h |  1 -
 arch/x86/kernel/sys_x86_64.c      | 21 +++------------
 arch/xtensa/kernel/syscall.c      |  3 ++-
 include/linux/sched/mm.h          | 27 +++++++------------
 mm/mmap.c                         | 55 +++++++++++++++++++--------------------
 18 files changed, 75 insertions(+), 89 deletions(-)
---
base-commit: 7c626ce4bae1ac14f60076d00eafe71af30450ba
change-id: 20240830-mm-generic-shadow-stack-guard-5bc5b8d0e95d

Best regards,
-- 
Mark Brown <broonie@kernel.org>


