Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3E144554989
	for <lists+linux-mips@lfdr.de>; Wed, 22 Jun 2022 14:17:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244217AbiFVIVh (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 22 Jun 2022 04:21:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240874AbiFVIVg (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 22 Jun 2022 04:21:36 -0400
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 470B7381B0
        for <linux-mips@vger.kernel.org>; Wed, 22 Jun 2022 01:21:35 -0700 (PDT)
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1o3vcD-0007T2-00; Wed, 22 Jun 2022 10:21:33 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id BC210C01AA; Wed, 22 Jun 2022 09:55:14 +0200 (CEST)
Date:   Wed, 22 Jun 2022 09:55:14 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Liang He <windhl@126.com>
Cc:     linux-mips@vger.kernel.org
Subject: Re: [PATCH v2] mips: lantiq: Add missing of_node_put() in irq.c
Message-ID: <20220622075514.GA7828@alpha.franken.de>
References: <20220621154125.4084010-1-windhl@126.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220621154125.4084010-1-windhl@126.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Jun 21, 2022 at 11:41:25PM +0800, Liang He wrote:
> In icu_of_init(), of_find_compatible_node() will return a node
> pointer with refcount incremented. We should use of_node_put()
> when it is not used anymore.
> 
> Signed-off-by: Liang He <windhl@126.com>
> ---
>  changelog:
> 
>  v2: fix bug intro-ed by v1, only one put needed.
>  v1: add missing of_node_put()
> 
>  arch/mips/lantiq/irq.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/mips/lantiq/irq.c b/arch/mips/lantiq/irq.c
> index b732495f138a..20622bf0a9b3 100644
> --- a/arch/mips/lantiq/irq.c
> +++ b/arch/mips/lantiq/irq.c
> @@ -408,6 +408,7 @@ int __init icu_of_init(struct device_node *node, struct device_node *parent)
>  		if (!ltq_eiu_membase)
>  			panic("Failed to remap eiu memory");
>  	}
> +	of_node_put(eiu_node);
>  
>  	return 0;
>  }
> -- 
> 2.25.1

applied to mips-fixes.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
