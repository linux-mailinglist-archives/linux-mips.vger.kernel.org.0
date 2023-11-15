Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 690877DBFCB
	for <lists+linux-mips@lfdr.de>; Mon, 30 Oct 2023 19:24:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229568AbjJ3SYA (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 30 Oct 2023 14:24:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231965AbjJ3SX6 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 30 Oct 2023 14:23:58 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7795F10D
        for <linux-mips@vger.kernel.org>; Mon, 30 Oct 2023 11:21:43 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-40806e40fccso31935025e9.2
        for <linux-mips@vger.kernel.org>; Mon, 30 Oct 2023 11:21:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698690100; x=1699294900; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+/9ggluaJ++InohprDPxvdU7Uw478trPLaD3bhLrtl4=;
        b=evnelxo6BHvIfCZLkH2HljZAClVdE9ks4A0+VrbC9RPeA11urFDr2tenj96AWZwyAh
         DNKriGKjs9z0/Hk0iHZ0UUznlW7GwojmeUQiLnk94LmHovwxp7wxg2l7CYsRx1SpCGFv
         pt3EXezQdlu6PGaOfE1jrpG0yuNNjiMI9gr9GDTgXE3MLzq9zulE+JC6y4uKSSnluXR/
         QMCW4L/fWQzumgtidJ2PxovL03srHOZS+U+lRsLxX6zbILHMPnqfBJeIjteHqxv9Oxyn
         8p0gUE7P6cWiwtideNc5db/5PLVCeUnyqICIf+JlPh0ZwsKZQBMRxrpeLPVSO3XCEyHA
         YsGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698690100; x=1699294900;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+/9ggluaJ++InohprDPxvdU7Uw478trPLaD3bhLrtl4=;
        b=gZ5bmlzR4UD67yJ35YjCrYoSdhY5n8fiGhV/3xtWzpQJsfg8UV7TmkoZI4391vIZX1
         GMLfaNyZt7YHZj3nP/u6H4rUaqWgSahOJwRWDv78+YCVjwupJzNWkji3+qp/gXV1FcK/
         UcF1x3c2GhT84f+6ajtwx7H3lCI8VV5VMmulArZEPk1UHtoLQp4ZZJv1o00LwpAbUQos
         hEP0jrTT7yGolpkLhVDkLAlPzoO0kJFSsaZcs8lHk/cycNcSMgQ5eSCh8PLCv9nTXEiM
         C7sF28f1w+20tO05nmbGeIvnE64ehVSYLwakNZcWfbCG0IaUL4CEHpETNTlkjQWr1fkE
         CtcA==
X-Gm-Message-State: AOJu0Yw9KANsolTyluKSnYUUMEf5vT1tcs9KfCUsIWpQVOcb/kYhs/Go
        WPSkGMqbBNwdQ0AXKOk1wBc+rC/wyE+kRRcGtKKaqw==
X-Google-Smtp-Source: AGHT+IEmwHEAyRl4O1ADBUXlJ8Ir1QajxdHcmQhP1+JwZ6AL7EQf1l2WpAn/vfiQDkHuuhxFizw+5mWU1UT2yp1CF+k=
X-Received: by 2002:a05:600c:524a:b0:408:4160:1528 with SMTP id
 fc10-20020a05600c524a00b0040841601528mr8760818wmb.30.1698690100370; Mon, 30
 Oct 2023 11:21:40 -0700 (PDT)
MIME-Version: 1.0
References: <20231027182217.3615211-1-seanjc@google.com> <20231027182217.3615211-4-seanjc@google.com>
 <ZT_fnAcDAvuPCwws@google.com> <CABgObfYM4nyb1K3xJVGvV+eQmZoLPAmz2-=1CG8++pCwvVW7Qg@mail.gmail.com>
In-Reply-To: <CABgObfYM4nyb1K3xJVGvV+eQmZoLPAmz2-=1CG8++pCwvVW7Qg@mail.gmail.com>
From:   David Matlack <dmatlack@google.com>
Date:   Mon, 30 Oct 2023 11:21:12 -0700
Message-ID: <CALzav=djOS8T7AmUa3A7QmP1f0xAm2W-KRDmOov_H8ps77A2qA@mail.gmail.com>
Subject: Re: [PATCH v13 03/35] KVM: Use gfn instead of hva for mmu_notifier_retry
To:     Paolo Bonzini <pbonzini@redhat.com>
Cc:     Sean Christopherson <seanjc@google.com>,
        Marc Zyngier <maz@kernel.org>,
        Oliver Upton <oliver.upton@linux.dev>,
        Huacai Chen <chenhuacai@kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Anup Patel <anup@brainfault.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        Christian Brauner <brauner@kernel.org>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        Andrew Morton <akpm@linux-foundation.org>, kvm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
        linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
        linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, Xiaoyao Li <xiaoyao.li@intel.com>,
        Xu Yilun <yilun.xu@intel.com>,
        Chao Peng <chao.p.peng@linux.intel.com>,
        Fuad Tabba <tabba@google.com>,
        Jarkko Sakkinen <jarkko@kernel.org>,
        Anish Moorthy <amoorthy@google.com>,
        Yu Zhang <yu.c.zhang@linux.intel.com>,
        Isaku Yamahata <isaku.yamahata@intel.com>,
        =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>,
        Vlastimil Babka <vbabka@suse.cz>,
        Vishal Annapurve <vannapurve@google.com>,
        Ackerley Tng <ackerleytng@google.com>,
        Maciej Szmigiero <mail@maciej.szmigiero.name>,
        David Hildenbrand <david@redhat.com>,
        Quentin Perret <qperret@google.com>,
        Michael Roth <michael.roth@amd.com>,
        Wang <wei.w.wang@intel.com>,
        Liam Merwick <liam.merwick@oracle.com>,
        Isaku Yamahata <isaku.yamahata@gmail.com>,
        "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Oct 30, 2023 at 10:01=E2=80=AFAM Paolo Bonzini <pbonzini@redhat.com=
> wrote:
>
> On Mon, Oct 30, 2023 at 5:53=E2=80=AFPM David Matlack <dmatlack@google.co=
m> wrote:
> >
> > On 2023-10-27 11:21 AM, Sean Christopherson wrote:
> > > From: Chao Peng <chao.p.peng@linux.intel.com>
> > >
> > > Currently in mmu_notifier invalidate path, hva range is recorded and
> > > then checked against by mmu_notifier_retry_hva() in the page fault
> > > handling path. However, for the to be introduced private memory, a pa=
ge
> >                           ^^^^^^^^^^^^^^^^^^^^^^^^
> >
> > Is there a missing word here?
>
> No but there could be missing hyphens ("for the to-be-introduced
> private memory"); possibly a "soon" could help parsing and that is
> what you were talking about?

Ah that explains it :)

>
> > >       if (likely(kvm->mmu_invalidate_in_progress =3D=3D 1)) {
> > > +             kvm->mmu_invalidate_range_start =3D INVALID_GPA;
> > > +             kvm->mmu_invalidate_range_end =3D INVALID_GPA;
> >
> > I don't think this is incorrect, but I was a little suprised to see thi=
s
> > here rather than in end() when mmu_invalidate_in_progress decrements to
> > 0.
>
> I think that would be incorrect on the very first start?

Good point. KVM could initialize start/end before registering
notifiers, but that's extra code.
