Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8F12F14BE36
	for <lists+linux-mips@lfdr.de>; Tue, 28 Jan 2020 17:59:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726613AbgA1Q7S (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 28 Jan 2020 11:59:18 -0500
Received: from mail-vs1-f68.google.com ([209.85.217.68]:45445 "EHLO
        mail-vs1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725881AbgA1Q7R (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 28 Jan 2020 11:59:17 -0500
Received: by mail-vs1-f68.google.com with SMTP id v141so4889801vsv.12
        for <linux-mips@vger.kernel.org>; Tue, 28 Jan 2020 08:59:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1kp2/4gfvXmBxJbriEuhD88FxIhMu/4bGwo/Zmm5PKU=;
        b=gMv4HGCWc9VWs5EKeYQSo1N5YZJjHcHm5rePnbNpI2VfXdzTRQeVopa5wPpcg0/et2
         vJKJjtefINOeaW+sEA+VDaUVkxgPh5nCZs7q/9YWl1jAc7yFKmoqpiqKOvvSK+kpCEU8
         GAkC4C5WPDb7EmZT5IUhnkUlSj7wT+Jv8ls90=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1kp2/4gfvXmBxJbriEuhD88FxIhMu/4bGwo/Zmm5PKU=;
        b=Jp1z4DbXNgEOkNAxKgAoqYqtCeHmDr5m1erzh2hdx6+NY84hv6+QPdTE8RQmxMV6jz
         CDPC+euOLPzPvmfuLC4BXA8yATusIio9cE/V2wmu25uglp30nPi1VTLMPLIQv1YJF6WM
         /GyEiVWGfUGvT+ioDdIPod8Sjro5IfwImIPCEMs3LwJ6gN4a3uPNdUiJnJro/gkUXgnf
         OK586l2a8OOVpRyShlXW0nUUuVUYH6Qlo9PVPQVRQi971WkgAKQ3GMZt70bTVySLEvi4
         ajN1Q3AXFolA7q8GNnLTOtbUDQtXAAoWIjl4/kV0OeflHXyLbWlwLtPjIkU1A75Sdhk4
         rw2Q==
X-Gm-Message-State: APjAAAWgEYpOd2oZMliirJXF3UIcDUaidXVrVbj6Jrxhz3yIcl1xhvba
        H2xivdKWx6o/677O6mEfh5oMK7JdJJI=
X-Google-Smtp-Source: APXvYqy8IIGNCF7G8VVRHKtw6/yugw+NsexCJxB/5y6YrYfGGzfJayQOmtQ3M4+xauMt0RlezGAO3w==
X-Received: by 2002:a67:f81a:: with SMTP id l26mr14071263vso.194.1580230756657;
        Tue, 28 Jan 2020 08:59:16 -0800 (PST)
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com. [209.85.221.178])
        by smtp.gmail.com with ESMTPSA id v68sm5480755vkf.20.2020.01.28.08.59.15
        for <linux-mips@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jan 2020 08:59:15 -0800 (PST)
Received: by mail-vk1-f178.google.com with SMTP id y184so3827143vkc.11
        for <linux-mips@vger.kernel.org>; Tue, 28 Jan 2020 08:59:15 -0800 (PST)
X-Received: by 2002:a1f:c686:: with SMTP id w128mr13530554vkf.34.1580230755259;
 Tue, 28 Jan 2020 08:59:15 -0800 (PST)
MIME-Version: 1.0
References: <20191109191644.191766-1-dianders@chromium.org>
In-Reply-To: <20191109191644.191766-1-dianders@chromium.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 28 Jan 2020 08:59:01 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WcjHMzRE0yHm4uRFYj=Zoxz_v1FgiZETOwjzMtkjJcfQ@mail.gmail.com>
Message-ID: <CAD=FV=WcjHMzRE0yHm4uRFYj=Zoxz_v1FgiZETOwjzMtkjJcfQ@mail.gmail.com>
Subject: Re: [PATCH 0/5] kdb: Don't implicitly change tasks; plus misc fixups
To:     Paul Burton <paul.burton@mips.com>,
        Jason Wessel <jason.wessel@windriver.com>,
        Daniel Thompson <daniel.thompson@linaro.org>
Cc:     qiaochong <qiaochong@loongson.cn>,
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
        Andrew Morton <akpm@linux-foundation.org>,
        Will Deacon <will@kernel.org>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Christophe Leroy <christophe.leroy@c-s.fr>,
        =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        LKML <linux-kernel@vger.kernel.org>,
        Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi

On Sat, Nov 9, 2019 at 11:17 AM Douglas Anderson <dianders@chromium.org> wrote:
>
> This started out as just a follow-up to Daniel's post [1].  I wanted
> to stop implicitly changing the current task in kdb.  ...but, of
> course, everywhere you look in kdb there are things to cleanup, so
> this gets a few misc cleanups I found along the way.  Enjoy.
>
> [1] https://lore.kernel.org/r/20191010150735.dhrj3pbjgmjrdpwr@holly.lan
>
>
> Douglas Anderson (5):
>   MIPS: kdb: Remove old workaround for backtracing on other CPUs
>   kdb: kdb_current_regs should be private
>   kdb: kdb_current_task shouldn't be exported
>   kdb: Gid rid of implicit setting of the current task / regs
>   kdb: Get rid of confusing diag msg from "rd" if current task has no
>     regs
>
>  arch/mips/kernel/traps.c       |  5 -----
>  include/linux/kdb.h            |  2 --
>  kernel/debug/kdb/kdb_bt.c      |  8 +-------
>  kernel/debug/kdb/kdb_main.c    | 31 ++++++++++++++-----------------
>  kernel/debug/kdb/kdb_private.h |  2 +-
>  5 files changed, 16 insertions(+), 32 deletions(-)

I noticed that this series doesn't seem to be in linux-next, but I
think it was supposed to target v5.6?  Do you know if there is
anything outstanding or if it'll be queued up sometime soon?

Thanks!


-Doug
