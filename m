Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED5482B1592
	for <lists+linux-mips@lfdr.de>; Fri, 13 Nov 2020 06:33:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726156AbgKMFdJ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 13 Nov 2020 00:33:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726071AbgKMFdI (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 13 Nov 2020 00:33:08 -0500
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com [IPv6:2607:f8b0:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82FE2C0613D1;
        Thu, 12 Nov 2020 21:33:07 -0800 (PST)
Received: by mail-oi1-x244.google.com with SMTP id m143so9238788oig.7;
        Thu, 12 Nov 2020 21:33:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rzpHxVwtYfPNR5m+0xd40O02SiyxGAAISovudBzR/vE=;
        b=h86+nsdjF93+wDYVtajUVNvY26hefcNO04S+d0kH+aiRUmxn58HcQx5GtgRzTOZZg7
         qtXZbq4JpNzvvjKAnjgzcujlx+yLhKxWysKxVUHdj9hcYpjHiwcYjfITQyblfLCd8BL2
         d2bOfs2FEkwNBZGGGDYwInbsQp8GwLNv+BTmQ7vmL0XGShcy94/3LcblWZu0yr2DAOYm
         CAdnXuF54D7OuqAweTnyGlQhL7UMhXNdlcLjUWtg9CAtMYEqIn97G286HoczEHADNb/+
         Leez1Sjob23y065wvBBKLehx4xhenW1CRkTCIzUZPa5aEFxJZX7x8ZLRUiAQpQiODjwe
         mk9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rzpHxVwtYfPNR5m+0xd40O02SiyxGAAISovudBzR/vE=;
        b=Bn/v+Mf6rjUSU0EBKfgmtm2nh7RNdWINZ+Qq71ndnV/ftibuqZzivcECsyx56PMmfc
         NNU6nWGHm8OwyJhxYTJJ9ghdpHUBT1RwtYLeGprrwg1o+Wnlxsky+C8Vt8fLlgmYr8GW
         K17UieQuUqf4I2phT3NpaNamtXoHCfMg9AXLTfrzdvLNe3XvrFgHCIktiZDjjp9P/tFW
         JKfPc8VS+RFjfX/n585S66PNF93KAVtlXys14Uao9Vhfux49T80zYbiQeNMM3U4m2GdX
         j6G2QWexS8WX07DeVxUiIhvMEQse5dkfkWaxUUshklzLBB7Uhczy162LXboxpptMywvg
         usQw==
X-Gm-Message-State: AOAM530hFQMus66crlDaEzYA6pIG2zwT1gSI9Y6x+JLU4r8GXbs6MLgZ
        a8BEz97Y+WX3YqDcMSVZFV6RStaly2la+tW6Fzw=
X-Google-Smtp-Source: ABdhPJzvDqnz5H8slcSClxUbBKekqGkSOvIRf7i1k5l9QQ/+KRmv33DpeSYtc0XvtPH09vHjxxEa5wSlnHz8GOQH1sA=
X-Received: by 2002:aca:f407:: with SMTP id s7mr377123oih.23.1605245587028;
 Thu, 12 Nov 2020 21:33:07 -0800 (PST)
MIME-Version: 1.0
References: <20201111163013.29412-1-sergio.paracuellos@gmail.com>
 <CAJsYDVJtPqd-aPjJZFC76R2fbv1i=tVzRR7S1VFAMzp1QcPbiQ@mail.gmail.com>
 <CAJsYDVKWuygjbBErQt1B5XD8Bp06-TdrziBzDdYmMGhU_8X-aA@mail.gmail.com>
 <CAMhs-H85RCK=a_y+fVm-oR3hOEfr=rtVcLvX09YH4F65enz3oA@mail.gmail.com> <CAJsYDV+Gm-0HpvE7W8iG=t5JT+whrQjerRUT65eXxv2av9160A@mail.gmail.com>
In-Reply-To: <CAJsYDV+Gm-0HpvE7W8iG=t5JT+whrQjerRUT65eXxv2av9160A@mail.gmail.com>
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date:   Fri, 13 Nov 2020 06:32:55 +0100
Message-ID: <CAMhs-H_qFpVv3KK5Bc4igrj7VffZSmAAT=sM8PSyY7H0-SV1yg@mail.gmail.com>
Subject: Re: [PATCH 0/7] MIPS: ralink: add CPU clock detection and clock gate
 driver for MT7621
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
        "open list:STAGING SUBSYSTEM" <devel@driverdev.osuosl.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Nov 13, 2020 at 1:40 AM Chuanhong Guo <gch981213@gmail.com> wrote:
>
> On Thu, Nov 12, 2020 at 1:23 PM Sergio Paracuellos
> <sergio.paracuellos@gmail.com> wrote:
> >
> > To avoid weird behaviour because of some drivers are
> > not using properly clocks we have the CLK_IGNORED_UNUSED, which as you
> > can see is currently being used in my code. Using that all seems to
> > work as expected as it is now.
>
> The whole point of having a clock gate driver is to gate unused
> clocks to save (maybe a tiny bit of) power. It's other peripheral
> drivers' fault that it doesn't enable clocks properly and we shouldn't
> just work-around the problem in the clock driver by disallowing auto
> clock gating.
>

Totally agreed with what you are saying here but I don't really think
using the flag is a workaround. It is just a way to ensure no
regressions occurred until all drivers are adapted and also having all
of them enabled is the behaviour. For me adapt the rest of driver code
 should be a different patch set after this driver is properly
finished and mainlined.

> --
> Regards,
> Chuanhong Guo

Best regards,
     Sergio Paracuellos
