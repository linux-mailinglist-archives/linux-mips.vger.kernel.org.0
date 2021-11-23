Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 278BF459EFE
	for <lists+linux-mips@lfdr.de>; Tue, 23 Nov 2021 10:12:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234700AbhKWJPn (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 23 Nov 2021 04:15:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233807AbhKWJPn (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 23 Nov 2021 04:15:43 -0500
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25621C061714
        for <linux-mips@vger.kernel.org>; Tue, 23 Nov 2021 01:12:35 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id n29so37659255wra.11
        for <linux-mips@vger.kernel.org>; Tue, 23 Nov 2021 01:12:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HYs1wzwF6+J9dSOANXB9y6loDw9qWfCXBI2HZhWySNA=;
        b=wltUiAygiHWsBEmc25AjNkPWeRE3z9px4T/cVrqarPBht3N5GOBcMj472TjSJxLh+F
         0GPEkZ82ElidOxCepsH3qkVpZpghdJFzn6w8QY0bBYX7GfBGAa5PebvvpwYx1AMsWy+/
         Hy0tXtM5hguM8ULFAxaSFY9L9pHflRmc5oBmZlGzdmDGxSVWLmJgoXyeLvirR3+EDdYc
         x6uL63V8O6CZSV6meLPQPSVnuq81aNx6LBTQbWdIxp70MyirIsOfKBJ+3yy5wRokBv7P
         ZHDdSS5XrKlSNk/fVqI4v77GmiM6rni3n8Pmp1gAXvY2q32B2g9mUwyOWVLBU2DWazev
         nV6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HYs1wzwF6+J9dSOANXB9y6loDw9qWfCXBI2HZhWySNA=;
        b=hre6MLXf2xtKG6q5lraPdgq8HgXs9RuFwi9QI+BEylMyAt7SjlROm7+5KNO3cdAZw+
         RZ6RvFEVa9NdV3rk+knWHLDSB5AtOO+ZY9htkKhKU3fHs0XXCHYQjdfsoBCxMib13Aty
         54dI0EpJgZIJ+uHWOlhgIpzR7EGOn1ORlCV1RRVvh4FtfBywgU04255aBh5J7jJ2FLfW
         5A1YTgJCw+/gQzBB3ISG16YXMb+28XxQ7BDq4Xt8FxbBqPNf2WPMOXGuxZoKREFmGwmD
         0uXlRUDMnnf2y531HCvOMlWNdnUu2HBOiuGzN0VlQ3BaVIQ68E/9AXQcwub91M5X/tKd
         zTpg==
X-Gm-Message-State: AOAM532ECfzkoTIx3Ktp7e8h9SU+rNrO25bhAPzCyR9Rp2wGum6MvZ9R
        AJzTFqp9P3+mGLQJxCWhh7ygotoBm7t/zugCZPexsw==
X-Google-Smtp-Source: ABdhPJw3107qjhtYHlg0VKfoxcrKNwhATIgpuvcrTNAjZTbcT3w/UYNbeW1BEW91PyajE9x5O252/D9Dk01cQ3/AShU=
X-Received: by 2002:a05:6000:1a45:: with SMTP id t5mr5400365wry.306.1637658753498;
 Tue, 23 Nov 2021 01:12:33 -0800 (PST)
MIME-Version: 1.0
References: <20211121125451.9489-1-dwmw2@infradead.org> <20211121125451.9489-6-dwmw2@infradead.org>
In-Reply-To: <20211121125451.9489-6-dwmw2@infradead.org>
From:   Anup Patel <anup@brainfault.org>
Date:   Tue, 23 Nov 2021 14:42:21 +0530
Message-ID: <CAAhSdy307DqNuQEFCu2ze2jXJ7taDE6y6SwY9nHGA8yNPfggiQ@mail.gmail.com>
Subject: Re: [PATCH v5 05/12] KVM: RISC-V: Use Makefile.kvm for common files
To:     David Woodhouse <dwmw2@infradead.org>
Cc:     Paolo Bonzini <pbonzini@redhat.com>, kvm <kvm@vger.kernel.org>,
        Boris Ostrovsky <boris.ostrovsky@oracle.com>,
        Joao Martins <joao.m.martins@oracle.com>,
        "jmattson @ google . com" <jmattson@google.com>,
        "wanpengli @ tencent . com" <wanpengli@tencent.com>,
        "seanjc @ google . com" <seanjc@google.com>,
        "vkuznets @ redhat . com" <vkuznets@redhat.com>,
        "mtosatti @ redhat . com" <mtosatti@redhat.com>,
        "joro @ 8bytes . org" <joro@8bytes.org>, karahmed@amazon.com,
        Marc Zyngier <maz@kernel.org>,
        James Morse <james.morse@arm.com>,
        Alexandru Elisei <alexandru.elisei@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Huacai Chen <chenhuacai@kernel.org>,
        Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Anup Patel <anup.patel@wdc.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        kvmarm@lists.cs.columbia.edu,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        kvm-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
        butt3rflyh4ck <butterflyhuangxx@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sun, Nov 21, 2021 at 6:25 PM David Woodhouse <dwmw2@infradead.org> wrote:
>
> From: David Woodhouse <dwmw@amazon.co.uk>
>
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>

Looks good to me.

For KVM RISC-V,
Acked-by: Anup Patel <anup.patel@wdc.com>
Reviewed-by: Anup Patel <anup.patel@wdc.com>

Thanks,
Anup

> ---
>  arch/riscv/kvm/Makefile | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
>
> diff --git a/arch/riscv/kvm/Makefile b/arch/riscv/kvm/Makefile
> index 30cdd1df0098..300590225348 100644
> --- a/arch/riscv/kvm/Makefile
> +++ b/arch/riscv/kvm/Makefile
> @@ -5,14 +5,10 @@
>
>  ccflags-y += -I $(srctree)/$(src)
>
> -KVM := ../../../virt/kvm
> +include $(srctree)/virt/kvm/Makefile.kvm
>
>  obj-$(CONFIG_KVM) += kvm.o
>
> -kvm-y += $(KVM)/kvm_main.o
> -kvm-y += $(KVM)/coalesced_mmio.o
> -kvm-y += $(KVM)/binary_stats.o
> -kvm-y += $(KVM)/eventfd.o
>  kvm-y += main.o
>  kvm-y += vm.o
>  kvm-y += vmid.o
> --
> 2.31.1
>
