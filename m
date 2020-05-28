Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 871BE1E62D6
	for <lists+linux-mips@lfdr.de>; Thu, 28 May 2020 15:52:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390558AbgE1NwK (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 28 May 2020 09:52:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390577AbgE1NvP (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 28 May 2020 09:51:15 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30A13C08C5C8;
        Thu, 28 May 2020 06:51:15 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id ci21so3222588pjb.3;
        Thu, 28 May 2020 06:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=B1VCJJnYQntCaHq/bCL7ytqI8GL57Z8GxGPvzlNy5Jc=;
        b=uL9UixqSt756rdZNvsXFJYNS/zS3+QPBkXCGeFXy4x6t+XA9XbJ2XVnjXZAAvNvkFW
         c8cz8lKeHjYMTUWtCapDDRequ0hWqOuD0QafNpbd/2mH4ksrf7d/c8VN7fTtJqq/aWl2
         rkDyVyzu0odHs3b4u1bK+EQHgFYPDnAawqVFwIVA9VBtNXpAa5SoNF0xSkPfCgvNF7X4
         o3nqEPbKOleJVPrF0ywx7WG+RP6x5UjnLGJjpuimqu+oc2R/0bwkUGwfpA3vXGMdhOjS
         2UmgwSXRZxxdJRiDyc3iwSyhGev1KyoWu5nzNCsWvRN0G0gqaJFOU6IQhp64I3+dQEey
         aSlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=B1VCJJnYQntCaHq/bCL7ytqI8GL57Z8GxGPvzlNy5Jc=;
        b=E0pUiAHMpLLMtCzzyvoSjR3TPx0AkmrCsJJSjgF3ULtyQLnL/zqsr5yAgGtuJgOGAl
         5+IuPmX7due+4hwqImSc3qwEVSK0FQEXRQ3G+g+dL+o/rBmnJkVfbl4qx7cVYmRnrHie
         nHjsxNpcZfwFz39x2FZVK6zGhZZD1Sq6F5JFi9re8WMIgzxnTOEFp4o9alfdQtOKuf2u
         kew5mH647L+L98XxCUkBXwqBJMD0PxW4a99uki5lcpqEurTAzwnMpE6bTyVTt6nHmmwp
         +qaEXnvUd+XnQMqFkGMClJmuFBK6Qw88Cbsistxifjt5CyNLT8j4AzBCoP9j+jV0hLOh
         6etA==
X-Gm-Message-State: AOAM530v5F9HiwiD9v9kOC1+/fbw3TelwkdF88DYK2mJUU8ZEyoFIwcp
        c7ELtvbQngRqxqy0BBn06xrvmOpsoUnt2VXOcgE=
X-Google-Smtp-Source: ABdhPJyOPrVNPIxx9eAv48xneIkt1SACLcGfOZUeXikQzCHe7fIw9bajSfsIbkfCgstMRCZRJ9nAWtuKZ74GlGhw1A4=
X-Received: by 2002:a17:90b:3651:: with SMTP id nh17mr4030548pjb.228.1590673874690;
 Thu, 28 May 2020 06:51:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200526125928.17096-1-Sergey.Semin@baikalelectronics.ru>
 <20200526125928.17096-5-Sergey.Semin@baikalelectronics.ru>
 <CAHp75VcfkPPy5YjNrcv8c6doyQz5C47QyREE0v6tfQjXYrBijQ@mail.gmail.com> <20200528134046.scxig3she3wyjyko@mobilestation>
In-Reply-To: <20200528134046.scxig3she3wyjyko@mobilestation>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 28 May 2020 16:51:03 +0300
Message-ID: <CAHp75VfqnLTK-fT-KdzN-3=u=dLTJjo=9+b=oKXUoUOsbeg00Q@mail.gmail.com>
Subject: Re: [PATCH v3 4/6] bus: Add Baikal-T1 AXI-bus driver
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     Serge Semin <fancer.lancer@gmail.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Paul Burton <paulburton@kernel.org>,
        Olof Johansson <olof@lixom.net>,
        Rob Herring <robh+dt@kernel.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "soc@kernel.org" <soc@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, May 28, 2020 at 4:40 PM Serge Semin
<Sergey.Semin@baikalelectronics.ru> wrote:
>
> On Thu, May 28, 2020 at 01:00:57AM +0300, Andy Shevchenko wrote:
> > On Tuesday, May 26, 2020, Serge Semin <Sergey.Semin@baikalelectronics.ru>
> > wrote:
> >
> > > AXI3-bus is the main communication bus connecting all high-speed
> > > peripheral IP-cores with RAM controller and MIPS P5600 cores on Baikal-T1
> > > SoC. Bus traffic arbitration is done by means of DW AMBA 3 AXI
> > > Interconnect (so called AXI Main Interconnect) routing IO requests from
> > > one SoC block to another. This driver provides a way to detect any bus
> > > protocol errors and device not responding situations by means of an
> > > embedded on top of the interconnect errors handler block (EHB). AXI
> > > Interconnect QoS arbitration tuning is currently unsupported.
> > > The bus doesn't provide a way to detect the interconnected devices,
> > > so they are supposed to be statically defined like by means of the
> > > simple-bus sub-nodes.
> >
> >
> >
> > Few comments in case if you need a new version. Main point is about
> > sysfs_streq().
>
> Hello, Andy. Thanks for your comments. I'll address most of them in a follow-up
> patches. See just one note below.
>
> >
> >
> > > Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> > > Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
> > > Cc: Paul Burton <paulburton@kernel.org>
> > > Cc: Olof Johansson <olof@lixom.net>
> > > Cc: Rob Herring <robh+dt@kernel.org>
> > > Cc: linux-mips@vger.kernel.org
> > > Cc: soc@kernel.org
> > > Cc: devicetree@vger.kernel.org
> > >
>
> [nip]
>
> > > +
> > > +static void bt1_axi_clear_data(void *data)
> > > +{
> > > +       struct bt1_axi *axi = data;
> > > +       struct platform_device *pdev = to_platform_device(axi->dev);
> > > +
> > > +       platform_set_drvdata(pdev, NULL);
> >
> >
>
> > Doesn't device driver core do this already?
>
> It doesn't on remove.

__device_release_driver() calls dev_set_drvdata(dev, NULL);
What did I miss?

> This cleanups the drvdata pointer when the driver is
> unloaded at the moment of remove() callback calling. This is a good
> practice to leave the device the same as it has been before usage including
> the pointer value. In this case if theoretically someone (though very
> unlikely, but anyway) would try to use the pointer without having it
> initialized, the NULL-dereference would pop up, otherwise we may
> corrupt someones memory, which is very nasty.

The above is right and I agree with.

-- 
With Best Regards,
Andy Shevchenko
