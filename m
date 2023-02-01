Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9F17367A01C
	for <lists+linux-mips@lfdr.de>; Tue, 24 Jan 2023 18:26:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233149AbjAXR0i (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 24 Jan 2023 12:26:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232166AbjAXR0h (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 24 Jan 2023 12:26:37 -0500
X-Greylist: delayed 552 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 24 Jan 2023 09:26:33 PST
Received: from out-72.mta0.migadu.com (out-72.mta0.migadu.com [91.218.175.72])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BACFC4AA6E
        for <linux-mips@vger.kernel.org>; Tue, 24 Jan 2023 09:26:33 -0800 (PST)
Date:   Tue, 24 Jan 2023 17:17:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
        t=1674580638;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=KIEASO5qPs55lTPiWLXCZgFc1uWbFeBJE6bZJxvRUc0=;
        b=pHL003ov1XfnmIFlNayK1LaKatLGFuHSsS50iKWIk9FUm7eZ3+Hh4zvnZo0gD4kA+Ikrly
        jgan9mv2Uos5m1WyH5cRwTLVHswqpM8wNprQ67Jyt6Jw1juH3/vuLsyhSdzSnnXDYt8ofY
        ju2OUJ7yTEO4EIJpNHPVHxdHb1S591c=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From:   Oliver Upton <oliver.upton@linux.dev>
To:     David Matlack <dmatlack@google.com>
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
Subject: Re: [PATCH 2/7] KVM: arm64: Use kvm_arch_flush_remote_tlbs()
Message-ID: <Y9ASmOvJutgGLVnT@google.com>
References: <20230119173559.2517103-1-dmatlack@google.com>
 <20230119173559.2517103-3-dmatlack@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230119173559.2517103-3-dmatlack@google.com>
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi David,

On Thu, Jan 19, 2023 at 09:35:54AM -0800, David Matlack wrote:
> Use kvm_arch_flush_remote_tlbs() instead of
> CONFIG_HAVE_KVM_ARCH_TLB_FLUSH_ALL. The two mechanisms solve the same
> problem, allowing architecture-specific code to provide a non-IPI
> implementation of remote TLB flushing.
> 
> Dropping CONFIG_HAVE_KVM_ARCH_TLB_FLUSH_ALL allows KVM to standardize
> all architectures on kvm_arch_flush_remote_tlbs() instead of maintaining
> two mechanisms.
> 
> Opt to standardize on kvm_arch_flush_remote_tlbs() since it avoids
> duplicating the generic TLB stats across architectures that implement
> their own remote TLB flush.
> 
> This adds an extra function call to the ARM64 kvm_flush_remote_tlbs()
> path, but (I assume) that is a small cost in comparison to flushing
> remote TLBs.

A fair assumption indeed. The real pile up occurs on the DSB subsequent
to the TLBI.

> No functional change intended.
> 
> Signed-off-by: David Matlack <dmatlack@google.com>
> ---
>  arch/arm64/include/asm/kvm_host.h | 3 +++
>  arch/arm64/kvm/Kconfig            | 1 -
>  arch/arm64/kvm/mmu.c              | 6 +++---
>  virt/kvm/kvm_main.c               | 2 --
>  4 files changed, 6 insertions(+), 6 deletions(-)

I think you're missing the diff that actually drops the Kconfig opton
from virt/kvm/Kconfig.

--
Thanks,
Oliver
