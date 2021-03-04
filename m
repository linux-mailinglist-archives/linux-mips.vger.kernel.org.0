Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03C6132DBBC
	for <lists+linux-mips@lfdr.de>; Thu,  4 Mar 2021 22:27:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237465AbhCDV1m (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 4 Mar 2021 16:27:42 -0500
Received: from alln-iport-1.cisco.com ([173.37.142.88]:56034 "EHLO
        alln-iport-1.cisco.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229517AbhCDV1O (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 4 Mar 2021 16:27:14 -0500
X-Greylist: delayed 349 seconds by postgrey-1.27 at vger.kernel.org; Thu, 04 Mar 2021 16:27:14 EST
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=1694; q=dns/txt; s=iport;
  t=1614893234; x=1616102834;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=9ULi3lxtKwy2ziPDY/q6Yuz9DuWL9aXRDve/CHdZaFA=;
  b=b6rhBryo3MWymHruizd2fOtiwyQXDFLaYxObVjYmkTvm+a3M9XIa6FGp
   QtYzOJ7PKsGwDtWsonE17cYf65teL/9J4bUoAXYy8TAkqW6R5SAjVCTVI
   vuVgrmyuKt3HgViU33c2gdXS251DRx0bNqMJQPMM1aXFnTCYaikhFmraY
   Q=;
X-IPAS-Result: =?us-ascii?q?A0AVAABfTkFgmIcNJK1iHAEBAQEBAQcBARIBAQQEAQFAg?=
 =?us-ascii?q?TwGAQELAYN2ATkxlh6PehaKP4F8CwEBAQ0BATQEAQGBFIM0AwICgXoCJTUID?=
 =?us-ascii?q?gIDAQEBAwIDAQEBAQUBAQECAQYEFAEBAQEBAQEBhkOGRQEFMgFGEAsYLjwbB?=
 =?us-ascii?q?hOCcIMIrhJ0gTSJH4FEFA6BFgGNQiYcgUlCgRGDGj6KMwSCQAeBDoIoEpN7i?=
 =?us-ascii?q?i6be4MGgR+acjEQo0a2cgIEBgUCFoFWATWBWTMaCBsVgyRQGQ2OOI5QIAMvO?=
 =?us-ascii?q?AIGAQkBAQMJjBMBAQ?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="5.81,223,1610409600"; 
   d="scan'208";a="656967522"
Received: from alln-core-2.cisco.com ([173.36.13.135])
  by alln-iport-1.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 04 Mar 2021 21:24:51 +0000
Received: from zorba ([10.24.1.42])
        by alln-core-2.cisco.com (8.15.2/8.15.2) with ESMTPS id 124LOnLb005860
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Thu, 4 Mar 2021 21:24:50 GMT
Date:   Thu, 4 Mar 2021 13:24:48 -0800
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
Subject: Re: [PATCH 2/5] CMDLINE: drivers: of: ifdef out cmdline section
Message-ID: <20210304212448.GK109100@zorba>
References: <20210304044803.812204-2-danielwa@cisco.com>
 <2b0081aa-52af-a4ab-7481-6e125bd103d6@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2b0081aa-52af-a4ab-7481-6e125bd103d6@csgroup.eu>
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-SMTP-Client: 10.24.1.42, [10.24.1.42]
X-Outbound-Node: alln-core-2.cisco.com
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Mar 04, 2021 at 08:09:52AM +0100, Christophe Leroy wrote:
> 
> 
> Le 04/03/2021 à 05:47, Daniel Walker a écrit :
> > It looks like there's some seepage of cmdline stuff into
> > the generic device tree code. This conflicts with the
> > generic cmdline implementation so I remove it in the case
> > when that's enabled.
> > 
> > Cc: xe-linux-external@cisco.com
> > Signed-off-by: Ruslan Ruslichenko <rruslich@cisco.com>
> > Signed-off-by: Daniel Walker <danielwa@cisco.com>
> > ---
> >   drivers/of/fdt.c | 12 ++++++++++++
> >   1 file changed, 12 insertions(+)
> > 
> > diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
> > index feb0f2d67fc5..cfe4f8d3c9f5 100644
> > --- a/drivers/of/fdt.c
> > +++ b/drivers/of/fdt.c
> > @@ -25,6 +25,7 @@
> >   #include <linux/serial_core.h>
> >   #include <linux/sysfs.h>
> >   #include <linux/random.h>
> > +#include <linux/cmdline.h>
> >   #include <asm/setup.h>  /* for COMMAND_LINE_SIZE */
> >   #include <asm/page.h>
> > @@ -1048,8 +1049,18 @@ int __init early_init_dt_scan_chosen(unsigned long node, const char *uname,
> >   	early_init_dt_check_for_initrd(node);
> > +#ifdef CONFIG_GENERIC_CMDLINE
> >   	/* Retrieve command line */
> >   	p = of_get_flat_dt_prop(node, "bootargs", &l);
> > +
> > +	/*
> > +	 * The builtin command line will be added here, or it can override
> > +	 * with the DT bootargs.
> > +	 */
> > +	cmdline_add_builtin(data,
> > +			    ((p != NULL && l > 0) ? p : NULL), /* This is sanity checking */
> 
> Can we do more simple ? If p is NULL, p is already NULL, so (l > 0 ? p : NULL) should be enough.


I believe Rob gave me this line. Maybe he can comment on it.

Daniel
