Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D49F54FBF3
	for <lists+linux-mips@lfdr.de>; Fri, 17 Jun 2022 19:11:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1382627AbiFQRLd (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 17 Jun 2022 13:11:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231674AbiFQRLc (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 17 Jun 2022 13:11:32 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79D8E3A73E
        for <linux-mips@vger.kernel.org>; Fri, 17 Jun 2022 10:11:31 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id a17so2421097pls.6
        for <linux-mips@vger.kernel.org>; Fri, 17 Jun 2022 10:11:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=bdDDbsy5CGOO7wZD0IM4Eh6cCyQ0ONF/h8Wgyy1Nd18=;
        b=QKAV7BGSNsPE9wA9Sqlq00olPyQu9PB6qK5tl1Rxnvu9fCuQ47fv7tZIRz9aybGRrv
         3UrV5mRaMilV9R4lDQuOmyt+MPr9yWyqZpS64RJ3BfkNuoC3cwCM2QwDj1IanZEjLIHz
         Fx/1KYX6+54ItOS2pBQcoF5+u1VFY7BL2bXTctivpXivDvWG3z4lR6r1ekopPf3Nj9GD
         JHgW/PpUbR50V8UtSyZ7a6wsZBHXawSsbaSERvSJc9ccG9WlaemjVf5pcnvjBndz49Cm
         dkSbH7nm5Mt86N20zqdhkw7OEFLOG9oMRPEcwR1uPz0/LHFlQj+EXTzTlNeOqnYalR45
         lR/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=bdDDbsy5CGOO7wZD0IM4Eh6cCyQ0ONF/h8Wgyy1Nd18=;
        b=02Tgg4J+Y4EiADnP0dziSsFCApS7GIoXPz97ehz8ymbo9UCEfczA/F9Vu4ZUoESBsY
         r3gCaRuLsaQ44euk33AM8Yrs/huFoqCvREbGzuDPyBpQGWXbCt4cidIMqcy8wFn4/N/S
         MdxrWO0CDbUUeIG/FyWQEoOr9VHjMC2CQoTX22WTDhr0XPX4tZ9o9PmyDoXdc78Zn5qc
         zYGbtlkKTURVSvZoi+sDswWFTZU04tHR+OkZHruQLjmewb6MIMuoCoGVQxb41Bp6Bznr
         kwuZ5MViNh8v6OxP2fRC99SMvcU5hoJHanEeYmIwOcMGUr8lSuI8x1W83HQW0Fu65Sze
         WKew==
X-Gm-Message-State: AJIora+t+M6YlYmlLILEysyRw+fnm4VgP25gaKKjOB0B5jZmrPfKsXdZ
        GtRjsSam2cbQ2Jm+XGO/Xdx5Jg==
X-Google-Smtp-Source: AGRyM1uXzqylJ7t0A4w2Rtgnm+iUT1OEcJxDjLWt6XST+qWVe58pzA+XrFJ2UZHi/ZCRvGo6mmHtTw==
X-Received: by 2002:a17:90b:4b90:b0:1e8:48bd:453 with SMTP id lr16-20020a17090b4b9000b001e848bd0453mr22483076pjb.86.1655485890790;
        Fri, 17 Jun 2022 10:11:30 -0700 (PDT)
Received: from google.com (123.65.230.35.bc.googleusercontent.com. [35.230.65.123])
        by smtp.gmail.com with ESMTPSA id m2-20020a17090a858200b001ec7c8919f0sm1087504pjn.23.2022.06.17.10.11.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jun 2022 10:11:30 -0700 (PDT)
Date:   Fri, 17 Jun 2022 17:11:27 +0000
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
Subject: Re: [PATCH v6 20/22] KVM: x86/mmu: Refactor drop_large_spte()
Message-ID: <Yqy1v59ZDJ7EkCix@google.com>
References: <20220516232138.1783324-1-dmatlack@google.com>
 <20220516232138.1783324-21-dmatlack@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220516232138.1783324-21-dmatlack@google.com>
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

On Mon, May 16, 2022, David Matlack wrote:
>  static void drop_large_spte(struct kvm_vcpu *vcpu, u64 *sptep)
>  {
> -	if (__drop_large_spte(vcpu->kvm, sptep)) {
> -		struct kvm_mmu_page *sp = sptep_to_sp(sptep);
> -
> -		kvm_flush_remote_tlbs_with_address(vcpu->kvm, sp->gfn,
> -			KVM_PAGES_PER_HPAGE(sp->role.level));
> -	}
> +	return __drop_large_spte(vcpu->kvm, sptep, true);

A "return" for a void function is unnecessary.  And since the shortlog is already
a somewhat vague "do a refactor", I vote to opportunistically:

  - rename drop_large_spte() to drop_spte_if_huge()
  - rename __drop_large_spte() to drop_huge_spte()
  - move "if (!is_large_pte(*sptep))" to drop_spte_if_huge() since the split path
    should never pass in a non-huge SPTE.

That last point will also clean up an oddity with with "flush" parameter; given
the command-like name of "flush", it's a bit weird that __drop_large_spte() doesn't
flush when the SPTE is large.


static void drop_huge_spte(struct kvm *kvm, u64 *sptep, bool flush)
{
	struct kvm_mmu_page *sp;

	sp = sptep_to_sp(sptep);
	WARN_ON(sp->role.level == PG_LEVEL_4K);

	drop_spte(kvm, sptep);

	if (flush)
		kvm_flush_remote_tlbs_with_address(kvm, sp->gfn,
			KVM_PAGES_PER_HPAGE(sp->role.level));
}

static void drop_spte_if_huge(struct kvm_vcpu *vcpu, u64 *sptep)
{
	if (is_large_pte(*sptep))
		drop_huge_spte(vcpu->kvm, sptep, true);
}


>  }
>  
>  /*
> -- 
> 2.36.0.550.gb090851708-goog
> 
