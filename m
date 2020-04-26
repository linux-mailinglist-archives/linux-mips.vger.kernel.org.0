Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A54611B90B7
	for <lists+linux-mips@lfdr.de>; Sun, 26 Apr 2020 15:46:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726142AbgDZNqy (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 26 Apr 2020 09:46:54 -0400
Received: from elvis.franken.de ([193.175.24.41]:55778 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726140AbgDZNqy (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 26 Apr 2020 09:46:54 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1jShcS-0000jA-01; Sun, 26 Apr 2020 15:46:52 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id E22A5C0301; Sun, 26 Apr 2020 15:45:31 +0200 (CEST)
Date:   Sun, 26 Apr 2020 15:45:31 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Tiezhu Yang <yangtiezhu@loongson.cn>
Cc:     Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>
Subject: Re: [PATCH] MIPS: Loongson: Add support for perf tool
Message-ID: <20200426134531.GB8299@alpha.franken.de>
References: <1587893445-9656-1-git-send-email-yangtiezhu@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1587893445-9656-1-git-send-email-yangtiezhu@loongson.cn>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sun, Apr 26, 2020 at 05:30:45PM +0800, Tiezhu Yang wrote:
> In order to use perf tool on the Loongson platform, we should enable kernel
> support for various performance events provided by software and hardware,
> so add CONFIG_PERF_EVENTS=y to loongson3_defconfig.
> 
> E.g. without this patch:
> 
> [loongson@localhost perf]$ ./perf list
> 
> List of pre-defined events (to be used in -e):
> 
>   duration_time                                      [Tool event]
> 
>   rNNN                                               [Raw hardware event descriptor]
>   cpu/t1=v1[,t2=v2,t3 ...]/modifier                  [Raw hardware event descriptor]
>    (see 'man perf-list' on how to encode it)
> 
>   mem:<addr>[/len][:access]                          [Hardware breakpoint]
> 
> With this patch:
> 
> [loongson@localhost perf]$ ./perf list
> 
> List of pre-defined events (to be used in -e):
> 
>   branch-instructions OR branches                    [Hardware event]
>   branch-misses                                      [Hardware event]
>   cpu-cycles OR cycles                               [Hardware event]
>   instructions                                       [Hardware event]
> 
>   alignment-faults                                   [Software event]
>   bpf-output                                         [Software event]
>   context-switches OR cs                             [Software event]
>   cpu-clock                                          [Software event]
>   cpu-migrations OR migrations                       [Software event]
>   dummy                                              [Software event]
>   emulation-faults                                   [Software event]
>   major-faults                                       [Software event]
>   minor-faults                                       [Software event]
>   page-faults OR faults                              [Software event]
>   task-clock                                         [Software event]
> 
>   duration_time                                      [Tool event]
> 
>   L1-dcache-load-misses                              [Hardware cache event]
>   L1-dcache-store-misses                             [Hardware cache event]
>   L1-icache-load-misses                              [Hardware cache event]
>   branch-load-misses                                 [Hardware cache event]
>   branch-loads                                       [Hardware cache event]
>   dTLB-load-misses                                   [Hardware cache event]
>   dTLB-store-misses                                  [Hardware cache event]
>   iTLB-load-misses                                   [Hardware cache event]
> 
>   rNNN                                               [Raw hardware event descriptor]
>   cpu/t1=v1[,t2=v2,t3 ...]/modifier                  [Raw hardware event descriptor]
>    (see 'man perf-list' on how to encode it)
> 
>   mem:<addr>[/len][:access]                          [Hardware breakpoint]
> 
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> ---
>  arch/mips/configs/loongson3_defconfig | 1 +
>  1 file changed, 1 insertion(+)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
