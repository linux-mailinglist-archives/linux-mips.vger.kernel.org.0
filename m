Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A1B7667A023
	for <lists+linux-mips@lfdr.de>; Tue, 24 Jan 2023 18:29:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233331AbjAXR26 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 24 Jan 2023 12:28:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229486AbjAXR25 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 24 Jan 2023 12:28:57 -0500
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com [IPv6:2607:f8b0:4864:20::112a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C1D046149
        for <linux-mips@vger.kernel.org>; Tue, 24 Jan 2023 09:28:57 -0800 (PST)
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-4c131bede4bso228443957b3.5
        for <linux-mips@vger.kernel.org>; Tue, 24 Jan 2023 09:28:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4sHQzscpqG9TR78740t1qks4GROeGMyOxwyGqktGwJE=;
        b=Wv/Y/FHqEIrZHr/zsNPKlIP0whUgie/P2KEuD/n0uk24KW6tZ8c5E2dlYQQksvdoXc
         MIGHEBlUyUiurRHKw8Eli/ImV02k9ot4n+oIcF3KHN0Eg97UZIY86sENWVWQU92/wEku
         tC53N+VqDQm61+7t4vsGLZJKabtV7K36r+12kp1mA/pYMQNNe9IENQSoeoOTDJhNIfIi
         pwMTsdVKm9K2Zr4mYwzujPCEe6yuR+ktXBivdEw3X1L9xQ34O0xjHOv/b0Y/qsZO4lf3
         CRYLcBg/1JEoF9JDtZGWN8+JUGWeccq8WSx3xvS9w95XtQVb/oCmR3pU9VOfVK3eaNRc
         R3JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4sHQzscpqG9TR78740t1qks4GROeGMyOxwyGqktGwJE=;
        b=38Ys8GqjSw9RxT1WgY00wxfHsReE3G9HBz/ibM53QEHkaaNsWV3I8jKFR6SyPu/lfn
         vcYxe9l6Lo0jk7rwrqKjvm2G4jZI27b84XyCKbd9hvL95Z4Gkzlv8xfUH61qRsHiM83r
         DNYCi6PIMvV2tPoiFJgjpI+DOninNOtOD/RA+X7zEV0RdIl4KaKD/sl/RKU0o+DyOuVy
         5zMeSY/u3on0itytnMa90iDb+QvZQsXNKM0ekjuZ6DJ4TbaSdoBJArzz0QC229owOm6v
         b3u04DbIJQ5ICR76zYA+iKZ2DsgEdWRiA86lBLnJat6yFGkg4UUFOfYH0tvs4ZxhsEeP
         AIgQ==
X-Gm-Message-State: AFqh2kqgqV6TAQOu9cy99lTdokT413qcBZuVicsq6NJB+Xvah7JSSsyN
        QUeapVaxOeS7BamrZIP77LAvm0DEadR9eXFZwESiRA==
X-Google-Smtp-Source: AMrXdXtoN51iKqcC09s8NkQ+YBm6QxH/37ZW+Hv6vzsZE0mZGYF6ccuLxsS+T0REhESD+5OAPgve9W78T1Q827MM4i4=
X-Received: by 2002:a0d:f807:0:b0:477:b56e:e1d6 with SMTP id
 i7-20020a0df807000000b00477b56ee1d6mr3560086ywf.188.1674581336255; Tue, 24
 Jan 2023 09:28:56 -0800 (PST)
MIME-Version: 1.0
References: <20230119173559.2517103-1-dmatlack@google.com> <20230119173559.2517103-3-dmatlack@google.com>
 <Y9ASmOvJutgGLVnT@google.com>
In-Reply-To: <Y9ASmOvJutgGLVnT@google.com>
From:   David Matlack <dmatlack@google.com>
Date:   Tue, 24 Jan 2023 09:28:29 -0800
Message-ID: <CALzav=fbzgpktnCX9Z7G_gN=yVVLuwB5Of3_pq3LHrQGySbHsg@mail.gmail.com>
Subject: Re: [PATCH 2/7] KVM: arm64: Use kvm_arch_flush_remote_tlbs()
To:     Oliver Upton <oliver.upton@linux.dev>
Cc:     Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>,
        James Morse <james.morse@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Zenghui Yu <yuzenghui@huawei.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
        Anup Patel <anup@brainfault.org>,
        Atish Patra <atishp@atishpatra.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Sean Christopherson <seanjc@google.com>,
        linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
        kvmarm@lists.cs.columbia.edu, linux-mips@vger.kernel.org,
        kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
        linux-riscv@lists.infradead.org,
        Raghavendra Rao Ananta <rananta@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Jan 24, 2023 at 9:17 AM Oliver Upton <oliver.upton@linux.dev> wrote:
> On Thu, Jan 19, 2023 at 09:35:54AM -0800, David Matlack wrote:
> >
> >  arch/arm64/include/asm/kvm_host.h | 3 +++
> >  arch/arm64/kvm/Kconfig            | 1 -
> >  arch/arm64/kvm/mmu.c              | 6 +++---
> >  virt/kvm/kvm_main.c               | 2 --
> >  4 files changed, 6 insertions(+), 6 deletions(-)
>
> I think you're missing the diff that actually drops the Kconfig opton
> from virt/kvm/Kconfig.

Indeed I am, thanks for catching that!
