Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65991230201
	for <lists+linux-mips@lfdr.de>; Tue, 28 Jul 2020 07:48:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726816AbgG1FsG (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 28 Jul 2020 01:48:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726536AbgG1FsF (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 28 Jul 2020 01:48:05 -0400
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com [IPv6:2607:f8b0:4864:20::d42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 900FAC061794
        for <linux-mips@vger.kernel.org>; Mon, 27 Jul 2020 22:48:05 -0700 (PDT)
Received: by mail-io1-xd42.google.com with SMTP id s189so12269897iod.2
        for <linux-mips@vger.kernel.org>; Mon, 27 Jul 2020 22:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WQ0pC1DQThoK/AZiEC7D32glHuxBBVPldWJH00eCB2g=;
        b=KWxDdEqtW1WLmhMNUYPqaKrwoMVmd7TRu5rWyGAITco0Mu8PWQF7X8D95xkT7Wxgvc
         S5x5yxz+rF7DlM+n6jBF5RiqVx//5D+pkybJQFtbP2nrsudSycrqWVO/T0hhnk7BGFZy
         sOmT9zoDDHXptCT84dwjpNCpvDYlqpnlySw4yZJZ6ZCP3GJMn6jM7lL9oN2KBYBxI6rO
         qJSDlJ4L9AU8eWoBehDpA/6rvYev8cDUi2aqTCJR7JkqeytKIlk0A1TkrEUaJzZC4lZI
         ZxNRQn+if0q/QJ2+Tdzm62BqHCzk+osYj/gWHXLUXnVtSNoQ09NYKPmu+0uLZ9hRHP9B
         12Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WQ0pC1DQThoK/AZiEC7D32glHuxBBVPldWJH00eCB2g=;
        b=VV/aKbmDD89DBP0o5rGFrH3mAsnRUker32ngIAggpNEDJGfHA4/S8mIdFKQKUvcUd1
         Tg3LiQ3TCqeqtA2KMilsSBU4lG4lQsR4JaofZXy+Aky6AIqECyyT3d9Zqx2zdHlafP1l
         MBW+5VOfn4LS9uwuS5QCvdCdpkNf0xJywXDQ4WVGs+anrtNgOBGmwoCJTAv6+kzYT3Ut
         SIPd5IE1P5EXtq2IGyxRIWTVYAwGTHp/GDNTKIoiHEpfvBkK2wMRkWIMguV7bm8I1P6N
         rUOGGTtBgO4yh/M78YIc7f5NBLN2fNZR3IsZQPZRR3GW6lNayVUnRDoZBw2fod0qt2tO
         CO/A==
X-Gm-Message-State: AOAM530Fqt7e30QJQAXTuxBT2PJi+25LKRVgvL149mucaYThSfopbcWf
        ocvqqKzr9k6T/qgizn/1BE5VOOESqepUktMm3rF8H+xkyUE1Sw==
X-Google-Smtp-Source: ABdhPJwjeynbbY/9wynObx+xTE8bMjUQ+MUy97l4XZjM4Xbos5FNBXeLlFT6BsplAOGYsHIf+EO03aGF36few6JgHI0=
X-Received: by 2002:a6b:ce11:: with SMTP id p17mr27558240iob.125.1595915284996;
 Mon, 27 Jul 2020 22:48:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200727165108.2378227-1-git@xen0n.name>
In-Reply-To: <20200727165108.2378227-1-git@xen0n.name>
From:   Huacai Chen <chenhuacai@gmail.com>
Date:   Tue, 28 Jul 2020 13:47:53 +0800
Message-ID: <CAAhV-H50C1hYLTqk5CEaO+gg3H0ih2Af7Sv8aEzk6WFeKsn2ig@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] Refactor FTLBPar exception handling and add GSExc handler
To:     WANG Xuerui <git@xen0n.name>
Cc:     "open list:MIPS" <linux-mips@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

For the whole series:

Reviewed-by: Huacai Chen <chenhc@lemote.com>

On Tue, Jul 28, 2020 at 2:53 AM WANG Xuerui <git@xen0n.name> wrote:
>
> It was found that some undocumented unprivileged instructions could
> crash the kernel with a "FTLB parity error" on Loongson-3A4000, but the
> error registers were garbage:
>
> [  896.970419] FTLB error exception, cp0_ecc=0x00000002:
> [  896.975446] cp0_errorepc == ffffffffffffffff
> [  896.979755] c0_cacheerr == 00000000
> [  896.983277] Decoded c0_cacheerr: primary cache fault in insn reference.
> [  896.989963] Cache error exception:
> [  896.993396] cp0_errorepc == ffffffffffffffff
> [  896.997707] c0_cacheerr == 00000000
> [  897.001228] Decoded c0_cacheerr: primary cache fault in insn reference.
> [  897.007916] Error bits:
> [  897.010467] IDX: 0x00000000
> [  897.013284] Kernel panic - not syncing: Can't handle the cache error!
> [  897.019807] ---[ end Kernel panic - not syncing: Can't handle the cache error! ]---
>
> Turns out the FTLBPar exception code is actually implementation-specific.
> On Loongson cores the exception is "GSExc" instead, and is non-fatal in
> Loongson's linux-3.10 fork. So we dynamically register the correct handler
> for the exception, and do not panic on the specific undocumented case.
>
> P.S. There is not much space left in the cpuinfo_mips.options flag. We
> should consider moving to something like x86's feature flags that is
> extensible.
>
> v3:
> - Simplified declaration of cpu_has_gsexcex, as suggested by Huacai
>
> v2:
> - Removed stray GSExc logic in cpu_probe_legacy, pointed out by Huacai
>
> WANG Xuerui (3):
>   MIPS: only register FTLBPar exception handler for supported models
>   MIPS: add definitions for Loongson-specific CP0.Diag1 register
>   MIPS: handle Loongson-specific GSExc exception
>
>  arch/mips/include/asm/cpu-features.h |  8 ++++++
>  arch/mips/include/asm/cpu.h          |  2 ++
>  arch/mips/include/asm/mipsregs.h     | 11 ++++++++
>  arch/mips/kernel/cpu-probe.c         | 16 ++++++++++++
>  arch/mips/kernel/genex.S             |  7 +++++
>  arch/mips/kernel/traps.c             | 38 +++++++++++++++++++++++++++-
>  6 files changed, 81 insertions(+), 1 deletion(-)
>
> --
> 2.25.1
>
