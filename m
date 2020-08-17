Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B52222465D5
	for <lists+linux-mips@lfdr.de>; Mon, 17 Aug 2020 13:58:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728197AbgHQL6O (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 17 Aug 2020 07:58:14 -0400
Received: from elvis.franken.de ([193.175.24.41]:49839 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726980AbgHQL6N (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 17 Aug 2020 07:58:13 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1k7dmF-0004BP-00; Mon, 17 Aug 2020 13:58:11 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 6F205C0D74; Mon, 17 Aug 2020 13:53:08 +0200 (CEST)
Date:   Mon, 17 Aug 2020 13:53:08 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Florian Fainelli <f.fainelli@gmail.com>
Cc:     linux-mips@linux-mips.org, Hauke Mehrtens <hauke@hauke-m.de>,
        =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
        "open list:BROADCOM BCM47XX MIPS ARCHITECTURE" 
        <linux-mips@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/2] firmware: bcm47xx_sprom: Fix -Wmissing-prototypes
 warnings
Message-ID: <20200817115308.GA4796@alpha.franken.de>
References: <20200726041521.5398-1-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200726041521.5398-1-f.fainelli@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, Jul 25, 2020 at 09:15:19PM -0700, Florian Fainelli wrote:
> Hi Thomas,
> 
> This patch series fixes W=1 -Wmissing-prototypes warnings for the
> bcm47xx_sprom.c firmware file.
> 
> Thanks!
> 
> Florian Fainelli (2):
>   firmware: bcm47xx_sprom: Fix -Wmissing-prototypes warnings
>   MIPS: BCM47xx: Include bcm47xx_sprom.h
> 
>  arch/mips/include/asm/mach-bcm47xx/bcm47xx.h |  4 +---
>  drivers/firmware/broadcom/bcm47xx_sprom.c    |  1 +
>  include/linux/bcm47xx_sprom.h                | 10 ++++++++++
>  3 files changed, 12 insertions(+), 3 deletions(-)

series applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
