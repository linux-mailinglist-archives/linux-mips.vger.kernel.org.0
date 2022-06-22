Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7BFCA554CB9
	for <lists+linux-mips@lfdr.de>; Wed, 22 Jun 2022 16:19:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358056AbiFVOTw (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 22 Jun 2022 10:19:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358143AbiFVOTu (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 22 Jun 2022 10:19:50 -0400
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34D9F1009
        for <linux-mips@vger.kernel.org>; Wed, 22 Jun 2022 07:19:50 -0700 (PDT)
Received: by mail-pl1-x62a.google.com with SMTP id y6so15550456plg.0
        for <linux-mips@vger.kernel.org>; Wed, 22 Jun 2022 07:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=BzxAUPe5okJNZee9MSLP9PbTGm5gfg8v2qRMcdUL4+0=;
        b=O5heBvklZbSxZj/ed0HHu9xg0cdTwcYZ8+1Mjr1qOthOBcuL3F9RzDjiYKE75UUzAP
         WobpdUABHfVrVHR4WoRgqgX79lY4x9h/QuPsPLqYJExoaBsPkFWX19IOZLZGbQkTHleX
         mg+UFVEr82lEQV/7FHyoPxYREI10yKRjqDF0+BgNbaGNtjmwGrEUOHfsnV0MdXCsAKDk
         ZTF0mGNGbdPoDUnH6eMhHUiZCdLcIDDHE3nvqC9Rjgh7OxSxwlT693WnktZnMplJdla6
         eEOEq3SwN+x7zeTkBSI2ha03O/T2Ch7h4aYsWxOgsb8+k7k2Jf3TbVINN3tzzz/Ji1y6
         rQiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=BzxAUPe5okJNZee9MSLP9PbTGm5gfg8v2qRMcdUL4+0=;
        b=hXgHVwKSJS5agiaI/wwNcjOGC/pqRI4tYK2hmfD1i3i2HlBy3tEakz45u2Zq/56EJc
         acPcRcNPpnW+gkab+jpH894ukdaJYEG0AgHm6QiQdh84C/oiFF/min8OJUiLC1SZdeMe
         jiqsJIMEFg3KQl8S9DpvFycSsO4qrKvqHo5/Fb+NRSdC1B2H2rftk10acU/KXwpBkwAN
         wiZiNxZ3z54qw7nvSHcciFC9kCIW9WT5p0HfPgpxHPF4lI1RpBrMMuj3lSeeqLPr2uEd
         wNScATgFv0wJoNEV4sN09Zurb40bRqGlhnijLlHezfdlr/iMVyo4O77XRXbuDRZqeH4Q
         Gazw==
X-Gm-Message-State: AJIora+/IehkHk7B413zpv6j142KvUWlGo7zl74m3oTpaBVsAgSkhSAT
        0LdTRHIaOmcyjgCquV4YsL0IYg==
X-Google-Smtp-Source: AGRyM1s6BHwkunCCOtr1rJlpNZ/lT0ticChntRH0O/W4Ed8+WafDWpg6DiHb+22bQYkLURbtDY22vg==
X-Received: by 2002:a17:902:8689:b0:14e:f1a4:d894 with SMTP id g9-20020a170902868900b0014ef1a4d894mr34493773plo.65.1655907589586;
        Wed, 22 Jun 2022 07:19:49 -0700 (PDT)
Received: from google.com (123.65.230.35.bc.googleusercontent.com. [35.230.65.123])
        by smtp.gmail.com with ESMTPSA id i6-20020a626d06000000b0051c09cdd71fsm13518188pfc.72.2022.06.22.07.19.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jun 2022 07:19:47 -0700 (PDT)
Date:   Wed, 22 Jun 2022 14:19:43 +0000
From:   Sean Christopherson <seanjc@google.com>
To:     Paolo Bonzini <pbonzini@redhat.com>
Cc:     David Matlack <dmatlack@google.com>, Marc Zyngier <maz@kernel.org>,
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
Subject: Re: [PATCH v6 03/22] KVM: x86/mmu: Stop passing @direct to
 mmu_alloc_root()
Message-ID: <YrMk/z4HCvX0ASPm@google.com>
References: <20220516232138.1783324-1-dmatlack@google.com>
 <20220516232138.1783324-4-dmatlack@google.com>
 <Yqt6rBPMxfwAPjp1@google.com>
 <bb22c823-f12f-90d8-e8d6-0cddba95f60a@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bb22c823-f12f-90d8-e8d6-0cddba95f60a@redhat.com>
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

On Wed, Jun 22, 2022, Paolo Bonzini wrote:
> On 6/16/22 20:47, Sean Christopherson wrote:
> > > The argument @direct is vcpu->arch.mmu->root_role.direct, so just use
> > > that.
> > It's worth calling out that, unlike non-root page tables, it's impossible to have
> > a direct root in an indirect MMU.  I.e. provide a hint as to why there's a need to
> > pass @direct in the first place.
> > 
> 
> I suppose there's *no* need to pass direct?  Also, there's the trivial (but
> less interesting) justification that kvm_mmu_load does
> 
>         if (vcpu->arch.mmu->root_role.direct)
>                 r = mmu_alloc_direct_roots(vcpu);
>         else
>                 r = mmu_alloc_shadow_roots(vcpu);
> 
> and those are the only callers of mmu_alloc_root.

Duh, you're right, grabbing root_role.direct in mmu_alloc_root() is much better.
