Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7D89C7707AF
	for <lists+linux-mips@lfdr.de>; Fri,  4 Aug 2023 20:19:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229864AbjHDSTR (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 4 Aug 2023 14:19:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229471AbjHDSTP (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 4 Aug 2023 14:19:15 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5B4D46B2
        for <linux-mips@vger.kernel.org>; Fri,  4 Aug 2023 11:19:14 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1b52875b8d9so20495ad.0
        for <linux-mips@vger.kernel.org>; Fri, 04 Aug 2023 11:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691173154; x=1691777954;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mfl7UJxUbxuUeTFoCKSsO/YqaEDE5S858pqTp5fgS00=;
        b=uCBp75tLHriee//ikoqX2p7GjimbkirtfpIc8u1w4o4rJ5LjqEB3KYoXAiKiKEJ1MF
         DotbslqYm5Nhe3DYQsDTksQT7Her1ubNthHRWCzWT4FlTQfKRzfdCp6TYxeevDR31fvW
         0zyetWbMhkUr7qGOnjI6KiEqxCz6dPc2GmSHje5ATyYxqrTq6lSL+WS1dI0HHL++kfX8
         D+v4noCZoArF+1sIIwVhIBcDOTPnV5jsidMUaZYjedfSrLAc1z5UsqyKSi4/1p+Jm50S
         Tm2k90LzEhrYGbndJU95LHQSily8ML2kCFE6HRvTt1LMGvaeA2yRRJSEA2PA7YMzA0vp
         Y3SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691173154; x=1691777954;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mfl7UJxUbxuUeTFoCKSsO/YqaEDE5S858pqTp5fgS00=;
        b=jUoEIdKJxrvlman3geKkaR71UiWUjff7r20BD6B539Tmqc37YNauCGjLRtTatragd2
         yee8N+yzJw2uD6a3F1F/DSgHh3+PdAeKczTXAb8cg6pXLFWf63MDDkxRUZpp7p0NsA0u
         fe6Ticm8V9afGcwocpQoeX7SlI/bCJqls0d/4dkqruBbE4fEE9V+ugkoodE6tSP8iAai
         3ttwnjD6r1g35WGivGSGJHXWJRpGGLZBHjdb3TqQ6jR6csZpWWfAXD9a7+x17iGtfctb
         yoFfJck748SgOcl2n1WT7xjvP5DA+U5eT3natXPfJsjZu5R+L+doZ7FV1tOb6EDw/jDw
         pQZA==
X-Gm-Message-State: AOJu0YyHxKBEPMCkSZ7zL2g7SXRv6w9V38M+WKuPGbZXYO15tlwgVjb6
        R7/WCzyJ6Z0eP6RY3rCLCGrefTiiNny7MEVHi4BWuA==
X-Google-Smtp-Source: AGHT+IFFuspIZOGK/w9Z6kR37S5PKecewC+tAEgC1N9zpe8mnYVma9ptD/pOi27s4N+BxyB/wElI7D/qTwtc1r+Abqc=
X-Received: by 2002:a17:902:c409:b0:1a9:bb1d:64e with SMTP id
 k9-20020a170902c40900b001a9bb1d064emr24172plk.15.1691173154182; Fri, 04 Aug
 2023 11:19:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230722022251.3446223-1-rananta@google.com> <20230722022251.3446223-3-rananta@google.com>
 <87tttpr6qy.wl-maz@kernel.org> <ZMgsjx8dwKd4xBGe@google.com>
 <877cqdqw12.wl-maz@kernel.org> <CAJHc60xAUVt5fbhEkOqeC-VF8SWVOt3si=1yxVVAUW=+Hu_wNg@mail.gmail.com>
In-Reply-To: <CAJHc60xAUVt5fbhEkOqeC-VF8SWVOt3si=1yxVVAUW=+Hu_wNg@mail.gmail.com>
From:   Raghavendra Rao Ananta <rananta@google.com>
Date:   Fri, 4 Aug 2023 11:19:02 -0700
Message-ID: <CAJHc60zN-dc2E-fS7fuXgkrfGD9bqW6tMy2GRZxbHOeZv0ZOBw@mail.gmail.com>
Subject: Re: [PATCH v7 02/12] KVM: arm64: Use kvm_arch_flush_remote_tlbs()
To:     Marc Zyngier <maz@kernel.org>
Cc:     Sean Christopherson <seanjc@google.com>,
        Oliver Upton <oliver.upton@linux.dev>,
        James Morse <james.morse@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        Zenghui Yu <yuzenghui@huawei.com>,
        Anup Patel <anup@brainfault.org>,
        Atish Patra <atishp@atishpatra.org>,
        Jing Zhang <jingzhangos@google.com>,
        Reiji Watanabe <reijiw@google.com>,
        Colton Lewis <coltonlewis@google.com>,
        David Matlack <dmatlack@google.com>,
        linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
        linux-mips@vger.kernel.org, kvm-riscv@lists.infradead.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Aug 2, 2023 at 4:28=E2=80=AFPM Raghavendra Rao Ananta
<rananta@google.com> wrote:
>
> Sure, I'll change it to kvm_arch_flush_vm_tlbs() in v8.
>
While working on the renaming, I realized that since this function is
called from kvm_main.c's kvm_flush_remote_tlbs(). Do we want to rename
this and the other kvm_flush_*() functions that the series introduces
to match their kvm_arch_flush_*() counterparts?  (spiraling more into
this, we also have the 'remote_tlb_flush_requests' and
'remote_tlb_flush' stats)

Thank you.
Raghavendra

> Thanks,
> Raghavendra
>
> On Wed, Aug 2, 2023 at 8:55=E2=80=AFAM Marc Zyngier <maz@kernel.org> wrot=
e:
> >
> > On Mon, 31 Jul 2023 22:50:07 +0100,
> > Sean Christopherson <seanjc@google.com> wrote:
> > >
> > > On Thu, Jul 27, 2023, Marc Zyngier wrote:
> > > > On Sat, 22 Jul 2023 03:22:41 +0100,
> > > > Raghavendra Rao Ananta <rananta@google.com> wrote:
> > > > >
> > > > > Stop depending on CONFIG_HAVE_KVM_ARCH_TLB_FLUSH_ALL and opt to
> > > > > standardize on kvm_arch_flush_remote_tlbs() since it avoids
> > > > > duplicating the generic TLB stats across architectures that imple=
ment
> > > > > their own remote TLB flush.
> > > > >
> > > > > This adds an extra function call to the ARM64 kvm_flush_remote_tl=
bs()
> > > > > path, but that is a small cost in comparison to flushing remote T=
LBs.
> > > >
> > > > Well, there is no such thing as a "remote TLB" anyway. We either ha=
ve
> > > > a non-shareable or inner-shareable invalidation. The notion of remo=
te
> > > > would imply that we track who potentially has a TLB, which we
> > > > obviously don't.
> > >
> > > Maybe kvm_arch_flush_vm_tlbs()?  The "remote" part is misleading even=
 on x86 when
> > > running on Hyper-V, as the flush may be done via a single hypercall a=
nd by kicking
> > > "remote" vCPUs.
> >
> > Yup, this would be much better.
> >
> > Thanks,
> >
> >         M.
> >
> > --
> > Without deviation from the norm, progress is not possible.
