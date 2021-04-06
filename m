Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7BAAB355949
	for <lists+linux-mips@lfdr.de>; Tue,  6 Apr 2021 18:35:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244250AbhDFQgB (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 6 Apr 2021 12:36:01 -0400
Received: from rcdn-iport-4.cisco.com ([173.37.86.75]:63769 "EHLO
        rcdn-iport-4.cisco.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232063AbhDFQgB (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 6 Apr 2021 12:36:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=2214; q=dns/txt; s=iport;
  t=1617726953; x=1618936553;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=YVi6Pd95NNQkukWDzEdKyppnaWlfPPnzy+EUME4WOBg=;
  b=YE+TJnJB+iv9Us/gqqe8m/ZYf/XQC399UOOQ+66Rb47XOHkWNJK1c12X
   oyFh6W/Tq7HskKh4Zv2Jmv1TfqoCm0YLpdX9PVBwZadIGYI3IldBxQKgB
   n4YN4sICTsxMYcdDYz4jg/VvpR+k5ngpSDG2BrEZJdjpjlqAAYmZP+flW
   Q=;
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3A7NO2kKE3yH2CO2oOpLqFkpHXdLJzesId70?=
 =?us-ascii?q?hD6mlaQ3VuHfCwvcaogfgdyFvYiCwJXmshhNCHP8C7MBbh3LRy5pQcOqrnYR?=
 =?us-ascii?q?Lvv3GmIJonwYzpxTDhHCOWzJ846Y5Lda9iBNrsSWVrlMqS2njbL/8MyMSKmZ?=
 =?us-ascii?q?rDuc7w1HFoJDsGV4hB6ENDBh+fAglKQmB9dP0EPb69wuYCmDa6Y3QQaa2Adx?=
 =?us-ascii?q?o4dszOvcfCmp6jQTNuPX8awTKDhz+p97L2eiLwtnwjeghCzrs4/W/OnxaR3M?=
 =?us-ascii?q?WemsumwRzR3XK71fprsebmo+EuOOW8zuAINzOpsQqzfYJnQbHHhiwtufqi8k?=
 =?us-ascii?q?xCqqirnz4Qe+Ju9njWYma55Tzq1gWI6kdX11bSjXmFnHDkvcv1AAgfNvMEr4?=
 =?us-ascii?q?dYfhzFgnBQxe1B7A=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0AKAAAkjWxg/4wNJK1aGgEBAQEBAQE?=
 =?us-ascii?q?BAQEDAQEBARIBAQEBAgIBAQEBQIE+BQEBAQELAYIqgU0BOTGMZokuA5AMFop?=
 =?us-ascii?q?GFIFoCwEBAQ0BATQEAQGBFgGDNAMCAoF2AiU0CQ4CAwEBDAEBBQEBAQIBBgR?=
 =?us-ascii?q?xE4VdhkUBBTIBRhALEgYuPA0OBhOFeatQdYE0gQGIHYFEFA6BFwGNTCccgUl?=
 =?us-ascii?q?CgRODIj6EGA6GEQSCQAeBDoIVExKULIpcnCmDFYEmj1qLbTIQpGG4PgIEBgU?=
 =?us-ascii?q?CFoFUOoFZMxoIGxWDJFAZDp0IIQMvOAIGAQkBAQMJin8BJwSCGQEB?=
X-IronPort-AV: E=Sophos;i="5.82,310,1613433600"; 
   d="scan'208";a="857074414"
Received: from alln-core-7.cisco.com ([173.36.13.140])
  by rcdn-iport-4.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 06 Apr 2021 16:35:52 +0000
Received: from zorba ([10.24.14.212])
        by alln-core-7.cisco.com (8.15.2/8.15.2) with ESMTPS id 136GZnnO027751
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Tue, 6 Apr 2021 16:35:51 GMT
Date:   Tue, 6 Apr 2021 09:35:49 -0700
From:   Daniel Walker <danielwa@cisco.com>
To:     Christophe Leroy <christophe.leroy@csgroup.eu>
Cc:     Will Deacon <will@kernel.org>, ob Herring <robh@kernel.org>,
        Daniel Gimpelevich <daniel@gimpelevich.san-francisco.ca.us>,
        Andrew Morton <akpm@linux-foundation.org>, x86@kernel.org,
        linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        xe-linux-external@cisco.com,
        Ruslan Ruslichenko <rruslich@cisco.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/8] CMDLINE: drivers: of: ifdef out cmdline section
Message-ID: <20210406163549.GS2469518@zorba>
References: <41021d66db2ab427c14255d2a24bb4517c8b58fd.1617126961.git.danielwa@cisco.com>
 <0c4b839f023f87c451c8aa3c4f7a8d92729c2f02.1617126961.git.danielwa@cisco.com>
 <6d50809a-eb6b-b8bb-bb8b-88f66c52c0fa@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6d50809a-eb6b-b8bb-bb8b-88f66c52c0fa@csgroup.eu>
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-SMTP-Client: 10.24.14.212, [10.24.14.212]
X-Outbound-Node: alln-core-7.cisco.com
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Apr 02, 2021 at 07:32:08PM +0200, Christophe Leroy wrote:
> 
> 
> Le 30/03/2021 à 19:56, Daniel Walker a écrit :
> > It looks like there's some seepage of cmdline stuff into
> > the generic device tree code. This conflicts with the
> > generic cmdline implementation so I remove it in the case
> > when that's enabled.
> > 
> > Cc: xe-linux-external@cisco.com
> > Signed-off-by: Ruslan Ruslichenko <rruslich@cisco.com>
> > Signed-off-by: Daniel Walker <danielwa@cisco.com>
> > ---
> >   drivers/of/fdt.c | 14 ++++++++++++++
> >   1 file changed, 14 insertions(+)
> > 
> > diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
> > index dcc1dd96911a..d8805cd9717a 100644
> > --- a/drivers/of/fdt.c
> > +++ b/drivers/of/fdt.c
> > @@ -25,6 +25,7 @@
> >   #include <linux/serial_core.h>
> >   #include <linux/sysfs.h>
> >   #include <linux/random.h>
> > +#include <linux/cmdline.h>
> >   #include <asm/setup.h>  /* for COMMAND_LINE_SIZE */
> >   #include <asm/page.h>
> > @@ -1050,6 +1051,18 @@ int __init early_init_dt_scan_chosen(unsigned long node, const char *uname,
> >   	/* Retrieve command line */
> >   	p = of_get_flat_dt_prop(node, "bootargs", &l);
> > +
> > +#if defined(CONFIG_GENERIC_CMDLINE) && defined(CONFIG_GENERIC_CMDLINE_OF)
> > +	/*
> > +	 * The builtin command line will be added here, or it can override
> > +	 * with the DT bootargs.
> > +	 */
> > +	cmdline_add_builtin(data,
> > +			    (l > 0 ? p : NULL), /* This is sanity checking */
> > +			    COMMAND_LINE_SIZE);
> > +#elif defined(CONFIG_GENERIC_CMDLINE)
> > +	strlcpy(data, p, COMMAND_LINE_SIZE);
> > +#else
> 
> Ugly.
> 
> Linux codying style recommend to limit the use of #ifdefs to headers as much as possible.
> 
> Why do we need so many alternatives ? Allthough they are temporary, can we
> order the changes in another way to reduce that ?

I think this whole section can be removed down even all the CMDLINE ifdef's ..
The only architecture which needs this is powerpc because it calls this function
three times.

If powerpc were made to call this only once , and then call the generic handling
for the command line then this whole section would get removed.

Daniel
