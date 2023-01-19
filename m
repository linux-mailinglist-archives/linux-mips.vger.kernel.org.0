Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B6A9867421B
	for <lists+linux-mips@lfdr.de>; Thu, 19 Jan 2023 20:06:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231252AbjASTGC (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 19 Jan 2023 14:06:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230361AbjASTF7 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 19 Jan 2023 14:05:59 -0500
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com [IPv6:2607:f8b0:4864:20::1136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2480394CA0
        for <linux-mips@vger.kernel.org>; Thu, 19 Jan 2023 11:04:53 -0800 (PST)
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-4a263c4ddbaso41749127b3.0
        for <linux-mips@vger.kernel.org>; Thu, 19 Jan 2023 11:04:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8ZdECDAg9mmwgMiId+0pdkIRFxWXX0Q/ZbZP48ymAFw=;
        b=Giy1ebz7O7hQyLTIrtkNNdjBv+MOt2a11+O3yrLKdfi0gkb9lOByfeSgTPczfJEGb2
         p8d0RDgaBcgodvbREpLedfJYFzJ6sUh3y+/Kk2nB5wG0XWFvHIIwdRQir2FjfdWdS9Tj
         +rt17AF0fb7qkyCHUXHbr0WuZ+0k+UmlUL3XRsZ35z/NG8KC17aR/t4/C07kqwQtIjYu
         ik9/D70oGXpm9zYVjNL7tCpYbaSSHLrAJ0Kx6LokMM1zSa/Omk45VsI0lkLRYIZHjJ0t
         T4WywLp/HCTt1yfU3CMQr50DAEA47mnPOtX1zH6p6WhCGjVh6+PNei54Lb8VlWVsM6ML
         fO1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8ZdECDAg9mmwgMiId+0pdkIRFxWXX0Q/ZbZP48ymAFw=;
        b=AGeUBq2w0TuDq0/xfOhh2jO+6Lr+S4rQyZICZ7w39FVv8dX4OT83hXWSpdafDOuyxr
         VzvCRiCIMWK3+svriUmbZqKQ/tAzOvbZjxEGzrBWUKwIRXfx5pOs5WUhXudNtrRSOQjh
         EXh1PWmIb+12xcf6/HENutAthg1AzC3qPXqxYmI1/mz29TYmxWz4N/ACNff4Az1N8dci
         aq/gPgCLU3U/Ag7pKCrGVpi3xbbxzzUneRe0KXoJu4WldiZjBzqrnGuW3pvdkEn+cMC4
         6UAR/BONg8xdfZt9h12MV9q9/r/5yYbyhuxK6l5yPUVEcjGrD/XoXFVYqTLn6H4UB5ZK
         G/wA==
X-Gm-Message-State: AFqh2kocpFwWi+6Lcc7erEaNo+cmQIcJWy4U3+3X0/J8Bs9wGFgAM/9r
        dn4bFmOB2PtFR/f5TaT8hoiVnV8zF2V9MLB55vftRA==
X-Google-Smtp-Source: AMrXdXtw3ClXGsau5g83hRYHF5bMmdLrbSAwU9zjlK/t8/PMP/LzBLrUT8Sd0TO+7LHePXlgOs+p8s15w/v0I2sj3tQ=
X-Received: by 2002:a81:4bd1:0:b0:478:1c89:6462 with SMTP id
 y200-20020a814bd1000000b004781c896462mr1433601ywa.150.1674155091041; Thu, 19
 Jan 2023 11:04:51 -0800 (PST)
MIME-Version: 1.0
References: <20221208193857.4090582-1-dmatlack@google.com> <Y8l6egh2wWN7BUlZ@google.com>
 <86tu0mmo8m.wl-maz@kernel.org> <CALzav=dya7GsOD7-dm3649Xe4Xo_p5gJACvjZHtpbk0QwoU-gg@mail.gmail.com>
In-Reply-To: <CALzav=dya7GsOD7-dm3649Xe4Xo_p5gJACvjZHtpbk0QwoU-gg@mail.gmail.com>
From:   David Matlack <dmatlack@google.com>
Date:   Thu, 19 Jan 2023 11:04:24 -0800
Message-ID: <CALzav=ebYgZu2LfeQkspU_ke6GHbuPcpiST0pMafmAJGziybnA@mail.gmail.com>
Subject: Re: [RFC PATCH 00/37] KVM: Refactor the KVM/x86 TDP MMU into common code
To:     Marc Zyngier <maz@kernel.org>
Cc:     Paolo Bonzini <pbonzini@redhat.com>,
        James Morse <james.morse@arm.com>,
        Alexandru Elisei <alexandru.elisei@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Oliver Upton <oliver.upton@linux.dev>,
        Huacai Chen <chenhuacai@kernel.org>,
        Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
        Anup Patel <anup@brainfault.org>,
        Atish Patra <atishp@atishpatra.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Sean Christopherson <seanjc@google.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        Nadav Amit <namit@vmware.com>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        Vlastimil Babka <vbabka@suse.cz>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Peter Xu <peterx@redhat.com>, xu xin <cgel.zte@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>, Yu Zhao <yuzhao@google.com>,
        Colin Cross <ccross@google.com>,
        Hugh Dickins <hughd@google.com>,
        Ben Gardon <bgardon@google.com>,
        Mingwei Zhang <mizhang@google.com>,
        Krish Sadhukhan <krish.sadhukhan@oracle.com>,
        Ricardo Koller <ricarkol@google.com>,
        Jing Zhang <jingzhangos@google.com>,
        linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
        kvmarm@lists.cs.columbia.edu, linux-mips@vger.kernel.org,
        kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
        linux-riscv@lists.infradead.org,
        Alexandre Ghiti <alexghiti@rivosinc.com>,
        Raghavendra Rao Ananta <rananta@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Jan 19, 2023 at 10:38 AM David Matlack <dmatlack@google.com> wrote:
>
> On Thu, Jan 19, 2023 at 9:24 AM Marc Zyngier <maz@kernel.org> wrote:
> >
> > On Thu, 19 Jan 2023 17:14:34 +0000, David Matlack <dmatlack@google.com> wrote:
> > > I'd like to target RISC-V first, since it has significantly lower risk
> > > and complexity than e.g. ARM (which has pKVM, stage-1 walkers, and
> > > [soon] nested virtualization to deal with).
> >
> > And (joy, happiness), the upcoming 128bit page table support[1].
>
> Oh good, I was worried the ARM port was going to be too easy :)

But in all seriousness, I'm not too worried about supporting 128-bit
page tables in the Common MMU, assuming it is a compile-time decision.
The way I'm planning to organize the code, architecture-specific code
will own the PTEs, so each architecture can do whatever they want.
There is a hard-coded assumption that PTEs are u64 in the current
code, but we can abstract that behind a typedef for 128-bit support.

We will need to figure out how to deal with concurrency though. Will
128-bit page table support come with 128-bit atomic support (e.g.
compare-exchange)? If so we should be good to go. If not, we'll need
to emulate them with e.g. spinlocks. But either way, figuring this out
is not specific to the Common MMU. Even if ARM kept its own stage-2
MMU we'd have to solve the same problem there.
