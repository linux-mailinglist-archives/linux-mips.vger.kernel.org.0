Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 212811D26C8
	for <lists+linux-mips@lfdr.de>; Thu, 14 May 2020 07:46:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725806AbgENFqo (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 14 May 2020 01:46:44 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:41385 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725788AbgENFqo (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 14 May 2020 01:46:44 -0400
Received: by mail-io1-f66.google.com with SMTP id w11so1655492iov.8
        for <linux-mips@vger.kernel.org>; Wed, 13 May 2020 22:46:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WOz6INC07XnTXNpYp62H39ZjGtLNkmqGXKitI+kyle8=;
        b=Vscn7qKXJc+xtGawJoAh5Zh45NgXsLkg6vfvZ/RJbAs8IyzM9FoGti/l9/AHSa1Cmk
         IgsHCmadiLX6hduCjWRsTXwcgWKYnFObm+9gZsruwujqpw4/Lp7nzz/A9wBqk0K22lna
         Z4e+gBUqr2TzBsjvF5hrftEdtZyDFXS8cMHnFsqAUGw7YoJXTzDPn4zyzVoEHIRJUTju
         EHmzsLAPbKSfUd6U5rZpUseS8JKlSA28NrP4F4dUwbk/ycnBgggkvxQCEMv2x8yXb7Ew
         3WKXhykWZrhS5NjpfbcfgaMXDq6U+dD3645ZEC1r+O5On79rSmo0N5U2qgTCinISAox3
         098w==
X-Gm-Message-State: AOAM532xXrSzpKED+zA28cNQKzbo6FdcG1WvuVxELk9DWM219vSn6Yyz
        SY1rxRgbzW+cZt5E7HxGvlrh6zoIi9c633/g7xQ=
X-Google-Smtp-Source: ABdhPJwf+JCwXJkSr10ewe1MVUZnvW8RQQUJzuBg2zuBFX54iJYfy8Ms45TnhWiIchAz6Gmv3Hz0LTkVhkMp8yjLNdU=
X-Received: by 2002:a02:966a:: with SMTP id c97mr3028455jai.106.1589435203036;
 Wed, 13 May 2020 22:46:43 -0700 (PDT)
MIME-Version: 1.0
References: <1588930212-5255-1-git-send-email-chenhc@lemote.com>
 <20200508130149.GA14297@alpha.franken.de> <CAAhV-H5BRhxvaQ_-RHYkEe8BY-OSQto1FhQtBx3T+bZTOVs+-Q@mail.gmail.com>
 <20200509152501.GA9125@alpha.franken.de> <alpine.LFD.2.21.2005130036060.677301@eddie.linux-mips.org>
In-Reply-To: <alpine.LFD.2.21.2005130036060.677301@eddie.linux-mips.org>
From:   Huacai Chen <chenhc@lemote.com>
Date:   Thu, 14 May 2020 13:46:33 +0800
Message-ID: <CAAhV-H63n_wa8Z72WRNPjeG0aVYEujvcDJPmd2nPcER1NrUiGw@mail.gmail.com>
Subject: Re: [PATCH] MIPS: inst.h: Stop including asm.h to avoid various build failures
To:     "Maciej W. Rozycki" <macro@linux-mips.org>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        Fuxin Zhang <zhangfx@lemote.com>,
        Zhangjin Wu <wuzhangjin@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi, Maciej,

On Thu, May 14, 2020 at 6:55 AM Maciej W. Rozycki <macro@linux-mips.org> wrote:
>
> On Sat, 9 May 2020, Thomas Bogendoerfer wrote:
>
> > > > > Commit d339cd02b888eb8 ("MIPS: Move unaligned load/store helpers to
> > > > > inst.h") causes a lot of build failures because macros in asm.h conflict
> > > > > with various subsystems. Some of these conflictions has been fixed (such
> > > > > as LONG, PANIC and PRINT) by adjusting asm.h, but some of them is nearly
> > > > > impossible to fix (such as PTR and END). The only reason of including
> > > > > asm.h in inst.h is that we need the PTR macro which is used by unaligned
> > > > > load/store helpers. So in this patch we define a new PTR_STR macro and
> > > > > use it to replace STR(PTR), then we can stop including asm.h to avoid
> > > > > various build failures.
> > > > >
> > > > > Fixes: d339cd02b888eb8 ("MIPS: Move unaligned load/store helpers to inst.h")
> > > > > Reported-by: kbuild test robot <lkp@intel.com>
> > > > > Signed-off-by: Huacai Chen <chenhc@lemote.com>
> > > > > ---
> > > > >  arch/mips/include/asm/inst.h | 184 ++++++++++++++++++++++---------------------
> > > >
> > > > applied to mips-next. /me hopes this is the last fix... thanks
> > > I think this is the last fix... and, does "MIPS: asm: Rename some
> > > macros to avoid build errors" need to be reverted?
> >
> > let's keep it as it is now.
>
>  Sigh, this just shows how the original change was wrong in the first
> place.  Why was <asm/inst.h> specifically chosen, whose purpose has been
> machine code generators/interpreters that has nothing to do with unaligned
> access helpers, over a more suitable location, such as (maybe obviously?)
> <asm/unaligned.h>?
>
>  I suggest that we roll back to before the destruction, move the necessary
> bits away from <asm/inst.h>, and then perhaps none of the follow-up hacks
> will be required.
I think you are right, but it is too late... so, I think we needn't roll back.

>
>   Maciej
>
>
Huacai
