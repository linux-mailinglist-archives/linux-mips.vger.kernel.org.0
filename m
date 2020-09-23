Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E902D274F6A
	for <lists+linux-mips@lfdr.de>; Wed, 23 Sep 2020 05:09:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726720AbgIWDJA (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 22 Sep 2020 23:09:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44533 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726710AbgIWDJA (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Tue, 22 Sep 2020 23:09:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1600830538;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=U++Drsyj05eZBhTKTXoglUvDH8yY00109ZIQ2O3IACs=;
        b=LvLmwd4cilOej0XS1Jiv4fQsa8yI/kw5BKSbIi6KnNtYcn15KSS9J7MhvFlh9CQnzIrLl2
        /IvkF4Y+kJ4VsUvFeq+VWxY4KPEj0hpHnz6h/SFMiKf4O/F3G3it7bCmdK+ew7aDjcTCgh
        IvIZ44FYCBes+HMrScb2igSD+LIKjs4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-323-Xd_GMt9VNFSsLpbGC2Lt3Q-1; Tue, 22 Sep 2020 23:08:56 -0400
X-MC-Unique: Xd_GMt9VNFSsLpbGC2Lt3Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 069EE1007464;
        Wed, 23 Sep 2020 03:08:55 +0000 (UTC)
Received: from localhost (ovpn-12-42.pek2.redhat.com [10.72.12.42])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id A0F9E55765;
        Wed, 23 Sep 2020 03:08:50 +0000 (UTC)
Date:   Wed, 23 Sep 2020 11:08:47 +0800
From:   Baoquan He <bhe@redhat.com>
To:     Huacai Chen <chenhc@lemote.com>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Eric Biederman <ebiederm@xmission.com>,
        Dave Young <dyoung@redhat.com>,
        Vivek Goyal <vgoyal@redhat.com>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        kexec@lists.infradead.org, Fuxin Zhang <zhangfx@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: Re: [PATCH 1/3] MIPS: Crash kernel should be able to see old memories
Message-ID: <20200923030847.GM25604@MiWiFi-R3L-srv>
References: <1600828257-31316-1-git-send-email-chenhc@lemote.com>
 <20200923024548.GL25604@MiWiFi-R3L-srv>
 <CAAhV-H66O77hK7kB8cCcM6XUOc-TFEg_TJG+GrCSEdD89Qxb7g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAhV-H66O77hK7kB8cCcM6XUOc-TFEg_TJG+GrCSEdD89Qxb7g@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 09/23/20 at 10:58am, Huacai Chen wrote:
> Hi, Baoquan,
> 
> On Wed, Sep 23, 2020 at 10:46 AM Baoquan He <bhe@redhat.com> wrote:
> >
> > On 09/23/20 at 10:30am, Huacai Chen wrote:
> > > Kexec-tools use mem=X@Y to pass usable memories to crash kernel, but in
> > > commit a94e4f24ec836c8984f83959 ("MIPS: init: Drop boot_mem_map") all
> > > BIOS passed memories are removed by early_parse_mem(). I think this is
> > > reasonable for a normal kernel but not for a crash kernel, because a
> > > crash kernel should be able to see all old memories, even though it is
> > > not supposed to use them.
> >
> > I am not familiar with MIPS code, but we analyze and fill memmap= to
> > pass usable memory to crashkenrel in kexec-tools, do you mean you are
> > specifying memmap= or mem= by hand?
> Not by hand, but by code of kexec-tools via the "mem=" parameter.

OK, please ignore my comments.

> 
> As I know, kexec-tools of MIPS only use "mem=" to pass "usable"
> memory, but not "visible" memory. "Visible" memory of the crash kernel
> is still passed by BIOS (strictly, by the old kernel who duplicates
> information from BIOS). If memblock_remove() executed here, it would
> remove all "visible" memory and make "visible" memory the same as
> "usable" memory, and I think this is not correct.
> 
> >
> > And we don't have mem=X@Y, only mem=nn[KMG].
> The relocatable kernel of MIPS is still unusable now, so MIPS should
> use mem=X@Y, and the crash kernel is always different from normal
> kernel.

Interesting. Seems MIPS does support mem=X@Y, even though the document
of 'mem=' says it's used to specify amount of memory, but not memory
region. Anyway, leave this to mips reviewers, thanks for replying.

~~~~~~~~~~~~~~~~~~~
        mem=nn[KMG]     [KNL,BOOT] Force usage of a specific amount of memory
                        Amount of memory to be used in cases as follows:

> 
> >
> > >
> > > Fixes: a94e4f24ec836c8984f83959 ("MIPS: init: Drop boot_mem_map")
> > > Signed-off-by: Huacai Chen <chenhc@lemote.com>
> > > ---
> > >  arch/mips/kernel/setup.c | 2 ++
> > >  1 file changed, 2 insertions(+)
> > >
> > > diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
> > > index 4c04a86..e2804a2 100644
> > > --- a/arch/mips/kernel/setup.c
> > > +++ b/arch/mips/kernel/setup.c
> > > @@ -392,8 +392,10 @@ static int __init early_parse_mem(char *p)
> > >        */
> > >       if (usermem == 0) {
> > >               usermem = 1;
> > > +#ifndef CONFIG_CRASH_DUMP
> > >               memblock_remove(memblock_start_of_DRAM(),
> > >                       memblock_end_of_DRAM() - memblock_start_of_DRAM());
> > > +#endif
> > >       }
> > >       start = 0;
> > >       size = memparse(p, &p);
> > > --
> > > 2.7.0
> > >
> >
> 

