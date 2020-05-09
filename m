Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 023F11CBD1E
	for <lists+linux-mips@lfdr.de>; Sat,  9 May 2020 06:02:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726067AbgEIEC1 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 9 May 2020 00:02:27 -0400
Received: from mail-il1-f194.google.com ([209.85.166.194]:42797 "EHLO
        mail-il1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725385AbgEIEC1 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 9 May 2020 00:02:27 -0400
Received: by mail-il1-f194.google.com with SMTP id t12so3347359ile.9
        for <linux-mips@vger.kernel.org>; Fri, 08 May 2020 21:02:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6xua7Jmgc6X8rMKuMjL528rW3WjsqSVGHqeP4mYGGbI=;
        b=O7l1tO1XHu2qQQfwiKMtg/MEvl9o6iowZFwwJ4WTT8sctxGocWxMIzrgsxmnm7woNs
         DKTIQYYw4fnGKi0FtKgfhLAQ/XCWwstcAXsHN4119iwX7plEl4B/8G5faOvzAZJ/B3FX
         SxhohJ380o4E0vf5JXlkn1yxYSRtbaTS1T3z8dFPFfdYq3kcFgXSjRUz6Xnf62muNhO0
         VG0RZ0eXEfDiJk7oQezPECJPdJ0pBKrSi0GJm8Z0/PAGSXOwAnGg9bhvC6AyCGr9wW8D
         vAocc7FMjhuhFPqp42p85x53zo33OaLYOLEndyhlUuViagP5Nzx1MbpErsdtIm4J2muN
         WaHw==
X-Gm-Message-State: AGi0PuaCobIOhoBOy+dVYQ++MMACNoqUggixZsZJGU5IACZraiBuAPwo
        1cNfCRj/RbCKQd2nFagxfIhkVwI557RjcgL0ldXV275Oyhc=
X-Google-Smtp-Source: APiQypI6jruPM9osllFHMNluc29Ipbp/tjHkHTiAXrefbo46iwZHL1dvSzAfE0F0DtI6TqkTvr/KEEHZmHmiXCwFCvM=
X-Received: by 2002:a92:cece:: with SMTP id z14mr6001292ilq.147.1588996945143;
 Fri, 08 May 2020 21:02:25 -0700 (PDT)
MIME-Version: 1.0
References: <1588930212-5255-1-git-send-email-chenhc@lemote.com> <20200508130149.GA14297@alpha.franken.de>
In-Reply-To: <20200508130149.GA14297@alpha.franken.de>
From:   Huacai Chen <chenhc@lemote.com>
Date:   Sat, 9 May 2020 12:10:05 +0800
Message-ID: <CAAhV-H5BRhxvaQ_-RHYkEe8BY-OSQto1FhQtBx3T+bZTOVs+-Q@mail.gmail.com>
Subject: Re: [PATCH] MIPS: inst.h: Stop including asm.h to avoid various build failures
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

On Fri, May 8, 2020 at 9:31 PM Thomas Bogendoerfer
<tsbogend@alpha.franken.de> wrote:
>
> On Fri, May 08, 2020 at 05:30:12PM +0800, Huacai Chen wrote:
> > Commit d339cd02b888eb8 ("MIPS: Move unaligned load/store helpers to
> > inst.h") causes a lot of build failures because macros in asm.h conflict
> > with various subsystems. Some of these conflictions has been fixed (such
> > as LONG, PANIC and PRINT) by adjusting asm.h, but some of them is nearly
> > impossible to fix (such as PTR and END). The only reason of including
> > asm.h in inst.h is that we need the PTR macro which is used by unaligned
> > load/store helpers. So in this patch we define a new PTR_STR macro and
> > use it to replace STR(PTR), then we can stop including asm.h to avoid
> > various build failures.
> >
> > Fixes: d339cd02b888eb8 ("MIPS: Move unaligned load/store helpers to inst.h")
> > Reported-by: kbuild test robot <lkp@intel.com>
> > Signed-off-by: Huacai Chen <chenhc@lemote.com>
> > ---
> >  arch/mips/include/asm/inst.h | 184 ++++++++++++++++++++++---------------------
>
> applied to mips-next. /me hopes this is the last fix... thanks
I think this is the last fix... and, does "MIPS: asm: Rename some
macros to avoid build errors" need to be reverted?

Huacai
>
> Thomas.
>
> --
> Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
> good idea.                                                [ RFC1925, 2.3 ]
