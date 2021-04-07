Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B3AD535748B
	for <lists+linux-mips@lfdr.de>; Wed,  7 Apr 2021 20:50:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230168AbhDGSuP (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 7 Apr 2021 14:50:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229691AbhDGSuP (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 7 Apr 2021 14:50:15 -0400
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com [IPv6:2607:f8b0:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51618C06175F;
        Wed,  7 Apr 2021 11:50:05 -0700 (PDT)
Received: by mail-il1-x135.google.com with SMTP id d10so17129063ils.5;
        Wed, 07 Apr 2021 11:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=b++me/vcCLJvw9varsX+G3RJRw7/X7m6AUetLZR2Nv4=;
        b=YX7dKkmFBazLmKRGC/v+9j8yBdSShEwjnP86zVbw9sy8+c4XQrqLkF9ERA8d5tLetH
         TAElcBhMdeuLalZfrtAe31xtk9HxeJ7m7Bh9RbS3i/qYVULYV7eW0d+SlTg+/B2wWN/d
         RQxlXFIokmKthq3syT9yXNifBmqqWq1LJuXy5jreeuoTI7tgPqmaDRh3wuKm0z4yYDIH
         eEpEZlfgiptwK7eg9eFNn7rV2w+38hyQApAUKuO/gSBOLneN2lYiP/cZWk5CN5tbzUyd
         LVHs9TJzGhE70kMI0wfqZ8iU41+qssSRy/MK3wAXqH2qQJEw6OWfy3gGuVg0ohtNKZKJ
         IWNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=b++me/vcCLJvw9varsX+G3RJRw7/X7m6AUetLZR2Nv4=;
        b=GBxLsy3o8mN5OJVVmTS0m46Wtc0dKvrpU4GzfwtqBC9xpATzTH7+3JyrwxvHq6iKUr
         va3C/fMV0jyLrXBEcK1GmYDCq8pSFQPabWkaoBPoQ3xAQP5F4BUAPJ8g4e2jWHK16SIi
         fhAgmt/pNagEEuibfnVCR3rglsRKW+Ct44Ap7HLEl4CjJT0ISdaM3FpjGrsxJFcFLdqR
         OWv0+uorCojHJA5axFPTDrx7njePlxzMo3QwVhlDdLRRbqkq8iA1GS+jjXbmkQlpJIrF
         le0MEWGJnAafqoGtJqE2FSqcobC1YKrvW+2TPSQcIIJbWongbut4LvDZ0lF1+KQOZx6x
         J8sQ==
X-Gm-Message-State: AOAM5337uOAn7wCeCeyzM6OrZDHmmzEvjPeupAx2lbzp1qKTSLP21IFG
        ug2s4eGfz2pZQiYUja7Jfnq/7CoGj8gTxfB/wnSy3dOyZbPm2A==
X-Google-Smtp-Source: ABdhPJyjUWWhg6dDfjjHjtwtUT6QUGUcDE6AJntOIooI3RHxQWCTF9PLwhIQljzudlfLBnJ8qzGAhGyqEs/ShbxbdMM=
X-Received: by 2002:a92:d689:: with SMTP id p9mr3798668iln.179.1617821404757;
 Wed, 07 Apr 2021 11:50:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210403061912.1012509-1-ilya.lipnitskiy@gmail.com>
 <alpine.DEB.2.21.2104060311490.65251@angie.orcam.me.uk> <CALCv0x0SwiOAWXk36vuFkspNSM16nS=wdMhm5ZNyOdFUia5zuw@mail.gmail.com>
 <alpine.DEB.2.21.2104071545330.65251@angie.orcam.me.uk>
In-Reply-To: <alpine.DEB.2.21.2104071545330.65251@angie.orcam.me.uk>
From:   Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
Date:   Wed, 7 Apr 2021 11:49:53 -0700
Message-ID: <CALCv0x0wQ9DJUVEPXCgbBFQHjqNCfSYLFkU0Md2zjJ4XfydhXg@mail.gmail.com>
Subject: Re: [PATCH] MIPS: add support for buggy MT7621S core detection
To:     "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Wei Li <liwei391@huawei.com>,
        Tiezhu Yang <yangtiezhu@loongson.cn>,
        linux-mips@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Felix Fietkau <nbd@nbd.name>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Apr 7, 2021 at 6:49 AM Maciej W. Rozycki <macro@orcam.me.uk> wrote:
>
> On Mon, 5 Apr 2021, Ilya Lipnitskiy wrote:
>
> > Thanks for the comments. Including asm/bugs.h in asm/mips-cps.h led to
> > some circular dependencies when I tried it, but I will try again based
> > on your feedback - indeed it would be much cleaner to have this logic
> > in mips_cps_numcores. The only wrinkle is that mips_cps_numcores may
> > return a different value on MT7621 after the cores have started due to
> > CPULAUNCH flags changing, but nobody calls mips_cps_numcores later
> > anyway, so it's a moot point today. I will clean up the change and
> > resend.
>
>  Hmm, I don't know this system, but by the look of the code it queries
> launch[2], which I gather refers to the VPE #0 of an inexistent core #1,
> so why would the structure change given that there is no corresponding
> silicon?
The structure would change only on the dual-core flavor of MT7621, the
single-core would always report 1 core, but on the dual-core, if
somebody were to call mips_cps_numcores after the second core had
already started, mips_cps_numcores would return 1 instead of 2. I
think it may be feasible to fix it by checking other flags, but there
is no use case for that today, so I'd rather keep this hacky logic to
a minimum.

Ilya
