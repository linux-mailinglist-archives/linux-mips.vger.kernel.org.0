Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 30F8E76A34E
	for <lists+linux-mips@lfdr.de>; Mon, 31 Jul 2023 23:50:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230266AbjGaVuM (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 31 Jul 2023 17:50:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229902AbjGaVuL (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 31 Jul 2023 17:50:11 -0400
Received: from mail-pj1-x1049.google.com (mail-pj1-x1049.google.com [IPv6:2607:f8b0:4864:20::1049])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38B49139
        for <linux-mips@vger.kernel.org>; Mon, 31 Jul 2023 14:50:10 -0700 (PDT)
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-268108bc0f9so4990809a91.1
        for <linux-mips@vger.kernel.org>; Mon, 31 Jul 2023 14:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1690840209; x=1691445009;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=R2QJFD2XHgTI1kJ5wD8vqBTFZZRvLtV3pZ4w1UH3Oa8=;
        b=tSLTmu+DLBufAzFzbicDIcqEm2TuolEf1DapzPi+gTM4FHXli52KWx81A5zuk/YCxr
         l/OlTy/M2QsL/+aaVuZ/hYb5nYSSERYjNp13FI8HYqXm9WQmG25RmZxIsRM/Z7zSspZU
         JeMXBEyXp4E2GhE+/oU7uxeo5vA7VEgDwo3z8s1TIqOjvBy9PB/UOIPUcDQqZ2yvrlDS
         tD1vLJn5szUm3mkfyZtKLdz/qI26XfZV9AjJ3HuKY1kp9JjckDUfZYJ6zw6f2Uc034NJ
         WHPzXkiGbDSZiEmxmUdXhZElFyFTVHyycIhHVC0+v52tpuADk55LDDgQL5cDUbXmgDrC
         Rygw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690840209; x=1691445009;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R2QJFD2XHgTI1kJ5wD8vqBTFZZRvLtV3pZ4w1UH3Oa8=;
        b=SBZ65/cjhNrtGZ2AIifVN/RZTZ+3XAhMqUSBmSb5ju5XuC63Lt49RD4eEK7cvn37Wf
         ajEnv5UKe0f3XY1UyA5MpchPsUKmToxYuLUcBmb4rpcd+5XbvkL8A3luICgyhV/a6DvN
         FmS8vSqHDxxw8aqrCS5XZ5bMSfCQUPHlOu6KE/ZV4XU5UQsXGJjQaKi6AeviUxuc9fJP
         LwBvZjnncvlE9D3tYNqMmezITc/uN+6EMPkou4E5zW54Bt0sEOWjHPbD4yRnO/HA1l3U
         hhdoM/t4R9NO8000QNbrmH2zTPgj51lExdDbR5qrerdT28Gw7li5gQDm/YXO6vgHK/Zo
         z4uQ==
X-Gm-Message-State: ABy/qLZ6LGEbD4pYJP3UiOmcfQvkZazIgks6oOMSOocc0OoKvkbjgBU1
        UEykP3/Sm5kXI47e/NPPI4NLkdNrDjc=
X-Google-Smtp-Source: APBJJlHF5b1qBy7lIC09fHisk5z7a6GWyFDId8WOrl6w4SB5XD3HwWcrOpZcO/fkStMRmvg1ofrSPaEq5SU=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:f68b:b0:1b8:a552:c8c9 with SMTP id
 l11-20020a170902f68b00b001b8a552c8c9mr47142plg.13.1690840209652; Mon, 31 Jul
 2023 14:50:09 -0700 (PDT)
Date:   Mon, 31 Jul 2023 14:50:07 -0700
In-Reply-To: <87tttpr6qy.wl-maz@kernel.org>
Mime-Version: 1.0
References: <20230722022251.3446223-1-rananta@google.com> <20230722022251.3446223-3-rananta@google.com>
 <87tttpr6qy.wl-maz@kernel.org>
Message-ID: <ZMgsjx8dwKd4xBGe@google.com>
Subject: Re: [PATCH v7 02/12] KVM: arm64: Use kvm_arch_flush_remote_tlbs()
From:   Sean Christopherson <seanjc@google.com>
To:     Marc Zyngier <maz@kernel.org>
Cc:     Raghavendra Rao Ananta <rananta@google.com>,
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
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Jul 27, 2023, Marc Zyngier wrote:
> On Sat, 22 Jul 2023 03:22:41 +0100,
> Raghavendra Rao Ananta <rananta@google.com> wrote:
> > 
> > Stop depending on CONFIG_HAVE_KVM_ARCH_TLB_FLUSH_ALL and opt to
> > standardize on kvm_arch_flush_remote_tlbs() since it avoids
> > duplicating the generic TLB stats across architectures that implement
> > their own remote TLB flush.
> > 
> > This adds an extra function call to the ARM64 kvm_flush_remote_tlbs()
> > path, but that is a small cost in comparison to flushing remote TLBs.
> 
> Well, there is no such thing as a "remote TLB" anyway. We either have
> a non-shareable or inner-shareable invalidation. The notion of remote
> would imply that we track who potentially has a TLB, which we
> obviously don't.

Maybe kvm_arch_flush_vm_tlbs()?  The "remote" part is misleading even on x86 when
running on Hyper-V, as the flush may be done via a single hypercall and by kicking
"remote" vCPUs.
