Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE1CF1B05E0
	for <lists+linux-mips@lfdr.de>; Mon, 20 Apr 2020 11:45:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725896AbgDTJpD (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 20 Apr 2020 05:45:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725773AbgDTJpD (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Mon, 20 Apr 2020 05:45:03 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73168C061A0C;
        Mon, 20 Apr 2020 02:45:03 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id w3so3754106plz.5;
        Mon, 20 Apr 2020 02:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=F+XcpZEsWmJmu2jfdAwkWGI+jCZB3DGbfi1Ga2IHxyw=;
        b=qk9faXpZk6XzibVEOfRwfbql5CkYatmcsjpMfy17YSRMgeX3bsV3d2wgOfAfpn0qaO
         +WBgB26ZaTXwc/7dURZ/bzbWGQWG5fhoiOIek0NChA7C7S1Kfj3LtRywiYIRlGUhJgQc
         mlq2GgSqxDURI2sRh9xoWJHJwCZGtpUFDEfULO071x4l3IHQFRO6ecthNnD/kJppcVh2
         4c5famVIPqEKQPz+nzL2hWZ2Q2ajrLwfKTL48d4E8fjD1I8XMjvSDL7UaTJqNTLG2AfE
         8BHx5wlo3NsAKjGOLwBYq6QVC3nLlh2qSUXkKQ8jhDHViItBU2Zgj0c9adzu8r7HE1lO
         L1Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=F+XcpZEsWmJmu2jfdAwkWGI+jCZB3DGbfi1Ga2IHxyw=;
        b=XtyQ/fXK0XcCFqssiowZg46seiZtZqZA+iipySfvy1ZE0SvG2k3s6eXSeyOF90/AYf
         /d4sOJ/7tNGkszmqkgqeNqx4x47iFwn3CZm4X/owqHDziMtX2Y0vCBdOvDYJgALtIpZS
         XVmJgS9M7rGKAL/EDPV9D1fUpnolshhFfKVNcnSk95BU2Gx2pmeuZGQC5L3DQPjIHmut
         O3FoN22uQzs0yQJw6tw4OA+p/emqxCIpIgr930df6ssU6i83L07mHOPZDCMKjZa6SXmd
         Kf4qZg+p9GQM4+vTUn/HEI3t7wyQZ4hdgoFBCcia9gAS3bW6AZU4OK4mgZVgt6l6QI1Z
         UkKQ==
X-Gm-Message-State: AGi0PuYqiuWKeJ1rA7R65Rdnu6A7KdNat9JXRxEuX6UuOTaaibg4dC75
        mRSGhqLVNvbrIXBwyF3egdBLxSqCXfA/j9fPIK0dQTZYoWmTAQ==
X-Google-Smtp-Source: APiQypKR5OqIb6o/nxyC3oiRNXPMjBFOmxp17fC3wElumd+N26CQvbwy/RWCvQ4QNO5kpA2YngvLzkAWC7YTfQznbM8=
X-Received: by 2002:a17:902:9306:: with SMTP id bc6mr15802376plb.255.1587375902969;
 Mon, 20 Apr 2020 02:45:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200417082147.43384-1-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200417082147.43384-3-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200418105533.477ce529@collabora.com> <20200419222040.GJ185537@smile.fi.intel.com>
 <20200420111754.5863324b@collabora.com>
In-Reply-To: <20200420111754.5863324b@collabora.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 20 Apr 2020 12:44:51 +0300
Message-ID: <CAHp75VeOH+DC362tsEo13gr9fJpeCHXok=7O19B3njbxCOzd2A@mail.gmail.com>
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

On Mon, Apr 20, 2020 at 12:21 PM Boris Brezillon
<boris.brezillon@collabora.com> wrote:
> On Mon, 20 Apr 2020 01:20:40 +0300
> Andy Shevchenko <andriy.shevchenko@intel.com> wrote:
> > On Sat, Apr 18, 2020 at 10:55:33AM +0200, Boris Brezillon wrote:
> > > On Fri, 17 Apr 2020 16:21:47 +0800
> > > "Ramuthevar,Vadivel MuruganX"
> > > <vadivel.muruganx.ramuthevar@linux.intel.com> wrote:
> > >
> > > > From: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
> >
> > > > +static const struct of_device_id lgm_nand_match[] = {
> > > > + { .compatible = "intel,lgm-nand", },
> > > > + {}
> > > > +};
> > > > +MODULE_DEVICE_TABLE(of, lgm_nand_match);
> > >
> > > You probably have a missing "depends on OF" in your Kconfig.
> >
> > Since it's using device property API, dependency is not needed.
> >
>
> There's no compile-time dependency, but this driver will be pretty
> useless if all its users have the NAND controller node defined in their
> DT and CONFIG_OF is not enabled.

No, it's not.
See [1] for the details how ACPI may utilize this table.

[1]: https://www.kernel.org/doc/html/latest/firmware-guide/acpi/enumeration.html#device-tree-namespace-link-device-id

> I guess the OF option is selected by
> arches, so explicitly depending on OF is only relevant if you change
> the dependency rules as suggested in my other reply.

-- 
With Best Regards,
Andy Shevchenko
