Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E4E93554CA
	for <lists+linux-mips@lfdr.de>; Tue,  6 Apr 2021 15:18:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243580AbhDFNSr (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 6 Apr 2021 09:18:47 -0400
Received: from elvis.franken.de ([193.175.24.41]:59069 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229720AbhDFNSr (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 6 Apr 2021 09:18:47 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1lTlbK-0006qP-06; Tue, 06 Apr 2021 15:18:38 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 91B91C24D9; Tue,  6 Apr 2021 15:11:01 +0200 (CEST)
Date:   Tue, 6 Apr 2021 15:11:01 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
Cc:     John Crispin <john@phrozen.org>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, Mike Rapoport <rppt@kernel.org>
Subject: Re: [PATCH] MIPS: ralink: rt288x: select MIPS_AUTO_PFN_OFFSET
Message-ID: <20210406131101.GH9505@alpha.franken.de>
References: <20210307194030.8007-1-ilya.lipnitskiy@gmail.com>
 <20210404021126.1399920-1-ilya.lipnitskiy@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210404021126.1399920-1-ilya.lipnitskiy@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, Apr 03, 2021 at 07:11:26PM -0700, Ilya Lipnitskiy wrote:
> RT288X systems may have a non-zero ramstart causing problems with memory
> reservations and boot hangs, as well as messages like:
>   Wasting 1048576 bytes for tracking 32768 unused pages
> 
> Both are alleviated by selecting MIPS_AUTO_PFN_OFFSET for such
> platforms.
> 
> Tested on a Belkin F5D8235 v1 RT2880 device.
> 
> Link: https://lore.kernel.org/linux-mips/20180820233111.xww5232dxbuouf4n@pburton-laptop/
> 
> Signed-off-by: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
> Cc: Mike Rapoport <rppt@kernel.org>
> ---
>  arch/mips/ralink/Kconfig | 1 +
>  1 file changed, 1 insertion(+)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
