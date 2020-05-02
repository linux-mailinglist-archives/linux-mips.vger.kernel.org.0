Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8A8E1C2479
	for <lists+linux-mips@lfdr.de>; Sat,  2 May 2020 12:20:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726654AbgEBKUI (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 2 May 2020 06:20:08 -0400
Received: from elvis.franken.de ([193.175.24.41]:36583 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726574AbgEBKUF (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 2 May 2020 06:20:05 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1jUpFa-00085x-01; Sat, 02 May 2020 12:20:02 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id B0495C036B; Sat,  2 May 2020 12:07:01 +0200 (CEST)
Date:   Sat, 2 May 2020 12:07:01 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org, chenhc@lemote.com
Subject: Re: [PATCH] MIPS: Loongson64: Correct TLB type for Loongson-3 Classic
Message-ID: <20200502100701.GA4437@alpha.franken.de>
References: <20200430164802.2809056-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200430164802.2809056-1-jiaxun.yang@flygoat.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, May 01, 2020 at 12:48:02AM +0800, Jiaxun Yang wrote:
> Huacai just informed me that some early Loongson-3A2000 had wrong
> TLB type in Config0 register. That means we have to correct it via
> PRID.
> 
> It looks like I shoudn't drop MIPS_CPU_FTLB flag in PRID case for
> Loongson-3 Classic.
> 
> Fixes: da1bd29742b1 ("MIPS: Loongson64: Probe CPU features via CPUCFG")
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> Reported-by: Huacai Chen <chenhc@lemote.com>
> ---
>  arch/mips/kernel/cpu-probe.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
