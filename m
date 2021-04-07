Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F30813573DC
	for <lists+linux-mips@lfdr.de>; Wed,  7 Apr 2021 20:03:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355079AbhDGSDt (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 7 Apr 2021 14:03:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348379AbhDGSDt (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 7 Apr 2021 14:03:49 -0400
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com [IPv6:2607:f8b0:4864:20::732])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D53BBC06175F
        for <linux-mips@vger.kernel.org>; Wed,  7 Apr 2021 11:03:38 -0700 (PDT)
Received: by mail-qk1-x732.google.com with SMTP id z10so19611111qkz.13
        for <linux-mips@vger.kernel.org>; Wed, 07 Apr 2021 11:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=anyfinetworks-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=E7qDMlp+Kl/2efqWyQjBtNVcWaQNFkD10uOmOaV4wnE=;
        b=mL142lxWpoGMt964mBfjH4VySqk9D6qhno904fW/+gYuc3HxhrTbQ/O4WQ4z45TRfe
         mUHzLT5lWe4GfI662zmx9rXLSVkvi8ompkef92+FpEizuTDQkHnvRG2wcYaWYpNvufqh
         ndE54pno9X8hooDGcUIXOR2aiCxml8ecT3TJNlzqBQXW8PVRbESlVLcVkAYj8HOejDXA
         4J4vDFG9vN2socf30kP/mI40eQYABWVacgWEOyptx/6U8udoAwfo8WUBXzHexyWIXj1U
         PCqIrRn8HK8LR2A5iyVW5Wgsp7KCoSWIpeUT6gXMn2pgAMzpaHWb7Qr0C0iYN0IpQbHQ
         SPqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=E7qDMlp+Kl/2efqWyQjBtNVcWaQNFkD10uOmOaV4wnE=;
        b=rQLT4pKqvInum8rpIaz4ZL0F30Nk28gdLWvt2ShrsxejhhP5E7WCvLPQoQbx9aLG4V
         QBBPlbU87Mv/uSXfpZqX7i1xr9UZb9pQVSi2d4gdg4x8umvO062q6vWJK7OCFnh+r4HT
         VDvFko+Kk/N9LOrmehFjKNh8E/mYzGBKADX2B19XtoTVLx0z5vLwDhWIoCJsoYizvmq9
         +aanBmkLvPIF5aUmlc5/m21szm25LxiLV7A7QKvhDkrPMwsTrT1Ltj4H92Aak6sg8Hje
         bl+CYiODn3iLRBQ9tYUSys/qGIglnzxVDb9c5SDHm7bzV7IkiAvLAx2b2YXHZamwi4ep
         /5dg==
X-Gm-Message-State: AOAM530afWKa+Kcjyvm00DZpXr6frOuYuPYF9t1vr7QmULDWWsuoDXS4
        M7HJx73ra9P48LwwLkyqj1WMiuDVoDGZxaf0WDe7/5KOV+ujoFoayU4=
X-Google-Smtp-Source: ABdhPJwn25Jc8C3JYO4/UNzNVsqh3MCm9Xt+iGUkLnK9jQWIA3c1T02aJCSbEUYhRqF1xPB8WtlsLLsoAGURwqCbVws=
X-Received: by 2002:a37:6592:: with SMTP id z140mr4508154qkb.464.1617818618120;
 Wed, 07 Apr 2021 11:03:38 -0700 (PDT)
MIME-Version: 1.0
From:   Johan Almbladh <johan.almbladh@anyfinetworks.com>
Date:   Wed, 7 Apr 2021 20:03:26 +0200
Message-ID: <CAM1=_QQK3two9faxKbiw+73TiRZA=y2Upxcmv_Eaeu2uKd-oCQ@mail.gmail.com>
Subject: Completing eBPF JIT support for MIPS32
To:     linux-mips@vger.kernel.org
Cc:     paulburton@kernel.org, itugrok@yahoo.com, daniel@iogearbox.net,
        bpf@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The MIPS64 architecture has had an eBPF JIT for quite some time, but
the kernel still lacks eBPF JIT support for MIPS32. In 2019 there was
an effort extend the MIPS64 JIT to also support 32-bit MIPS ISAs,
716850ab104d ("MIPS: eBPF: Initial eBPF support for MIPS32
architecture."), but the work was never completed. What would be
needed to bring eBPF JIT support to MIPS32?

According to Paul Burton, 36366e367ee9 ("MIPS: BPF: Restore MIPS32 cBPF JIT")

> The eBPF JIT has a number of problems on MIPS32:
>
> - Most notably various code paths still result in emission of MIPS64
>   instructions which will cause reserved instruction exceptions & kernel
>   panics when run on MIPS32 CPUs.
>
> - The eBPF JIT doesn't account for differences between the O32 ABI used
>   by MIPS32 kernels versus the N64 ABI used by MIPS64 kernels. Notably
>   arguments beyond the first 4 are passed on the stack in O32, and this
>   is entirely unhandled when JITing a BPF_CALL instruction. Stack space
>   must be reserved for arguments even if they all fit in registers, and
>   the callee is free to assume that stack space has been reserved for
>   its use - with the eBPF JIT this is not the case, so calling any
>   function can result in clobbering values on the stack & unpredictable
>   behaviour. Function arguments in eBPF are always 64-bit values which
>   is also entirely unhandled - the JIT still uses a single (32-bit)
>   register per argument. As a result all function arguments are always
>   passed incorrectly when JITing a BPF_CALL instruction, leading to
>   kernel crashes or strange behavior.
>
> - The JIT attempts to bail our on use of ALU64 instructions or 64-bit
>   memory access instructions. The code doing this at the start of
>   build_one_insn() incorrectly checks whether BPF_OP() equals BPF_DW,
>   when it should really be checking BPF_SIZE() & only doing so when
>   BPF_CLASS() is one of BPF_{LD,LDX,ST,STX}. This results in false
>   positives that cause more bailouts than intended, and that in turns
>   hides some of the problems described above.
>
> - The kernel's cBPF->eBPF translation makes heavy use of 64-bit eBPF
>   instructions that the MIPS32 eBPF JIT bails out on, leading to most
>   cBPF programs not being JITed at all.

I can see two different ways to proceed from here.

1) Continue the work on the 64-bit eBPF JIT and complete the MIPS32
support there.

2) Use the 32-bit cBPF JIT as a fresh start for a new 32-bit eBPF JIT
implementation.

It depends of course on how much effort it would be to fix the
remaining issues with the current eBPF JIT. On the other hand, since
eBPF is a 64-bit architecture I would expect the bytecode to translate
nicely to a 64-bit target, and that a 32-bit JIT might differ a lot.
For other targets there are often separate 64-bit and 32-bit JIT
implementations. I also think the JIT support for MIPS32 should make
it possible to replace the cBPF JIT. That means it cannot fall back to
use the interpreter as I understand the current (32-bit)
implementation does to a large extent. Perhaps it would then be
cleaner to let the 32-bit version be separate implementation.

Any thoughts and suggestions? What do you think would be the best way forward?

Thanks,
Johan
