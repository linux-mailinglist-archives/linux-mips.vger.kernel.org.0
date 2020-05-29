Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1EE71E7831
	for <lists+linux-mips@lfdr.de>; Fri, 29 May 2020 10:23:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725601AbgE2IXb (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 29 May 2020 04:23:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725562AbgE2IX3 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 29 May 2020 04:23:29 -0400
Received: from mail-il1-x141.google.com (mail-il1-x141.google.com [IPv6:2607:f8b0:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59133C03E969;
        Fri, 29 May 2020 01:23:29 -0700 (PDT)
Received: by mail-il1-x141.google.com with SMTP id p5so534871ile.6;
        Fri, 29 May 2020 01:23:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=udSgGJX5D7f8dF71fgMGsCTDginSHbzEq5a5xZZSsIU=;
        b=GTIejjtGmRpSWdjR1S9urhWKmO5wC4PecZevnBZspqWdiuMXe6VvQpVpC9P2/45Sjy
         4mNsI7LqDKEIp8hPf6DWRXAEOfvodH/S8gRqBDshCAnFm+E2YZ4B3F77gnpaWg5bRqTb
         od2MSmPr3CF5UKe3NV1u2w08Sm6GXskjzRG4pNrDuLr5oSjco27Z90D1CvOD4STkZ6tQ
         2Nx1mGrG5detn9G8q5Eh/8jiUiWRoRNAfocE1bIm597Cwf7XqWCuIseH3w+pKtJywGIJ
         k21illywZfrczyMjd2IJl9auLpOG33RJODi2GSGxd6Zv8VnAO5quBSy5aWz5nBdkfnLt
         YnCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=udSgGJX5D7f8dF71fgMGsCTDginSHbzEq5a5xZZSsIU=;
        b=M/dMaWOVX0Do1OjDMhVYzjY0QDWERJyr56iKoneEcMpgkgsOc6Qf67LrhABNUgRlVd
         WS1nbw8LHxXoT3/rAydPoaSBnJfU0lwYzBvxLeZYEnQ23G1ctjT40xbd/OrrsTBeSHIQ
         KoM/ope0Ca1K+AFgb5SR+0iFs7mMuTl5zCyjL6LkJ7pFW/UtUGN2aVyb8RgCsEPPll2O
         Ac7Fm+QB/4NwpF0Z7jlUWmDa1sKOIlu0DEFgvu4gucKZAOkLFCAni2OoUbFbEHSmxL77
         ya6meFr3gFYiExuo0qz9wl5Wq9dViER3cBVKmPaPI49/fTvMgjtNCk025Pa2OttGNcyo
         ctKw==
X-Gm-Message-State: AOAM533/M9Y484yYjL3N0JNSccjBMYMigrev+6QsjKxJ+MtXIdW1jccW
        nnEj0P+n9WTkt4zq3ozFxfNne0xNlCs6WEBepYc=
X-Google-Smtp-Source: ABdhPJxUsEUgS6qEW3ReJWktfydrfe88XCP4KL/eCCtx8j1XR7hIs7wORdUUTO+wTE1jWkwhWXJ/TxZ7FwnzBLELLZY=
X-Received: by 2002:a05:6e02:503:: with SMTP id d3mr6497766ils.208.1590740608663;
 Fri, 29 May 2020 01:23:28 -0700 (PDT)
MIME-Version: 1.0
References: <1590654459-10827-1-git-send-email-yangtiezhu@loongson.cn>
 <CAAhV-H7W7iXJOmJ8yT7kfuMN2Y8VhzcOUQXrnkytEEqrQZtWmQ@mail.gmail.com> <20200529075643.GA7031@alpha.franken.de>
In-Reply-To: <20200529075643.GA7031@alpha.franken.de>
From:   Huacai Chen <chenhuacai@gmail.com>
Date:   Fri, 29 May 2020 16:23:16 +0800
Message-ID: <CAAhV-H5Qcbig+n604xHoj70ObKQRhQoSysGStngfxO9ZhrcqFA@mail.gmail.com>
Subject: Re: [PATCH] MIPS: Fix build warning about "PTR_STR" redefined under CONFIG_TEST_PRINTF
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Tiezhu Yang <yangtiezhu@loongson.cn>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Xuefeng Li <lixuefeng@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi, Thomas,

On Fri, May 29, 2020 at 4:05 PM Thomas Bogendoerfer
<tsbogend@alpha.franken.de> wrote:
>
> On Fri, May 29, 2020 at 09:24:06AM +0800, Huacai Chen wrote:
> > Hi, Tiezhu,
> >
> > On Thu, May 28, 2020 at 4:28 PM Tiezhu Yang <yangtiezhu@loongson.cn> wrote:
> > >
> > > Replace PTR_STR with INST_PTR_STR to fix the following build warning when
> > > CONFIG_TEST_PRINTF is set:
> > >
> > >   CC      lib/test_printf.o
> > > lib/test_printf.c:214:0: warning: "PTR_STR" redefined
> > >  #define PTR_STR "ffff0123456789ab"
> > >  ^
> > > In file included from ./arch/mips/include/asm/dsemul.h:11:0,
> > >                  from ./arch/mips/include/asm/processor.h:22,
> > >                  from ./arch/mips/include/asm/thread_info.h:16,
> > >                  from ./include/linux/thread_info.h:38,
> > >                  from ./include/asm-generic/preempt.h:5,
> > >                  from ./arch/mips/include/generated/asm/preempt.h:1,
> > >                  from ./include/linux/preempt.h:78,
> > >                  from ./include/linux/spinlock.h:51,
> > >                  from ./include/linux/seqlock.h:36,
> > >                  from ./include/linux/time.h:6,
> > >                  from ./include/linux/stat.h:19,
> > >                  from ./include/linux/module.h:13,
> > >                  from lib/test_printf.c:10:
> > > ./arch/mips/include/asm/inst.h:20:0: note: this is the location of the previous definition
> > >  #define PTR_STR  ".dword"
> > >  ^
> > >
> > > Fixes: e701656ec4db ("MIPS: inst.h: Stop including asm.h to avoid various build failures")
> > > Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> > Thank you for catching this issue, but I think this is not the best
> > solution. Maciej suggest another solution, and I will send a patch to
> > fix it.
>
> thank you, I was about to fix it myself. Not sure about your plan,
> but my idea would be to move the unaligned stuff into it's another
> or a new header file.
Yes, this is also Maciej's suggestion, and I have sent the patch one
minute ago...

Huacai
>
> Thomas.
>
> --
> Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
> good idea.                                                [ RFC1925, 2.3 ]
