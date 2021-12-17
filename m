Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8328E47929E
	for <lists+linux-mips@lfdr.de>; Fri, 17 Dec 2021 18:16:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239419AbhLQRQ6 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 17 Dec 2021 12:16:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239760AbhLQRQ6 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 17 Dec 2021 12:16:58 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DBC0C061401
        for <linux-mips@vger.kernel.org>; Fri, 17 Dec 2021 09:16:57 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id l22so6021754lfg.7
        for <linux-mips@vger.kernel.org>; Fri, 17 Dec 2021 09:16:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iVGRXJjXTkNbcWgM3Rtn/6//+8cggz0t1cCkyrwrD6E=;
        b=NoFJLqJSh74xV0bvIGodtdU6myPwjLF70BlRz3/lsUs8ymeVI3TX0mW2+g2CbLfFH2
         cMZpyQ8cJXTqfikJpsNjpTY8NKpoDtQ6tbZvFPqpvzLB/8TABVDbxuzQkIDLrXLFzsAf
         LAfOhf4eXOIT2VY2t2w8dAmsw0w0SRzwb73eiKCIIlerc9QRfSGnZV2WoqRehN+f8UxJ
         uqHGeEjQy3R5DIXecq1XiiV1fiAoq80ccCTwetxyKBLo9G5BT4ryA9XZEfInDJLXZP84
         waME57Iu66TjWNfCLrCunB0IcKZxzoZ1+ty2Sni8so9u7ZUkp7YgdnRgV1d7s7aj25RC
         yJpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iVGRXJjXTkNbcWgM3Rtn/6//+8cggz0t1cCkyrwrD6E=;
        b=UOKPHqrhkBzoDvNqEakhto4bEy2QKfNC6eH5heIyvjmNSn19es2OyZoFmgEHtvCOR8
         3Wn27kzpjAlESlumz4p+yJTZZHeGmECV8KvIPnEiNsZj2xodp9GKEDvr6DeQuMJrwp2O
         IIYFvPOXWI4MWtuAeLFcKDWmynYXzR0FLhN+zxu1jB+0/EATSvuU0CNgafPXDAcoNQ+n
         0MH4Gb33qz2WKNnzKIvyWZf2kTo30KVlz2Sz8B96RY2FcDYRuT58AoiWoffl9BaBy9mY
         4GNNkBLCuLRBPXiVgct65urhYUxuiyc69RVgDyN95ptdl6qs7l+8JvHwygAf5tB+kUm+
         eCyQ==
X-Gm-Message-State: AOAM533JAZxeX+j1Uh1NVUKTHG5P5/QDNZAp17PqR+bZg1GcejmKiFUt
        +nPI9gtmF2WLr8REdqw8KLdyw1kOrICUhN/2Ngwjow==
X-Google-Smtp-Source: ABdhPJysvotVxooftGCVk/xDAJQ/AsjHsAYvT9wKfIRHe1I+TbfogcpumOtlivME3YTupY0NEGqA9TacfUf0YlHyD+Q=
X-Received: by 2002:a05:6512:310e:: with SMTP id n14mr3660165lfb.167.1639761415733;
 Fri, 17 Dec 2021 09:16:55 -0800 (PST)
MIME-Version: 1.0
References: <20211207002102.26414-1-paul@crapouillou.net> <CAK8P3a3xfuFN+0Gb694R_W2tpC7PfFEFcpsAyPdanqZ6FpVoxQ@mail.gmail.com>
 <CAJZ5v0jifFWLJgjJywGrjWgE9ZQkjD03rQDHw+4YL-VzkfL1Hg@mail.gmail.com>
In-Reply-To: <CAJZ5v0jifFWLJgjJywGrjWgE9ZQkjD03rQDHw+4YL-VzkfL1Hg@mail.gmail.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Fri, 17 Dec 2021 18:16:19 +0100
Message-ID: <CAPDyKFpfWZsw+7aZdQVsCsTxoEfUqpkZM6Ozfr5COQNNaqhLhA@mail.gmail.com>
Subject: Re: [PATCH 0/5] Rework pm_ptr() and *_PM_OPS macros
To:     "Rafael J. Wysocki" <rafael@kernel.org>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Paul Cercueil <paul@crapouillou.net>,
        Pavel Machek <pavel@ucw.cz>, Len Brown <len.brown@intel.com>,
        Jonathan Cameron <jic23@kernel.org>, list@opendingux.net,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        linux-mmc <linux-mmc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Networking <netdev@vger.kernel.org>,
        Linux PM list <linux-pm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, 17 Dec 2021 at 16:07, Rafael J. Wysocki <rafael@kernel.org> wrote:
>
> On Tue, Dec 7, 2021 at 10:22 AM Arnd Bergmann <arnd@arndb.de> wrote:
> >
> > On Tue, Dec 7, 2021 at 1:20 AM Paul Cercueil <paul@crapouillou.net> wrote:
> > >
> > > This patchset reworks the pm_ptr() macro I introduced a few versions
> > > ago, so that it is not conditionally defined.
> > >
> > > It applies the same treatment to the *_PM_OPS macros. Instead of
> > > modifying the existing ones, which would mean a 2000+ patch bomb, this
> > > patchset introduce two new macros to replace the now deprecated
> > > UNIVERSAL_DEV_PM_OPS() and SIMPLE_DEV_PM_OPS().
> > >
> > > The point of all of this, is to progressively switch from a code model
> > > where PM callbacks are all protected behind CONFIG_PM guards, to a code
> > > model where PM callbacks are always seen by the compiler, but discarded
> > > if not used.
> > >
> > > Patch [4/5] and [5/5] are just examples to illustrate the use of the new
> > > macros. As such they don't really have to be merged at the same time as
> > > the rest and can be delayed until a subsystem-wide patchset is proposed.
> > >
> > > - Patch [4/5] modifies a driver that already used the pm_ptr() macro,
> > >   but had to use the __maybe_unused flag to avoid compiler warnings;
> > > - Patch [5/5] modifies a driver that used a #ifdef CONFIG_PM guard
> > >   around its suspend/resume functions.
> >
> > This is fantastic, I love the new naming and it should provide a great path
> > towards converting all drivers eventually. I've added the patches to
> > my randconfig test build box to see if something breaks, but otherwise
> > I think these are ready to get into linux-next, at least patches 1-3,
> > so subsystem
> > maintainers can start queuing up the conversion patches once the
> > initial set is merged.
> >
> > Reviewed-by: Arnd Bergmann <arnd@arndb.de>
>
> Patches [0-3/5] applied as 5.17 material.
>
> The mmc patches need ACKs, but I can take them too.

Sure, please add my ack for them!

Kind regards
Uffe
