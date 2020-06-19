Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67AF8201BA9
	for <lists+linux-mips@lfdr.de>; Fri, 19 Jun 2020 21:53:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732560AbgFSTxu (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 19 Jun 2020 15:53:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731128AbgFSTxu (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 19 Jun 2020 15:53:50 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A302C0613EF
        for <linux-mips@vger.kernel.org>; Fri, 19 Jun 2020 12:53:50 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id p3so2237564pgh.3
        for <linux-mips@vger.kernel.org>; Fri, 19 Jun 2020 12:53:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=anG95SJd4AOjTnI4MV3+T4SvuNW+x6NMVdWZoSy8e08=;
        b=ha9EfugfFqrYvP9ncS5JDX/+xka+I18knexTDvSEUg3ZZbryI7a/FLIh6rXbkvHOES
         h9ujOx/D0LNG/bvHVXHGHYuGvaBOEvr390y7KSfwiaD/IR/aV/nVT/jKrFqWjIHCUjyp
         pKx8tPOkcfw+AMC9k4Y1o7kg3qc1QC/Tvgvsg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=anG95SJd4AOjTnI4MV3+T4SvuNW+x6NMVdWZoSy8e08=;
        b=uEoKnH+SbiJOvGBQh/nwrzbBLdN9ULRtydxbPUQ98hpWACTSbOmJ5eRvfIovGtexEM
         c0SLOrU/Dp5p4TSF330KQxyY8KUcT3Qb5MpZbQX4IUtEK3cq60OX6c/d3hhwAaOACBwk
         citG4HgiQZo8tZ4iLxMxDmx51ZLrsH44yNKEVeZ1Vp5gwujG6D4bE57xTelWqncZCJD9
         tEYk+QocwOGDprT9Fb7iq0creYwQkjsvdnE9kKBLLQf28SMgziR9tm/kcCYY26tr4o7n
         yMxu7JPvAuY3JpaxWTcVrl2t8qeaOO4rnbRyhwPPeYjhG7krQfpBmRnCKh/I8E46vitz
         26/Q==
X-Gm-Message-State: AOAM531hfdW8HF2z1D1UuUSK4vH+ydfX1L3HfnlMJhuV3sQnmKXrHd09
        dnPU7Fj//0OSBM0wUNfEjoxPGA==
X-Google-Smtp-Source: ABdhPJzHp+ulgh26iR+Xv3g/K0aOiw7U9M6bVmBEmxiFXk8mFx/tiNvkiTra7x6B5etHiCFnYsht0g==
X-Received: by 2002:a62:5c03:: with SMTP id q3mr9555744pfb.58.1592596428586;
        Fri, 19 Jun 2020 12:53:48 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id h20sm6473821pfo.105.2020.06.19.12.53.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2020 12:53:47 -0700 (PDT)
Date:   Fri, 19 Jun 2020 12:53:46 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Andy Lutomirski <luto@kernel.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Arnd Bergmann <arnd@arndb.de>, Will Drewry <wad@chromium.org>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        linux-arch <linux-arch@vger.kernel.org>
Subject: Re: [PATCH] seccomp: Use -1 marker for end of mode 1 syscall list
Message-ID: <202006191253.B00874B22@keescook>
References: <202006191236.AC3E22AAB@keescook>
 <CALCETrXM5gneAC40RLWyjnCeHE6JFVOKnM0ooKLooGGaVV1KOA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALCETrXM5gneAC40RLWyjnCeHE6JFVOKnM0ooKLooGGaVV1KOA@mail.gmail.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Jun 19, 2020 at 12:42:14PM -0700, Andy Lutomirski wrote:
> On Fri, Jun 19, 2020 at 12:37 PM Kees Cook <keescook@chromium.org> wrote:
> >
> > The terminator for the mode 1 syscalls list was a 0, but that could be
> > a valid syscall number (e.g. x86_64 __NR_read). By luck, __NR_read was
> > listed first and the loop construct would not test it, so there was no
> > bug. However, this is fragile. Replace the terminator with -1 instead,
> > and make the variable name for mode 1 syscall lists more descriptive.
> 
> Could the architecture instead supply the length of the list?

It could, but I didn't like the way the plumbing for that looked.

-- 
Kees Cook
