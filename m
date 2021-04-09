Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7327B35916B
	for <lists+linux-mips@lfdr.de>; Fri,  9 Apr 2021 03:27:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232984AbhDIB1N (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 8 Apr 2021 21:27:13 -0400
Received: from rcdn-iport-9.cisco.com ([173.37.86.80]:54712 "EHLO
        rcdn-iport-9.cisco.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232918AbhDIB1N (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 8 Apr 2021 21:27:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=3696; q=dns/txt; s=iport;
  t=1617931621; x=1619141221;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zMAEQSGGxAXPhVbwdo8g6BKr75SG96pClPfZ618q3KM=;
  b=OhYeNgwA2D/QNT+h3lb6GZcK9hczjzaxh5DW3XEzHBgnJPgmyD3oV2cz
   LQg35XX8/aVYWGWoVQ8MfTIKLAvX8h4ZadFVmSY69wzrw4gbHRUvLP6SV
   Kh28ZAutnNkGt4SzLUz6FP82n26X9TJX60MiQ2JmE1KnAZGPkBwxmWiDI
   0=;
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3AzTkORKl6L0U17Sf68XftOckLpnPpDfN3im?=
 =?us-ascii?q?dD5ilNYBxZY6Wkvuql9c516TbfjjENVHY83f2BIrCHW3PA9ZhziLNhWIuKdg?=
 =?us-ascii?q?/gpWeuMcVe/ZLvqgeQeRHW2+ZB2c5bGZRWJ8b3CTFB4PrSwA79KNo4xcnCza?=
 =?us-ascii?q?bAv5a7815IbSVHL55t9B14DAHzKDwUeCBjCYAiHJSRouprzgDARV0tYs62Bm?=
 =?us-ascii?q?YIUoH4zrWhqLvcbRELHBIh4gWV5AnJ1JfBDxOa0h0COgkg/Z4e9wH+/zDR1+?=
 =?us-ascii?q?GKr+y8jiTRzXbU6I5b3OH808JZCNaX4/JlTQnEu0KPeJlrXaGEsXQTpuyigW?=
 =?us-ascii?q?xa6eXkklMHI9l57W/XcyWOhSbVnyPk0Doo9hbZuDmlvUc=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0AEAABOrG9g/4ENJK1aGQEBAQEBAQE?=
 =?us-ascii?q?BAQEBAQEBAQEBARIBAQEBAQEBAQEBAQFAgT4EAQEBAQELAYIqgU0BOTGMZok?=
 =?us-ascii?q?xA5ANilyBfAsBAQENAQE0BAEBhFACgXcCJTQJDgIDAQEMAQEFAQEBAgEGBHE?=
 =?us-ascii?q?ThV2GRQEFHhw/EAsSBi48DQ4GE4V5qjx1gTSBAYgUgUQUDoEXAY1MJxyBSUK?=
 =?us-ascii?q?ENT6KOQSCQAeBDoIoEjcCk3MBilucKYMVgSaVJYYiMhCDeqBnuD4CBAYFAha?=
 =?us-ascii?q?BVDqBWTMaCBsVgyRQGQ6OKxaORyEDLzgCBgoBAQMJikwsghkBAQ?=
X-IronPort-AV: E=Sophos;i="5.82,208,1613433600"; 
   d="scan'208";a="789889986"
Received: from alln-core-9.cisco.com ([173.36.13.129])
  by rcdn-iport-9.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 09 Apr 2021 01:26:59 +0000
Received: from zorba ([10.24.9.242])
        by alln-core-9.cisco.com (8.15.2/8.15.2) with ESMTPS id 1391Qv7b032706
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Fri, 9 Apr 2021 01:26:58 GMT
Date:   Thu, 8 Apr 2021 18:26:57 -0700
From:   Daniel Walker <danielwa@cisco.com>
To:     Rob Herring <robh@kernel.org>
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
Message-ID: <20210409012657.GH3981976@zorba>
References: <41021d66db2ab427c14255d2a24bb4517c8b58fd.1617126961.git.danielwa@cisco.com>
 <0c4b839f023f87c451c8aa3c4f7a8d92729c2f02.1617126961.git.danielwa@cisco.com>
 <CAL_Jsq+_gF9Cy7H6ic2q8dxnPf4+FsBa5pFYYRydJsEmDhnNhA@mail.gmail.com>
 <20210330231717.GA2469518@zorba>
 <20210407225915.GA147338@robh.at.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210407225915.GA147338@robh.at.kernel.org>
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-SMTP-Client: 10.24.9.242, [10.24.9.242]
X-Outbound-Node: alln-core-9.cisco.com
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Apr 07, 2021 at 05:59:15PM -0500, Rob Herring wrote:
> On Tue, Mar 30, 2021 at 04:17:53PM -0700, Daniel Walker wrote:
> > On Tue, Mar 30, 2021 at 02:49:13PM -0500, Rob Herring wrote:
> > > On Tue, Mar 30, 2021 at 12:57 PM Daniel Walker <danielwa@cisco.com> wrote:
> > > >
> > > > It looks like there's some seepage of cmdline stuff into
> > > > the generic device tree code. This conflicts with the
> > > > generic cmdline implementation so I remove it in the case
> > > > when that's enabled.
> > > >
> > > > Cc: xe-linux-external@cisco.com
> > > > Signed-off-by: Ruslan Ruslichenko <rruslich@cisco.com>
> > > > Signed-off-by: Daniel Walker <danielwa@cisco.com>
> > > > ---
> > > >  drivers/of/fdt.c | 14 ++++++++++++++
> > > >  1 file changed, 14 insertions(+)
> > > >
> > > > diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
> > > > index dcc1dd96911a..d8805cd9717a 100644
> > > > --- a/drivers/of/fdt.c
> > > > +++ b/drivers/of/fdt.c
> > > > @@ -25,6 +25,7 @@
> > > >  #include <linux/serial_core.h>
> > > >  #include <linux/sysfs.h>
> > > >  #include <linux/random.h>
> > > > +#include <linux/cmdline.h>
> > > >
> > > >  #include <asm/setup.h>  /* for COMMAND_LINE_SIZE */
> > > >  #include <asm/page.h>
> > > > @@ -1050,6 +1051,18 @@ int __init early_init_dt_scan_chosen(unsigned long node, const char *uname,
> > > >
> > > >         /* Retrieve command line */
> > > >         p = of_get_flat_dt_prop(node, "bootargs", &l);
> > > > +
> > > > +#if defined(CONFIG_GENERIC_CMDLINE) && defined(CONFIG_GENERIC_CMDLINE_OF)
> > > 
> > > Moving in the wrong direction... This code already has too many
> > > #ifdef's. I like Christophe's version as it gets rid of all the code
> > > here.
> >  
> > It's temporary .. Notice CONFIG_GENERIC_CMDLINE_OF is only used on PowerPC. I
> > experienced doubling on arm64 when this was used (i.e. the append and prepend
> > was added twice).
> > 
> > I don't think there are any other users which can't be moved outside the device
> > tree code, but powerpc uses this function three times during boot up plus the
> > prom_init user. It's possible to use the generic command line in all four places,
> > but it become space inefficient.
> 
> What's the 3rd use? I count kaslr code and in 
> early_init_dt_scan_chosen_ppc. Do we need to build the command line for 
> kaslr seed? Getting any build time value from the kernel is pointless.

I think I may have been mistaken. I added a dump_stack() , but there may have
been other stack traces during bootup on prior -rcX's I was testing.

I re-ran the test and I only see one user on powerpc and powerpc64,

powerpc64,

[    T0] Call Trace:
[    T0] [c000000001517d00] [c00000000077e910] dump_stack+0xc4/0x114 (unreliable)
[    T0] [c000000001517d50] [c000000001186fb4] early_init_dt_scan_chosen+0x238/0x324
[    T0] [c000000001517de0] [c000000001138b00] early_init_dt_scan_chosen_ppc+0x20/0x194
[    T0] [c000000001517e10] [c000000001186ae0] of_scan_flat_dt+0xc8/0x130
[    T0] [c000000001517e70] [c000000001139404] early_init_devtree+0xa4/0x48c
[    T0] [c000000001517f10] [c00000000113ac90] early_setup+0xc8/0x254
[    T0] [c000000001517f90] [000000000000c754] 0xc754

powerpc32,

Call Trace:
[c06bbee0] [c067e334] early_init_dt_scan_chosen+0xf8/0x1dc (unreliable)
[c06bbf10] [c0666ec4] early_init_dt_scan_chosen_ppc+0x18/0x6c
[c06bbf30] [c067e048] of_scan_flat_dt+0x98/0xf4
[c06bbf70] [c0667234] early_init_devtree+0x48/0x2d0
[c06bbfb0] [c06679cc] machine_init+0x98/0xcc
[c06bbff0] [c0000398] set_ivor+0x114/0x154

I think it would be possible to just move the generic handling entire into
architecture code.

Daniel
