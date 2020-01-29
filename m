Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 86DC314CD48
	for <lists+linux-mips@lfdr.de>; Wed, 29 Jan 2020 16:23:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726893AbgA2PXp (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 29 Jan 2020 10:23:45 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:54540 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726801AbgA2PXp (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 29 Jan 2020 10:23:45 -0500
Received: by mail-wm1-f67.google.com with SMTP id g1so131187wmh.4
        for <linux-mips@vger.kernel.org>; Wed, 29 Jan 2020 07:23:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=sZj2aV1Zym3OI36biFrNjPhnaRNJMu4/fzIHJbLnLhg=;
        b=TebBue+xtT69xTDWnWr31tmvLHIKGPqyKH/r/Dv8WrJ9nHq1AyqodKOuDDdrwCUniR
         m1RJXo0lVyl7IkG3efpHkPKWeTZbeMaHgqksOCL+YqDoJ5jTKeNpRWBbaJjVrTN6Nm/o
         TE7FfhaNrVqORpZur/WsiMNkUYHVZS9jvsOFXP0HLcC4JW5XOFzhBFbQlnkimC6dKoI6
         6vzSxNCg7j0ynYdVhQdUnBDLzAWF/T0+JYZmPqsp229oa+v9bqrz/FtzJ4Julr4cTvC2
         Bsr8RmQF1064TLBR6rWq+Of/PhnPtybVh0HJn/Q850h6atO7Rh26p99KTqOG3a9lTMu9
         9m1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=sZj2aV1Zym3OI36biFrNjPhnaRNJMu4/fzIHJbLnLhg=;
        b=hx4j4Kl0fA0WlNl3yglgubFEnCsHga4w5Xd++4EZK/ofXg7DNGVq/uoy6OlBLGwjXj
         euFVjRUK/2tkh1A3rNiu55TMgdZVNDEqXsHQDD9thsrGj4U0Gh/7ZJkZBpjMis0u7cTF
         yWx4WQ4spYiMg1J6EYrU/TRvVjTFSFtS98aq9+wsO4Ss2enLopoEe5LJCLg2cdJ/gSqC
         JWtFf7Yj6zql0PsM/VTFAA58LwqSlL0B1gi8MR+UUWpGMg90nYln9vjrbkYbIKBwY1ph
         Sk56XLD/FwDk+LUML7QKLgkcsgnCSXbK7eFnagC5KiSlLXVTfMMn7CMyoRLxc+A2T29A
         xbdA==
X-Gm-Message-State: APjAAAUMMVy7/v+vzBAa6thCqW1g1YGODzPZJLNTvNm1ID4dXATbgW7h
        qhllQFkqOCXaN5VrftvkwzqfCL8I/z0/iw==
X-Google-Smtp-Source: APXvYqzjUFydW18jKI5YKyGpW9xJOmGMD/fMvHBCORG/gPtkny+4dmFPvKujyysx5+C8ANyv4uG7jQ==
X-Received: by 2002:a7b:c4cc:: with SMTP id g12mr12976834wmk.68.1580311423907;
        Wed, 29 Jan 2020 07:23:43 -0800 (PST)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
        by smtp.gmail.com with ESMTPSA id n12sm2772420wmi.18.2020.01.29.07.23.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2020 07:23:42 -0800 (PST)
Date:   Wed, 29 Jan 2020 15:23:40 +0000
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Doug Anderson <dianders@chromium.org>,
        Paul Burton <paul.burton@mips.com>,
        Jason Wessel <jason.wessel@windriver.com>,
        qiaochong <qiaochong@loongson.cn>,
        kgdb-bugreport@lists.sourceforge.net,
        Ralf Baechle <ralf@linux-mips.org>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Chuhong Yuan <hslester96@gmail.com>,
        linux-mips <linux-mips@vger.kernel.org>,
        Nicholas Mc Guire <hofrat@osadl.org>,
        James Hogan <jhogan@kernel.org>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        Serge Semin <fancer.lancer@gmail.com>,
        Prarit Bhargava <prarit@redhat.com>,
        Will Deacon <will@kernel.org>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Christophe Leroy <christophe.leroy@c-s.fr>,
        Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        LKML <linux-kernel@vger.kernel.org>,
        Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH 0/5] kdb: Don't implicitly change tasks; plus misc fixups
Message-ID: <20200129152340.bjlzlrybkujfdf5l@holly.lan>
References: <20191109191644.191766-1-dianders@chromium.org>
 <CAD=FV=WcjHMzRE0yHm4uRFYj=Zoxz_v1FgiZETOwjzMtkjJcfQ@mail.gmail.com>
 <20200128174248.756f18d713e759be2b4273db@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200128174248.756f18d713e759be2b4273db@linux-foundation.org>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Jan 28, 2020 at 05:42:48PM -0800, Andrew Morton wrote:
> On Tue, 28 Jan 2020 08:59:01 -0800 Doug Anderson <dianders@chromium.org> wrote:
> 
> > Hi
> > 
> > On Sat, Nov 9, 2019 at 11:17 AM Douglas Anderson <dianders@chromium.org> wrote:
> > >
> > > This started out as just a follow-up to Daniel's post [1].  I wanted
> > > to stop implicitly changing the current task in kdb.  ...but, of
> > > course, everywhere you look in kdb there are things to cleanup, so
> > > this gets a few misc cleanups I found along the way.  Enjoy.
> > >
> > > [1] https://lore.kernel.org/r/20191010150735.dhrj3pbjgmjrdpwr@holly.lan
> > >
> > >
> > > Douglas Anderson (5):
> > >   MIPS: kdb: Remove old workaround for backtracing on other CPUs
> > >   kdb: kdb_current_regs should be private
> > >   kdb: kdb_current_task shouldn't be exported
> > >   kdb: Gid rid of implicit setting of the current task / regs
> > >   kdb: Get rid of confusing diag msg from "rd" if current task has no
> > >     regs
> > >
> > >  arch/mips/kernel/traps.c       |  5 -----
> > >  include/linux/kdb.h            |  2 --
> > >  kernel/debug/kdb/kdb_bt.c      |  8 +-------
> > >  kernel/debug/kdb/kdb_main.c    | 31 ++++++++++++++-----------------
> > >  kernel/debug/kdb/kdb_private.h |  2 +-
> > >  5 files changed, 16 insertions(+), 32 deletions(-)
> > 
> > I noticed that this series doesn't seem to be in linux-next, but I
> > think it was supposed to target v5.6?  Do you know if there is
> > anything outstanding or if it'll be queued up sometime soon?
> > 
> 
> I grabbed them.
> 
> Are there any updates on the testing status, particularly on MIPS?

I put in a fair bit of work earlier this dev cycle to add MIPS to the
kgdb test suite. Unfortunately that left me catching up on a few other
things... or putting it another way I am late putting together the kgdb
tree for v5.6. It will be done by the weekend.

The first patch never got a formal Acked-by from the MIPS folks but they
commented positively so we can probably go ahead.


Daniel.
