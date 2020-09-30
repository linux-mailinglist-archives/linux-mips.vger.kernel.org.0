Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5990C27F2E4
	for <lists+linux-mips@lfdr.de>; Wed, 30 Sep 2020 22:01:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730281AbgI3UBm (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 30 Sep 2020 16:01:42 -0400
Received: from elvis.franken.de ([193.175.24.41]:36711 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730271AbgI3UBm (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 30 Sep 2020 16:01:42 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1kNiIE-0007xF-01; Wed, 30 Sep 2020 22:01:38 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id ECCB7C103F; Wed, 30 Sep 2020 21:54:53 +0200 (CEST)
Date:   Wed, 30 Sep 2020 21:54:53 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Pujin Shi <shipujin.t@gmail.com>
Cc:     Yousong Zhou <yszhou4tech@gmail.com>,
        Paul Burton <paulburton@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] MIPS: process: include exec.h header in process.c
Message-ID: <20200930195453.GB11126@alpha.franken.de>
References: <20200929093047.1425-1-shipujin.t@gmail.com>
 <20200929093047.1425-2-shipujin.t@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200929093047.1425-2-shipujin.t@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Sep 29, 2020 at 05:30:47PM +0800, Pujin Shi wrote:
>   arch/mips/kernel/process.c:696:15: error: no previous prototype for 'arch_align_stack' [-Werror=missing-prototypes]
> 
> Signed-off-by: Pujin Shi <shipujin.t@gmail.com>
> ---
>  arch/mips/kernel/process.c | 1 +
>  1 file changed, 1 insertion(+)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
