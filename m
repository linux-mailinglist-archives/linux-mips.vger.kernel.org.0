Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00768287154
	for <lists+linux-mips@lfdr.de>; Thu,  8 Oct 2020 11:19:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727709AbgJHJTk (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 8 Oct 2020 05:19:40 -0400
Received: from elvis.franken.de ([193.175.24.41]:51447 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726176AbgJHJTk (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 8 Oct 2020 05:19:40 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1kQS5J-0004K4-01; Thu, 08 Oct 2020 11:19:37 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 43AF2C1121; Thu,  8 Oct 2020 11:19:25 +0200 (CEST)
Date:   Thu, 8 Oct 2020 11:19:25 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: SGI-IP28: disable use of ll/sc in kernel
Message-ID: <20201008091925.GB6481@alpha.franken.de>
References: <20201007101704.110101-1-tsbogend@alpha.franken.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201007101704.110101-1-tsbogend@alpha.franken.de>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Oct 07, 2020 at 12:17:04PM +0200, Thomas Bogendoerfer wrote:
> SGI-IP28 systems only use broken R10k rev 2.5 CPUs, which could lock
> up, if ll/sc sequences are issued in certain order. Since those systems
> are all non-SMP, we can disable ll/sc usage in kernel.
> 
> Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> ---
>  arch/mips/include/asm/mach-ip28/cpu-feature-overrides.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
