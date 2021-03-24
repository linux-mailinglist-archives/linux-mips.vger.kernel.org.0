Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46E4C347572
	for <lists+linux-mips@lfdr.de>; Wed, 24 Mar 2021 11:09:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235400AbhCXKIw (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 24 Mar 2021 06:08:52 -0400
Received: from elvis.franken.de ([193.175.24.41]:55076 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235232AbhCXKIo (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 24 Mar 2021 06:08:44 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1lP0RM-0008Sw-08; Wed, 24 Mar 2021 11:08:40 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 03A1DC1C69; Wed, 24 Mar 2021 11:02:04 +0100 (CET)
Date:   Wed, 24 Mar 2021 11:02:04 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 0/2] MIPS: SiByte: Update SWARM defconfig for PATA support
Message-ID: <20210324100204.GI2378@alpha.franken.de>
References: <alpine.DEB.2.21.2103212028360.21463@angie.orcam.me.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2103212028360.21463@angie.orcam.me.uk>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sun, Mar 21, 2021 at 08:55:37PM +0100, Maciej W. Rozycki wrote:
> Hi,
> 
>  In the course of looking into Christoph's recent proposal to drop legacy 
> IDE drivers I have noticed that SiByte SWARM's defconfig does not enable 
> the pata_platform driver for the onboard PATA interface.  I think default 
> configuration ought to enable all the supported onboard devices unless 
> there are specific reasons so as not to, and the PATA interface is one of 
> the boot devices supported by the CFE firmware, so I think even more then 
> that it should be included by default.
> 
>  Change split into two because the defconfig has become stale since the 
> last update, so 1/2 first regenerates it, and then 2/2 applies the actual 
> modification.
> 
>  Sadly I'm currently away from my SWARM board for the foreseeable future 
> and I have no remote access to it either, but this is supposed not to need 
> run-time verification.  Build-tested only then.
> 
>  Please apply.

series applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
