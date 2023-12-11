Return-Path: <linux-mips+bounces-674-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E774880DC4F
	for <lists+linux-mips@lfdr.de>; Mon, 11 Dec 2023 22:02:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 245E41C215F6
	for <lists+linux-mips@lfdr.de>; Mon, 11 Dec 2023 21:02:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84AD854BC0;
	Mon, 11 Dec 2023 21:02:03 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id AA4F6BE;
	Mon, 11 Dec 2023 13:01:58 -0800 (PST)
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1rCnPW-0007EJ-00; Mon, 11 Dec 2023 22:01:54 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 179B4C0A2B; Mon, 11 Dec 2023 21:56:42 +0100 (CET)
Date: Mon, 11 Dec 2023 21:56:42 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>,
	Paul Burton <paulburton@kernel.org>,
	Ralf Baechle <ralf@linux-mips.org>, Jiri Slaby <jslaby@suse.cz>,
	linux-mips@vger.kernel.org
Subject: Re: [PATCH] MIPS: SGI-IP27: hubio: fix nasid kernel-doc warning
Message-ID: <ZXd3il10tu4yxWi+@alpha.franken.de>
References: <20231111030213.31595-1-rdunlap@infradead.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231111030213.31595-1-rdunlap@infradead.org>

On Fri, Nov 10, 2023 at 07:02:13PM -0800, Randy Dunlap wrote:
> ip27-hubio.c:32: warning: Function parameter or member 'nasid' not described in 'hub_pio_map'
> ip27-hubio.c:32: warning: Excess function parameter 'hub' description in 'hub_pio_map'
> 
> Fixes: 4bf841ebf17a ("MIPS: SGI-IP27: get rid of compact node ids")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: lore.kernel.org/r/202311101336.BUL1JuvU-lkp@intel.com
> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Cc: Paul Burton <paulburton@kernel.org>
> Cc: Ralf Baechle <ralf@linux-mips.org>
> Cc: Jiri Slaby <jslaby@suse.cz>
> Cc: linux-mips@vger.kernel.org
> ---
>  arch/mips/sgi-ip27/ip27-hubio.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff -- a/arch/mips/sgi-ip27/ip27-hubio.c b/arch/mips/sgi-ip27/ip27-hubio.c
> --- a/arch/mips/sgi-ip27/ip27-hubio.c
> +++ b/arch/mips/sgi-ip27/ip27-hubio.c
> @@ -21,7 +21,7 @@ static int force_fire_and_forget = 1;
>  /**
>   * hub_pio_map	-  establish a HUB PIO mapping
>   *
> - * @hub:	hub to perform PIO mapping on
> + * @nasid:	nasid to perform PIO mapping on
>   * @widget:	widget ID to perform PIO mapping for
>   * @xtalk_addr: xtalk_address that needs to be mapped
>   * @size:	size of the PIO mapping

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

