Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5806E347570
	for <lists+linux-mips@lfdr.de>; Wed, 24 Mar 2021 11:09:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235458AbhCXKIz (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 24 Mar 2021 06:08:55 -0400
Received: from elvis.franken.de ([193.175.24.41]:55157 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235395AbhCXKIr (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 24 Mar 2021 06:08:47 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1lP0RM-0008Sw-07; Wed, 24 Mar 2021 11:08:40 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 0A356C1C69; Wed, 24 Mar 2021 11:01:28 +0100 (CET)
Date:   Wed, 24 Mar 2021 11:01:28 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Bhaskar Chowdhury <unixbhaskar@gmail.com>
Cc:     robin.murphy@arm.com, tglx@linutronix.de, bhelgaas@google.com,
        andriy.shevchenko@linux.intel.com, maz@kernel.org,
        jonathan.derrick@intel.com, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, rdunlap@infradead.org
Subject: Re: [PATCH] MIPS: PCI: Fix a typo
Message-ID: <20210324100127.GH2378@alpha.franken.de>
References: <20210319051514.16447-1-unixbhaskar@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210319051514.16447-1-unixbhaskar@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Mar 19, 2021 at 10:45:14AM +0530, Bhaskar Chowdhury wrote:
> 
> s/packt/packet/
> 
> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
> ---
>  arch/mips/pci/pci-xtalk-bridge.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
