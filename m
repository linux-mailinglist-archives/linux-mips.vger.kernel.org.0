Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E42F9566837
	for <lists+linux-mips@lfdr.de>; Tue,  5 Jul 2022 12:40:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231937AbiGEKkq (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 5 Jul 2022 06:40:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230300AbiGEKkq (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 5 Jul 2022 06:40:46 -0400
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 6496415734
        for <linux-mips@vger.kernel.org>; Tue,  5 Jul 2022 03:40:44 -0700 (PDT)
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1o8fyz-0002Jv-00; Tue, 05 Jul 2022 12:40:41 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id CC4C0C01FB; Tue,  5 Jul 2022 12:20:53 +0200 (CEST)
Date:   Tue, 5 Jul 2022 12:20:53 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Liang He <windhl@126.com>
Cc:     linux-mips@vger.kernel.org
Subject: Re: [PATCH] mips: cavium-octeon: Fix missing of_node_put() in
 octeon2_usb_clocks_start
Message-ID: <20220705102053.GA9951@alpha.franken.de>
References: <20220701124112.237902-1-windhl@126.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220701124112.237902-1-windhl@126.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Jul 01, 2022 at 08:41:12PM +0800, Liang He wrote:
> We should call of_node_put() for the reference 'uctl_node' returned by
> of_get_parent() which will increase the refcount. Otherwise, there will
> be a refcount leak bug.
> 
> Signed-off-by: Liang He <windhl@126.com>
> ---
>  arch/mips/cavium-octeon/octeon-platform.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/mips/cavium-octeon/octeon-platform.c b/arch/mips/cavium-octeon/octeon-platform.c
> index a994022e32c9..ce05c0dd3acd 100644
> --- a/arch/mips/cavium-octeon/octeon-platform.c
> +++ b/arch/mips/cavium-octeon/octeon-platform.c
> @@ -86,11 +86,12 @@ static void octeon2_usb_clocks_start(struct device *dev)
>  					 "refclk-frequency", &clock_rate);
>  		if (i) {
>  			dev_err(dev, "No UCTL \"refclk-frequency\"\n");
> +			of_node_put(uctl_node);
>  			goto exit;
>  		}
>  		i = of_property_read_string(uctl_node,
>  					    "refclk-type", &clock_type);
> -
> +		of_node_put(uctl_node);
>  		if (!i && strcmp("crystal", clock_type) == 0)
>  			is_crystal_clock = true;
>  	}
> -- 
> 2.25.1

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
