Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4AD53DA022
	for <lists+linux-mips@lfdr.de>; Thu, 29 Jul 2021 11:15:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234886AbhG2JPp (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 29 Jul 2021 05:15:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235197AbhG2JPo (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 29 Jul 2021 05:15:44 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC5D2C061765
        for <linux-mips@vger.kernel.org>; Thu, 29 Jul 2021 02:15:41 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id y12so7230182edo.6
        for <linux-mips@vger.kernel.org>; Thu, 29 Jul 2021 02:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hev-cc.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HJEWXYf+MLVoeyVL4aKf9RaWEeEr+d0jCBcU4Hehaxo=;
        b=AnEg2zJa2HgclUb2HGoxq7v2MTCXHykSvoYQd/HK1CtNl+LbKX5si0F7hlBYlNCsc/
         A1Hcib63x2knKIYHDoRtEmSTeNiNXCAcX6o0glPWsC5hscrxnQmerV2Ou3Gdxkin36ZS
         ZsBEITmnal1ahnz+TC0JkduwhgHOukSSdZv7yhNBQR1zlb0edkI0N5M38xv+Rh2EX5KR
         9Svw0ABIwdcXxPHHm/VwCuhnfnkySVumKny0DHdH7wobRKZA8EEe9CBAYJafaIXtSamj
         JbUxQPcw9j4dtrcofRZclrSwjtbFGk7rK5BYzpD3CidKNrqQqEjFjBbYDfq5Y7vCQP5z
         HI5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HJEWXYf+MLVoeyVL4aKf9RaWEeEr+d0jCBcU4Hehaxo=;
        b=MhRVFCEgKCqGkXUrCGBoEGDmIrJkldxrERsZv8TfA5cVXXGZFAu82pijw74rxmC+1u
         dnFrun0sFnYTj9jJm2SPfpwkpQLSBI9ftzECRlAtzbuLliyKiF1RHeS5gm0eNhZd3zjv
         Nc1QhP7VTbFlVFgJ+CYRrLawBmVZonCP7ep/cNH8ADwg+320WI9bXaq5Y8lADmEHryf+
         tml7RSRldPsv+1AG9tTMxodHN7+GxPoEVxsYR1XiH2d4Clv2JeaxKrU8Ul5+sZa3z8vL
         SWt9XdOABH2ziyneX55EHmkqV8pa7wOjn+Py3+msKlEEd8mLpf7PJKvAUsVpuGuZ4otU
         AyoQ==
X-Gm-Message-State: AOAM532Iaq7NNFcCZ+dAMLdoahuTKpbBmtTdJweW99u5JQ0L1fc5Z1LA
        xHjCUSK++m8d59BBBmOFVYaB+tG5pMZJVm5ve7YQtg==
X-Google-Smtp-Source: ABdhPJzGO5ZEDGWNIfoyBnRz2S9+ImksyNVrhgBKmRynSisfodXh4WyTGC9T8Thgtd3CToxg9p1mCZgsHir6qf9QKZo=
X-Received: by 2002:a05:6402:cab:: with SMTP id cn11mr4706255edb.369.1627550140422;
 Thu, 29 Jul 2021 02:15:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210729082549.144559-1-wangrui@loongson.cn> <YQJu6fTIpeuGV+UX@boqun-archlinux>
In-Reply-To: <YQJu6fTIpeuGV+UX@boqun-archlinux>
From:   hev <r@hev.cc>
Date:   Thu, 29 Jul 2021 17:15:29 +0800
Message-ID: <CAHirt9j2G62=7_a4Ow88smnRzOjKMkD1WQoj4uc=mQq9Qf8UFQ@mail.gmail.com>
Subject: Re: [RFC PATCH] locking/atomic: arch/mips: Fix atomic{_64,}_sub_if_positive
To:     Boqun Feng <boqun.feng@gmail.com>
Cc:     Rui Wang <wangrui@loongson.cn>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Peter Zijlstra <peterz@infradead.org>,
        Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi, Boqun,

On Thu, Jul 29, 2021 at 5:04 PM Boqun Feng <boqun.feng@gmail.com> wrote:
>
> Hi,
>
> On Thu, Jul 29, 2021 at 04:25:49PM +0800, Rui Wang wrote:
> > This looks like a typo and that caused atomic64 test failed.
> >
> > Signed-off-by: Rui Wang <wangrui@loongson.cn>
> > Signed-off-by: hev <r@hev.cc>
>
> In your upcoming patches, please change this part to your real name.
> Here is a quote from Documentation/process/submitting-patches.rst:
>
>         using your real name (sorry, no pseudonyms or anonymous contributions.)
Ok, got it. :-)

Thank you. I will resend these patches.

Regards
Rui
