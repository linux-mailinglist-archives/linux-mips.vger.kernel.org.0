Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFC232232FA
	for <lists+linux-mips@lfdr.de>; Fri, 17 Jul 2020 07:36:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726634AbgGQFe1 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 17 Jul 2020 01:34:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726200AbgGQFe0 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 17 Jul 2020 01:34:26 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68010C08C5C0
        for <linux-mips@vger.kernel.org>; Thu, 16 Jul 2020 22:34:26 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id q7so11283474ljm.1
        for <linux-mips@vger.kernel.org>; Thu, 16 Jul 2020 22:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zWAhdSodPBqi2H5JBOy9sRuP2bwibuSZHD7FBC1gg6E=;
        b=yuTxGWFXIZNclTVHW9RjLUKJiO7NML3Kg9ysqGYkCZzgOzySzsu+afs7DiEe8YQIyq
         j6i9gcuRSFaYeo4vSt77AO22/v6He7q1IzbaNZDBW/0MVVw6PvGmvp3vO+Y4BhlnxBVT
         7fvggj/uO7ypPmVBTBvu1NFeSXI8ntvUYvbE+vnI0rQYJZcvpF2bvB7lR7NqY34b85yn
         LlT62FJRHL5juMiyrjPf7uW0a629izRxRCq7xshGd4WUmZ+R+zKGsKAAUDbewb+jbIo5
         pnTJoMm3gEh06sV14/Xg9ypmD2utGpnb1ohoq2s3j4ABVsAWpKmSX+TTHRcxA3W6Za9V
         9RLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zWAhdSodPBqi2H5JBOy9sRuP2bwibuSZHD7FBC1gg6E=;
        b=ZmXBb8w6ltTjFNIojwXHTiaRhJ5BZrssH8CDLTrEoJDTblG8JQl2tBWf0olQYREjxT
         jcbyl57m/Q3oOLnvVwE5AgMjOORye9UoycI54Il8zXqz1CIUKjIhaJIgxn76ys6+zoX6
         /7NgMXkf18VrDPewhU63VEeOAzj3jMkT0DmvRyFGaGfap6npBPqEPoXg8pFkJV/NRKiq
         XAw5eBuhtBilhQ8QMldzO76rvAADTyD5Q7gvZOtwTqYzpgpGmdt5PojLWolopex4cYBC
         Af0fzMTX9gOkM/xOBQFns7XhTJCvDYREliaqDsHM6JW9DqrLt1NeNLylxGgkhD/i8SEn
         YEFw==
X-Gm-Message-State: AOAM530WJqezFGS7P9T0onzTC4hppDBcUcLhZUGiqgpjc1iJ+3W+vkiP
        rtGIuFYDeDc1kdVXKKNnddGm0uKyiAiCaIIo7UuROg==
X-Google-Smtp-Source: ABdhPJzqUmHupuN7xBd1VTvCVu4k5dno0l+c/2WmOWFAQ4OBBksSBPxWrHIfCMe/SzKgL2Kj8mCltIWrhIYwmLvoT/I=
X-Received: by 2002:a2e:b88c:: with SMTP id r12mr3686377ljp.266.1594964064687;
 Thu, 16 Jul 2020 22:34:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200623174037.3951353-1-guro@fb.com> <20200623174037.3951353-9-guro@fb.com>
 <CA+G9fYs0vDPAL_84oDEVdGdbFEDjAR1RFoVeFTpjN6b2yS+ZPg@mail.gmail.com> <20200716200744.GB13387@carbon.dhcp.thefacebook.com>
In-Reply-To: <20200716200744.GB13387@carbon.dhcp.thefacebook.com>
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Fri, 17 Jul 2020 11:04:13 +0530
Message-ID: <CA+G9fYsvkrVJE-Aiqrkv0UG5fBWrNQ-fEvLeDgEtL5htr3m9wg@mail.gmail.com>
Subject: Re: [PATCH v7 08/19] mm: memcg/slab: save obj_cgroup for non-root
 slab objects
To:     Roman Gushchin <guro@fb.com>
Cc:     linux-mips@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Christoph Lameter <cl@linux.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Michal Hocko <mhocko@kernel.org>,
        Shakeel Butt <shakeelb@google.com>,
        linux-mm <linux-mm@kvack.org>, Vlastimil Babka <vbabka@suse.cz>,
        Kernel Team <kernel-team@fb.com>,
        open list <linux-kernel@vger.kernel.org>,
        lkft-triage@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, 17 Jul 2020 at 01:38, Roman Gushchin <guro@fb.com> wrote:
>
> On Thu, Jul 16, 2020 at 10:25:01PM +0530, Naresh Kamboju wrote:
> > On Tue, 23 Jun 2020 at 23:11, Roman Gushchin <guro@fb.com> wrote:
> > >
> > > Store the obj_cgroup pointer in the corresponding place of
> > > page->obj_cgroups for each allocated non-root slab object.  Make sure that
> > > each allocated object holds a reference to obj_cgroup.
> > >
> > > Objcg pointer is obtained from the memcg->objcg dereferencing in
> > > memcg_kmem_get_cache() and passed from pre_alloc_hook to post_alloc_hook.
> > > Then in case of successful allocation(s) it's getting stored in the
> > > page->obj_cgroups vector.
> > >
> > > The objcg obtaining part look a bit bulky now, but it will be simplified
> > > by next commits in the series.
> > >
> > > Signed-off-by: Roman Gushchin <guro@fb.com>
> > > Reviewed-by: Vlastimil Babka <vbabka@suse.cz>
> > > Reviewed-by: Shakeel Butt <shakeelb@google.com>
> > > ---
> > >  include/linux/memcontrol.h |  3 +-
> > >  mm/memcontrol.c            | 14 +++++++--
> > >  mm/slab.c                  | 18 +++++++-----
> > >  mm/slab.h                  | 60 ++++++++++++++++++++++++++++++++++----
> > >  mm/slub.c                  | 14 +++++----
> > >  5 files changed, 88 insertions(+), 21 deletions(-)


> > >
> >
> > I am not sure if this is the related patch or not that is causing
> > mips architecture build failure on linux -next.
>
> Hello, Naresh!
>
> Thank you for the report, interesting...
> There is nothing arch-specific in the code, so there must be something
> compiler-dependent. My wild guess is that the problem is caused by a memory
> allocation from the memcg_slab_post_alloc_hook(), but it's added by a later
> patch in the series. So if it really fails at this patch, there must be something
> different. I'll try to reproduce it, but I have to install the MIPS toolchain first,
> so it might take some time. If it creates some troubles, can you, please, check
> if s/__always_inline/inline helps?

sed -i -e 's#__always_inline#inline#g' mm/slub.c ->> then builds fine.

-  Naresh
