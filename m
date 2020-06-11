Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D999E1F6118
	for <lists+linux-mips@lfdr.de>; Thu, 11 Jun 2020 06:54:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725799AbgFKEya convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Thu, 11 Jun 2020 00:54:30 -0400
Received: from mail-qk1-f194.google.com ([209.85.222.194]:42310 "EHLO
        mail-qk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725782AbgFKEya (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 11 Jun 2020 00:54:30 -0400
Received: by mail-qk1-f194.google.com with SMTP id l17so4453686qki.9
        for <linux-mips@vger.kernel.org>; Wed, 10 Jun 2020 21:54:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=JOTpogiQZ3qH8WA8V9O5kAZ+rRJ4JnbAw1qwXw6An2M=;
        b=dnxgcCFzX1S8QhRxJtekmnbIFw6LFDe6PB/vE3z90QDSwi/vzda+6MQfoC6RUdvTEr
         dt90PKBdVPf29GjdbZRDmQ5FSyDcLzSOuh6/R8hZMT1xWtv4B+AcKTsQ1mS7IqNkAsYV
         AAU7up2aRclZg3a9jPpfrY0rlOojfLzMWffYmWVxmUEtAYAALCafevaNiPbULxN1Is0X
         ParZs6KEPNHSa0RnHDY9rGts/1Cr43V9PQbioF9DwaCsvyouTxMK4WBJmfprq8xBRkja
         5mEN+42sTKljQ8/uIr69fyozNMYNl1hrEv5LVkChoknoO+0+K1r7wd8EnqfVBvFYVsyd
         OFMw==
X-Gm-Message-State: AOAM533NceGUAqidn9rmOE7eoZVCj3NnAN1d97p5HwhlPDF4xJJ0deSK
        t3C78i1a4LDnJbjipdIq83OvSrP0Q/Q+iDs5arrvP+5zW4g=
X-Google-Smtp-Source: ABdhPJxiKQ92Yockp7orzBj+khMA46ggqysYKlRUWlfgS04BdNz0w0ShJZ8Qid9wUJBDti1cMqtDyEOvb3MMdopPrCg=
X-Received: by 2002:a37:a8b:: with SMTP id 133mr6429012qkk.134.1591851268783;
 Wed, 10 Jun 2020 21:54:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200528231628.120171-1-syq@debian.org> <20200529110913.GA11310@alpha.franken.de>
 <CAKcpw6VkZBtiewrczgT1YS6C1KWf5WnWGf2vZRg+-k24yOD3_Q@mail.gmail.com> <alpine.LFD.2.21.2006040038360.9519@redsun52.ssa.fujisawa.hgst.com>
In-Reply-To: <alpine.LFD.2.21.2006040038360.9519@redsun52.ssa.fujisawa.hgst.com>
From:   YunQiang Su <syq@debian.org>
Date:   Thu, 11 Jun 2020 12:54:17 +0800
Message-ID: <CAKcpw6WsTR=hu6O1jgRNQC2hGJyXbA6qwQShz=dCrnZJsSQNKw@mail.gmail.com>
Subject: Re: [PATCH] mips: add o32_fp64 boot param to disable FP64 support
To:     "Maciej W. Rozycki" <macro@wdc.com>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips <linux-mips@vger.kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>,
        "Maciej W. Rozycki" <macro@linux-mips.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Maciej W. Rozycki <macro@wdc.com> 于2020年6月4日周四 上午8:19写道：
>
> On Fri, 29 May 2020, YunQiang Su wrote:
>
> > > > When build with CONFIG_O32_FP64_SUPPORTS, even all of the userland
> > > > is FPXX, we cannot run any FP32 binary.
> > >
> > > I don't understand what this means. Can you explain what the problem
> > > is ?
> > >
> >
> > Some or most CPU cannot run FP32 application if
> > CONFIG_O32_FP64_SUPPORTS is enabled.
> > So we switch the whole Debian archive to FPXX. But the golang cannot
> > support FP32 now.
> >
> > So I wish provides a way to support FP32 and FP64 with a single kernel image.
>
>  Well, FP32 and FP64 (and FPXX) are per-program attributes set in the ELF
> headers of o32 binaries and CP0.Status.FR is a per-process property.  At
> program execution an FP64-enabled kernel will set CP0.Status.FR in the
> program's user context according to the FP32/FP64 setting in the program's
> ELF structures, or fail if hardware does not support the requested mode.

Yes. It is a bug of golang. It is FP32 while claims that it is FPXX,
due to it use gcc,
while doesn't pass -mfp32 to it.

https://go-review.googlesource.com/c/go/+/237058

>
>  The FPXX hybrid mode is there to permit running with either CP0.Status.FR
> setting, by tightening the FP ABI and forbidding the use of some code that
> is allowed with both FP32 and FP64.  This mode also permits the use of
> either FP32 or FP64 modules (but not both at a time) in dynamic loading,
> by switching CP0.Status.FR accordingly as long as supported by the piece
> of hardware being run on.
>
>  If you have software that only supports a certain FPxx setting, then
> build it accordingly and the kernel will do the rest.  If the setting
> required is not compatible with what hardware supports, then you can't run
> your software on your hardware, and if you override the checks by patching
> the kernel, then you'll get incorrect results.
>
>  So what problem are you trying to solve?  Why do you need FP32 support if

The problem is that I enabled CONFIG_O32_FP64_SUPPORT for Debian buster
while now golang cannot work with it.

I don't want to switch it off again, by instead, I *was* preferring to
provides a
boot-time option for sysadmin. So I can keep this option open, and the
kernel of DSA (debian official sysadmin) can turn it off on boot-time.

> all your software is FPXX (which will run with any CP0.Status.FR setting),
> and why does Go have issues (what kind of issues?) with any particular
> FPxx setting given that it uses the same MIPS backend as all the other
> language frontends do?
>
>   Maciej
