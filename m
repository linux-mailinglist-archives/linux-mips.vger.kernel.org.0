Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F21841E7914
	for <lists+linux-mips@lfdr.de>; Fri, 29 May 2020 11:12:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725821AbgE2JMh (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 29 May 2020 05:12:37 -0400
Received: from mail-il1-f196.google.com ([209.85.166.196]:45466 "EHLO
        mail-il1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725808AbgE2JMg (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 29 May 2020 05:12:36 -0400
Received: by mail-il1-f196.google.com with SMTP id 9so1701588ilg.12
        for <linux-mips@vger.kernel.org>; Fri, 29 May 2020 02:12:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vRBzDSriHT1QTUhm3erXkZiigU2pqgu1Mq9NhhwlJH0=;
        b=hh7G7R+OslK349qSLVGE8EnoKdT2YEI/sNECGXZ5SSt+/BJUnHD6NSsCJVoVaZkLoC
         79clwi31+aJvYykQoGhKluI53R4a2BPvBXa08vAk5GVrjtEuv4SXX7pokcgKQAI12/vu
         za7c+rNBJYr7v6n7zcGibqeyRmWXIYiOx3K/z4yPhqjR//mWqRR1TPiiMf9/wDLSTZBz
         ejb5QWa2XhMQhk3EueCZixhU8FLuxVTVaUv9IvqrbKbC4TAaFopPdfC1G5hwZkXortXP
         Ci5jBdZKw1OUya6fHuVtW6HHFWWFrPbDX4AqOSGa5tp6xZi0S2BY2LSzXA4LzJmU7UBB
         2dGA==
X-Gm-Message-State: AOAM531NMjEeyM1Wkt5aOm4xkIkLuhsJ72h+5856eN/1UMv6Su+rg9R2
        CsMaReiFLMvPWW6F2QPd6Ae/Q5NIi3/ESNvllRE=
X-Google-Smtp-Source: ABdhPJzMG0wm93NcaCb61RL2w7UkoR9ua4srlfJnuxw70+qe2JDHeybOPrYfd2FB83z0wBqh7P4SjySROehKNV0U06c=
X-Received: by 2002:a92:9f12:: with SMTP id u18mr6571865ili.287.1590743555977;
 Fri, 29 May 2020 02:12:35 -0700 (PDT)
MIME-Version: 1.0
References: <1590740530-15649-1-git-send-email-chenhc@lemote.com> <d649c2a7-13b0-014b-8043-f3fdfbc72fa9@xen0n.name>
In-Reply-To: <d649c2a7-13b0-014b-8043-f3fdfbc72fa9@xen0n.name>
From:   Huacai Chen <chenhc@lemote.com>
Date:   Fri, 29 May 2020 17:12:24 +0800
Message-ID: <CAAhV-H6YVTfGi_Vz92sb0EF0jRCqFkzzN1HN2spCWt8ZRF53XQ@mail.gmail.com>
Subject: Re: [PATCH] MIPS: Fix build warning about "PTR_STR" redefinition
To:     WANG Xuerui <kernel@xen0n.name>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        Fuxin Zhang <zhangfx@lemote.com>,
        Zhangjin Wu <wuzhangjin@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        "Maciej W . Rozycki" <macro@linux-mips.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

I'm sorry I forgot that, should I send V2?

Huacai

On Fri, May 29, 2020 at 4:34 PM WANG Xuerui <kernel@xen0n.name> wrote:
>
> Hi Huacai,
>
>
> On 2020/5/29 16:22, Huacai Chen wrote:
>
> > PTR_STR is redefined when CONFIG_TEST_PRINTF is set. This causes the
> > following build warning:
> >
> >    CC      lib/test_printf.o
> > lib/test_printf.c:214:0: warning: "PTR_STR" redefined
> >   #define PTR_STR "ffff0123456789ab"
> >   ^
> > In file included from ./arch/mips/include/asm/dsemul.h:11:0,
> >                   from ./arch/mips/include/asm/processor.h:22,
> >                   from ./arch/mips/include/asm/thread_info.h:16,
> >                   from ./include/linux/thread_info.h:38,
> >                   from ./include/asm-generic/preempt.h:5,
> >                   from ./arch/mips/include/generated/asm/preempt.h:1,
> >                   from ./include/linux/preempt.h:78,
> >                   from ./include/linux/spinlock.h:51,
> >                   from ./include/linux/seqlock.h:36,
> >                   from ./include/linux/time.h:6,
> >                   from ./include/linux/stat.h:19,
> >                   from ./include/linux/module.h:13,
> >                   from lib/test_printf.c:10:
> > ./arch/mips/include/asm/inst.h:20:0: note: this is the location of the previous definition
> >   #define PTR_STR  ".dword"
> >   ^
> >
> > Instead of renaming PTR_STR again and again, it is better to move the
> > unaligned load/store helpers from inst.h to unaligned.h, suggested by
> > Maciej W. Rozycki.
>
> I don't have time to review the implementation at the moment, but you
> can use the Suggested-by tag to mention Maciej in a structured way.
>
> >
> > Fixes: e701656ec4db ("MIPS: inst.h: Stop including asm.h to avoid various build failures")
> > Cc: Maciej W. Rozycki" <macro@linux-mips.org>
> > Reported-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> > Signed-off-by: Huacai Chen <chenhc@lemote.com>
> > ---
> >   arch/mips/include/asm/inst.h      | 779 ------------------------------------
> >   arch/mips/include/asm/unaligned.h | 802 ++++++++++++++++++++++++++++++++++++++
> >   arch/mips/kernel/unaligned.c      |   1 +
> >   arch/mips/loongson64/cop2-ex.c    |   1 +
> >   4 files changed, 804 insertions(+), 779 deletions(-)
> >   create mode 100644 arch/mips/include/asm/unaligned.h
