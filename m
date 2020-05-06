Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5E1C1C6E95
	for <lists+linux-mips@lfdr.de>; Wed,  6 May 2020 12:39:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729101AbgEFKja (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 6 May 2020 06:39:30 -0400
Received: from outils.crapouillou.net ([89.234.176.41]:37704 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728338AbgEFKja (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 6 May 2020 06:39:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1588761567; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=lri60Rh/WWEZpTscgBE+aL46FEzB7vTrH7JrYZ13c3Q=;
        b=DOyX1sOJvjy/0Xco05BZaSYpDnLNZ48CV6sCtYIP7y4fd8j5Qb2k056eOb8MKKWMnhaSkZ
        E3G8S0cUPzcxkGEWmObSOwW/RP8Xzw3n91Kxpiz4OQM22y3fUrbaUh+zutW5JRNuQepI9s
        TWoykMWefZjCrL+ZdsJ8HrNtpiWkj2c=
Date:   Wed, 06 May 2020 12:39:17 +0200
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH] MIPS: ingenic: Replace <linux/clk-provider.h> by
 <linux/of_clk.h>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, linux-clk@vger.kernel.org
Message-Id: <H9OW9Q.YK4HNVO1QA6G1@crapouillou.net>
In-Reply-To: <20200506090452.1290-1-geert+renesas@glider.be>
References: <20200506090452.1290-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi,

Le mer. 6 mai 2020 =E0 11:04, Geert Uytterhoeven=20
<geert+renesas@glider.be> a =E9crit :
> The JZ4740 setup code is not a clock provider, and just needs to call
> of_clk_init().
>=20
> Hence it can include <linux/of_clk.h> instead of=20
> <linux/clk-provider.h>.
>=20
> Fixes: f932449c11dabb4b ("MIPS: ingenic: Drop obsolete code, merge=20
> the rest in setup.c")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Looks good to me. Thanks for your patch.

Reviewed-by: Paul Cercueil <paul@crapouillou.net>

Cheers,
-Paul

> ---
>  arch/mips/jz4740/setup.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/mips/jz4740/setup.c b/arch/mips/jz4740/setup.c
> index 81428ddcaa9736f9..142cf127bf9e1c9f 100644
> --- a/arch/mips/jz4740/setup.c
> +++ b/arch/mips/jz4740/setup.c
> @@ -5,13 +5,13 @@
>   *  JZ4740 setup code
>   */
>=20
> -#include <linux/clk-provider.h>
>  #include <linux/clocksource.h>
>  #include <linux/init.h>
>  #include <linux/io.h>
>  #include <linux/irqchip.h>
>  #include <linux/kernel.h>
>  #include <linux/libfdt.h>
> +#include <linux/of_clk.h>
>  #include <linux/of_fdt.h>
>  #include <linux/pm.h>
>  #include <linux/suspend.h>
> --
> 2.17.1
>=20


