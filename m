Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 921F633DC06
	for <lists+linux-mips@lfdr.de>; Tue, 16 Mar 2021 19:04:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233762AbhCPSDV (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 16 Mar 2021 14:03:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231502AbhCPSBy (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 16 Mar 2021 14:01:54 -0400
Received: from nbd.name (nbd.name [IPv6:2a01:4f8:221:3d45::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9A66C061756;
        Tue, 16 Mar 2021 11:01:53 -0700 (PDT)
Received: from [2a04:4540:1403:b600:2d8:61ff:fef0:a7c3]
        by ds12 with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <john@phrozen.org>)
        id 1lME0p-0003uU-O6; Tue, 16 Mar 2021 19:01:47 +0100
Subject: Re: [PATCH] MIPS: ralink: define stubs for clk_set_parent to fix
 compile testing
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     thierry.reding@gmail.com, linux-tegra@vger.kernel.org,
        balbi@kernel.org, linux-usb@vger.kernel.org, digetx@gmail.com,
        kernel test robot <lkp@intel.com>
References: <20210316175725.79981-1-krzysztof.kozlowski@canonical.com>
From:   John Crispin <john@phrozen.org>
Message-ID: <5f117b2f-90a9-4684-a453-0f7493d89c55@phrozen.org>
Date:   Tue, 16 Mar 2021 19:01:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210316175725.79981-1-krzysztof.kozlowski@canonical.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


On 16.03.21 18:57, Krzysztof Kozlowski wrote:
> The Ralink MIPS platform does not use Common Clock Framework and does
> not define certain clock operations leading to compile test failures:
>
>      /usr/bin/mips-linux-gnu-ld: drivers/usb/phy/phy-tegra-usb.o: in function `tegra_usb_phy_init':
>      phy-tegra-usb.c:(.text+0x1dd4): undefined reference to `clk_get_parent'
>
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Acked-by John Crispin <john@phrozen.org>
> ---
>   arch/mips/ralink/clk.c | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
>
> diff --git a/arch/mips/ralink/clk.c b/arch/mips/ralink/clk.c
> index 2f9d5acb38ea..8387177a47ef 100644
> --- a/arch/mips/ralink/clk.c
> +++ b/arch/mips/ralink/clk.c
> @@ -70,6 +70,20 @@ long clk_round_rate(struct clk *clk, unsigned long rate)
>   }
>   EXPORT_SYMBOL_GPL(clk_round_rate);
>   
> +int clk_set_parent(struct clk *clk, struct clk *parent)
> +{
> +	WARN_ON(clk);
> +	return -1;
> +}
> +EXPORT_SYMBOL(clk_set_parent);
> +
> +struct clk *clk_get_parent(struct clk *clk)
> +{
> +	WARN_ON(clk);
> +	return NULL;
> +}
> +EXPORT_SYMBOL(clk_get_parent);
> +
>   void __init plat_time_init(void)
>   {
>   	struct clk *clk;
