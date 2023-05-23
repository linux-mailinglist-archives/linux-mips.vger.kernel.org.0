Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6117F70D894
	for <lists+linux-mips@lfdr.de>; Tue, 23 May 2023 11:13:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236134AbjEWJNz (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 23 May 2023 05:13:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236159AbjEWJNx (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 23 May 2023 05:13:53 -0400
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 512B3133
        for <linux-mips@vger.kernel.org>; Tue, 23 May 2023 02:13:45 -0700 (PDT)
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1q1O5L-0007MY-00; Tue, 23 May 2023 11:13:39 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id CD31CC02E6; Tue, 23 May 2023 11:08:45 +0200 (CEST)
Date:   Tue, 23 May 2023 11:08:45 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Manuel Lauss <manuel.lauss@gmail.com>
Cc:     linux-mips@vger.kernel.org
Subject: Re: [PATCH] MIPS: Restore Au1300 support
Message-ID: <20230523090845.GE9484@alpha.franken.de>
References: <20230510103323.301065-1-manuel.lauss@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230510103323.301065-1-manuel.lauss@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_PASS,T_SCC_BODY_TEXT_LINE,T_SPF_TEMPERROR autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, May 10, 2023 at 12:33:23PM +0200, Manuel Lauss wrote:
> The Au1300, at least the one I have to test, uses the NetLogic vendor
> ID, but commit 95b8a5e0111a ("MIPS: Remove NETLOGIC support") also
> dropped Au1300 detection.  Restore Au1300 detection.
> 
> Tested on DB1300 with Au1380 chip.
> 
> Signed-off-by: Manuel Lauss <manuel.lauss@gmail.com>
> ---
>  arch/mips/kernel/cpu-probe.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/mips/kernel/cpu-probe.c b/arch/mips/kernel/cpu-probe.c
> index 6d15a398d389..e79adcb128e6 100644
> --- a/arch/mips/kernel/cpu-probe.c
> +++ b/arch/mips/kernel/cpu-probe.c
> @@ -1502,6 +1502,10 @@ static inline void cpu_probe_alchemy(struct cpuinfo_mips *c, unsigned int cpu)
>  			break;
>  		}
>  		break;
> +	case PRID_IMP_NETLOGIC_AU13XX:
> +		c->cputype = CPU_ALCHEMY;
> +		__cpu_name[cpu] = "Au1300";
> +		break;
>  	}
>  }
>  
> @@ -1863,6 +1867,7 @@ void cpu_probe(void)
>  		cpu_probe_mips(c, cpu);
>  		break;
>  	case PRID_COMP_ALCHEMY:
> +	case PRID_COMP_NETLOGIC:
>  		cpu_probe_alchemy(c, cpu);
>  		break;
>  	case PRID_COMP_SIBYTE:
> -- 
> 2.40.1

applied to mips-fixes.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
