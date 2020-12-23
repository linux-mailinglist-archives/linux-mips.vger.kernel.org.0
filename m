Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F5AF2E16BD
	for <lists+linux-mips@lfdr.de>; Wed, 23 Dec 2020 04:10:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728737AbgLWDBz (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 22 Dec 2020 22:01:55 -0500
Received: from mail.kernel.org ([198.145.29.99]:45452 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728734AbgLWCTn (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 22 Dec 2020 21:19:43 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0FC1022248;
        Wed, 23 Dec 2020 02:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1608689956;
        bh=8jNY02AooCi6/6ckcF69nXo7LysvusQFUDNXyXdmPDE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=u+9DgwOKCRXm2sLmpUi33Dorlfl5nvkIS7jiw8DDoSnRFW8Xd9g13bHn7KZeU2pSh
         RGyzBanRukRIXqjvLn2cux3NRyFYs14Y6Ujk2UP4fGJnZGKYxG08gQ0/InKD6xe/nj
         exM4a+P2tY0DEniRhFp0+XwkicB7J5YwLwNM7qLdTUbuNOVf19P2DC8frVuo9opk5L
         CZPfkOzrqxK05EUdcYs/6Eplh18Kzj/jaUzMgeO7hbQzMuwrr9FqY+4OQZzg/vF1RJ
         J+901a/apQP0FPpj32a6AKt31GEnZfgvoWy+TXp/TkqOc+jgxnCDdwaPgKuqLuPvr9
         4GP4+X/OR0WUQ==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Sasha Levin <sashal@kernel.org>, linux-mips@vger.kernel.org,
        kvm@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 049/130] MIPS: kvm: Use vm_get_page_prot to get protection bits
Date:   Tue, 22 Dec 2020 21:16:52 -0500
Message-Id: <20201223021813.2791612-49-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201223021813.2791612-1-sashal@kernel.org>
References: <20201223021813.2791612-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>

[ Upstream commit 411406a8c758d9ad6f908fab3a6cf1d3d89e1d08 ]

MIPS protection bits are setup during runtime so using defines like
PAGE_SHARED ignores this runtime changes. Using vm_get_page_prot
to get correct page protection fixes this.

Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/mips/kvm/mmu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/mips/kvm/mmu.c b/arch/mips/kvm/mmu.c
index 97f63a84aa51f..b5974ff2d9162 100644
--- a/arch/mips/kvm/mmu.c
+++ b/arch/mips/kvm/mmu.c
@@ -1100,6 +1100,7 @@ int kvm_mips_handle_commpage_tlb_fault(unsigned long badvaddr,
 {
 	kvm_pfn_t pfn;
 	pte_t *ptep;
+	pgprot_t prot;
 
 	ptep = kvm_trap_emul_pte_for_gva(vcpu, badvaddr);
 	if (!ptep) {
@@ -1109,7 +1110,8 @@ int kvm_mips_handle_commpage_tlb_fault(unsigned long badvaddr,
 
 	pfn = PFN_DOWN(virt_to_phys(vcpu->arch.kseg0_commpage));
 	/* Also set valid and dirty, so refill handler doesn't have to */
-	*ptep = pte_mkyoung(pte_mkdirty(pfn_pte(pfn, PAGE_SHARED)));
+	prot = vm_get_page_prot(VM_READ|VM_WRITE|VM_SHARED);
+	*ptep = pte_mkyoung(pte_mkdirty(pfn_pte(pfn, prot)));
 
 	/* Invalidate this entry in the TLB, guest kernel ASID only */
 	kvm_mips_host_tlb_inv(vcpu, badvaddr, false, true);
-- 
2.27.0

