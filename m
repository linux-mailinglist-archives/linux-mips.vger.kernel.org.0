Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7135215B8A3
	for <lists+linux-mips@lfdr.de>; Thu, 13 Feb 2020 05:36:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729358AbgBMEgB (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 12 Feb 2020 23:36:01 -0500
Received: from nbd.name ([46.4.11.11]:57030 "EHLO nbd.name"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727076AbgBMEgB (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 12 Feb 2020 23:36:01 -0500
Received: from [2a04:4540:1403:be00:cc25:4383:c3cc:1be9]
        by ds12 with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <john@phrozen.org>)
        id 1j26EJ-0000fa-1V; Thu, 13 Feb 2020 05:35:59 +0100
Subject: Re: [PATCH 7/7] MIPS: ralink: Replace <linux/clk-provider.h> by
 <linux/of_clk.h>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Paul Cercueil <paul@crapouillou.net>,
        James Hartley <james.hartley@sondrel.com>
Cc:     linux-mips@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200212101544.8793-1-geert+renesas@glider.be>
 <20200212101544.8793-8-geert+renesas@glider.be>
From:   John Crispin <john@phrozen.org>
Message-ID: <7c6519b6-fafa-1f8f-d10a-5bef1c7c5950@phrozen.org>
Date:   Thu, 13 Feb 2020 05:35:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20200212101544.8793-8-geert+renesas@glider.be>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 12/02/2020 11:15, Geert Uytterhoeven wrote:
> The Ralink platform code is not a clock provider, and just needs to call
> of_clk_init().
> 
> Hence it can include <linux/of_clk.h> instead of <linux/clk-provider.h>.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: John Crispin <john@phrozen.org>

> ---
>   arch/mips/ralink/timer-gic.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/mips/ralink/timer-gic.c b/arch/mips/ralink/timer-gic.c
> index 944fbe0fc7416f5a..dcf2a44ac51eede6 100644
> --- a/arch/mips/ralink/timer-gic.c
> +++ b/arch/mips/ralink/timer-gic.c
> @@ -8,7 +8,7 @@
>   #include <linux/init.h>
>   
>   #include <linux/of.h>
> -#include <linux/clk-provider.h>
> +#include <linux/of_clk.h>
>   #include <linux/clocksource.h>
>   
>   #include "common.h"
> 

