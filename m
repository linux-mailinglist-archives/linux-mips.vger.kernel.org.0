Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DCF3224656F
	for <lists+linux-mips@lfdr.de>; Mon, 17 Aug 2020 13:31:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727906AbgHQLbV (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 17 Aug 2020 07:31:21 -0400
Received: from elvis.franken.de ([193.175.24.41]:49788 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728453AbgHQLbU (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 17 Aug 2020 07:31:20 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1k7dMD-0003tH-04; Mon, 17 Aug 2020 13:31:17 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 954F4C0D74; Mon, 17 Aug 2020 13:23:20 +0200 (CEST)
Date:   Mon, 17 Aug 2020 13:23:20 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Aleksander Jan Bajkowski <olek2@wp.pl>
Cc:     linux-mips@vger.kernel.org, john@phrozen.org, hauke@hauke-m.de
Subject: Re: MIPS: lantiq: add missing GPHY clock aliases for ar10 and grx390
Message-ID: <20200817112320.GE11725@alpha.franken.de>
References: <20200810180946.2766-1-olek2@wp.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200810180946.2766-1-olek2@wp.pl>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Aug 10, 2020 at 08:09:46PM +0200, Aleksander Jan Bajkowski wrote:
> Add missing GPHY clock aliases for ar10 (xrx300) and grx390 (xrx330).
> PMU in ar10 and grx390 differs from vr9. Ar10 has 3 and grx390 has 4
> built-in GPHY compared to vr9 which has 2.
> 
> Corespondings PMU bit:
> GPHY0 -> bit 29
> GPHY1 -> bit 30
> GPHY2 -> bit 31
> GPHY3 -> bit 26
> 
> Tested on D-Link DWR-966 with OpenWRT.
> 
> Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
> Cc: linux-mips@vger.kernel.org
> Cc: john@phrozen.org
> Cc: hauke@hauke-m.de
> Cc: tsbogend@alpha.franken.de
> ---
>  arch/mips/lantiq/xway/sysctrl.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
