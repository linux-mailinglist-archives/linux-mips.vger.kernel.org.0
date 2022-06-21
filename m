Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D292553947
	for <lists+linux-mips@lfdr.de>; Tue, 21 Jun 2022 19:59:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236616AbiFUR7N (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 21 Jun 2022 13:59:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245609AbiFUR7M (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 21 Jun 2022 13:59:12 -0400
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8376220DE
        for <linux-mips@vger.kernel.org>; Tue, 21 Jun 2022 10:59:11 -0700 (PDT)
Received: by mail-pf1-x42b.google.com with SMTP id u37so13781002pfg.3
        for <linux-mips@vger.kernel.org>; Tue, 21 Jun 2022 10:59:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=JbuWAytcUZALQjKHnKlHD39QZVXy3a1bRzVkWDq42KQ=;
        b=VErgQoB8GWymThL3YgzGl2WrL12ULYe/Cx/wyQRAW01d1/41ggxbQwxVOnzuwICFhG
         hlA/lrHAMM3uUbioCGYIMB10kT5kJRIxBeHBxMtKnqe8TOc1UA6q8/qtaiFqCan3/IJX
         zbld0o+9fIhscaxiitkhFrgx3xF2+mm+jDKQcXlVY6HSgbY1WNrPJinLucleTCE+gUAp
         ZzKcF99tELyFLUKjMPVKMvpACZbdJEki9ptdeMGLcmOKYAiaI8j87t1CGi/1EX4C73n/
         er1cQQAVMrZvwmWyBge9+Hybfl4bxzFWz1KNBdnXAQ8WoAaTDtPiczPKVjpEk59p0pZZ
         80Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=JbuWAytcUZALQjKHnKlHD39QZVXy3a1bRzVkWDq42KQ=;
        b=64YZLL8X+w+bMOG9Rfz68ep/vMwYJznOruwZtLZ47SWIaEeY/KgvAAExe+6gfVlJrr
         6XKN+BewFDIvDTG7ShlnqeMahE17yxcsLZhTIlGzwYc3S9iGf4pxXdzWQ74HA8M8QyGK
         hIEscqM01RqhR7FyPuRSZRJsxaFFOMe59eGeQADkgULenu5zCLIL4ob7YksXa2JqDlLj
         Qm7zQVI5PO7AcmhGpGXCnDL2T6LZD5CTAVf9Y1E52nEMtbKqjQ19TPiLn5uMa0mOFnQ8
         Pcqm+LKSXcY8zm/VNPeaesKQmKaH3057tccy0RiNu3w+GMnpYlCRzr3xYP77f0u+Yj03
         POEg==
X-Gm-Message-State: AJIora9wiWPPZ8zs5h5XVgEtO+rI6u4tpl4o2qa5/PPbg95umWZx2scD
        SR4dyoMvWK8nAkD8fqE6KCnu3Q==
X-Google-Smtp-Source: AGRyM1tyKoScvgZ9jUTl9r400vYVAKVYV/qzOYeNUaiQG+sTZs1pyelcoub/qTYVZzhpTV2f2gXgXw==
X-Received: by 2002:a63:e705:0:b0:3fd:fb59:bd7f with SMTP id b5-20020a63e705000000b003fdfb59bd7fmr27065817pgi.505.1655834350902;
        Tue, 21 Jun 2022 10:59:10 -0700 (PDT)
Received: from google.com (123.65.230.35.bc.googleusercontent.com. [35.230.65.123])
        by smtp.gmail.com with ESMTPSA id jj4-20020a170903048400b001678898ad06sm5027806plb.47.2022.06.21.10.59.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jun 2022 10:59:10 -0700 (PDT)
Date:   Tue, 21 Jun 2022 17:59:07 +0000
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
        "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>,
        "moderated list:KERNEL VIRTUAL MACHINE FOR ARM64 (KVM/arm64)" 
        <kvmarm@lists.cs.columbia.edu>,
        "open list:KERNEL VIRTUAL MACHINE FOR MIPS (KVM/mips)" 
        <linux-mips@vger.kernel.org>,
        "open list:KERNEL VIRTUAL MACHINE FOR MIPS (KVM/mips)" 
        <kvm@vger.kernel.org>,
        "open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" 
        <kvm-riscv@lists.infradead.org>, Peter Feiner <pfeiner@google.com>,
        Lai Jiangshan <jiangshanlai@gmail.com>
Subject: Re: [PATCH v6 19/22] KVM: x86/mmu: Zap collapsible SPTEs in shadow
 MMU at all possible levels
Message-ID: <YrIG6/dymlPQGwg1@google.com>
References: <20220516232138.1783324-1-dmatlack@google.com>
 <20220516232138.1783324-20-dmatlack@google.com>
 <Yqyzavjp9eS9p4+m@google.com>
 <CALzav=dG9f2X8GBLjQgR-Lj4yPKX2Adg3C+9_9aC83A7mzmbtw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALzav=dG9f2X8GBLjQgR-Lj4yPKX2Adg3C+9_9aC83A7mzmbtw@mail.gmail.com>
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

On Tue, Jun 21, 2022, David Matlack wrote:
> On Fri, Jun 17, 2022 at 10:01 AM Sean Christopherson <seanjc@google.com> wrote:
> >
> > On Mon, May 16, 2022, David Matlack wrote:
> > > +static void kvm_rmap_zap_collapsible_sptes(struct kvm *kvm,
> > > +                                        const struct kvm_memory_slot *slot)
> > > +{
> > > +     /*
> > > +      * Note, use KVM_MAX_HUGEPAGE_LEVEL - 1 since there's no need to zap
> > > +      * pages that are already mapped at the maximum possible level.
> > > +      */
> > > +     if (slot_handle_level(kvm, slot, kvm_mmu_zap_collapsible_spte,
> > > +                           PG_LEVEL_4K, KVM_MAX_HUGEPAGE_LEVEL - 1,
> > > +                           true))
> >
> > No need to wrap, "true" fits easily on the previous line.  That said, I don't see
> > any point in adding a helper.  It's highly unlike there will be another caller,
> > and IMO it's not any more readable since I have to go look at another function
> > when reading kvm_mmu_zap_collapsible_sptes().
> 
> I could see an argument for readability either way. Putting it in a
> helper function abstracts away the details, which would aid
> readability if the reader does not care about the implementation
> details of the rmap case.

I'm ok either way, dealer's choice.
