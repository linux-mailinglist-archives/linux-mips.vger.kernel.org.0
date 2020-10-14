Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4DBF28E8A7
	for <lists+linux-mips@lfdr.de>; Thu, 15 Oct 2020 00:09:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727605AbgJNWJd (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 14 Oct 2020 18:09:33 -0400
Received: from elvis.franken.de ([193.175.24.41]:33823 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726747AbgJNWJc (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 14 Oct 2020 18:09:32 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1kSoxe-0006rS-00; Thu, 15 Oct 2020 00:09:30 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 0EFCEC04F4; Thu, 15 Oct 2020 00:07:41 +0200 (CEST)
Date:   Thu, 15 Oct 2020 00:07:40 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     "Maciej W. Rozycki" <macro@linux-mips.org>
Cc:     Hauke Mehrtens <hauke@hauke-m.de>,
        =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Keguang Zhang <keguang.zhang@gmail.com>,
        John Crispin <john@phrozen.org>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3] MIPS: replace add_memory_region with memblock
Message-ID: <20201014220740.GA5587@alpha.franken.de>
References: <20201009121449.64081-1-tsbogend@alpha.franken.de>
 <alpine.LFD.2.21.2010141344200.866917@eddie.linux-mips.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.LFD.2.21.2010141344200.866917@eddie.linux-mips.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Oct 14, 2020 at 01:47:06PM +0100, Maciej W. Rozycki wrote:
> On Fri, 9 Oct 2020, Thomas Bogendoerfer wrote:
> 
> > add_memory_region was the old interface for registering memory and
> > was already changed to used memblock internaly. Replace it by
> > directly calling memblock functions.
> > 
> > Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> 
>  For the DEC part:
> 
> Acked-by: Maciej W. Rozycki <macro@linux-mips.org>
> 
> NB this does not apply cleanly to upstream master, but I was able to 
> verify this regardless as the DEC part does.  For future reference: what 
> tree do you usually use that you post patches against?

mips-next branch in 

git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
