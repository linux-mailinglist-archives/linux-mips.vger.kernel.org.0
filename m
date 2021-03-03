Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BAA3A32C897
	for <lists+linux-mips@lfdr.de>; Thu,  4 Mar 2021 02:16:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230430AbhCDAus (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 3 Mar 2021 19:50:48 -0500
Received: from elvis.franken.de ([193.175.24.41]:40114 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1579159AbhCCSad (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 3 Mar 2021 13:30:33 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1lHWFq-0003ZZ-00; Wed, 03 Mar 2021 19:29:50 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id BE979C0D74; Wed,  3 Mar 2021 19:15:41 +0100 (CET)
Date:   Wed, 3 Mar 2021 19:15:41 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        linux-mips@vger.kernel.org, rppt@kernel.org,
        fancer.lancer@gmail.com, guro@fb.com,
        Andrew Morton <akpm@linux-foundation.org>,
        paul@crapouillou.net,
        Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Kamal Dasu <kdasu.kdev@gmail.com>,
        Yanteng Si <siyanteng@loongson.cn>,
        Huacai Chen <chenhuacai@kernel.org>,
        "open list:BROADCOM BMIPS MIPS ARCHITECTURE" 
        <bcm-kernel-feedback-list@broadcom.com>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] MIPS: BMIPS: Reserve exception base to prevent corruption
Message-ID: <20210303181541.GA25675@alpha.franken.de>
References: <20210301092241.i7dxo7zbg3ar55d6@mobilestation>
 <20210302041940.3663823-1-f.fainelli@gmail.com>
 <20210302235411.GA3897@alpha.franken.de>
 <4e3640d4-7fc2-96dc-de00-599b3ac80757@gmail.com>
 <20210303094134.GA18354@alpha.franken.de>
 <alpine.DEB.2.21.2103031844510.19637@angie.orcam.me.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2103031844510.19637@angie.orcam.me.uk>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Mar 03, 2021 at 06:45:52PM +0100, Maciej W. Rozycki wrote:
> On Wed, 3 Mar 2021, Thomas Bogendoerfer wrote:
> 
> > perfect, I only forgot about R3k... I'll submit a formal patch submission
> > later today.
> 
>  What's up with the R3k (the usual trigger for me) here?

I've moved r3k cpu_probe() to it's own file and when moving ebase
reservation to cpu_probe(), I need to add it there as well. So just
a mechanic step, I've missed.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
