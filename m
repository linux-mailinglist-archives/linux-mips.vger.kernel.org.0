Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D921332344
	for <lists+linux-mips@lfdr.de>; Tue,  9 Mar 2021 11:43:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230030AbhCIKnI (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 9 Mar 2021 05:43:08 -0500
Received: from elvis.franken.de ([193.175.24.41]:33970 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230319AbhCIKm4 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 9 Mar 2021 05:42:56 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1lJZpF-0007Wx-01; Tue, 09 Mar 2021 11:42:53 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id A017DC1BA6; Tue,  9 Mar 2021 11:42:12 +0100 (CET)
Date:   Tue, 9 Mar 2021 11:42:12 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     zhangqing <zhangqing@loongson.cn>
Cc:     Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] MIPS: Loongson64: Move loongson_system_configuration
 to loongson.h
Message-ID: <20210309104212.GB6740@alpha.franken.de>
References: <20210304110057.22144-1-zhangqing@loongson.cn>
 <20210304110057.22144-3-zhangqing@loongson.cn>
 <20210306080337.GC4744@alpha.franken.de>
 <dc1a1651-59be-aaae-67cb-4734b4e54b5c@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dc1a1651-59be-aaae-67cb-4734b4e54b5c@loongson.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, Mar 06, 2021 at 04:57:30PM +0800, zhangqing wrote:
> 
> 
> On 03/06/2021 04:03 PM, Thomas Bogendoerfer wrote:
> > as you are already touching mach-loongson64 files...
> > 
> > Is there a chance you clean up that up even further ? My goal is to
> > have only files in mach-<platform> files, which have an mach-generic
> > counterpart. Everything else should go to its own directory. So in
> > case of loongson something
> > 
> > like
> > 
> > arch/mips/include/asm/loongson		for common stuff
> > arch/mips/include/asm/loongson/32
> > arch/mips/include/asm/loongson/64
> > 
> > Comments ?
> 
> Hi,Thomas
> 
> I am very interested in cleaning up.
> Can you merge these two patches first?

yes, I'll just want to get fixes for 5.12 done before restarting applying
mips-next stuff.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
