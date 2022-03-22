Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AE3684E45D4
	for <lists+linux-mips@lfdr.de>; Tue, 22 Mar 2022 19:17:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234501AbiCVSS5 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 22 Mar 2022 14:18:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232080AbiCVSS4 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 22 Mar 2022 14:18:56 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F2BE74DFB
        for <linux-mips@vger.kernel.org>; Tue, 22 Mar 2022 11:17:27 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id d5so12013387lfj.9
        for <linux-mips@vger.kernel.org>; Tue, 22 Mar 2022 11:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rjXWwDt+piFjEizKBPLIwkQ3oNcecYs/t2+aRfZKR2Q=;
        b=e0SsUFEnYUMCyRAkGyLVow0+R4bFdfmash3hSguwzYMReIozuymckocyM5BR/BZLJg
         F/po3/TlVjopsmXJ41juFAnRzPe45KNaRNkzN0MtvjZ9mBPCEsZrjkO6ujDAemvwda96
         rl80jZRhNG2l/NMfwbStZ6I+jDlhs/HdozQzWkjJ80csfkdMlVM4vYTOYFFyjfHkCzzd
         9/mg9mIusJIiJ41q4kWg6sKjFXIQgUQguTqgxHiq8PkCHtwIR6pYWShWbrYo5MzF8yp5
         bQ749BhKFyRlGHbieptNt6y4VPTEPjdhkDnJ0TPl0KSwq8Nl847v1G4lQzpS2egtD3Nu
         R/sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rjXWwDt+piFjEizKBPLIwkQ3oNcecYs/t2+aRfZKR2Q=;
        b=xayKyqysWAAHwbR3ZEMwRXrxI3c4UPKEp8DuELuFH9GVpQdiPImU09Nv6KHJa6DVOt
         52LSk+EI5Fo9U2xrD5ThmKfGSQrGdtgcJ2685+9YzrRaWjkYFZ0k5LYZv3Ve/MHwegNi
         Lp3ycu09TAdZiZFzpuRo2KpteysVvaUOSSaDSzjWerKVXJIql00xMoR/QU3OIRFcJjH7
         a5Qe3folWz9ulZ61qr3ir6acMZiidnYN2z6UBZUod/NE9Wci4V04qoRED+XWmz+UP1xS
         68aW80DoJyFlLXYGyeZQFsTypj0nrNbb1JxXGElVpSGFVojcHc7mLk03qxo9MpeHxZAL
         J+AQ==
X-Gm-Message-State: AOAM533u8JEm031geYulG4vMf7eBeD09doLrV6Tu9l+71zIo8xd/ZXus
        NoMB4gpCUDEYfRIKG1eWL6DUkncB4/z66CywXTAVqg==
X-Google-Smtp-Source: ABdhPJxTpXDCogH6wFEbXP5cV7bKAnz+C/vzgCxatvwG3tgn9N4H9nX6rT0RugIgjr0sQJpMf/ysU29QMVGOZ9XlHbA=
X-Received: by 2002:ac2:57db:0:b0:44a:23ce:b7f5 with SMTP id
 k27-20020ac257db000000b0044a23ceb7f5mr9953556lfo.235.1647973045570; Tue, 22
 Mar 2022 11:17:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220311002528.2230172-1-dmatlack@google.com> <20220311002528.2230172-2-dmatlack@google.com>
 <YjBC1ZLio2iPkZ0V@xz-m1.local>
In-Reply-To: <YjBC1ZLio2iPkZ0V@xz-m1.local>
From:   David Matlack <dmatlack@google.com>
Date:   Tue, 22 Mar 2022 11:16:59 -0700
Message-ID: <CALzav=dx2rm7xm07x0iEMiS1jzNoU2cOT-mtA9=P6C1riOe2AQ@mail.gmail.com>
Subject: Re: [PATCH v2 01/26] KVM: x86/mmu: Optimize MMU page cache lookup for
 all direct SPs
To:     Peter Xu <peterx@redhat.com>
Cc:     Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>,
        Huacai Chen <chenhuacai@kernel.org>,
        Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
        Anup Patel <anup@brainfault.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Sean Christopherson <seanjc@google.com>,
        Andrew Jones <drjones@redhat.com>,
        Ben Gardon <bgardon@google.com>,
        "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>,
        "moderated list:KERNEL VIRTUAL MACHINE FOR ARM64 (KVM/arm64)" 
        <kvmarm@lists.cs.columbia.edu>,
        "open list:KERNEL VIRTUAL MACHINE FOR MIPS (KVM/mips)" 
        <linux-mips@vger.kernel.org>,
        "open list:KERNEL VIRTUAL MACHINE FOR MIPS (KVM/mips)" 
        <kvm@vger.kernel.org>,
        "open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" 
        <kvm-riscv@lists.infradead.org>, Peter Feiner <pfeiner@google.com>
Content-Type: text/plain; charset="UTF-8"
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

On Tue, Mar 15, 2022 at 12:40 AM Peter Xu <peterx@redhat.com> wrote:
>
> On Fri, Mar 11, 2022 at 12:25:03AM +0000, David Matlack wrote:
> > Commit fb58a9c345f6 ("KVM: x86/mmu: Optimize MMU page cache lookup for
> > fully direct MMUs") skipped the unsync checks and write flood clearing
> > for full direct MMUs. We can extend this further and skip the checks for
> > all direct shadow pages. Direct shadow pages are never marked unsynced
> > or have a non-zero write-flooding count.
>
> Nit: IMHO it's better to spell out the exact functional change, IIUC those
> are the direct mapped SPs where guest uses huge pages but host uses only
> small pages for the shadowing?

Yes that's correct. I'll include that in the commit message in the next version.

>
> >
> > Checking sp->role.direct alos generates better code than checking
> > direct_map because, due to register pressure, direct_map has to get
> > shoved onto the stack and then pulled back off.
> >
> > No functional change intended.
> >
> > Reviewed-by: Sean Christopherson <seanjc@google.com>
> > Signed-off-by: David Matlack <dmatlack@google.com>
>
> Reviewed-by: Peter Xu <peterx@redhat.com>
>
> --
> Peter Xu
>
