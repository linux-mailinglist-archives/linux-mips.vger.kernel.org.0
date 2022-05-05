Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 90DBE51CC64
	for <lists+linux-mips@lfdr.de>; Fri,  6 May 2022 01:00:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1386530AbiEEXE0 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 5 May 2022 19:04:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1386526AbiEEXEY (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 5 May 2022 19:04:24 -0400
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB4F65EDC5
        for <linux-mips@vger.kernel.org>; Thu,  5 May 2022 16:00:43 -0700 (PDT)
Received: by mail-pg1-x529.google.com with SMTP id v10so4710458pgl.11
        for <linux-mips@vger.kernel.org>; Thu, 05 May 2022 16:00:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=OynsI/Y1y6rsQh9WExR+1/Zkn9MMK8WgC1JkonenMkY=;
        b=czdbdSz4ZFvCh9CDIv//7vre9DD/9YuCdL7EH5JN3DK0rF1o5+bTGuSgXwOZeSrk+p
         p8f2JfvS0v+6umNaERHgOwIdoEi8v1/2zrslEUYWwlHeubYqiVmr34/AxEsei4oudhWF
         CJw1/UWxbSaDoiU0lYFK9W30KO/wNOo18gChC4qkaV1TP5t1Sj1gQwYTlFKXOJwlMxlq
         XeiXI6920NuTALp0ZQbe2zYhFBhwPP2emPNLXFFrtYyo4BIGE7RBJErDr0wdw4Tg7a0V
         li/5C0KssxCA+9aZc5pkAacKGyoxzspvkeX6qENNBTjpWd2qQDkGsVy52938gVfWzJSk
         QdKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=OynsI/Y1y6rsQh9WExR+1/Zkn9MMK8WgC1JkonenMkY=;
        b=aMIPUwslXzIQ8G/julepWomhYNJs+uUwZ5LTcye8fYfVBTw8yK6hNxtv9LDkj+xk0M
         wVFLyH4k2qtBwxBilGNahqqG8o1op/UMuI5zMlGK08wsn0oA9rhQkdwQzbQxANEOldvh
         jvfk9N+LRMZXM2LY6qBEIEvTEltVCqNmFCLyd1dhXdK1tJ+yD24uqqwbdiZhqo/nNOeC
         144nIDV26nUQe9pRKvzxK7bGgJpZVMOMyajq5H0o3kNyCkYCQT7oF0up9icUU4vtUhA+
         IQ9vyYAsqi0a8T35flz02ZFpAr6DlJLqDUJpHWZA0JrEPSh9kMZtiPF21LevYS8a+LKM
         j+qw==
X-Gm-Message-State: AOAM530MOY+raLr9P1N8V6sT2x3qTJK7eGclH0XLoP5viE29aMaIu6If
        fNaox+3BX+DggNVvjDdGJx+IPg==
X-Google-Smtp-Source: ABdhPJxDu0wALLZyxGIddDUnRgsXc2qv3Ld2ZmjdwFGFx/UOM+F3BAohwM2FdgVKnvaNd70HiCM4nw==
X-Received: by 2002:a63:6841:0:b0:3c1:a611:793e with SMTP id d62-20020a636841000000b003c1a611793emr308309pgc.249.1651791642951;
        Thu, 05 May 2022 16:00:42 -0700 (PDT)
Received: from google.com (157.214.185.35.bc.googleusercontent.com. [35.185.214.157])
        by smtp.gmail.com with ESMTPSA id y18-20020a170902d65200b0015e8d4eb27fsm146862plh.201.2022.05.05.16.00.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 May 2022 16:00:42 -0700 (PDT)
Date:   Thu, 5 May 2022 23:00:39 +0000
From:   Sean Christopherson <seanjc@google.com>
To:     David Matlack <dmatlack@google.com>
Cc:     Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>,
        Huacai Chen <chenhuacai@kernel.org>,
        Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
        Anup Patel <anup@brainfault.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
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
        <kvm-riscv@lists.infradead.org>, Peter Feiner <pfeiner@google.com>
Subject: Re: [PATCH v4 08/20] KVM: x86/mmu: Pass memory caches to allocate
 SPs separately
Message-ID: <YnRXFyTik32RIxNp@google.com>
References: <20220422210546.458943-1-dmatlack@google.com>
 <20220422210546.458943-9-dmatlack@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220422210546.458943-9-dmatlack@google.com>
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Apr 22, 2022, David Matlack wrote:
> Refactor kvm_mmu_alloc_shadow_page() to receive the caches from which it
> will allocate the various pieces of memory for shadow pages as a
> parameter, rather than deriving them from the vcpu pointer. This will be
> useful in a future commit where shadow pages are allocated during VM
> ioctls for eager page splitting, and thus will use a different set of
> caches.
> 
> Preemptively pull the caches out all the way to
> kvm_mmu_get_shadow_page() since eager page splitting will not be calling
> kvm_mmu_alloc_shadow_page() directly.
> 
> No functional change intended.
> 
> Signed-off-by: David Matlack <dmatlack@google.com>
> ---

...

>  static struct kvm_mmu_page *kvm_mmu_alloc_shadow_page(struct kvm_vcpu *vcpu,
> +						      struct shadow_page_caches *caches,

Definitely work doing the "kvm" capture in an earlier patch, and doing the s/vcpu/kvm
here, the diff on top is tiny.  The shortlog/changelog would need minor tweaks, but
that's not a big deal.

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index da1c3cf91778..15784bab985f 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -2084,13 +2084,12 @@ struct shadow_page_caches {
        struct kvm_mmu_memory_cache *gfn_array_cache;
 };

-static struct kvm_mmu_page *kvm_mmu_alloc_shadow_page(struct kvm_vcpu *vcpu,
+static struct kvm_mmu_page *kvm_mmu_alloc_shadow_page(struct kvm *kvm,
                                                      struct shadow_page_caches *caches,
                                                      gfn_t gfn,
                                                      struct hlist_head *sp_list,
                                                      union kvm_mmu_page_role role)
 {
-       struct kvm *kvm = vcpu->kvm;
        struct kvm_mmu_page *sp;

        sp = kvm_mmu_memory_cache_alloc(caches->page_header_cache);
@@ -2133,7 +2132,7 @@ static struct kvm_mmu_page *__kvm_mmu_get_shadow_page(struct kvm_vcpu *vcpu,
        sp = kvm_mmu_find_shadow_page(vcpu, gfn, sp_list, role);
        if (!sp) {
                created = true;
-               sp = kvm_mmu_alloc_shadow_page(vcpu, caches, gfn, sp_list, role);
+               sp = kvm_mmu_alloc_shadow_page(vcpu->kvm, caches, gfn, sp_list, role);
        }

        trace_kvm_mmu_get_page(sp, created);

