Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 665003281BC
	for <lists+linux-mips@lfdr.de>; Mon,  1 Mar 2021 16:05:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236880AbhCAPEQ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 1 Mar 2021 10:04:16 -0500
Received: from elvis.franken.de ([193.175.24.41]:33717 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236855AbhCAPEB (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 1 Mar 2021 10:04:01 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1lGk4r-00041h-00; Mon, 01 Mar 2021 16:03:17 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id B6038C0193; Mon,  1 Mar 2021 15:48:00 +0100 (CET)
Date:   Mon, 1 Mar 2021 15:48:00 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Adrian Schmutzler <freifunk@adrianschmutzler.de>
Cc:     linux-mips@vger.kernel.org
Subject: Re: [PATCH] MIPS: octeon: add explicit interface setup on E200
Message-ID: <20210301144800.GA11261@alpha.franken.de>
References: <20210225165258.43995-1-freifunk@adrianschmutzler.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210225165258.43995-1-freifunk@adrianschmutzler.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Feb 25, 2021 at 05:52:58PM +0100, Adrian Schmutzler wrote:
> Define the device explicitly instead of having it fall into the
> "unknown board" default.
> 
> The board is already present in cvmx-bootinfo.h.
> 
> Signed-off-by: Adrian Schmutzler <freifunk@adrianschmutzler.de>
> ---
>  arch/mips/cavium-octeon/executive/cvmx-helper-board.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/mips/cavium-octeon/executive/cvmx-helper-board.c b/arch/mips/cavium-octeon/executive/cvmx-helper-board.c
> index abd11b7af22f..ce9d2553537e 100644
> --- a/arch/mips/cavium-octeon/executive/cvmx-helper-board.c
> +++ b/arch/mips/cavium-octeon/executive/cvmx-helper-board.c
> @@ -174,6 +174,8 @@ int cvmx_helper_board_get_mii_address(int ipd_port)
>  			return 7 - ipd_port;
>  		else
>  			return -1;
> +	case CVMX_BOARD_TYPE_UBNT_E200:
> +		return -1;
>  	case CVMX_BOARD_TYPE_KONTRON_S1901:
>  		if (ipd_port == CVMX_HELPER_BOARD_MGMT_IPD_PORT)
>  			return 1;

why doesn't the device tree provide the phy address ?

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
