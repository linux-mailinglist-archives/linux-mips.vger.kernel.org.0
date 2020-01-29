Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4E96514C477
	for <lists+linux-mips@lfdr.de>; Wed, 29 Jan 2020 02:42:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726363AbgA2Bmw (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 28 Jan 2020 20:42:52 -0500
Received: from mail.kernel.org ([198.145.29.99]:49034 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726333AbgA2Bmw (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 28 Jan 2020 20:42:52 -0500
Received: from localhost.localdomain (c-73-231-172-41.hsd1.ca.comcast.net [73.231.172.41])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1914B2051A;
        Wed, 29 Jan 2020 01:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1580262171;
        bh=Dm5O1JcZZZn4Fmmh8ZEVuwwpAngNiF+PCJfRS/Xf9zw=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=IuNPIsR0oGrUykv480vwdj6CsOazTln5Bw1n/BEKw1a/AsxXikVYbWTsDoZHVn1NH
         t/EI5lRCJXpmAa1YAwlsAfg3SXA/vfAdzvcPXlErBoR7v2HI9/sbLaWbGUKdyFKt2C
         ZB09jVEnfNltBzwVSCZDK1MGtariwNUd7/U93c4E=
Date:   Tue, 28 Jan 2020 17:42:48 -0800
From:   Andrew Morton <akpm@linux-foundation.org>
To:     Doug Anderson <dianders@chromium.org>
Cc:     Paul Burton <paul.burton@mips.com>,
        Jason Wessel <jason.wessel@windriver.com>,
        Daniel Thompson <daniel.thompson@linaro.org>,
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
        Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        LKML <linux-kernel@vger.kernel.org>,
        Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH 0/5] kdb: Don't implicitly change tasks; plus misc
 fixups
Message-Id: <20200128174248.756f18d713e759be2b4273db@linux-foundation.org>
In-Reply-To: <CAD=FV=WcjHMzRE0yHm4uRFYj=Zoxz_v1FgiZETOwjzMtkjJcfQ@mail.gmail.com>
References: <20191109191644.191766-1-dianders@chromium.org>
        <CAD=FV=WcjHMzRE0yHm4uRFYj=Zoxz_v1FgiZETOwjzMtkjJcfQ@mail.gmail.com>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, 28 Jan 2020 08:59:01 -0800 Doug Anderson <dianders@chromium.org> wrote:

> Hi
> 
> On Sat, Nov 9, 2019 at 11:17 AM Douglas Anderson <dianders@chromium.org> wrote:
> >
> > This started out as just a follow-up to Daniel's post [1].  I wanted
> > to stop implicitly changing the current task in kdb.  ...but, of
> > course, everywhere you look in kdb there are things to cleanup, so
> > this gets a few misc cleanups I found along the way.  Enjoy.
> >
> > [1] https://lore.kernel.org/r/20191010150735.dhrj3pbjgmjrdpwr@holly.lan
> >
> >
> > Douglas Anderson (5):
> >   MIPS: kdb: Remove old workaround for backtracing on other CPUs
> >   kdb: kdb_current_regs should be private
> >   kdb: kdb_current_task shouldn't be exported
> >   kdb: Gid rid of implicit setting of the current task / regs
> >   kdb: Get rid of confusing diag msg from "rd" if current task has no
> >     regs
> >
> >  arch/mips/kernel/traps.c       |  5 -----
> >  include/linux/kdb.h            |  2 --
> >  kernel/debug/kdb/kdb_bt.c      |  8 +-------
> >  kernel/debug/kdb/kdb_main.c    | 31 ++++++++++++++-----------------
> >  kernel/debug/kdb/kdb_private.h |  2 +-
> >  5 files changed, 16 insertions(+), 32 deletions(-)
> 
> I noticed that this series doesn't seem to be in linux-next, but I
> think it was supposed to target v5.6?  Do you know if there is
> anything outstanding or if it'll be queued up sometime soon?
> 

I grabbed them.

Are there any updates on the testing status, particularly on MIPS?
