Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 58B6F54F9E8
	for <lists+linux-mips@lfdr.de>; Fri, 17 Jun 2022 17:12:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1382988AbiFQPML (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 17 Jun 2022 11:12:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1382971AbiFQPMJ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 17 Jun 2022 11:12:09 -0400
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3F2C40E62
        for <linux-mips@vger.kernel.org>; Fri, 17 Jun 2022 08:12:08 -0700 (PDT)
Received: by mail-pf1-x42b.google.com with SMTP id 187so4408693pfu.9
        for <linux-mips@vger.kernel.org>; Fri, 17 Jun 2022 08:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=3mgvhKmrqaYUspBn6nABZ88HosdbgWN7FHxrlSXkE+I=;
        b=hTERR44sQ02GCKZjqwMUtxMSduYjK9pDoqnBAlk1bS16iMGjnVJpFsEEhxXsb0t1Lk
         AIdchbUIXed1op+Irh496vAc86DXlcZSXYYZUiMP0bAGwp4OABZqoEssbrcAmYwrC+KN
         2PXyVzDVabFo/w+KgK0V7Tm0go4bEd7Rres9V8lP2u0DIrrrM8q+EkUFG50Y0I9uz8WU
         KacIUUPIB1gZdjf2LexJPt8fmL3luaR9ATaG32+/B3NlZg24Q1VglatRlHZkldmJjvyk
         HTpkJ3sUqm9hzkGzzdm7Jghe0lzwpOhce2y1NHpKp7E4DQ9KhkuEvO4yu+9JNpcKR4fl
         avLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=3mgvhKmrqaYUspBn6nABZ88HosdbgWN7FHxrlSXkE+I=;
        b=PIoL1/2pEjGvIXpJK6x8iRR530M4LSpWfv60qLeobBezaWpkKl+qSH1mMw4EiT2YFZ
         9Qhbya9gBlMrQdItrn5BaslcB6kujbzAIFKKi7aSebJDHJEPEf96vr1uEK9jJvfwyzA8
         ivDowsVawXjjedHfxqrvZd3wlWO6sXeqNGC6C+6fiB8GjwXyxk0RL4Dv0hmgi3I2+y0U
         xNoIBg5Im4HhpcuZT5Kk2bJg6SSwGIadUwx0xgPlYUctX2M0nAt5xEcgci8Q5W2HpmNn
         c9rY9cq2wfjAbzJ9K/Wyl8Cd5wroz+B0z4kKqSHR0WlJTD50278jFqLvqu6P5LpBPUqd
         jIzw==
X-Gm-Message-State: AJIora/o+XWvq9KSEUUCSyJ6aw6xVzUOq/BfVlu4pDgsPwr2EcdRHhix
        /VmCTYGKGfCn2WS6nZSbZQApXw==
X-Google-Smtp-Source: AGRyM1vfbbnxwQFV1uQ+YDKGOWDgTFUZzxCaEFFsVM4p7M9tq5Wv+ppIzZKQQB6z6heUAcwABxAbwg==
X-Received: by 2002:a65:404c:0:b0:3c6:4018:ffbf with SMTP id h12-20020a65404c000000b003c64018ffbfmr9685028pgp.408.1655478728062;
        Fri, 17 Jun 2022 08:12:08 -0700 (PDT)
Received: from google.com (123.65.230.35.bc.googleusercontent.com. [35.230.65.123])
        by smtp.gmail.com with ESMTPSA id k17-20020a628e11000000b0050dc76281a2sm3808947pfe.124.2022.06.17.08.12.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jun 2022 08:12:07 -0700 (PDT)
Date:   Fri, 17 Jun 2022 15:12:04 +0000
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
        <kvm-riscv@lists.infradead.org>, Peter Feiner <pfeiner@google.com>,
        Lai Jiangshan <jiangshanlai@gmail.com>
Subject: Re: [PATCH v6 04/22] KVM: x86/mmu: Derive shadow MMU page role from
 parent
Message-ID: <YqyZxEfxXLsHGoZ/@google.com>
References: <20220516232138.1783324-1-dmatlack@google.com>
 <20220516232138.1783324-5-dmatlack@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220516232138.1783324-5-dmatlack@google.com>
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, May 16, 2022, David Matlack wrote:
> +static struct kvm_mmu_page *kvm_mmu_get_child_sp(struct kvm_vcpu *vcpu,
> +						 u64 *sptep, gfn_t gfn,
> +						 bool direct, u32 access)

Please use "unsigned int" for @access, here and everywhere else, so that KVM is
consistent in how it refers to access.  @access can actually squeeze into a u8,
but it's referenced as a "unsigned int" because sp->role.access is an unsigned int.
For me at least, when I see "u<size" I always assume there is a specific reason
for using an exact size, e.g. variables/fields that track hardware state.  Whereas
"int" and "unsigned int" give the hint that the variable is KVM metadata.

@@ -2201,7 +2201,8 @@ static struct kvm_mmu_page *kvm_mmu_get_shadow_page(struct kvm_vcpu *vcpu,
        return __kvm_mmu_get_shadow_page(vcpu->kvm, vcpu, &caches, gfn, role);
 }

-static union kvm_mmu_page_role kvm_mmu_child_role(u64 *sptep, bool direct, u32 access)
+static union kvm_mmu_page_role kvm_mmu_child_role(u64 *sptep, bool direct,
+                                                 unsigned int access)
 {
        struct kvm_mmu_page *parent_sp = sptep_to_sp(sptep);
        union kvm_mmu_page_role role;
@@ -2242,7 +2243,7 @@ static union kvm_mmu_page_role kvm_mmu_child_role(u64 *sptep, bool direct, u32 a

 static struct kvm_mmu_page *kvm_mmu_get_child_sp(struct kvm_vcpu *vcpu,
                                                 u64 *sptep, gfn_t gfn,
-                                                bool direct, u32 access)
+                                                bool direct, unsigned int access)
 {
        union kvm_mmu_page_role role;

> +{
> +	union kvm_mmu_page_role role;
> +
> +	role = kvm_mmu_child_role(sptep, direct, access);
> +	return kvm_mmu_get_page(vcpu, gfn, role);
> +}
> +
