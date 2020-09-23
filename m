Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9E63274F52
	for <lists+linux-mips@lfdr.de>; Wed, 23 Sep 2020 04:58:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726775AbgIWC6R (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 22 Sep 2020 22:58:17 -0400
Received: from mail-il1-f196.google.com ([209.85.166.196]:36485 "EHLO
        mail-il1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726589AbgIWC6R (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 22 Sep 2020 22:58:17 -0400
Received: by mail-il1-f196.google.com with SMTP id t12so19390052ilh.3
        for <linux-mips@vger.kernel.org>; Tue, 22 Sep 2020 19:58:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tINp7J4bxG+uLoITB1Kv1Z9+hirg1853lk0Rgmm4YeU=;
        b=OT/OtFMcoR14L02bR6NljWV4LrUPNjyYrlNLYZTq4P20397xUmR4PUayvPtKSzFcKn
         IuIrkpqaqTXwOuAjjV2zZBDWuyrDfKS9qW1lr/QGLZlkuBdj+VV32NMNmT/CFCyfTjz/
         CVjfcyBOOWdR86yaXaE/zS4jmQEJS2GcbuGd94Ao3O14zC3uenBZazxtqqrpowRj1VGC
         LkfWpFlU8OYUxS1rm0dVTslF/XJMkDsvKeQkxKbSBvVFSGLQQMsx1q9xuq7F1AXIM6t9
         JBVyGtvZy8+10UMSVzQ+rFtJVdw5I+EtmLwp+L5MsmyB5vXLQLsBEOxqxpiUqoBl6lAd
         mS4w==
X-Gm-Message-State: AOAM533NgbE5jBM0QYHqOKeMOWmIJQo7NdsJpr/M/wGq3IkxhjbDlaIp
        GMX5dQItSswbAeBR3PaAWR3BDgrtSu5P6Wb2qSQ=
X-Google-Smtp-Source: ABdhPJzPuAVuSFEELChmWXizI7Rspz1xFL3yLQ1l8oY4Z1kzG+7oVtBZMMfyPhloXfvBBvulwtx5t+l3GeZGiSpGjqY=
X-Received: by 2002:a92:2806:: with SMTP id l6mr6643411ilf.147.1600829896450;
 Tue, 22 Sep 2020 19:58:16 -0700 (PDT)
MIME-Version: 1.0
References: <1600828257-31316-1-git-send-email-chenhc@lemote.com> <20200923024548.GL25604@MiWiFi-R3L-srv>
In-Reply-To: <20200923024548.GL25604@MiWiFi-R3L-srv>
From:   Huacai Chen <chenhc@lemote.com>
Date:   Wed, 23 Sep 2020 10:58:04 +0800
Message-ID: <CAAhV-H66O77hK7kB8cCcM6XUOc-TFEg_TJG+GrCSEdD89Qxb7g@mail.gmail.com>
Subject: Re: [PATCH 1/3] MIPS: Crash kernel should be able to see old memories
To:     Baoquan He <bhe@redhat.com>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Eric Biederman <ebiederm@xmission.com>,
        Dave Young <dyoung@redhat.com>,
        Vivek Goyal <vgoyal@redhat.com>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        kexec@lists.infradead.org, Fuxin Zhang <zhangfx@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi, Baoquan,

On Wed, Sep 23, 2020 at 10:46 AM Baoquan He <bhe@redhat.com> wrote:
>
> On 09/23/20 at 10:30am, Huacai Chen wrote:
> > Kexec-tools use mem=X@Y to pass usable memories to crash kernel, but in
> > commit a94e4f24ec836c8984f83959 ("MIPS: init: Drop boot_mem_map") all
> > BIOS passed memories are removed by early_parse_mem(). I think this is
> > reasonable for a normal kernel but not for a crash kernel, because a
> > crash kernel should be able to see all old memories, even though it is
> > not supposed to use them.
>
> I am not familiar with MIPS code, but we analyze and fill memmap= to
> pass usable memory to crashkenrel in kexec-tools, do you mean you are
> specifying memmap= or mem= by hand?
Not by hand, but by code of kexec-tools via the "mem=" parameter.

As I know, kexec-tools of MIPS only use "mem=" to pass "usable"
memory, but not "visible" memory. "Visible" memory of the crash kernel
is still passed by BIOS (strictly, by the old kernel who duplicates
information from BIOS). If memblock_remove() executed here, it would
remove all "visible" memory and make "visible" memory the same as
"usable" memory, and I think this is not correct.

>
> And we don't have mem=X@Y, only mem=nn[KMG].
The relocatable kernel of MIPS is still unusable now, so MIPS should
use mem=X@Y, and the crash kernel is always different from normal
kernel.

Huacai

>
> >
> > Fixes: a94e4f24ec836c8984f83959 ("MIPS: init: Drop boot_mem_map")
> > Signed-off-by: Huacai Chen <chenhc@lemote.com>
> > ---
> >  arch/mips/kernel/setup.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
> > index 4c04a86..e2804a2 100644
> > --- a/arch/mips/kernel/setup.c
> > +++ b/arch/mips/kernel/setup.c
> > @@ -392,8 +392,10 @@ static int __init early_parse_mem(char *p)
> >        */
> >       if (usermem == 0) {
> >               usermem = 1;
> > +#ifndef CONFIG_CRASH_DUMP
> >               memblock_remove(memblock_start_of_DRAM(),
> >                       memblock_end_of_DRAM() - memblock_start_of_DRAM());
> > +#endif
> >       }
> >       start = 0;
> >       size = memparse(p, &p);
> > --
> > 2.7.0
> >
>
