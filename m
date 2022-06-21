Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 792BD5538DA
	for <lists+linux-mips@lfdr.de>; Tue, 21 Jun 2022 19:27:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352382AbiFUR1w (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 21 Jun 2022 13:27:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348148AbiFUR1v (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 21 Jun 2022 13:27:51 -0400
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8345D2DA85
        for <linux-mips@vger.kernel.org>; Tue, 21 Jun 2022 10:27:50 -0700 (PDT)
Received: by mail-pf1-x434.google.com with SMTP id a15so6506453pfv.13
        for <linux-mips@vger.kernel.org>; Tue, 21 Jun 2022 10:27:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=KosiNj3YNLlbRK+vwldOUZcVPdw3Sy1cjQrcoE0ds2g=;
        b=o3FQhCiPU79gM9QSey1nVtIDqruLiydkTG9l+XcF04HDSGQFzIW5YUOvNuq/Mk8Ofz
         vISENPhAsPE86DtG32UwDFoBBA+kPGRDnBUNVp/rJmB48pzsyvqO/+R0r0XXixeR1ZWW
         98V4gI15W8jDZVSZxqi+XieFmk1N81GqONqQcGBLamJj7UmGE1Uzw+1hJZU3lw/G9EE+
         PDrjfyrA93NJoQqVDFaZrUf9YdMWf30s+uxZ+oZr6z2omBFCarn/dEOuXbEYFSab1yO/
         uTlnFz9DkGJhyo2Btkxd/MykAz4crPCqDUTkNzg0+RAi5F8GAJvhXF6cec7fDMUkffNE
         51bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=KosiNj3YNLlbRK+vwldOUZcVPdw3Sy1cjQrcoE0ds2g=;
        b=lDPgnpjaqJEW0JTAVg0x6EA8OY2fCiwioqPYfHKLvNxFDJzkXzvw0Nf+JRcoeHkRiQ
         F++tmbP+cDeSog/o8XmsmRl72d7B/RAa20zoL4Fn6TUwR0TZosMoBSRzrYIg/ypUhm/A
         SIm0IpuAga8TG9G/fu1eJLi6eocb7XrpRRJ9NFW7dC4rN5iimEbWoGD4FQ9wC5zp8u/1
         VSPo16uGiUaMdhVcIPVoQvOZ8LQwULhgXxPefHmku0munt1MS7G2e1l+5qHm2Ww2ufsa
         gMjHLJ85N4TxC1Xea8JpjFlxG4HO2ki3BEpURG1IK779BD7fGb/fQ4n4Dd9+GfYkSNXW
         hFSA==
X-Gm-Message-State: AJIora8BFy1Ewlu8rLTYTa7MQChwVghSXYzX1AZ//oHPjyxE8B7gWeLB
        g+eRM41MjtrZLoHzJ9gOuF5CtQ==
X-Google-Smtp-Source: AGRyM1sn5aCSMgS5NUyy3XSMR5k1j/lGDPRdso1aw12M5LEPZ/CN//TgTZSfDqmXHmvaNJ3NWGf+lg==
X-Received: by 2002:a05:6a00:885:b0:510:950f:f787 with SMTP id q5-20020a056a00088500b00510950ff787mr30877821pfj.83.1655832469779;
        Tue, 21 Jun 2022 10:27:49 -0700 (PDT)
Received: from google.com (123.65.230.35.bc.googleusercontent.com. [35.230.65.123])
        by smtp.gmail.com with ESMTPSA id x6-20020a1709029a4600b0015e8d4eb1d1sm11008703plv.27.2022.06.21.10.27.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jun 2022 10:27:49 -0700 (PDT)
Date:   Tue, 21 Jun 2022 17:27:45 +0000
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
Subject: Re: [PATCH v6 10/22] KVM: x86/mmu: Pass memory caches to allocate
 SPs separately
Message-ID: <YrH/kd5g08rvZkTt@google.com>
References: <20220516232138.1783324-1-dmatlack@google.com>
 <20220516232138.1783324-11-dmatlack@google.com>
 <YqyXYJsoZGgp7l62@google.com>
 <CALzav=fVzX+GXCdKRwRGofAgKatX206_kBKagT7R-eYO9RnYkA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALzav=fVzX+GXCdKRwRGofAgKatX206_kBKagT7R-eYO9RnYkA@mail.gmail.com>
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
> On Fri, Jun 17, 2022 at 8:02 AM Sean Christopherson <seanjc@google.com> wrote:
> >
> > On Mon, May 16, 2022, David Matlack wrote:
> > > Refactor kvm_mmu_alloc_shadow_page() to receive the caches from which it
> > > will allocate the various pieces of memory for shadow pages as a
> > > parameter, rather than deriving them from the vcpu pointer. This will be
> > > useful in a future commit where shadow pages are allocated during VM
> > > ioctls for eager page splitting, and thus will use a different set of
> > > caches.
> > >
> > > Preemptively pull the caches out all the way to
> > > kvm_mmu_get_shadow_page() since eager page splitting will not be calling
> >
> > Uber nit, "eager hugepage splitting" to provide a mental cue/reminder for why
> > those pages are direct.
> 
> I think it may be too late to move away from the term "eager page
> splitting" (it is already in commit messages and the module param is
> called "eager_page_split"). Using a slightly different name here might
> produce more confusion, or at least cause readers to do a double-take.

True.  I'm totally fine omitting "huge".

> But naming aside, I don't follow what you mean here. i.e. What does
> the fact that page splitting uses direct shadow pages have to do with
> this patch?

I have no idea.  I suspect I was looking at a different patch when replying to
this one.  I distinctly remember pausing for a few seconds to recall the direct
aspect, but looking back at this patch I don't see what I could have possibly be
wondering about.
