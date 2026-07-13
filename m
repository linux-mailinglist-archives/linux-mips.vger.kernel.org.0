Return-Path: <linux-mips+bounces-15851-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 775RA6jyVGo6hwAAu9opvQ
	(envelope-from <linux-mips+bounces-15851-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 13 Jul 2026 16:14:00 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 99DD674C37A
	for <lists+linux-mips@lfdr.de>; Mon, 13 Jul 2026 16:13:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=arm.com header.s=foss header.b=nFe7xAlP;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15851-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-mips+bounces-15851-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=arm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9FE5130664A6
	for <lists+linux-mips@lfdr.de>; Mon, 13 Jul 2026 14:05:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAE28437102;
	Mon, 13 Jul 2026 14:03:37 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53EAD43440F;
	Mon, 13 Jul 2026 14:03:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783951417; cv=none; b=kmkhzIVSIil+0BMGtd/pP9s08xfX5u6ta0GvznKpDpz1h061aWuZE3oG6NBdENzsJfzsDOkeOXl3wyFg48cJafL5Is68T5Q9ryetKKqGiZbYgAfdKBlfpcgQQ+d4HgRU07oEWflOLAV7zmQdGDqeSnt2txkcHxryzDIowp0F4U4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783951417; c=relaxed/simple;
	bh=QAL4GYmN8cF0pmxGGh9bWrEOsYJOq6TzQh5SyXgApoA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XamWiigeduuKWi4fawwqqiYUYTUwCUaANlQ6oCJT1hs377vM4LjXirjR3Uua4zB46Dg1eHr4G/fTqXOKitlztkQS+8SSgWlPOSMhjhFyTgMZ+nml0WX0Rs1/OGYCGB1UMATvFrWOJ1Rz2bt2M6x9EAQIZn6vuoJ5UjV0NRE6KYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=nFe7xAlP; arc=none smtp.client-ip=217.140.110.172
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9D6A62309;
	Mon, 13 Jul 2026 07:03:31 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id AF31A3F7B4;
	Mon, 13 Jul 2026 07:03:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783951415; bh=QAL4GYmN8cF0pmxGGh9bWrEOsYJOq6TzQh5SyXgApoA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nFe7xAlP2LDvWkRo0KA0ExYj7kOvwZ3/PeBr/ZxemEskfg5Bkh306EL0w/W9x9JIN
	 6Rx+rn4+oXKAD3tpAI7lV/BuzB2WGkXK7sBpbgChBd8nXbW9Icfb0KCMOKBYCtCIox
	 XMYIO7XpJyV2WpqTO0aUkz0XGFIpt8zutTPK0j+A=
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org,
	linux-arch@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	x86@kernel.org,
	linux-mm@kvack.org,
	kasan-dev@googlegroups.com,
	linux-csky@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org,
	linux-openrisc@vger.kernel.org
Cc: david@kernel.org,
	linux@armlinux.org.uk,
	akpm@linux-foundation.org,
	ankur.a.arora@oracle.com,
	rppt@kernel.org,
	linmag7@gmail.com,
	chleroy@kernel.org,
	klarasmodin@gmail.com,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	kas@kernel.org,
	zhangtianyang@loongson.cn,
	wangyuli@aosc.io,
	tsbogend@alpha.franken.de,
	ljs@kernel.org,
	jgg@ziepe.ca,
	catalin.marinas@arm.com,
	will@kernel.org,
	arnd@arndb.de,
	ryan.roberts@arm.com,
	pasha.tatashin@soleen.com,
	rmclure@linux.ibm.com,
	baolin.wang@linux.alibaba.com,
	tj@kernel.org,
	kevin.brodsky@arm.com,
	anup@brainfault.org,
	atish.patra@linux.dev,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	dave.hansen@linux.intel.com,
	luto@kernel.org,
	peterz@infradead.org,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	hpa@zytor.com,
	hannes@cmpxchg.org,
	mhocko@kernel.org,
	qi.zheng@linux.dev,
	shakeel.butt@linux.dev,
	kasong@tencent.com,
	baohua@kernel.org,
	axelrasmussen@google.com,
	yuanchu@google.com,
	weixugc@google.com,
	ryabinin.a.a@gmail.com,
	glider@google.com,
	andreyknvl@gmail.com,
	dvyukov@google.com,
	vincenzo.frascino@arm.com,
	anshuman.khandual@arm.com,
	yang@os.amperecomputing.com,
	chaitanyas.prakash@arm.com,
	ardb@kernel.org,
	guoren@kernel.org,
	yang.li85200@gmail.com,
	viro@zeniv.linux.org.uk,
	dinguyen@kernel.org,
	schuster.simon@siemens-energy.com,
	wangruikang@iscas.ac.cn,
	junhui.liu@pigmoral.tech,
	muchun.song@linux.dev,
	vishal.moola@gmail.com,
	namcao@linutronix.de,
	pavel@kernel.org,
	djbw@kernel.org,
	yu-cheng.yu@intel.com,
	baolu.lu@linux.intel.com,
	Jonathan.Cameron@huawei.com,
	coxu@redhat.com,
	andreas@gaisler.com,
	liam@infradead.org,
	vbabka@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	geert@linux-m68k.org,
	shorne@gmail.com,
	jonas@southpole.se,
	stefan.kristiansson@saunalahti.fi,
	Yeoreum Yun <yeoreum.yun@arm.com>
Subject: [RFC PATCH 34/34] arm64: pgtable: convert pte_present() from macro to static inline
Date: Mon, 13 Jul 2026 14:56:13 +0100
Message-ID: <20260713135614.1618183-35-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260713135614.1618183-1-yeoreum.yun@arm.com>
References: <20260713135614.1618183-1-yeoreum.yun@arm.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,armlinux.org.uk,linux-foundation.org,oracle.com,gmail.com,xen0n.name,loongson.cn,aosc.io,alpha.franken.de,ziepe.ca,arm.com,arndb.de,soleen.com,linux.ibm.com,linux.alibaba.com,brainfault.org,linux.dev,dabbelt.com,eecs.berkeley.edu,ghiti.fr,linux.intel.com,infradead.org,redhat.com,alien8.de,zytor.com,cmpxchg.org,tencent.com,google.com,os.amperecomputing.com,zeniv.linux.org.uk,siemens-energy.com,iscas.ac.cn,pigmoral.tech,linutronix.de,intel.com,huawei.com,gaisler.com,suse.com,linux-m68k.org,southpole.se,saunalahti.fi];
	TAGGED_FROM(0.00)[bounces-15851-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[yeoreum.yun@arm.com,linux-mips@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:loongarch@lists.linux.dev,m:linux-mips@vger.kernel.org,m:linux-arch@vger.kernel.org,m:kvm-riscv@lists.infradead.org,m:linux-riscv@lists.infradead.org,m:x86@kernel.org,m:linux-mm@kvack.org,m:kasan-dev@googlegroups.com,m:linux-csky@vger.kernel.org,m:linux-m68k@lists.linux-m68k.org,m:linux-openrisc@vger.kernel.org,m:david@kernel.org,m:linux@armlinux.org.uk,m:akpm@linux-foundation.org,m:ankur.a.arora@oracle.com,m:rppt@kernel.org,m:linmag7@gmail.com,m:chleroy@kernel.org,m:klarasmodin@gmail.com,m:chenhuacai@kernel.org,m:kernel@xen0n.name,m:kas@kernel.org,m:zhangtianyang@loongson.cn,m:wangyuli@aosc.io,m:tsbogend@alpha.franken.de,m:ljs@kernel.org,m:jgg@ziepe.ca,m:catalin.marinas@arm.com,m:will@kernel.org,m:arnd@arndb.de,m:ryan.roberts@arm.com,m:pasha.tatashin@soleen.com,m:rmclure@linux.ibm.com,m:baolin.wang@linux.alibaba.com,m:tj@kernel.org,m:kevin.brodsky@arm.com,m:anup@brainfault.org,m:atish.pa
 tra@linux.dev,m:pjw@kernel.org,m:palmer@dabbelt.com,m:aou@eecs.berkeley.edu,m:alex@ghiti.fr,m:dave.hansen@linux.intel.com,m:luto@kernel.org,m:peterz@infradead.org,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:hpa@zytor.com,m:hannes@cmpxchg.org,m:mhocko@kernel.org,m:qi.zheng@linux.dev,m:shakeel.butt@linux.dev,m:kasong@tencent.com,m:baohua@kernel.org,m:axelrasmussen@google.com,m:yuanchu@google.com,m:weixugc@google.com,m:ryabinin.a.a@gmail.com,m:glider@google.com,m:andreyknvl@gmail.com,m:dvyukov@google.com,m:vincenzo.frascino@arm.com,m:anshuman.khandual@arm.com,m:yang@os.amperecomputing.com,m:chaitanyas.prakash@arm.com,m:ardb@kernel.org,m:guoren@kernel.org,m:yang.li85200@gmail.com,m:viro@zeniv.linux.org.uk,m:dinguyen@kernel.org,m:schuster.simon@siemens-energy.com,m:wangruikang@iscas.ac.cn,m:junhui.liu@pigmoral.tech,m:muchun.song@linux.dev,m:vishal.moola@gmail.com,m:namcao@linutronix.de,m:pavel@kernel.org,m:djbw@kernel.org,m:yu-cheng.yu@intel.com,m:baolu.lu@linux.intel.com,m:Jon
 athan.Cameron@huawei.com,m:coxu@redhat.com,m:andreas@gaisler.com,m:liam@infradead.org,m:vbabka@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:geert@linux-m68k.org,m:shorne@gmail.com,m:jonas@southpole.se,m:stefan.kristiansson@saunalahti.fi,m:yeoreum.yun@arm.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[arm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yeoreum.yun@arm.com,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_GT_50(0.00)[95];
	TAGGED_RCPT(0.00)[linux-mips];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp,arm.com:from_mime,arm.com:mid,arm.com:email,arm.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 99DD674C37A

pte_present() is used as the basis for both pmd_present() and pud_present().
It is currently implemented as a macro composed of pte_val() and
pte_present_invalid().

When pte_present() or its higher-level variants are used directly with
ptep_get() or pXdp_get(), for example:

  pte_present(ptep_get(pte));
  pmd_present(pmdp_get(pmd));
  pud_present(pudp_get(pud));

the macro expansion causes the compiler to evaluate the argument twice,
resulting in redundant loads. For example, pte_present() expands to:

  !pte_val(READ_ONCE(*pte) || pte_present_invalid(READ_ONCE(*pte))

A typical example is pud_free_pmd_page(), where the expansion of
pmd_present() generates:
    ...
    /* pmd_present() (x20 = pmdp) */
    1b88: f9400288     ldr	x8, [x20]        // read pmdp.
    1b8c: f9000fa8     str	x8, [x29, #0x18]
    1b90: 3707fec8     tbnz	w8, #0x0, 0x1b68 <pud_free_pmd_page+0xd0>
    1b94: f9400288     ldr	x8, [x20]        // redundant read of pmdp.
    1b98: 8a170109     and	x9, x8, x23
    1b9c: f9000fa8     str	x8, [x29, #0x18]
    1ba0: f120013f     cmp	x9, #0x800
    1ba4: 54fffe20     b.eq	0x1b68 <pud_free_pmd_page+0xd0>
    1ba8: 17fffff4     b	0x1b78 <pud_free_pmd_page+0xe0>
    ...

Convert pte_present() to static inline function so that prevent the
generation of redundant code and move pte_valid() and
pte_present_invalid() further up so the inline function can use them.

After this change, the generated code becomes:
    ...
    /* pmd_present() (x20 = pmdp) */
    1a30: f9400288     ldr	x8, [x20]
    1a34: 8a170109     and	x9, x8, x23
    1a38: f9000fa8     str	x8, [x29, #0x18]
    1a3c: f120013f     cmp	x9, #0x800
    1a40: 54fffe80     b.eq	0x1a10 <pud_free_pmd_page+0xd0>
    1a44: 3607fee8     tbz	w8, #0x0, 0x1a20 <pud_free_pmd_page+0xe0>
    1a48: 17fffff2     b	0x1a10 <pud_free_pmd_page+0xd0>
    ...

This eliminates the redundant load and also reduces code size at
call sites using this pattern. For example, pud_free_pmd_page() shrinks
from 7,500 bytes to 7,148 bytes, a reduction of approximately 4.7%.

Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 arch/arm64/include/asm/pgtable.h | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index 6185fc291fd7d..aaae3d14895f6 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -140,10 +140,17 @@ static inline pteval_t __phys_to_pte_val(phys_addr_t phys)
 #define pte_none(pte)		(!pte_val(pte))
 #define pte_page(pte)		(pfn_to_page(pte_pfn(pte)))
 
+#define pte_valid(pte)		(!!(pte_val(pte) & PTE_VALID))
+#define pte_present_invalid(pte) \
+	((pte_val(pte) & (PTE_VALID | PTE_PRESENT_INVALID)) == PTE_PRESENT_INVALID)
+
 /*
  * The following only work if pte_present(). Undefined behaviour otherwise.
  */
-#define pte_present(pte)	(pte_valid(pte) || pte_present_invalid(pte))
+static __always_inline bool pte_present(pte_t pte)
+{
+	return pte_valid(pte) || pte_present_invalid(pte);
+}
 #define pte_young(pte)		(!!(pte_val(pte) & PTE_AF))
 #define pte_special(pte)	(!!(pte_val(pte) & PTE_SPECIAL))
 #define pte_write(pte)		(!!(pte_val(pte) & PTE_WRITE))
@@ -168,9 +175,6 @@ static inline pteval_t __phys_to_pte_val(phys_addr_t phys)
 #define pte_sw_dirty(pte)	(!!(pte_val(pte) & PTE_DIRTY))
 #define pte_dirty(pte)		(pte_sw_dirty(pte) || pte_hw_dirty(pte))
 
-#define pte_valid(pte)		(!!(pte_val(pte) & PTE_VALID))
-#define pte_present_invalid(pte) \
-	((pte_val(pte) & (PTE_VALID | PTE_PRESENT_INVALID)) == PTE_PRESENT_INVALID)
 /*
  * Execute-only user mappings do not have the PTE_USER bit set. All valid
  * kernel mappings have the PTE_UXN bit set.
-- 
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}


