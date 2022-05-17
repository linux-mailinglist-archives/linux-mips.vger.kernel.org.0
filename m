Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 52CC4529516
	for <lists+linux-mips@lfdr.de>; Tue, 17 May 2022 01:21:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238802AbiEPXVt (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 16 May 2022 19:21:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239046AbiEPXVo (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 16 May 2022 19:21:44 -0400
Received: from mail-pj1-x104a.google.com (mail-pj1-x104a.google.com [IPv6:2607:f8b0:4864:20::104a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BDC836152
        for <linux-mips@vger.kernel.org>; Mon, 16 May 2022 16:21:44 -0700 (PDT)
Received: by mail-pj1-x104a.google.com with SMTP id o8-20020a17090a9f8800b001dc9f554c7fso8824009pjp.4
        for <linux-mips@vger.kernel.org>; Mon, 16 May 2022 16:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=nd6Dxj+D3c/luGLy1QY1Ne5KCdEStn7D54niackY8Gg=;
        b=i3uMJsKKZ/XQE4JHEj68rSTKlYb1NduEyUOZ3xS8XgWD9SjI/+SpqpYTidv2LQax4s
         Kt2YfPCb390F3PDSFpc8dol9kk4EG2+VQ3LPEM39lW4asDIdueiF9ywQRN7ZDdQHFPxS
         rjhXVZnTN3vQ1YyLF4Siw+CKlwy2IblDNMYwQZP8ODwweFgU3BUeA3pYmSiUZMJFO51g
         gsn0ARDvZSuDL4E1HO+la9IDrMmxJJ3zomsyr8N+H2unSOY4V2ClpS2op9i2dY6w6twK
         e76qUp9gPrSFHtqa97W8KhPb9zpg7aH3Sfxmp1NwBZk+eIe5o8iS9qIP7BftkJKcbzvR
         Mm/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=nd6Dxj+D3c/luGLy1QY1Ne5KCdEStn7D54niackY8Gg=;
        b=YSD74cre7T1sQob2u+pfVAkccGbX2UpnuKL5bq0uUcNjAlkXbAGQUIRoJCQpqLOeMb
         FOmJY6ZTqlvsmsCPeKhG57dUFodueysaxHB2A+k65gq0Zdhi7EskV7QN1nWYpW3sSjt1
         cMO9dFNikyH0yS0+xsDc3z1U3lAYlu/dk9c9p6Qu1LY+4CVVztJkVIKxfgk+RlPjxtP7
         ooHSddHAfFGEMf/xzIF6xXidNbNpDiNpK5O8XrKtxJ54yhROPhm/9lNiO+KxuD2cwDRi
         0hj9kPnuCua5cxB/00JxIJibVe/wOLAbWNLqIaat6OdTw+yhym2Ia9PVmZtYR4zlvtKa
         3eBQ==
X-Gm-Message-State: AOAM531koNsbUQyUKnK+PfQ1bX0d+YiHniFddn7omNhFwJdhes+Pl1d8
        xlxuGaM2QlsY4OMvJ+hY/X1o6OZZHxAKKg==
X-Google-Smtp-Source: ABdhPJwZ4hPASu3hwlbQApjM3Qpw4pmZCcc7AWStf7IYvk7O3j5Z1wZRMVRJ5UOh13coV7lr1j1BYTYIPZhckg==
X-Received: from dmatlack-heavy.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:19cd])
 (user=dmatlack job=sendgmr) by 2002:a17:903:30d2:b0:161:70be:bf86 with SMTP
 id s18-20020a17090330d200b0016170bebf86mr8770769plc.18.1652743303616; Mon, 16
 May 2022 16:21:43 -0700 (PDT)
Date:   Mon, 16 May 2022 23:21:17 +0000
In-Reply-To: <20220516232138.1783324-1-dmatlack@google.com>
Message-Id: <20220516232138.1783324-2-dmatlack@google.com>
Mime-Version: 1.0
References: <20220516232138.1783324-1-dmatlack@google.com>
X-Mailer: git-send-email 2.36.0.550.gb090851708-goog
Subject: [PATCH v6 01/22] KVM: x86/mmu: Optimize MMU page cache lookup for all
 direct SPs
From:   David Matlack <dmatlack@google.com>
To:     Paolo Bonzini <pbonzini@redhat.com>
Cc:     Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
        Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
        Anup Patel <anup@brainfault.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Sean Christopherson <seanjc@google.com>,
        Andrew Jones <drjones@redhat.com>,
        Ben Gardon <bgardon@google.com>, Peter Xu <peterx@redhat.com>,
        maciej.szmigiero@oracle.com,
        "moderated list:KERNEL VIRTUAL MACHINE FOR ARM64 (KVM/arm64)" 
        <kvmarm@lists.cs.columbia.edu>,
        "open list:KERNEL VIRTUAL MACHINE FOR MIPS (KVM/mips)" 
        <linux-mips@vger.kernel.org>,
        "open list:KERNEL VIRTUAL MACHINE FOR MIPS (KVM/mips)" 
        <kvm@vger.kernel.org>,
        "open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" 
        <kvm-riscv@lists.infradead.org>, Peter Feiner <pfeiner@google.com>,
        Lai Jiangshan <jiangshanlai@gmail.com>,
        David Matlack <dmatlack@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Commit fb58a9c345f6 ("KVM: x86/mmu: Optimize MMU page cache lookup for
fully direct MMUs") skipped the unsync checks and write flood clearing
for full direct MMUs. We can extend this further to skip the checks for
all direct shadow pages. Direct shadow pages in indirect MMUs (i.e.
shadow paging) are used when shadowing a guest huge page with smaller
pages. Such direct shadow pages, like their counterparts in fully direct
MMUs, are never marked unsynced or have a non-zero write-flooding count.

Checking sp->role.direct also generates better code than checking
direct_map because, due to register pressure, direct_map has to get
shoved onto the stack and then pulled back off.

No functional change intended.

Reviewed-by: Lai Jiangshan <jiangshanlai@gmail.com>
Reviewed-by: Sean Christopherson <seanjc@google.com>
Reviewed-by: Peter Xu <peterx@redhat.com>
Signed-off-by: David Matlack <dmatlack@google.com>
---
 arch/x86/kvm/mmu/mmu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index efe5a3dca1e0..774810d8a2ed 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -2026,7 +2026,6 @@ static struct kvm_mmu_page *kvm_mmu_get_page(struct kvm_vcpu *vcpu,
 					     int direct,
 					     unsigned int access)
 {
-	bool direct_mmu = vcpu->arch.mmu->root_role.direct;
 	union kvm_mmu_page_role role;
 	struct hlist_head *sp_list;
 	unsigned quadrant;
@@ -2070,7 +2069,8 @@ static struct kvm_mmu_page *kvm_mmu_get_page(struct kvm_vcpu *vcpu,
 			continue;
 		}
 
-		if (direct_mmu)
+		/* unsync and write-flooding only apply to indirect SPs. */
+		if (sp->role.direct)
 			goto trace_get_page;
 
 		if (sp->unsync) {
-- 
2.36.0.550.gb090851708-goog

