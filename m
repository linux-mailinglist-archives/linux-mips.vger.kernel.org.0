Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3774D242BA7
	for <lists+linux-mips@lfdr.de>; Wed, 12 Aug 2020 16:52:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726489AbgHLOwe (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 12 Aug 2020 10:52:34 -0400
Received: from elvis.franken.de ([193.175.24.41]:44772 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726485AbgHLOwe (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 12 Aug 2020 10:52:34 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1k5s7D-00065F-00; Wed, 12 Aug 2020 16:52:31 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 59A69C0D52; Wed, 12 Aug 2020 16:52:21 +0200 (CEST)
Date:   Wed, 12 Aug 2020 16:52:21 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Florian Fainelli <f.fainelli@gmail.com>
Cc:     linux-mips@linux-mips.org, Hauke Mehrtens <hauke@hauke-m.de>,
        =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
        "open list:BROADCOM BCM47XX MIPS ARCHITECTURE" 
        <linux-mips@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/2] firmware: bcm47xx_sprom: Fix -Wmissing-prototypes
 warnings
Message-ID: <20200812145221.GA12964@alpha.franken.de>
References: <20200726041521.5398-1-f.fainelli@gmail.com>
 <62385d10-a552-25a7-4c49-63eed22a97c1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <62385d10-a552-25a7-4c49-63eed22a97c1@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Aug 07, 2020 at 11:37:43AM -0700, Florian Fainelli wrote:
> 
> 
> On 7/25/2020 9:15 PM, Florian Fainelli wrote:
> > Hi Thomas,
> > 
> > This patch series fixes W=1 -Wmissing-prototypes warnings for the
> > bcm47xx_sprom.c firmware file.
> 
> Thomas, can you apply these patches if you are fine with them? Thanks

I was unsure about the maintainer status of drivers/firmware/broadcom, but
I'll apply it to mips-next after merge window.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
