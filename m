Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E0CF379749
	for <lists+linux-mips@lfdr.de>; Mon, 10 May 2021 20:57:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232555AbhEJS6y (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 10 May 2021 14:58:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232744AbhEJS6w (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 10 May 2021 14:58:52 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3584C061574
        for <linux-mips@vger.kernel.org>; Mon, 10 May 2021 11:57:46 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id o16so22116988ljp.3
        for <linux-mips@vger.kernel.org>; Mon, 10 May 2021 11:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=aKEUOJuhx+R5Q4bhRWHxVLgdxk0QGSuqQVlbf8MB+7c=;
        b=JDBZzQIPoejn3/d+QtGZzD28RdIw8C64WhVvR1t8Mm8NPesB5GQbV+6X8MAPg8d2iz
         7mjSfAUxoe5GoA1u5eFD81uYYLAp2URnyUCGrbNDYHVp38j8bGebnRhp+yuSIhca96TB
         Idw999gL4TQKkak+v8eW//N13DSw/7q+BBPaOMR33bGqZCv8T374sU+F3cL1EEa60D/a
         NLbUr3Kya2ani4/px1deJxMu9aWX7EaHN+n0Wv5F28jq3z25xhcOIgfkMVM1CulHeisB
         6W1yTMA8cSJ+3dwvBwd7q8xAXNwv+Nbrjofd7n08PFX4O78UvKYNZsu4A6MXr68Q2VUW
         k9Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=aKEUOJuhx+R5Q4bhRWHxVLgdxk0QGSuqQVlbf8MB+7c=;
        b=rTx0+AY3iHgKZUGHGhPAAFnz1xRpieOsSeiCD1kEA5gf6K4IrxDRtBWO0yHXabcPoq
         2w8tdIuDqmQKNTCrLS0vlfOVgDsybLqiVAmRPgqw38anb6T0FUZbEIue+vZm3Rh9weTi
         O5e3AVxAV/qxrju6sa8yY6iWxQfAH4wZyUH+cfdT09BJZiyBiUX078CEd4mHXRm4ZaHx
         Sqg+/vF/8weTSxXW6pgm2RwCqKFrJ7z2DzyVnBdLucgKXqD7yOhC9nj2qwIa/qxVlTj0
         NcI6/XPekzxj0Eo6Q/mkEibeJOJW94NWx22bPd9oTOUuKOQXGApuWI7Vjp8aJkS3q+GQ
         b+CA==
X-Gm-Message-State: AOAM5311fVKdSKFHGyceRNBUMIcltj8H4DyC4pWFwwjl45aODiYhp4kR
        XJwA0f00cg9OIRycvCmPtRcNlwAN5HZBxovkGAifAA==
X-Google-Smtp-Source: ABdhPJwlSFI8JRzL4BW3Gmg9WHqzIaE0tnEyTDmQy+u1k5R9ZHhhfpXgcqsFOBszyUlQhiyVUC1Rjjrmtnj+bLyjTHs=
X-Received: by 2002:a2e:591:: with SMTP id 139mr14109105ljf.207.1620673065009;
 Mon, 10 May 2021 11:57:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210429203740.1935629-1-jingzhangos@google.com>
In-Reply-To: <20210429203740.1935629-1-jingzhangos@google.com>
From:   Jing Zhang <jingzhangos@google.com>
Date:   Mon, 10 May 2021 13:57:33 -0500
Message-ID: <CAAdAUtgW0vYmr5rqiMJKbZSjgEtLQqxfHd8H0fxrTbE0o4zmWw@mail.gmail.com>
Subject: Re: [PATCH v4 0/4] KVM statistics data fd-based binary interface
To:     KVM <kvm@vger.kernel.org>, KVMARM <kvmarm@lists.cs.columbia.edu>,
        LinuxMIPS <linux-mips@vger.kernel.org>,
        KVMPPC <kvm-ppc@vger.kernel.org>,
        LinuxS390 <linux-s390@vger.kernel.org>,
        Linuxkselftest <linux-kselftest@vger.kernel.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Marc Zyngier <maz@kernel.org>,
        James Morse <james.morse@arm.com>,
        Julien Thierry <julien.thierry.kdev@gmail.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Will Deacon <will@kernel.org>,
        Huacai Chen <chenhuacai@kernel.org>,
        Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Mackerras <paulus@ozlabs.org>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Janosch Frank <frankja@linux.ibm.com>,
        David Hildenbrand <david@redhat.com>,
        Cornelia Huck <cohuck@redhat.com>,
        Claudio Imbrenda <imbrenda@linux.ibm.com>,
        Sean Christopherson <seanjc@google.com>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Jim Mattson <jmattson@google.com>,
        Peter Shier <pshier@google.com>,
        Oliver Upton <oupton@google.com>,
        David Rientjes <rientjes@google.com>,
        Emanuele Giuseppe Esposito <eesposit@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Paolo,

On Thu, Apr 29, 2021 at 3:37 PM Jing Zhang <jingzhangos@google.com> wrote:
>
> This patchset provides a file descriptor for every VM and VCPU to read
> KVM statistics data in binary format.
> It is meant to provide a lightweight, flexible, scalable and efficient
> lock-free solution for user space telemetry applications to pull the
> statistics data periodically for large scale systems. The pulling
> frequency could be as high as a few times per second.
> In this patchset, every statistics data are treated to have some
> attributes as below:
>   * architecture dependent or common
>   * VM statistics data or VCPU statistics data
>   * type: cumulative, instantaneous,
>   * unit: none for simple counter, nanosecond, microsecond,
>     millisecond, second, Byte, KiByte, MiByte, GiByte. Clock Cycles
> Since no lock/synchronization is used, the consistency between all
> the statistics data is not guaranteed. That means not all statistics
> data are read out at the exact same time, since the statistics date
> are still being updated by KVM subsystems while they are read out.
>
> ---
>
> * v3 -> v4
>   - Rebase to kvm/queue, commit 9f242010c3b4 ("KVM: avoid "deadlock"
>     between install_new_memslots and MMU notifier")
>   - Use C-stype comments in the whole patch
>   - Fix wrong count for x86 VCPU stats descriptors
>   - Fix KVM stats data size counting and validity check in selftest
>
> * v2 -> v3
>   - Rebase to kvm/queue, commit edf408f5257b ("KVM: avoid "deadlock"
>     between install_new_memslots and MMU notifier")
>   - Resolve some nitpicks about format
>
> * v1 -> v2
>   - Use ARRAY_SIZE to count the number of stats descriptors
>   - Fix missing `size` field initialization in macro STATS_DESC
>
> [1] https://lore.kernel.org/kvm/20210402224359.2297157-1-jingzhangos@google.com
> [2] https://lore.kernel.org/kvm/20210415151741.1607806-1-jingzhangos@google.com
> [3] https://lore.kernel.org/kvm/20210423181727.596466-1-jingzhangos@google.com
>
> ---
>
> Jing Zhang (4):
>   KVM: stats: Separate common stats from architecture specific ones
>   KVM: stats: Add fd-based API to read binary stats data
>   KVM: stats: Add documentation for statistics data binary interface
>   KVM: selftests: Add selftest for KVM statistics data binary interface
>
>  Documentation/virt/kvm/api.rst                | 171 ++++++++
>  arch/arm64/include/asm/kvm_host.h             |   9 +-
>  arch/arm64/kvm/guest.c                        |  42 +-
>  arch/mips/include/asm/kvm_host.h              |   9 +-
>  arch/mips/kvm/mips.c                          |  67 ++-
>  arch/powerpc/include/asm/kvm_host.h           |   9 +-
>  arch/powerpc/kvm/book3s.c                     |  68 +++-
>  arch/powerpc/kvm/book3s_hv.c                  |  12 +-
>  arch/powerpc/kvm/book3s_pr.c                  |   2 +-
>  arch/powerpc/kvm/book3s_pr_papr.c             |   2 +-
>  arch/powerpc/kvm/booke.c                      |  63 ++-
>  arch/s390/include/asm/kvm_host.h              |   9 +-
>  arch/s390/kvm/kvm-s390.c                      | 133 +++++-
>  arch/x86/include/asm/kvm_host.h               |   9 +-
>  arch/x86/kvm/x86.c                            |  71 +++-
>  include/linux/kvm_host.h                      | 132 +++++-
>  include/linux/kvm_types.h                     |  12 +
>  include/uapi/linux/kvm.h                      |  50 +++
>  tools/testing/selftests/kvm/.gitignore        |   1 +
>  tools/testing/selftests/kvm/Makefile          |   3 +
>  .../testing/selftests/kvm/include/kvm_util.h  |   3 +
>  .../selftests/kvm/kvm_bin_form_stats.c        | 380 ++++++++++++++++++
>  tools/testing/selftests/kvm/lib/kvm_util.c    |  11 +
>  virt/kvm/kvm_main.c                           | 237 ++++++++++-
>  24 files changed, 1415 insertions(+), 90 deletions(-)
>  create mode 100644 tools/testing/selftests/kvm/kvm_bin_form_stats.c
>
>
> base-commit: 9f242010c3b46e63bc62f08fff42cef992d3801b
> --
> 2.31.1.527.g47e6f16901-goog
>

Do I need to send another version for this?

Thanks,
Jing
