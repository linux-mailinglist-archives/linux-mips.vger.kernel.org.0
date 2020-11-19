Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F3A82B8F19
	for <lists+linux-mips@lfdr.de>; Thu, 19 Nov 2020 10:41:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726906AbgKSJfu (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 19 Nov 2020 04:35:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726781AbgKSJfu (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 19 Nov 2020 04:35:50 -0500
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com [IPv6:2607:f8b0:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19717C0613CF;
        Thu, 19 Nov 2020 01:35:50 -0800 (PST)
Received: by mail-ot1-x344.google.com with SMTP id n89so4686593otn.3;
        Thu, 19 Nov 2020 01:35:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wM+ecfsKrvO3rc1/geqb60FiAxjMBeRileH+PC0H49Y=;
        b=ZrL/jWDo+iFZh4HMoSucR3OspDcVXtUCX0SnrbDlA3+pS+5pP2E5Ma4ZKNV7090uiO
         ygn2eGrRc7DSi/F9Z6WMx1xsrPhzGu5Ihulp7YPeA0sGulwwJUckXM7oS5WEzAjSucmi
         b8+58YZezQiRbq8KG3yYzvc2jbOqMxmknF8NXj8hUnpk1OoQhOmNA5LRbPW0+S3B4o26
         gtnYedDZVsTfTx93Ehd8jsMXSB3FjktBifq81Gk7Q3THOMW6ajd6o5GXJ4BmVTRQ9z9F
         78Y3OSGwz5nD+E6oUGEvDjf2j8gYUsKq6snE7tPRtGl5S1PIjy/ONVIlpuuTguWL452R
         SjRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wM+ecfsKrvO3rc1/geqb60FiAxjMBeRileH+PC0H49Y=;
        b=ZC/F3dOS4mjWKJJ+PWcd4fQLVg8SFHXZZlbTQSv3AW5UyQfg8lacsA1s2GMT3dYRuO
         EmnCDt/CMw7oZQWvLFCD+RdZILHDmsgGdab1xYvBloVOKOo8Ptb4EeF9VfUiOPDZNZ7W
         x4bZSVtADcY0nVJK7sMR1K7k/JcKPF29b2o72lQktdiDybk7vwK8aavHfL7m85UfSb2x
         WRoo+IcNr2RIugLiWScxWsV6TGQakO2JG26aUUAXF0ytSpTOpVlHIsOAzd60YEZyeebh
         lQ/o2/GfVhOCv7Xi9xwJqMg7Zul5kO891il4stljlx2tCIVgRkovceYfkcfBxsk1dj8T
         SqBA==
X-Gm-Message-State: AOAM532UT2D9BH0SDg3I4Lg0qhiPH31yk0n5crb0ed4qqudIbD5i7LBC
        SXKhjQHADSgSJ+5hDjaWq3YJrAbEENS8IvlkizU=
X-Google-Smtp-Source: ABdhPJykfMo2H23O1RLI3nZpHLSywArPKNbXytZU480c48TgWX4LYj4Md4b3bFUcty22u9/7rLAhNFml78/iIJqE6lU=
X-Received: by 2002:a9d:4704:: with SMTP id a4mr9303980otf.236.1605778549518;
 Thu, 19 Nov 2020 01:35:49 -0800 (PST)
MIME-Version: 1.0
References: <20201113154632.24973-1-sergio.paracuellos@gmail.com>
 <20201113154632.24973-4-sergio.paracuellos@gmail.com> <CAJsYDVL1ZYc=OaCS7_NNu27aUKmpHp63nPuVq1V8xp8s6Vguxw@mail.gmail.com>
In-Reply-To: <CAJsYDVL1ZYc=OaCS7_NNu27aUKmpHp63nPuVq1V8xp8s6Vguxw@mail.gmail.com>
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date:   Thu, 19 Nov 2020 10:35:38 +0100
Message-ID: <CAMhs-H8axFToyEYUwtc1ZGMd9mOb3ixnha_trJ7C5yFz06xdbQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] clk: ralink: add clock driver for mt7621 SoC
To:     Chuanhong Guo <gch981213@gmail.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        John Crispin <john@phrozen.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Weijie Gao <hackpascal@gmail.com>, jiaxun.yang@flygoat.com,
        "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        "open list:STAGING SUBSYSTEM" <devel@driverdev.osuosl.org>,
        NeilBrown <neil@brown.name>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi,

On Thu, Nov 19, 2020 at 10:32 AM Chuanhong Guo <gch981213@gmail.com> wrote:
>
> Hi!
>
> On Fri, Nov 13, 2020 at 11:46 PM Sergio Paracuellos
> <sergio.paracuellos@gmail.com> wrote:
> > [...]
> > diff --git a/drivers/clk/ralink/Makefile b/drivers/clk/ralink/Makefile
> > new file mode 100644
> > index 000000000000..cf6f9216379d
> > --- /dev/null
> > +++ b/drivers/clk/ralink/Makefile
>
> Why ralink? The clock design of mt7621 doesn't seem
> to be part of ralink legacy stuff, and ralink is already
> acquired by mediatek anyway.
> I think it should be put in drivers/clk/mediatek instead.

I don't really know. It seems in that directory only arm arch related
code from mediatek is included... but let's see what other people
think about this.

>
> --
> Regards,
> Chuanhong Guo

Best regards,
    Sergio Paracuellos
