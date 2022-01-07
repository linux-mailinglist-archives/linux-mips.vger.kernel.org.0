Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A55F6487B18
	for <lists+linux-mips@lfdr.de>; Fri,  7 Jan 2022 18:12:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348484AbiAGRMN (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 7 Jan 2022 12:12:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240466AbiAGRMN (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 7 Jan 2022 12:12:13 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0524C061746
        for <linux-mips@vger.kernel.org>; Fri,  7 Jan 2022 09:12:12 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id j11so17855111lfg.3
        for <linux-mips@vger.kernel.org>; Fri, 07 Jan 2022 09:12:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=hsyXsxtBZEcruNE0RSBDpIO6UfRz2bkT6mcQH0TCHag=;
        b=JedtYuO2MBL/Jq63d8Dpm5ZGe9pdlriNG20Z9JXbiXhAGT2T1eosIqxH+SrokNeZ41
         9XdXy/0ssc8O5/QBN3AWwRqY1SNx9QWp0s08dyv92POQAOPFJ5GJzbglguXPwq8Q81uf
         wXzTM6hkENstyjHcvgZJZuXh60y3kQH3sIZDlN2ATWFy+XFGH6nyOYqRiH8B7Nm2EBz5
         JKlkxvBPsWG8Y+gWYWZyQrUGbDfIpsIZVnrvdk8bSwZlKoCG1TPcTKigjDCu657OUyf9
         hUQxxyMpGVJiBU+GmokUpYUsSBLdPm/8bNzEiTF7adWaKZdTzMy8j0lCGwhMMo+0KmKO
         j4zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=hsyXsxtBZEcruNE0RSBDpIO6UfRz2bkT6mcQH0TCHag=;
        b=cvzu4m5Uf6d9V/qGcdbMGi40QNBNPLHyNhWSpdVAdD33ncZ7kSwsGzYJevPdOJH8+f
         VKltekuNvE8A5mh9Bxu4zUXesVEV8/ps/xy2SsUvHtkiDQLAt5oopeDvuuV4dq9uStUR
         439kGl1A9PKoaJMZ7j0wqKrUmx6xutuX2gGbMW1MWWB2RyDgs4bJscNOhYryWX1uq4T2
         FtoqSFnYkCgCLAh7HWOqyZGBawdAKhrCGgwX2lAQ8QnSN8B4oKXndvKvv7s/yLVZISBL
         qnkw8PGDbY3FVUTz1X16+frqPOa3TViDkZJ5942IeD+RCewE1R1SaMnMWMPUygSbxkCg
         gfqw==
X-Gm-Message-State: AOAM530Q3vGc18cuO85kZxb0Z6GAir6KezRbvu+ZPUGtdETn2E1/62aL
        afV0NZnzZnNmPK5SMG98wAz2d9tSqcJWq59KlALdzg==
X-Google-Smtp-Source: ABdhPJzE30DbulawhWiCujkHtN/T2lniSHQIt33HGVagdBHXpBynwjYjWgZOH4SOHIPIVmb+1kFlNRu6ksu6c+EqOVc=
X-Received: by 2002:a05:6512:3bb:: with SMTP id v27mr54814798lfp.71.1641575530922;
 Fri, 07 Jan 2022 09:12:10 -0800 (PST)
MIME-Version: 1.0
References: <20220105182939.106885-1-paul@crapouillou.net> <20220105182939.106885-4-paul@crapouillou.net>
 <CAPDyKFpUUPzqonNBrFq68h8QOVxardvf2q7AuEQVeUJ-S2726A@mail.gmail.com> <PGMC5R.ZEUF4DPAECD7@crapouillou.net>
In-Reply-To: <PGMC5R.ZEUF4DPAECD7@crapouillou.net>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Fri, 7 Jan 2022 18:11:34 +0100
Message-ID: <CAPDyKFod5nxW2dG1_a9WyEb2UNJW+OzyS411+9nVYxUOiP6iMg@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] PM: core: Add EXPORT[_GPL]_SIMPLE_DEV_PM_OPS macros
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     "Rafael J . Wysocki" <rafael@kernel.org>,
        Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>, Len Brown <len.brown@intel.com>,
        Pavel Machek <pavel@ucw.cz>, list@opendingux.net,
        linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-pm@vger.kernel.org,
        Jonathan Cameron <jonathan.cameron@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, 7 Jan 2022 at 17:43, Paul Cercueil <paul@crapouillou.net> wrote:
>
>
>
> Le ven., janv. 7 2022 at 17:33:04 +0100, Ulf Hansson
> <ulf.hansson@linaro.org> a =C3=A9crit :
> > On Wed, 5 Jan 2022 at 19:30, Paul Cercueil <paul@crapouillou.net>
> > wrote:
> >>
> >>  These macros are defined conditionally, according to CONFIG_PM:
> >>  - if CONFIG_PM is enabled, these macros resolve to
> >>    DEFINE_SIMPLE_DEV_PM_OPS(), and the dev_pm_ops symbol will be
> >>    exported.
> >>
> >>  - if CONFIG_PM is disabled, these macros will result in a dummy
> >> static
> >>    dev_pm_ops to be created with the __maybe_unused flag. The
> >> dev_pm_ops
> >>    will then be discarded by the compiler, along with the provided
> >>    callback functions if they are not used anywhere else.
> >>
> >>  In the second case, the symbol is not exported, which should be
> >>  perfectly fine - users of the symbol should all use the pm_ptr() or
> >>  pm_sleep_ptr() macro, so the dev_pm_ops marked as "extern" in the
> >>  client's code will never be accessed.
> >
> > How common is it to export the dev_pm_ops? Do we really need a macro
> > for this?
>
> $ rgrep EXPORT_SYMBOL drivers/ |grep pm_ops |wc -l
> 44
>
> That should be enough to justify a macro.

Yep, certainly! I will take a closer look beginning next week.

[...]

Kind regards
Uffe
