Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C12061BF439
	for <lists+linux-mips@lfdr.de>; Thu, 30 Apr 2020 11:35:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726396AbgD3JfO (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 30 Apr 2020 05:35:14 -0400
Received: from mail-il1-f196.google.com ([209.85.166.196]:37678 "EHLO
        mail-il1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726378AbgD3JfN (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 30 Apr 2020 05:35:13 -0400
Received: by mail-il1-f196.google.com with SMTP id u189so699922ilc.4
        for <linux-mips@vger.kernel.org>; Thu, 30 Apr 2020 02:35:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XjmGWm636Bu0l8iEZ0HDvc+H+u/T90tXGBhLTfpYUzU=;
        b=IyAaDLvLLYChHZtHURejEQFv1YWK1r18vjMc4i+gR8VrZ2HwTZZ1WeKWfcvawg8haL
         Z62B8KkQRngACg6qOvpysJsRIB3W+5ax1InRGDWySOhFZiXqwyKKo1HbMRiFgody+SPh
         edTnP2hDv6bJHDv9rfZKLrze3EplaTUzqMRMMZTsbezie59+JSTrSBOvHpjFLcYGzY+T
         ViYjGB61C5RAZENcdnZX0cYkjF291pzwlgdqgA3wxa8xGas+0R8yQ1d/enLxdb8wNWSu
         aswQXQKLs280NBBsM1eezcwYzYyw7daFTgqJSzm37yTnVe8Q7a/TqDPJn59V6zLBPPE4
         OTjA==
X-Gm-Message-State: AGi0PuZnqjizl1do5J7gC79yKzbdIB07lJ5gKHCfKbiEPVPPG6ig3sHP
        UGezw/s3/eRdJPAxMmehuPrSkwulluhNIdngjeEafJmqdD8=
X-Google-Smtp-Source: APiQypL93EjdLF6M+etw8h0WiOacpdgG391os09Jn7zdkPsauWxJMyHLhmFeNDh+mYp1cUU+ATSvUNGWZt/CfgkiJmo=
X-Received: by 2002:a92:bad5:: with SMTP id t82mr985674ill.171.1588239312756;
 Thu, 30 Apr 2020 02:35:12 -0700 (PDT)
MIME-Version: 1.0
References: <1588145170-9451-1-git-send-email-chenhc@lemote.com>
 <20200429182231.GA21158@alpha.franken.de> <CAAhV-H6j9ktHZ2C2Psk6X+0jmh-L9GMgOmKM95x0iXHo0d7TqA@mail.gmail.com>
 <20200430081357.GA7626@alpha.franken.de>
In-Reply-To: <20200430081357.GA7626@alpha.franken.de>
From:   Huacai Chen <chenhc@lemote.com>
Date:   Thu, 30 Apr 2020 17:42:43 +0800
Message-ID: <CAAhV-H75EQ=Zd37qPe=VBwT-Z3Fu=_7W4TSG2v8TLpq03MRCdg@mail.gmail.com>
Subject: Re: [PATCH V2] MIPS: perf: Add hardware perf events support for new Loongson-3
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     "open list:MIPS" <linux-mips@vger.kernel.org>,
        Fuxin Zhang <zhangfx@lemote.com>,
        Zhangjin Wu <wuzhangjin@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi, Thomas,

On Thu, Apr 30, 2020 at 4:16 PM Thomas Bogendoerfer
<tsbogend@alpha.franken.de> wrote:
>
> On Thu, Apr 30, 2020 at 03:30:55PM +0800, Huacai Chen wrote:
> > Hi, Thomas,
> >
> > On Thu, Apr 30, 2020 at 2:33 AM Thomas Bogendoerfer
> > <tsbogend@alpha.franken.de> wrote:
> > >
> > > On Wed, Apr 29, 2020 at 03:26:10PM +0800, Huacai Chen wrote:
> > > > New Loongson-3 means Loongson-3A R2 (Loongson-3A2000) and newer CPUs.
> > > > Loongson-3 processors have three types of PMU types (so there are three
> > > > event maps): Loongson-3A1000/Loonngson-3B1000/Loongson-3B1500 is Type-1,
> > > > Loongson-3A2000/Loongson-3A3000 is Type-2, Loongson-3A4000+ is Type-3.
> > > >
> > > > Signed-off-by: Huacai Chen <chenhc@lemote.com>
> > > > ---
> > > >  .../asm/mach-loongson64/cpu-feature-overrides.h    |   1 +
> > > >  arch/mips/kernel/perf_event_mipsxx.c               | 358 +++++++++++++++++++--
> > >
> > > checkpatch warns about missing break/fallthrough statement and indention
> > > problems, could please look at this ? And as all the new code is only
> > > usefull for loongsoon CPUs could you try to only compile it in, if it's
> > > enabled for the image ?
> > OK, I will solve the "fallthrough" warnings and indention warnings.
> > But the other problem is I should use #ifdef CONFIG_CPU_LOONGSON64 to
> > guard all new code in this file? I remember that Paul Burton suggest
> > us to avoid use #ifdef and use runtime detection instead.
>
> if you do the cpu checks for current_cpu_type() == CPU_LOONGSON64
> the compiler will eliminate not needed cpu code. Looks like most
> of the new code is done inside case CPU_LOONGSON64 blocks, so
> that is fine. Could you check how much size increase you get for
> a non loongson64 target with your patch ?
I have build an IP28 kernel (ip28_defconfig+perf):

size of vmlinux with this perf patch: 10913440
size of vmlinux without this perf patch:10913296

readelf -a vmlinux with this perf patch:
  Type           Offset             VirtAddr           PhysAddr
                 FileSiz            MemSiz              Flags  Align
  LOAD           0x0000000000001000 0xa800000020004000 0xa800000020004000
                 0x0000000000800c0c 0x0000000000830dc0  RWE    0x1000
  NOTE           0x000000000070d020 0xa800000020710020 0xa800000020710020
                 0x000000000000003c 0x000000000000003c  R      0x4

readelf -a vmlinux without this perf patch:
  Type           Offset             VirtAddr           PhysAddr
                 FileSiz            MemSiz              Flags  Align
  LOAD           0x0000000000001000 0xa800000020004000 0xa800000020004000
                 0x0000000000800c0c 0x0000000000830dc0  RWE    0x1000
  NOTE           0x000000000070cff0 0xa80000002070fff0 0xa80000002070fff0
                 0x000000000000003c 0x000000000000003c  R      0x4

>
>
> Thomas.
>
> --
> Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
> good idea.                                                [ RFC1925, 2.3 ]
