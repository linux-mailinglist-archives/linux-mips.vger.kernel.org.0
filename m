Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C849769F9A
	for <lists+linux-mips@lfdr.de>; Mon, 31 Jul 2023 19:41:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229535AbjGaRlb (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 31 Jul 2023 13:41:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229454AbjGaRla (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 31 Jul 2023 13:41:30 -0400
Received: from mail-pg1-x54a.google.com (mail-pg1-x54a.google.com [IPv6:2607:f8b0:4864:20::54a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F0041A7
        for <linux-mips@vger.kernel.org>; Mon, 31 Jul 2023 10:41:29 -0700 (PDT)
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-55c79a5565aso2840694a12.3
        for <linux-mips@vger.kernel.org>; Mon, 31 Jul 2023 10:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1690825289; x=1691430089;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=SmEubc/b5+1ukKHmZiUP8NXK6ZmTPwRGFOIZRTSZ3Gc=;
        b=KsPWb1bI8OHDu6mex8qxqciyU59VHcBE8c/TrFQtscgcFzTfxWbsxZ86iRaaNxYAl+
         uKEGEpPVr5RuACHnIFFoR51eaJEUed2t4e+cwXrQF1OxjVWfGiA2bHAktTjJx/3Kigv1
         aLf1g5txUjo6a56/6JBCnjOVbIAtJXUjDTEeDz/pdOQeXJbHmEsKASOemdZt5AKhHcRJ
         S2YeZdows1O/MtzAgbL+cL7HEWn6oTFY7iHvHMe9wPN+oc+AtA23+j+qV9lSjxcBksWz
         h1pEu0KmsBggaeJ5Qw/klASWUgGhTVJCRwUn+0br0etDmh0uWPcCt7wt/xET1lxd0bfl
         P5Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690825289; x=1691430089;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SmEubc/b5+1ukKHmZiUP8NXK6ZmTPwRGFOIZRTSZ3Gc=;
        b=QFeBBxygWHSdVHROd1vT6+dzvneEKbtcwcTGcV+JPc1HsCgRcXnMC2O5C0PbhXA0hT
         drBfnq8O9Y5K2omjdnucWEYzSk7c+OX+bdn3r4bxFkgcfBnVjg9xgVK/81fLBrPwu/Ox
         56WYLFZ5CE1A0PI5GLChGGCIDvoTq01Zb5KadQjekR9Yc9zBupf+k27kLwcjI9boPWNY
         qSKb6VQvvkNv+iOcVjREo25Urr/BMzR7Yy3aYInJoixiRdzzieWP2pDLeT9xDGn1NcAf
         LjWly68ix+88F85PjN5RImqn1JD26bQ6OreohoDZcFjlKmxqqtzE22ivIZx+x+/S5cbA
         vJlA==
X-Gm-Message-State: ABy/qLYqGNqJ1qGXn/aFMZjXyWZ7R71a41PGPGTSmePWlxxSk9fMcIvz
        WpjneceHvhIorzgeiztTT8yddFrO4C8=
X-Google-Smtp-Source: APBJJlGf7HZFyR3bDyVIouwwAN332PvEDe58O6oPRM2xmpXKj1o/qbd27/Xr8AZ4gMLnHXhphSiN3o4xpSo=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:e74b:b0:1b8:a56e:1dcc with SMTP id
 p11-20020a170902e74b00b001b8a56e1dccmr42348plf.13.1690825288754; Mon, 31 Jul
 2023 10:41:28 -0700 (PDT)
Date:   Mon, 31 Jul 2023 10:41:26 -0700
In-Reply-To: <ZMfxYR41K71UV/84@linux.dev>
Mime-Version: 1.0
References: <20230729004144.1054885-1-seanjc@google.com> <ZMfxYR41K71UV/84@linux.dev>
Message-ID: <ZMfyRnROXNeu4tnS@google.com>
Subject: Re: [PATCH] KVM: Wrap kvm_{gfn,hva}_range.pte in a per-action union
From:   Sean Christopherson <seanjc@google.com>
To:     Oliver Upton <oliver.upton@linux.dev>
Cc:     Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
        Anup Patel <anup@brainfault.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Paolo Bonzini <pbonzini@redhat.com>,
        linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
        linux-mips@vger.kernel.org, kvm@vger.kernel.org,
        kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org, Yu Zhao <yuzhao@google.com>
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Jul 31, 2023, Oliver Upton wrote:
> On Fri, Jul 28, 2023 at 05:41:44PM -0700, Sean Christopherson wrote:
> > If this looks good, my thought is to squeeze it into 6.6 so that the MGLRU
> > and guest_memfd() series can build on it.  Or those series could just
> > include it?
> 
> Eh, I'm not a huge fan of having two series independently reposting a
> common base. It can be a bit annoying when the two authors have slightly
> different interpretations on how to improve it...

That suggests that there's something to improve upon ;-)

> > diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> > index dfbaafbe3a00..f84ef9399aee 100644
> > --- a/virt/kvm/kvm_main.c
> > +++ b/virt/kvm/kvm_main.c
> > @@ -526,7 +526,7 @@ typedef void (*on_unlock_fn_t)(struct kvm *kvm);
> >  struct kvm_hva_range {
> >  	unsigned long start;
> >  	unsigned long end;
> > -	pte_t pte;
> > +	union kvm_mmu_notifier_arg arg;
> >  	hva_handler_t handler;
> >  	on_lock_fn_t on_lock;
> >  	on_unlock_fn_t on_unlock;
> > @@ -547,6 +547,8 @@ static void kvm_null_fn(void)
> >  }
> >  #define IS_KVM_NULL_FN(fn) ((fn) == (void *)kvm_null_fn)
> >  
> > +static const union kvm_mmu_notifier_arg KVM_NO_ARG;
> > +
> 
> I'm guessing you were trying to keep this short, but it might be nice to
> use MMU_NOTIFIER_ (or similar) as the prefix to make the scope
> immediately obvious.

Yeah, agreed, it's worth the extra line in kvm_mmu_notifier_clear_flush_young().
