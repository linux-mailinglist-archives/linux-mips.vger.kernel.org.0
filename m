Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B75735781C
	for <lists+linux-mips@lfdr.de>; Thu,  8 Apr 2021 00:59:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229586AbhDGW72 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 7 Apr 2021 18:59:28 -0400
Received: from mail-ot1-f51.google.com ([209.85.210.51]:38718 "EHLO
        mail-ot1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229459AbhDGW71 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 7 Apr 2021 18:59:27 -0400
Received: by mail-ot1-f51.google.com with SMTP id w21-20020a9d63950000b02901ce7b8c45b4so444357otk.5;
        Wed, 07 Apr 2021 15:59:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=QKXgCn18Rr1eqfdzx55WXMaeSuXNDv2BM9yLmUwClbs=;
        b=VESw8pT467vjoArwrVyomMYyeqqbh4HIcU9XANCmWEapiO6jUMGMNQg4HmzTqMIcq+
         JbH66117F9NvI+GF3qCNYrRRJM6R17bDeL7Bq0Uz6AkFQ3tIGHGRGbvTu6zoR9EqwCVX
         /aGP9a9tnJaJugjAsxxJstg6UNElmfrq7Y6loluLCE2MtFTiqGgTsfE+LEjRe7DycIFW
         CPxaNiYX/6gYQo7bYHmQIcMgz7sURjSAc0D5xHE7ghjVyxCSM0OHfG1O1rWQvM6S3WOC
         L8JvDRcUufLAjgpDVVS+m3TUmxcSBF0TUqaQTviIGV4VPa9b195/1SqWSmQJ1WJVAwv/
         HVBA==
X-Gm-Message-State: AOAM532VwXR8f0YE4xX29CHNQdh6oESBow7mexcG7M/AzY40/NwauehC
        bC61Q4Z4EmxTZ2RHRDOAkg==
X-Google-Smtp-Source: ABdhPJyvr5jHBGk0riO06gjL1cJLFcP8LjEM1PludhoIvgfnmnAE6t/+wBnt/64MHZhkodj4W6TLdA==
X-Received: by 2002:a05:6830:22c3:: with SMTP id q3mr4869906otc.56.1617836356986;
        Wed, 07 Apr 2021 15:59:16 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id b22sm5786887ots.59.2021.04.07.15.59.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Apr 2021 15:59:16 -0700 (PDT)
Received: (nullmailer pid 174484 invoked by uid 1000);
        Wed, 07 Apr 2021 22:59:15 -0000
Date:   Wed, 7 Apr 2021 17:59:15 -0500
From:   Rob Herring <robh@kernel.org>
To:     Daniel Walker <danielwa@cisco.com>
Cc:     Will Deacon <will@kernel.org>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Daniel Gimpelevich <daniel@gimpelevich.san-francisco.ca.us>,
        Andrew Morton <akpm@linux-foundation.org>,
        X86 ML <x86@kernel.org>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Frank Rowand <frowand.list@gmail.com>,
        xe-linux-external@cisco.com,
        Ruslan Ruslichenko <rruslich@cisco.com>,
        devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/8] CMDLINE: drivers: of: ifdef out cmdline section
Message-ID: <20210407225915.GA147338@robh.at.kernel.org>
References: <41021d66db2ab427c14255d2a24bb4517c8b58fd.1617126961.git.danielwa@cisco.com>
 <0c4b839f023f87c451c8aa3c4f7a8d92729c2f02.1617126961.git.danielwa@cisco.com>
 <CAL_Jsq+_gF9Cy7H6ic2q8dxnPf4+FsBa5pFYYRydJsEmDhnNhA@mail.gmail.com>
 <20210330231717.GA2469518@zorba>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210330231717.GA2469518@zorba>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Mar 30, 2021 at 04:17:53PM -0700, Daniel Walker wrote:
> On Tue, Mar 30, 2021 at 02:49:13PM -0500, Rob Herring wrote:
> > On Tue, Mar 30, 2021 at 12:57 PM Daniel Walker <danielwa@cisco.com> wrote:
> > >
> > > It looks like there's some seepage of cmdline stuff into
> > > the generic device tree code. This conflicts with the
> > > generic cmdline implementation so I remove it in the case
> > > when that's enabled.
> > >
> > > Cc: xe-linux-external@cisco.com
> > > Signed-off-by: Ruslan Ruslichenko <rruslich@cisco.com>
> > > Signed-off-by: Daniel Walker <danielwa@cisco.com>
> > > ---
> > >  drivers/of/fdt.c | 14 ++++++++++++++
> > >  1 file changed, 14 insertions(+)
> > >
> > > diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
> > > index dcc1dd96911a..d8805cd9717a 100644
> > > --- a/drivers/of/fdt.c
> > > +++ b/drivers/of/fdt.c
> > > @@ -25,6 +25,7 @@
> > >  #include <linux/serial_core.h>
> > >  #include <linux/sysfs.h>
> > >  #include <linux/random.h>
> > > +#include <linux/cmdline.h>
> > >
> > >  #include <asm/setup.h>  /* for COMMAND_LINE_SIZE */
> > >  #include <asm/page.h>
> > > @@ -1050,6 +1051,18 @@ int __init early_init_dt_scan_chosen(unsigned long node, const char *uname,
> > >
> > >         /* Retrieve command line */
> > >         p = of_get_flat_dt_prop(node, "bootargs", &l);
> > > +
> > > +#if defined(CONFIG_GENERIC_CMDLINE) && defined(CONFIG_GENERIC_CMDLINE_OF)
> > 
> > Moving in the wrong direction... This code already has too many
> > #ifdef's. I like Christophe's version as it gets rid of all the code
> > here.
>  
> It's temporary .. Notice CONFIG_GENERIC_CMDLINE_OF is only used on PowerPC. I
> experienced doubling on arm64 when this was used (i.e. the append and prepend
> was added twice).
> 
> I don't think there are any other users which can't be moved outside the device
> tree code, but powerpc uses this function three times during boot up plus the
> prom_init user. It's possible to use the generic command line in all four places,
> but it become space inefficient.

What's the 3rd use? I count kaslr code and in 
early_init_dt_scan_chosen_ppc. Do we need to build the command line for 
kaslr seed? Getting any build time value from the kernel is pointless.

Rob
