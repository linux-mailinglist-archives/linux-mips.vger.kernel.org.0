Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E86CC76A37E
	for <lists+linux-mips@lfdr.de>; Mon, 31 Jul 2023 23:57:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231609AbjGaV5Z (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 31 Jul 2023 17:57:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229612AbjGaV5Y (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 31 Jul 2023 17:57:24 -0400
Received: from mail-pl1-x64a.google.com (mail-pl1-x64a.google.com [IPv6:2607:f8b0:4864:20::64a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B13F9118
        for <linux-mips@vger.kernel.org>; Mon, 31 Jul 2023 14:57:23 -0700 (PDT)
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-1bba9a0da10so34927455ad.2
        for <linux-mips@vger.kernel.org>; Mon, 31 Jul 2023 14:57:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1690840643; x=1691445443;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=q7XDjhCYt7FGRw55Y+SxXkLDr9VBzRKTPxUQEL1DO0A=;
        b=0r14oa0yxeLPoDTcrUFQsdRmJ1MzKa5X6LsW73dNl1PU/OSY0zRi/GXEUUtRuunzke
         BEXFYTKK9dhr/btpqKk9/KxGb46VF7nLnK8mdvlEa2Vqw6gx1jzqrm22oIwqY9XYoVAB
         o6tMTCDy9zYK4CsNQNKSC8DRFIK6HeIcOJBJcWQcv4dx4BpPRccobsOEqeM2JlWM0c+x
         tRilDqJw0H63lLGsTpxmR4Bilf75D9M09hSNVeFdNixjCrNPPDkxBE6WoQW7XXZ0GnKM
         oLzZ0TTXsq0m1tiYsjmkycSmFXfux5P5Y7E/la2Cz24A5F+xCBn6/y1+P7bnaB9/Ug+S
         oKIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690840643; x=1691445443;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q7XDjhCYt7FGRw55Y+SxXkLDr9VBzRKTPxUQEL1DO0A=;
        b=d5S39EEzCpqEvdB3he4qPBvNMmuH3PpzekOf1WLMk75wHcID8KngK2MaRZbrW9EiBj
         j3bBFtTCW5iEDQV/5BC/4lnQtxKlZN78nuXDPlFT2lS8ffUPlEsQmiVR5oZrJnn2r9C1
         NRlfmU4iIf9nhkr54wStenr0P9IBST83+L6e+gYxd7bkM/Ew9p1vh+FnqAWYNjjmWLhb
         TP2LZKDlvkQNRDFh9mcLl1mIHNPNZTpWlXp6qOt1pbRsLFUNdKcCKHP5Y+nKnjZxlR91
         4T0Gklfiml+mfh3cCSAISIQj07d5LwFjVJ7gw/r72p8zfjCGjkRLxPsYvTu/5Rlm/Chm
         uObA==
X-Gm-Message-State: ABy/qLaKOI1XGJ2ZsWzT0bsVficNKl2B430X93s6/sgzGaqnZ70hBOLm
        HpCKcEc+ALrpOQADoPM7XOLC3yA9x3s=
X-Google-Smtp-Source: APBJJlEt1EFA1GYHjWvxsA4wpLnQLY4u9T6tmKWhLJwuz8A3I/H56oGiC/ODlllK4HuoyYxAZYF+nbSducE=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:903:2291:b0:1b5:2b14:5f2c with SMTP id
 b17-20020a170903229100b001b52b145f2cmr50366plh.4.1690840643199; Mon, 31 Jul
 2023 14:57:23 -0700 (PDT)
Date:   Mon, 31 Jul 2023 14:57:21 -0700
In-Reply-To: <20230722022251.3446223-1-rananta@google.com>
Mime-Version: 1.0
References: <20230722022251.3446223-1-rananta@google.com>
Message-ID: <ZMguQayWzKU3/8o5@google.com>
Subject: Re: [PATCH v7 00/12] KVM: arm64: Add support for FEAT_TLBIRANGE
From:   Sean Christopherson <seanjc@google.com>
To:     Raghavendra Rao Ananta <rananta@google.com>
Cc:     Oliver Upton <oliver.upton@linux.dev>,
        Marc Zyngier <maz@kernel.org>,
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

On Sat, Jul 22, 2023, Raghavendra Rao Ananta wrote:
>  arch/arm64/include/asm/kvm_asm.h     |   3 +
>  arch/arm64/include/asm/kvm_host.h    |   6 ++
>  arch/arm64/include/asm/kvm_pgtable.h |  10 +++
>  arch/arm64/include/asm/tlbflush.h    | 109 ++++++++++++++-------------
>  arch/arm64/kvm/Kconfig               |   1 -
>  arch/arm64/kvm/arm.c                 |   6 --
>  arch/arm64/kvm/hyp/nvhe/hyp-main.c   |  11 +++
>  arch/arm64/kvm/hyp/nvhe/tlb.c        |  30 ++++++++
>  arch/arm64/kvm/hyp/pgtable.c         |  90 +++++++++++++++++++---
>  arch/arm64/kvm/hyp/vhe/tlb.c         |  27 +++++++
>  arch/arm64/kvm/mmu.c                 |  15 +++-
>  arch/mips/include/asm/kvm_host.h     |   4 +-
>  arch/mips/kvm/mips.c                 |  12 +--
>  arch/riscv/kvm/mmu.c                 |   6 --
>  arch/x86/include/asm/kvm_host.h      |   7 +-
>  arch/x86/kvm/mmu/mmu.c               |  25 ++----
>  arch/x86/kvm/mmu/mmu_internal.h      |   3 -
>  arch/x86/kvm/x86.c                   |   2 +-
>  include/linux/kvm_host.h             |  20 +++--
>  virt/kvm/Kconfig                     |   3 -
>  virt/kvm/kvm_main.c                  |  35 +++++++--
>  21 files changed, 294 insertions(+), 131 deletions(-)

Unless I've missed something, nothing in this series conflicts with anything that's
on the horizon for x86, so feel free to take this through the ARM tree once we've
emerged from behind the bikeshed :-)
