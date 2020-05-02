Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 409AB1C247A
	for <lists+linux-mips@lfdr.de>; Sat,  2 May 2020 12:20:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726574AbgEBKUJ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 2 May 2020 06:20:09 -0400
Received: from elvis.franken.de ([193.175.24.41]:36582 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726548AbgEBKUF (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 2 May 2020 06:20:05 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1jUpFa-00085x-00; Sat, 02 May 2020 12:20:02 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id EE3F2C0365; Sat,  2 May 2020 12:04:22 +0200 (CEST)
Date:   Sat, 2 May 2020 12:04:22 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Huacai Chen <chenhc@lemote.com>
Cc:     linux-mips@vger.kernel.org, Fuxin Zhang <zhangfx@lemote.com>,
        Zhangjin Wu <wuzhangjin@gmail.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: Re: [PATCH] MIPS: perf: Remove unnecessary "fallthrough" pseudo
 keywords
Message-ID: <20200502100422.GA3913@alpha.franken.de>
References: <1588395326-5351-1-git-send-email-chenhc@lemote.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1588395326-5351-1-git-send-email-chenhc@lemote.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, May 02, 2020 at 12:55:26PM +0800, Huacai Chen wrote:
> The last branch of switch-case doesn't need a "fallthrough" pseudo
> keyword, and it will cause errors when building a kernel with -Werror:
> 
>    arch/mips/kernel/perf_event_mipsxx.c: In function 'reset_counters':
>    include/linux/compiler_attributes.h:200:41: error: attribute 'fallthrough' not preceding a case label or default label [-Werror]
>      200 | # define fallthrough                    __attribute__((__fallthrough__))
>          |                                         ^~~~~~~~~~~~~
> >> arch/mips/kernel/perf_event_mipsxx.c:932:3: note: in expansion of macro 'fallthrough'
>      932 |   fallthrough;
>          |   ^~~~~~~~~~~
>    arch/mips/kernel/perf_event_mipsxx.c: In function 'loongson3_reset_counters':
>    include/linux/compiler_attributes.h:200:41: error: attribute 'fallthrough' not preceding a case label or default label [-Werror]
>      200 | # define fallthrough                    __attribute__((__fallthrough__))
>          |                                         ^~~~~~~~~~~~~
>    arch/mips/kernel/perf_event_mipsxx.c:903:3: note: in expansion of macro 'fallthrough'
>      903 |   fallthrough;
>          |   ^~~~~~~~~~~
>    cc1: all warnings being treated as errors
> 
> Fix it by removing unnecessary "fallthrough" pseudo keywords.
> 
> Reported-by: kbuild test robot <lkp@intel.com>
> Signed-off-by: Huacai Chen <chenhc@lemote.com>
> ---
>  arch/mips/kernel/perf_event_mipsxx.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/arch/mips/kernel/perf_event_mipsxx.c b/arch/mips/kernel/perf_event_mipsxx.c
> index a14974c..710b2c7 100644
> --- a/arch/mips/kernel/perf_event_mipsxx.c
> +++ b/arch/mips/kernel/perf_event_mipsxx.c
> @@ -900,7 +900,6 @@ static void loongson3_reset_counters(void *arg)
>  		mipspmu.write_counter(0, 0);
>  		mipsxx_pmu_write_control(0, 575<<5);
>  		mipspmu.write_counter(0, 0);
> -		fallthrough;
>  	}
>  }
>  
> @@ -929,7 +928,6 @@ static void reset_counters(void *arg)
>  	case 1:
>  		mipsxx_pmu_write_control(0, 0);
>  		mipspmu.write_counter(0, 0);
> -		fallthrough;
>  	}
>  }

please add breaks in both places.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
