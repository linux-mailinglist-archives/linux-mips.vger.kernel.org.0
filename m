Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EEF3A1B0656
	for <lists+linux-mips@lfdr.de>; Mon, 20 Apr 2020 12:14:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726109AbgDTKOv (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 20 Apr 2020 06:14:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726025AbgDTKOu (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Mon, 20 Apr 2020 06:14:50 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D81AC061A0C;
        Mon, 20 Apr 2020 03:14:49 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id r14so4725926pfg.2;
        Mon, 20 Apr 2020 03:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+plp5dslqkbN+jJKI4p9ucxk+mSNWrqMV1KZLrKDu8E=;
        b=m9/NpKD3YMhtt1l8zNAhqW7YCnAg0vuezB4FcJjBiW0qtvgfYxDE8Q+jH26Che+j09
         WIiar7jYNanQupQd41XmtOfKeb6r28kYQKdmiNBRV0NGpAjyGHWYazLmy0LhvSRtG7VN
         F/EYszmDw8mDmw/UL6hH7uM4Z2xWXP8/jMBVVAeyRk4hPBRLlBoF/zj+XzzRf3LFLIJc
         jRVwT7FgZTBNkxmx3j/36B68OKh/Ohr8aJ4+amz189J4w+rKjuS7VI8bO2jDK465A/qP
         YyUi8XJGibpb/IY1phIMWcFWNIt2JoWTdMiP6PUoYsPXcR53zk5yYxQCgX5G/4jFgU9Z
         R3bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+plp5dslqkbN+jJKI4p9ucxk+mSNWrqMV1KZLrKDu8E=;
        b=LU5PwF+6Gg/WrxmaDCiTNgb5lFVMxYdVAajDfxQ/nWLkDDrLZKzgUiYFVj072q2/9i
         SL4NlaagTJO23t7rl5Z940INTDX6AZq0FWn6+uMXNdwP9uDJ0lg+YFFKP2CmdH0RD0wX
         Gg7kz9ALt7k4jG4hJdvQV6isuXoQhOrdKueUy2ms4X2mBLVNZMgfsLvOMDkxzlACbpVY
         kGpczgHxlhjURJD9nVHRUKtQgEvn2immxTQiBrY+NDwkXM57oLnOjSbQhPmSyZ8VxUe5
         sWlIKRckYIc8uO1LhdvBYbjYc/lbgHfVuKn+wRK6JzR+2dzME8pP35J6QZ3whMCqUhsR
         29gw==
X-Gm-Message-State: AGi0PuY6QMeQ59IUcCB6nE4m5N1qIHWgBO6uNRuCyvdoqcTCsXMXjWas
        QM6WGNDe8lSp83Vm3EUgL5DoFI5CPNCsq9zvLck=
X-Google-Smtp-Source: APiQypL5JJh3lWpj0tF/H74qWnVXLQrlL9upOg621u5MaM3c0nHwfxf/sSiqTVj423joY+7ivzMJipVARFeU3GeIT9M=
X-Received: by 2002:aa7:8f26:: with SMTP id y6mr16420099pfr.36.1587377688814;
 Mon, 20 Apr 2020 03:14:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200417082147.43384-1-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200417082147.43384-3-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200418105533.477ce529@collabora.com> <20200419222040.GJ185537@smile.fi.intel.com>
 <20200420111754.5863324b@collabora.com> <CAHp75VeOH+DC362tsEo13gr9fJpeCHXok=7O19B3njbxCOzd2A@mail.gmail.com>
 <20200420115256.3a0ff647@collabora.com>
In-Reply-To: <20200420115256.3a0ff647@collabora.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 20 Apr 2020 13:14:42 +0300
Message-ID: <CAHp75Vfp_WYNR8kHVsSVumGzuVbGEGpAjfXVvJAV7t6zXXY+HA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] mtd: rawnand: Add NAND controller support on Intel
 LGM SoC
To:     Boris Brezillon <boris.brezillon@collabora.com>
Cc:     Andy Shevchenko <andriy.shevchenko@intel.com>,
        "Ramuthevar,Vadivel MuruganX" 
        <vadivel.muruganx.ramuthevar@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:MEMORY TECHNOLOGY..." <linux-mtd@lists.infradead.org>,
        devicetree <devicetree@vger.kernel.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh R <vigneshr@ti.com>, Arnd Bergmann <arnd@arndb.de>,
        Brendan Higgins <brendanhiggins@google.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Anders Roxell <anders.roxell@linaro.org>,
        masonccyang@mxic.com.tw, piotrs@cadence.com,
        Rob Herring <robh+dt@kernel.org>, linux-mips@vger.kernel.org,
        "hauke.mehrtens" <hauke.mehrtens@intel.com>, qi-ming.wu@intel.com,
        cheol.yong.kim@intel.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Apr 20, 2020 at 12:53 PM Boris Brezillon
<boris.brezillon@collabora.com> wrote:
> On Mon, 20 Apr 2020 12:44:51 +0300
> Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
>
> > On Mon, Apr 20, 2020 at 12:21 PM Boris Brezillon
> > <boris.brezillon@collabora.com> wrote:
> > > On Mon, 20 Apr 2020 01:20:40 +0300
> > > Andy Shevchenko <andriy.shevchenko@intel.com> wrote:
> > > > On Sat, Apr 18, 2020 at 10:55:33AM +0200, Boris Brezillon wrote:
> > > > > On Fri, 17 Apr 2020 16:21:47 +0800
> > > > > "Ramuthevar,Vadivel MuruganX"
> > > > > <vadivel.muruganx.ramuthevar@linux.intel.com> wrote:
> > > > >
> > > > > > From: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
> > > >
> > > > > > +static const struct of_device_id lgm_nand_match[] = {
> > > > > > + { .compatible = "intel,lgm-nand", },
> > > > > > + {}
> > > > > > +};
> > > > > > +MODULE_DEVICE_TABLE(of, lgm_nand_match);
> > > > >
> > > > > You probably have a missing "depends on OF" in your Kconfig.
> > > >
> > > > Since it's using device property API, dependency is not needed.
> > > >
> > >
> > > There's no compile-time dependency, but this driver will be pretty
> > > useless if all its users have the NAND controller node defined in their
> > > DT and CONFIG_OF is not enabled.
> >
> > No, it's not.
> > See [1] for the details how ACPI may utilize this table.
> >
> > [1]: https://www.kernel.org/doc/html/latest/firmware-guide/acpi/enumeration.html#device-tree-namespace-link-device-id
>
> Except the NAND framework does use the OF lib when parsing common DT
> properties (like nand-ecc-mode, etc), so it does depend on OF if you
> want those props to be parsed, which, according to the DT binding patch,
> is the case.

I see, so, NAND framework can be transformed at some point. In any
case, from driver perspective it's OF independent.

-- 
With Best Regards,
Andy Shevchenko
