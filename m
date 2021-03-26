Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17F47349FE6
	for <lists+linux-mips@lfdr.de>; Fri, 26 Mar 2021 03:46:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230516AbhCZCpi (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 25 Mar 2021 22:45:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230487AbhCZCpf (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 25 Mar 2021 22:45:35 -0400
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com [IPv6:2607:f8b0:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C064DC06174A;
        Thu, 25 Mar 2021 19:45:35 -0700 (PDT)
Received: by mail-il1-x12d.google.com with SMTP id d10so3893796ils.5;
        Thu, 25 Mar 2021 19:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=c3TyjwBJft9+viqfPrXWUpurNVXIQ9MInz6FpBne7QA=;
        b=RIfYo3knm7rJ8Fy8qNuU48hZbeapTu2tF4cGnlZCR9F4ZM5I03eDXqSPCxZswfhI4l
         MwbKKrTK1YKNYgACEJe9pUUNyG5HMN8ryvKud2Fjqah03zduTN5V/1+v67R6vsnRJNMM
         nxMvA3yka48mUXKmlr7P4msktvTVkphxiZIah2a8ahljfjtlWJDfLIWo71A1/WnXAYQV
         lUajAY31CYG3Br2ftZguq4q4SIkHodu3W5vE4URjTyfPVKeI1Pzcgh6EE3CVdIvd3s4v
         +vsLvxgQnGw2SpR/EGq5vS5BiEw6U9sU3y8f+zMcfT+mNIovxWztZKTwmCpC2AT6iTxU
         Ma7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=c3TyjwBJft9+viqfPrXWUpurNVXIQ9MInz6FpBne7QA=;
        b=BY03CRWvEv+FsW58/zSQzcMIYZ9EaWmfOyg7JdsG3h3y75bLcjshjIePQhkcKnzZZ8
         HO1qQ8uMxuxBreRmynKNg6k0pJtAMx9jnIbdlBrX23KLPF7fzgGWxvRPbSqvlwdN7VSp
         aFSFpvbVt24OCsjLOkeI927GIYwN4StUUwVYCGmGMCnPzgSZFTh4RPQFNqYy1f1c/ngL
         sT1oBzPl2zIE5qqSmRj4nVPTT/0uZLuyWjxhqSw/zm/1Qbmu+xxIZQYIswrSxY5GRILY
         lf3Jremq6sSRnrJ0FK708xqSmYfsJTRa7QibK5dM+y6jHZAkz/uBWCgubp7nE9JUBzFy
         44iQ==
X-Gm-Message-State: AOAM530/g3If8PpnqWBLfXIcPuOSg3+rNBJxctmocpP89ErT2oFudhw7
        8XIUnzFRL/jfN1fDKL28hF3/Fc/a5fXq0sFWNBw=
X-Google-Smtp-Source: ABdhPJw17Oub2hHuFs6ahjRk6K43qQvnSr86/UUcgndqJ+RYESwqNNNP+pspx19ljyZykhlcDwPmFlcnawKA7sCm4Mk=
X-Received: by 2002:a92:c842:: with SMTP id b2mr8936041ilq.179.1616726735262;
 Thu, 25 Mar 2021 19:45:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210317055902.506773-1-ilya.lipnitskiy@gmail.com> <20210325095529.GA5775@alpha.franken.de>
In-Reply-To: <20210325095529.GA5775@alpha.franken.de>
From:   Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
Date:   Thu, 25 Mar 2021 19:45:23 -0700
Message-ID: <CALCv0x2ni97mLEar6M9boWCrXzdsqM3JJNMbe=cDitHj+npanw@mail.gmail.com>
Subject: Re: [PATCH] MIPS: ralink: mt7621: add memory detection support
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Matthias Brugger <matthias.bgg@gmail.com>,
        John Crispin <john@phrozen.org>,
        Chuanhong Guo <gch981213@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Mar 25, 2021 at 3:01 AM Thomas Bogendoerfer
<tsbogend@alpha.franken.de> wrote:
>
> On Tue, Mar 16, 2021 at 10:59:02PM -0700, Ilya Lipnitskiy wrote:
> > From: Chuanhong Guo <gch981213@gmail.com>
> >
> > mt7621 has the following memory map:
> > 0x0-0x1c000000: lower 448m memory
> > 0x1c000000-0x2000000: peripheral registers
> > 0x20000000-0x2400000: higher 64m memory
> >
> > detect_memory_region in arch/mips/kernel/setup.c only adds the first
> > memory region and isn't suitable for 512m memory detection because
> > it may accidentally read the memory area for peripheral registers.
> >
> > This commit adds memory detection capability for mt7621:
> >   1. Add the highmem area when 512m is detected.
> >   2. Guard memcmp from accessing peripheral registers:
> >      This only happens when a user decided to change kernel load address
> >      to 256m or higher address. Since this is a quite unusual case, we
> >      just skip 512m testing and return 256m as memory size.
> >
> > [...]
>
> I get
>
> WARNING: modpost: vmlinux.o(.text+0x132c): Section mismatch in reference from the function prom_soc_init() to the function .init.text:mt7621_memory_detect()
> The function prom_soc_init() references
> the function __init mt7621_memory_detect().
> This is often because prom_soc_init lacks a __init
> annotation or the annotation of mt7621_memory_detect is wrong.
>
> Can you please fix this ?
Thanks, I will fix it. Having trouble reproducing the error, but I
clearly see the issue. Are you building on a MIPS target or
cross-compiling (I'm cross-compiling and no errors).

Ilya
