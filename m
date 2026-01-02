Return-Path: <linux-mips+bounces-12692-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A07EFCEDE4A
	for <lists+linux-mips@lfdr.de>; Fri, 02 Jan 2026 08:12:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 11C0E3013EE2
	for <lists+linux-mips@lfdr.de>; Fri,  2 Jan 2026 07:11:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE22330E0E7;
	Fri,  2 Jan 2026 07:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Inzhh79V"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 759B430E0CC;
	Fri,  2 Jan 2026 07:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767337584; cv=none; b=A6/+Lm7FhV+F/unA4gVjsrrnSwxFe72RvJ1j9JpXt8vhp19/GtZqlLSsruZj4Gem6jbcEjUUBpcA0vrKj/ukwUstMPCgTPdR7sU2OY04XbO4PfDk3PcSu/kRE5s3LGgEi6DbPXUOOw8UzPLJ6cQRRKRE4HBjPHtq5rhbKB4pSYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767337584; c=relaxed/simple;
	bh=q+M5A50bBS7JfetqFByPT+KJrphXgISZqTpM92eTenA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AFr1IvVY9TuFX2xK8C12SyOVo/GxVQP5vqk8PsE8t8F0oG1yLi47888PUJST+6swcqkG7tfgyp+fweJCiXUsInnfOozKUTPHrAFTovFsUn5MIX9k8sjAebHvMBAK91THy+gugVeQ410B4Ygk15Xf8tLQUx3gh+8PKJpA+flutHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Inzhh79V; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72875C116D0;
	Fri,  2 Jan 2026 07:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767337584;
	bh=q+M5A50bBS7JfetqFByPT+KJrphXgISZqTpM92eTenA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Inzhh79VgyZ5ZJxghX5baX9tzk6HIXuZ2MyqXt2ADd1mHizZQUaLq3g/u+lhVlVEH
	 kKgI9ji+RRI3pXIaxvmzfXOBumXagdqGp9BtkhjHVMewmngWlnF2E2IL9QTkOuRSgA
	 F5wxMXSi1A6yoJSUGtErYauF2O/JyBm3/k7mIOJswcDRKHuzj6G9fKWXAYhoaocl3X
	 m5h6uKBtJQGDNcQcCMWGhQ3CQWLoc9niN5VqwphQ53oJeTNLdLJkMwAcW4v7twPhRC
	 5qG2/LuaasR/8SN3/olgUS1+J1BoQDKKseepevIyapBoMFO2rsT09pb815Wn1kOow6
	 9VlvE1zKTvTrg==
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Alex Shi <alexs@kernel.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Andreas Larsson <andreas@gaisler.com>,
	Borislav Petkov <bp@alien8.de>,
	Brian Cain <bcain@kernel.org>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	"David S. Miller" <davem@davemloft.net>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	David Hildenbrand <david@kernel.org>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Guo Ren <guoren@kernel.org>,
	Heiko Carstens <hca@linux.ibm.com>,
	Helge Deller <deller@gmx.de>,
	Huacai Chen <chenhuacai@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Jonathan Corbet <corbet@lwn.net>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Magnus Lindholm <linmag7@gmail.com>,
	Matt Turner <mattst88@gmail.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Michal Hocko <mhocko@suse.com>,
	Michal Simek <monstr@monstr.eu>,
	Mike Rapoport <rppt@kernel.org>,
	Muchun Song <muchun.song@linux.dev>,
	Oscar Salvador <osalvador@suse.de>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Richard Weinberger <richard@nod.at>,
	Russell King <linux@armlinux.org.uk>,
	Stafford Horne <shorne@gmail.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Vineet Gupta <vgupta@kernel.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	Will Deacon <will@kernel.org>,
	x86@kernel.org,
	linux-alpha@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org,
	linux-cxl@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-mm@kvack.org,
	linux-openrisc@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-um@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	loongarch@lists.linux.dev,
	sparclinux@vger.kernel.org
Subject: [PATCH v2 25/28] x86: don't reserve hugetlb memory in setup_arch()
Date: Fri,  2 Jan 2026 09:00:01 +0200
Message-ID: <20260102070005.65328-26-rppt@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260102070005.65328-1-rppt@kernel.org>
References: <20260102070005.65328-1-rppt@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>

Commit 665eaf313314 ("x86/setup: call hugetlb_bootmem_alloc early")
added an early call to hugetlb_bootmem_alloc() to setup_arch() to allow
HVO style pre-initialization of vmemmap on x86.

With the ordering of hugetlb reservation vs memory map initialization
sorted out in core MM this no longer needs to be an architecture specific
quirk.

Drop the call to hugetlb_bootmem_alloc() from x86::setup_arch().

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 arch/x86/kernel/setup.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/x86/kernel/setup.c b/arch/x86/kernel/setup.c
index 1b2edd07a3e1..e2318fa9b1bb 100644
--- a/arch/x86/kernel/setup.c
+++ b/arch/x86/kernel/setup.c
@@ -1191,7 +1191,6 @@ void __init setup_arch(char **cmdline_p)
 
 	if (boot_cpu_has(X86_FEATURE_GBPAGES)) {
 		hugetlb_cma_reserve(PUD_SHIFT - PAGE_SHIFT);
-		hugetlb_bootmem_alloc();
 	}
 
 	/*
-- 
2.51.0


