Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0F9F3192F57
	for <lists+linux-mips@lfdr.de>; Wed, 25 Mar 2020 18:34:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727456AbgCYRe0 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 25 Mar 2020 13:34:26 -0400
Received: from elvis.franken.de ([193.175.24.41]:34593 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727129AbgCYRe0 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 25 Mar 2020 13:34:26 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1jH9v6-0008NM-01; Wed, 25 Mar 2020 18:34:24 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id D5A55C0D49; Wed, 25 Mar 2020 18:31:23 +0100 (CET)
Date:   Wed, 25 Mar 2020 18:31:23 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Yousong Zhou <yszhou4tech@gmail.com>
Cc:     Paul Burton <paulburton@kernel.org>, linux-mips@vger.kernel.org
Subject: Re: [PATCH v2] MIPS: Exclude more dsemul code when
 CONFIG_MIPS_FP_SUPPORT=n
Message-ID: <20200325173123.GB17524@alpha.franken.de>
References: <20200324152751.57666-1-yszhou4tech@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200324152751.57666-1-yszhou4tech@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Mar 24, 2020 at 11:27:51PM +0800, Yousong Zhou wrote:
> This furthers what commit 42b10815d559 ("MIPS: Don't compile math-emu
> when CONFIG_MIPS_FP_SUPPORT=n") has done
> 
> Signed-off-by: Yousong Zhou <yszhou4tech@gmail.com>
> ---
> v2 <- v1: Fix using unknown symbol CONFIG_MIPS_FP_EMULATOR, @tsbogend
> 
>  arch/mips/include/asm/processor.h | 12 ++++++------
>  arch/mips/kernel/process.c        | 10 ++++++++--
>  arch/mips/kernel/vdso.c           | 26 +++++++++++++++-----------
>  3 files changed, 29 insertions(+), 19 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
