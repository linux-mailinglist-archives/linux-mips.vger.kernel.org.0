Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C6276756918
	for <lists+linux-mips@lfdr.de>; Mon, 17 Jul 2023 18:29:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229566AbjGQQ3R (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 17 Jul 2023 12:29:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231911AbjGQQ3L (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 17 Jul 2023 12:29:11 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1DF3E56
        for <linux-mips@vger.kernel.org>; Mon, 17 Jul 2023 09:29:10 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1b9ed206018so217555ad.1
        for <linux-mips@vger.kernel.org>; Mon, 17 Jul 2023 09:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689611350; x=1690216150;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JdC3m+V++Z/viiPrZylihhrytj8yYzk3mKF8HaNWKR8=;
        b=JLAgLws9Ph8sZXiXZU9MF05DdRh4lVloJ4eCxbv6I29WMR5L0rCOLPelFSDEOZhJvt
         64+osbhlLyTLpW/D92uvfSJaEL4sFuEBmrpVS+xj6clTrIc2+bVJGwfbs5n6gHdnEr5B
         YqzqSMwfqaSo3XeFvoWjfbHeM4Cc/MTNc1ecF1B0hr875jx1ozJYDOrdZfwkabhTY752
         2VHpkMBORHmHuzxFkO6mdxouWf2WD6zFkfGAabLUwljGiTe44J/tuB2YOVMzpNsZ9p1i
         sch2dY3rkukgapyWRdaAtY7ju3lclvSIthC+kC+tP83bYfSBV/VxQM9FDLFKyUC+qfpE
         iEPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689611350; x=1690216150;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JdC3m+V++Z/viiPrZylihhrytj8yYzk3mKF8HaNWKR8=;
        b=TQ5gdZCyUJQL/n9f0ZdjVBIOSZt3yzKX7bZSsXN8zYZiIsuREWpdKXNuHnZgXJhD2r
         UujbLG1dV+acdmRx5PVQF8l6fqJrEZQzINDFBziRrAUWthilsjiGQFI6olKGJfY1yYuE
         V5duznyNwC6ZGtaNDlhb3nhkd3KOW10o60n8WUwhY0RXaXjZylDQ8FU5bgOPWN1bRB6I
         x7iNWlO7vOcwGVdM2t4o4hGxdlKCoIUWIIPabRu+l97wFfadVk0NuNYJFD8yBOOMgh3v
         gGkhSt0nWbvtJoSaReW4slAhhatPEnAY1Vu4JxM43dIsxfzzZS99KW+ojXE6V33w2ZTa
         gZOw==
X-Gm-Message-State: ABy/qLY/QtMi+jc0Vbi/LYElMportR7CxZA1uAhWDBww9Is0lWBzmFX1
        6SoUMEyj4isC9fvaeACzjTjl7Hs8QzcwmI9zCyuSAg==
X-Google-Smtp-Source: APBJJlEyymDBpyl7ABeHnCX+wEYEjlMXNDWxLVm6reu3PBE3OUW35nPR5bmepa4Nhj9vtn4nG7ITVPmZXkRqcZH8h0M=
X-Received: by 2002:a17:903:41c4:b0:1b8:5857:ea9a with SMTP id
 u4-20020a17090341c400b001b85857ea9amr1012512ple.23.1689611350208; Mon, 17 Jul
 2023 09:29:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230715005405.3689586-1-rananta@google.com> <20230715005405.3689586-3-rananta@google.com>
 <ef2dddcd-f4dd-da9b-c03f-ccd852bb8543@linaro.org>
In-Reply-To: <ef2dddcd-f4dd-da9b-c03f-ccd852bb8543@linaro.org>
From:   Raghavendra Rao Ananta <rananta@google.com>
Date:   Mon, 17 Jul 2023 09:28:58 -0700
Message-ID: <CAJHc60xbPoTeX4oKeg45U6QjBw3CS=ZU0PEVCE1zaoAX4Ex7Vw@mail.gmail.com>
Subject: Re: [PATCH v6 02/11] KVM: arm64: Use kvm_arch_flush_remote_tlbs()
To:     =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc:     Oliver Upton <oliver.upton@linux.dev>,
        Marc Zyngier <maz@kernel.org>,
        James Morse <james.morse@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Sean Christopherson <seanjc@google.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        Zenghui Yu <yuzenghui@huawei.com>,
        Anup Patel <anup@brainfault.org>,
        Atish Patra <atishp@atishpatra.org>,
        Jing Zhang <jingzhangos@google.com>,
        Colton Lewis <coltonlewis@google.com>,
        David Matlack <dmatlack@google.com>,
        linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
        linux-mips@vger.kernel.org, kvm-riscv@lists.infradead.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        kvm@vger.kernel.org, Zenghui Yu <zenghui.yu@linux.dev>,
        Gavin Shan <gshan@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Hi Philippe,

On Mon, Jul 17, 2023 at 1:13=E2=80=AFAM Philippe Mathieu-Daud=C3=A9
<philmd@linaro.org> wrote:
>
> Hi Raghavendra, David,
>
> On 15/7/23 02:53, Raghavendra Rao Ananta wrote:
> > From: David Matlack <dmatlack@google.com>
> >
> > Use kvm_arch_flush_remote_tlbs() instead of
> > CONFIG_HAVE_KVM_ARCH_TLB_FLUSH_ALL. The two mechanisms solve the same
> > problem, allowing architecture-specific code to provide a non-IPI
> > implementation of remote TLB flushing.
> >
> > Dropping CONFIG_HAVE_KVM_ARCH_TLB_FLUSH_ALL allows KVM to standardize
> > all architectures on kvm_arch_flush_remote_tlbs() instead of maintainin=
g
> > two mechanisms.
> >
> > Opt to standardize on kvm_arch_flush_remote_tlbs() since it avoids
> > duplicating the generic TLB stats across architectures that implement
> > their own remote TLB flush.
> >
> > This adds an extra function call to the ARM64 kvm_flush_remote_tlbs()
> > path, but that is a small cost in comparison to flushing remote TLBs.
> >
> > In addition, instead of just incrementing remote_tlb_flush_requests
> > stat, the generic interface would also increment the
> > remote_tlb_flush stat.
> >
> > Signed-off-by: David Matlack <dmatlack@google.com>
> > Signed-off-by: Raghavendra Rao Ananta <rananta@google.com>
> > Reviewed-by: Zenghui Yu <zenghui.yu@linux.dev>
> > Acked-by: Oliver Upton <oliver.upton@linux.dev>
> > Reviewed-by: Gavin Shan <gshan@redhat.com>
> > ---
> >   arch/arm64/include/asm/kvm_host.h | 3 +++
> >   arch/arm64/kvm/Kconfig            | 1 -
> >   arch/arm64/kvm/mmu.c              | 6 +++---
> >   virt/kvm/Kconfig                  | 3 ---
> >   virt/kvm/kvm_main.c               | 2 --
> >   5 files changed, 6 insertions(+), 9 deletions(-)
>
> You are doing 2 changes in the same patch:
>
> - Have ARM use kvm_arch_flush_remote_tlbs() instead of
>    HAVE_KVM_ARCH_TLB_FLUSH_ALL,
> - Drop the now unused HAVE_KVM_ARCH_TLB_FLUSH_ALL.
>
> Commits should be atomic, to allow partial
> revert or cherry-pick.
>
> Preferably splitting this patch in 2:
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
>
Thanks for the suggestion. I guess that makes sense. I'll split the
patch in two for v7.

- Raghavendra
> Regards,
>
> Phil.
>
