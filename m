Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A75AE566839
	for <lists+linux-mips@lfdr.de>; Tue,  5 Jul 2022 12:40:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230300AbiGEKkr (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 5 Jul 2022 06:40:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230004AbiGEKkp (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 5 Jul 2022 06:40:45 -0400
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 64AE215737
        for <linux-mips@vger.kernel.org>; Tue,  5 Jul 2022 03:40:44 -0700 (PDT)
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1o8fz0-0002Jv-01; Tue, 05 Jul 2022 12:40:42 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id BF8E2C0230; Tue,  5 Jul 2022 12:23:00 +0200 (CEST)
Date:   Tue, 5 Jul 2022 12:23:00 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Finn Thain <fthain@linux-m68k.org>, linux-mips@vger.kernel.org,
        kernel@pengutronix.de
Subject: Re: [PATCH] mips: sgi-ip22: Drop redundant check from .remove()
Message-ID: <20220705102300.GE9951@alpha.franken.de>
References: <20220618204037.35947-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220618204037.35947-1-u.kleine-koenig@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, Jun 18, 2022 at 10:40:37PM +0200, Uwe Kleine-König wrote:
> The remove callback is only called by the driver core if there is a
> driver to unbind, so there is no need to check dev->driver to be
> non-NULL.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
>  arch/mips/sgi-ip22/ip22-gio.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/mips/sgi-ip22/ip22-gio.c b/arch/mips/sgi-ip22/ip22-gio.c
> index 38d12f417e48..8686e8c1c4e5 100644
> --- a/arch/mips/sgi-ip22/ip22-gio.c
> +++ b/arch/mips/sgi-ip22/ip22-gio.c
> @@ -148,7 +148,7 @@ static void gio_device_remove(struct device *dev)
>  	struct gio_device *gio_dev = to_gio_device(dev);
>  	struct gio_driver *drv = to_gio_driver(dev->driver);
>  
> -	if (dev->driver && drv->remove)
> +	if (drv->remove)
>  		drv->remove(gio_dev);
>  }
>  
> 
> base-commit: f2906aa863381afb0015a9eb7fefad885d4e5a56
> -- 
> 2.36.1

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
