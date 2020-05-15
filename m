Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA7061D4C6B
	for <lists+linux-mips@lfdr.de>; Fri, 15 May 2020 13:20:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726140AbgEOLUL (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 15 May 2020 07:20:11 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:28318 "EHLO
        esa4.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726097AbgEOLUK (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 15 May 2020 07:20:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1589541610; x=1621077610;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=3AVsXks51MSBE0OyXHuHkc4u/u6HqyL6rnoDSmp+q6U=;
  b=IfVLI8CQzm/rx2dDmLSmmL8COaAhwG/+9MQzXTtHe7ttJB+1VQYTtRHR
   axHc1hbJShnpOakhh3SHXxQCb7fn2b6LjP2e0d4BDpjr3g73a6RHzW87U
   n473Tuq7VGD6nxMnD8L1VnxvwCsySFjAUoMum93iqqIw5zXmwHq6GCO2k
   F4GJoZvj5zbH8PT2jhyZm1076p0oF2/G/BkmAdZxkTS42Lq9H8zIQbcaY
   HgapC4GpLegqhA/Yfw/rYvxbn7aOkdIgNTI7uFJ0HJNRkThcs6fyO/dma
   O8qVi8BZs0aP6oEUqzOd1TpHWT1grxDePkzR1ODPl33ILlCsBvGEsMqiV
   Q==;
IronPort-SDR: m/cSSnHlsP0vqem7lVLh1v7bAj79SB37o+pmPXjBjPyLQrZgFl/EOlOwRouiu6GQP+rvd23niS
 Z7YNWO+fZEnggKvs5g3EWELNJioL786yBHbH/ouLuwKHj3LlTzOdgraojGovmtCygDZAkyzQen
 vmxx4ssDFENoD/1vVU2SvfP2qF4X2mpkPb8tVjEMYhnlsjqScEwMO0B9zBBjcVPwlpnr1P1Qve
 +pjrrZHyeRIrMQhp1KPtPmpRz1CtbO3ToICec4zs3Co4w2VKu5FCcYkCclz3LWVIHEENxJwnvw
 I/I=
X-IronPort-AV: E=Sophos;i="5.73,395,1583164800"; 
   d="scan'208";a="137771833"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 15 May 2020 19:20:08 +0800
IronPort-SDR: gDNwpLcW/I5HP8ilUuIDTPo6gX9tZMAHnqRJvecluI+wfB4ZYXtE0OCRKDZbKGIQWFRJHwP3LA
 a018B6aBPNRW+LgZ64LvXWYkJgZxXSE/0=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2020 04:09:47 -0700
IronPort-SDR: o9TRvhNgmGVr3IFiu7Pr/b2sklOzQ87PSXETWg8AjWZdjWFsnMJvljVyZMyuZcOGfT0ape3Gkw
 faRWNC4awfQQ==
WDCIronportException: Internal
Received: from unknown (HELO redsun52) ([10.149.66.28])
  by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2020 04:20:08 -0700
Date:   Fri, 15 May 2020 12:20:04 +0100 (BST)
From:   "Maciej W. Rozycki" <macro@wdc.com>
To:     Joshua Kinard <kumba@gentoo.org>
cc:     linux-mips@vger.kernel.org,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "Maciej W. Rozycki" <macro@linux-mips.org>
Subject: Re: [PATCH v2] MIPS: Split R10000 to allow for R12K+ optimizations
In-Reply-To: <18995238-ed16-411c-79ef-071897ee8a1b@gentoo.org>
Message-ID: <alpine.LFD.2.21.2005151216570.6492@redsun52.ssa.fujisawa.hgst.com>
References: <19dc5a54-4f53-5f69-5ade-4c354f63a356@gentoo.org> <alpine.LFD.2.21.2005140251480.6492@redsun52.ssa.fujisawa.hgst.com> <78b68917-ec7e-7434-2a80-5fabbd5247a8@gentoo.org> <alpine.LFD.2.21.2005142233430.6492@redsun52.ssa.fujisawa.hgst.com>
 <18995238-ed16-411c-79ef-071897ee8a1b@gentoo.org>
User-Agent: Alpine 2.21 (LFD 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, 14 May 2020, Joshua Kinard wrote:

> >  I suppose they have just come up in the order they were added.  Whatever 
> > the order is however as long as it is consistent you can `diff' a pair of 
> > files against each other to spot differences easily without the need to 
> > rely on your perceptiveness.  And <asm/mach-sibyte/war.h> already has 
> > conditionals in the middle.
> 
> I think then putting the conditional block below the section of fixed
> defines achieves that, then.  diff's (and git diff's) algorithm will show
> that as a clean addition and not require a lot of surrounding context lines.
>  It'll also avoid the need to submit a separate patch to fix IP30's "war.h".
> 
> I took a look at asm/mach-sibyte/war.h, but it looks kind of....messy?  None
> of the other "war.h" files use conditionals outside of IP27's, IP30's, and
> SiByte's, so there's not a whole lot of precedent to base off of.

 Well, there's <asm/mach-rc32434/war.h> too, to be exact.

 I have no further arguments nor other input, so I'll be leaving it for 
Thomas to decide.

  Maciej
