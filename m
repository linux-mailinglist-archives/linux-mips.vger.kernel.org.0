Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B1277FCA93
	for <lists+linux-mips@lfdr.de>; Thu, 14 Nov 2019 17:11:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726533AbfKNQLT (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 14 Nov 2019 11:11:19 -0500
Received: from mail-io1-f66.google.com ([209.85.166.66]:38958 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726482AbfKNQLT (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 14 Nov 2019 11:11:19 -0500
Received: by mail-io1-f66.google.com with SMTP id k1so7403529ioj.6
        for <linux-mips@vger.kernel.org>; Thu, 14 Nov 2019 08:11:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=m/6eJjoqatlkHX327WsvzFKy6FL3fKgPjPYcZivid0o=;
        b=AiurrKxewNIgEi3Qc6AI4HYquUZOxMUDDDEB4z7QR5Qc3jretuIDN/CPqLL/KNil0+
         uG62v8LYmfkf3YQQ+ZypHZUpDwShD0oQL4dCmML/1uNfP7DOAg/9G85ZtXxpPcKJ24y0
         fmQVgK/gitIAxmcJYMo0YJjFbj5qdty2SABIs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=m/6eJjoqatlkHX327WsvzFKy6FL3fKgPjPYcZivid0o=;
        b=Tzk/6Ns8LXgBqptKihEJI9K9MrDVzCFKxL/1IKR0ZUw24/OzUTJcmMhXwJN3O/GiFu
         anAHOr6vIwDjYbk/wHMEzSnopp8afBSoiUORLzsMQvP7Hkef3VKDU8mYNoPAiSkz0kcM
         sHDMuGMbZRZNOqKTPzR9SV2WrXiJyibhGeGNGDz5CO6U8IFifqKSC3g/xHBQoRLfnQjh
         /0HgnZKZmceB3av2FtqgmIVi8a1AWUSZLbcBlI6/+V9zHEgLzCTFuQ/edhqxhp1sPOzi
         3uH3QHQJYjc7nVHx3SCs2HqAvc5x5kt6wHFaFTC+pnm82a75DQ+SBB+rDYeRRGHaSQj3
         y5JA==
X-Gm-Message-State: APjAAAUA54kZbvwf4SIloqBQdbHmdBaNx7Rhzw8oNdzpSp98obc/fbDQ
        vPHZv23IUEk/2EdX4XKdXiI6Yp76crY=
X-Google-Smtp-Source: APXvYqz2DQZncd2oxX2qFv7ihnut43XsAhnOEvU6EOWBSMgvq75fwdwIQCCLL4moEy/4CG9o6hY+1Q==
X-Received: by 2002:a05:6638:219:: with SMTP id e25mr8655563jaq.105.1573747876281;
        Thu, 14 Nov 2019 08:11:16 -0800 (PST)
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com. [209.85.166.54])
        by smtp.gmail.com with ESMTPSA id z19sm808119ilj.49.2019.11.14.08.11.14
        for <linux-mips@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Nov 2019 08:11:15 -0800 (PST)
Received: by mail-io1-f54.google.com with SMTP id v17so7363406iol.12
        for <linux-mips@vger.kernel.org>; Thu, 14 Nov 2019 08:11:14 -0800 (PST)
X-Received: by 2002:a02:a813:: with SMTP id f19mr8010531jaj.12.1573747874146;
 Thu, 14 Nov 2019 08:11:14 -0800 (PST)
MIME-Version: 1.0
References: <20191109191644.191766-1-dianders@chromium.org>
 <20191109111623.1.I30a0cac4d9880040c8d41495bd9a567fe3e24989@changeid> <20191114105125.t3jma3ghwj2wtv6w@holly.lan>
In-Reply-To: <20191114105125.t3jma3ghwj2wtv6w@holly.lan>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 14 Nov 2019 08:10:56 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Xkxm-eTXmU9s+Bu+biLmjkioVqmHZEBVguZ85cCQywog@mail.gmail.com>
Message-ID: <CAD=FV=Xkxm-eTXmU9s+Bu+biLmjkioVqmHZEBVguZ85cCQywog@mail.gmail.com>
Subject: Re: [PATCH 1/5] MIPS: kdb: Remove old workaround for backtracing on
 other CPUs
To:     Daniel Thompson <daniel.thompson@linaro.org>
Cc:     Paul Burton <paul.burton@mips.com>,
        Jason Wessel <jason.wessel@windriver.com>,
        qiaochong <qiaochong@loongson.cn>,
        kgdb-bugreport@lists.sourceforge.net,
        Ralf Baechle <ralf@linux-mips.org>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        James Hogan <jhogan@kernel.org>,
        Mike Rapoport <rppt@linux.ibm.com>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-mips <linux-mips@vger.kernel.org>,
        =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
        Serge Semin <fancer.lancer@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi,

On Thu, Nov 14, 2019 at 2:51 AM Daniel Thompson
<daniel.thompson@linaro.org> wrote:
>
> On Sat, Nov 09, 2019 at 11:16:40AM -0800, Douglas Anderson wrote:
> > As of commit 2277b492582d ("kdb: Fix stack crawling on 'running' CPUs
> > that aren't the master") we no longer need any special case for doing
> > stack dumps on CPUs that are not the kdb master.  Let's remove.
> >
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
> > I have no way to test this personally, so hopefully someone who uses
> > kdb/kgdb on MIPS can.
>
> I took this as a hint to add mips support to kgdbtest ;-)
>
> Support is added and working well. Unfortunately lack of familiarity
> with mips means I have not yet figured out which mips defconfig gives
> us working SMP (and what the corresponding qemu invocation should be).

Nice!


> I think that means I still can't (quite) exercise this code fully.
> The most appropriate test is bta on an SMP system, right?

Yeah, or at least "btc".


> > Ideally this patch should be Acked by MIPS folks and then land through
> > the kdb/kgdb tree since the next patch in the series, ("kdb:
> > kdb_current_regs should be private") depends on it.
>
> An Acked-by from a MIPS maintainer would be very welcome. Perhaps
> with a bit of extra work on the above I might be able to provide
> a Tested-by:.
>
> I didn't see anything that particularly bothered me in the patches but
> given we're already at -rc7 I'm inclined to target this patchset for 5.6
> rather than 5.5.

That's fine.  This is all just cleanup stuff so targeting 5.6 is fine.

-Doug
