Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 103F527F2EA
	for <lists+linux-mips@lfdr.de>; Wed, 30 Sep 2020 22:01:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730303AbgI3UBm (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 30 Sep 2020 16:01:42 -0400
Received: from elvis.franken.de ([193.175.24.41]:36712 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730276AbgI3UBm (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 30 Sep 2020 16:01:42 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1kNiIE-0007xF-00; Wed, 30 Sep 2020 22:01:38 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id A723FC103E; Wed, 30 Sep 2020 21:54:40 +0200 (CEST)
Date:   Wed, 30 Sep 2020 21:54:40 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Pujin Shi <shipujin.t@gmail.com>
Cc:     Yousong Zhou <yszhou4tech@gmail.com>,
        Paul Burton <paulburton@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] MIPS: process: Add prototype for function
 arch_dup_task_struct
Message-ID: <20200930195440.GA11126@alpha.franken.de>
References: <20200929093047.1425-1-shipujin.t@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200929093047.1425-1-shipujin.t@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Sep 29, 2020 at 05:30:46PM +0800, Pujin Shi wrote:
> This commit adds a prototype to fix warning at W=1:
> 
>   arch/mips/kernel/process.c:95:5: error: no previous prototype for 'arch_dup_task_struct' [-Werror=missing-prototypes]
> 
> Signed-off-by: Pujin Shi <shipujin.t@gmail.com>
> ---
>  arch/mips/include/asm/processor.h | 1 +
>  1 file changed, 1 insertion(+)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
