Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C97E71D2F93
	for <lists+linux-mips@lfdr.de>; Thu, 14 May 2020 14:23:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726240AbgENMXk (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 14 May 2020 08:23:40 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:65358 "EHLO
        esa2.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725955AbgENMXk (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 14 May 2020 08:23:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1589459063; x=1620995063;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=xQ9YEGxgyEkc0qQ3ym1KOpEOeOMx8cHzc+BQlU2UN48=;
  b=ez4CE+RwARBKuDycI35qNBV2o5+cxshzxUcoPGo3IW4D3TQqCE+3YBq+
   /pC39rEFPkdu93+HvcIBWIQSBAx24tJnsptfJJsmnie9jUmP1u47VWVU2
   Cm9/aUtZ4kmDmOxf+Bp/UBHeWzy21yg+4V9BEx5WJeju0I85FGE+s+/uH
   t2t4FMPph+887OFiUtDZZnyXwauKGc39Ef/03N2BjQeAa+E3Zc+0ab0O/
   jxO/tlUpLrh8ffaK+4c1rt/s2Uib4p13r69t3rc6/WStpK/U1CajzBMlr
   NevP/BRcm6pFtgQulHah80DsIKXKScWXsiFcRumR8M8VEoJwOLxIycwRy
   w==;
IronPort-SDR: ufy3p4zwxnT53bJVKJdEGS2dYd4PeAbueNEganeTm62t6UTHsP4deIQfkSecqV9ev2K29m7QSz
 WVkjyfBoMs/Wv1bUku5aoOOpNr94BslVDGHN45TbqAj2tNieoYpvCz0qFlUtrvwqI6ZuVnGBmz
 nZROsS9Qzlr449++k9IeujfutgHrqAQYYj+kQxAOpReFAIg+q8yZwbs/I1RHsodY2o0bV1cjSb
 qrY8LR3teRkdHDMZsBmaBDkg85JB1h8O6MMwjly7BZI+hOxm+BLSR4+47wNVRPhHb4XzfbxfmR
 wb0=
X-IronPort-AV: E=Sophos;i="5.73,391,1583164800"; 
   d="scan'208";a="240383564"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 14 May 2020 20:24:23 +0800
IronPort-SDR: 0pQv2eOPjxRwKULtoQCnE9QynB7/+1ZmHkcz5Cl2C0eReCoGXcvpL5ovznjzgF4y5lMPfjy5TL
 6c2QLd4h5+wdRrUvM+DnH7QXkw0Vf6eR8=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2020 05:13:51 -0700
IronPort-SDR: 7mCy3jjxMOOVbOpNCPl/9O/bfB60XnaBkGJBxvRhmMrIUi7HGVrRxxD7xt5GtNl5F0bMgpHdXG
 5kjvFkeJxjGA==
WDCIronportException: Internal
Received: from unknown (HELO redsun52) ([10.149.66.28])
  by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2020 05:23:38 -0700
Date:   Thu, 14 May 2020 13:23:33 +0100 (BST)
From:   "Maciej W. Rozycki" <macro@wdc.com>
To:     Huacai Chen <chenhc@lemote.com>
cc:     "Maciej W. Rozycki" <macro@linux-mips.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        Fuxin Zhang <zhangfx@lemote.com>,
        Zhangjin Wu <wuzhangjin@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: Re: [PATCH] MIPS: inst.h: Stop including asm.h to avoid various
 build failures
In-Reply-To: <CAAhV-H63n_wa8Z72WRNPjeG0aVYEujvcDJPmd2nPcER1NrUiGw@mail.gmail.com>
Message-ID: <alpine.LFD.2.21.2005141316390.6492@redsun52.ssa.fujisawa.hgst.com>
References: <1588930212-5255-1-git-send-email-chenhc@lemote.com> <20200508130149.GA14297@alpha.franken.de> <CAAhV-H5BRhxvaQ_-RHYkEe8BY-OSQto1FhQtBx3T+bZTOVs+-Q@mail.gmail.com> <20200509152501.GA9125@alpha.franken.de> <alpine.LFD.2.21.2005130036060.677301@eddie.linux-mips.org>
 <CAAhV-H63n_wa8Z72WRNPjeG0aVYEujvcDJPmd2nPcER1NrUiGw@mail.gmail.com>
User-Agent: Alpine 2.21 (LFD 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, 14 May 2020, Huacai Chen wrote:

> >  Sigh, this just shows how the original change was wrong in the first
> > place.  Why was <asm/inst.h> specifically chosen, whose purpose has been
> > machine code generators/interpreters that has nothing to do with unaligned
> > access helpers, over a more suitable location, such as (maybe obviously?)
> > <asm/unaligned.h>?
> >
> >  I suggest that we roll back to before the destruction, move the necessary
> > bits away from <asm/inst.h>, and then perhaps none of the follow-up hacks
> > will be required.
> I think you are right, but it is too late... so, I think we needn't roll back.

 Well, your change hasn't even hit the mainline yet, and anyway it's never 
too late to get things right (it's not like software gets cast in stone) 
and as I say these bits do not functionally belong to <asm/inst.h>.

  Maciej
