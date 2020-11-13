Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0E002B19B7
	for <lists+linux-mips@lfdr.de>; Fri, 13 Nov 2020 12:13:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726460AbgKMLNe (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 13 Nov 2020 06:13:34 -0500
Received: from mx2.suse.de ([195.135.220.15]:33016 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726597AbgKMLKO (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 13 Nov 2020 06:10:14 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id ECA9EAEFB;
        Fri, 13 Nov 2020 11:10:11 +0000 (UTC)
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Huacai Chen <chenhc@lemote.com>,
        Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
        linux-mips@vger.kernel.org, kvm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] MIPS: kvm: Use vm_get_page_prot to get protection bits
Date:   Fri, 13 Nov 2020 12:09:50 +0100
Message-Id: <20201113110952.68086-2-tsbogend@alpha.franken.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20201113110952.68086-1-tsbogend@alpha.franken.de>
References: <20201113110952.68086-1-tsbogend@alpha.franken.de>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

MIPS protection bits are setup during runtime so using defines like
PAGE_SHARED ignores this runtime changes. Using vm_get_page_prot
to get correct page protection fixes this.

Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
---
 arch/mips/kvm/mmu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/mips/kvm/mmu.c b/arch/mips/kvm/mmu.c
index 28c366d307e7..3dabeda82458 100644
--- a/arch/mips/kvm/mmu.c
+++ b/arch/mips/kvm/mmu.c
@@ -1074,6 +1074,7 @@ int kvm_mips_handle_commpage_tlb_fault(unsigned long badvaddr,
 {
 	kvm_pfn_t pfn;
 	pte_t *ptep;
+	pgprot_t prot;
 
 	ptep = kvm_trap_emul_pte_for_gva(vcpu, badvaddr);
 	if (!ptep) {
@@ -1083,7 +1084,8 @@ int kvm_mips_handle_commpage_tlb_fault(unsigned long badvaddr,
 
 	pfn = PFN_DOWN(virt_to_phys(vcpu->arch.kseg0_commpage));
 	/* Also set valid and dirty, so refill handler doesn't have to */
-	*ptep = pte_mkyoung(pte_mkdirty(pfn_pte(pfn, PAGE_SHARED)));
+	prot = vm_get_page_prot(VM_READ|VM_WRITE|VM_SHARED);
+	*ptep = pte_mkyoung(pte_mkdirty(pfn_pte(pfn, prot)));
 
 	/* Invalidate this entry in the TLB, guest kernel ASID only */
 	kvm_mips_host_tlb_inv(vcpu, badvaddr, false, true);
-- 
2.16.4

