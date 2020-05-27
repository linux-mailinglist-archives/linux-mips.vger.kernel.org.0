Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE3811E403B
	for <lists+linux-mips@lfdr.de>; Wed, 27 May 2020 13:38:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730070AbgE0Lib (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 27 May 2020 07:38:31 -0400
Received: from elvis.franken.de ([193.175.24.41]:41062 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727902AbgE0Lia (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 27 May 2020 07:38:30 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1jduO3-00011U-04; Wed, 27 May 2020 13:38:19 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 6DC72C0594; Wed, 27 May 2020 13:35:27 +0200 (CEST)
Date:   Wed, 27 May 2020 13:35:27 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     YuanJunQing <yuanjunqing66@163.com>
Cc:     paulburton@kernel.org, chenhc@lemote.com,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        liulichao@loongson.cn
Subject: Re: [PATCH] MIPS: Fix IRQ tracing when call handle_fpe() and
 handle_msa_fpe()
Message-ID: <20200527113527.GE13537@alpha.franken.de>
References: <20200527061130.15618-1-yuanjunqing66@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200527061130.15618-1-yuanjunqing66@163.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, May 27, 2020 at 02:11:30PM +0800, YuanJunQing wrote:
>  Register "a1" is unsaved in this function,
>  when CONFIG_TRACE_IRQFLAGS is enabled,
>  the TRACE_IRQS_OFF macro will call trace_hardirqs_off(),
>  and this may change register "a1".
>  The changed register "a1" as argument will be send
>  to do_fpe() and do_msa_fpe().
> 
> Signed-off-by: YuanJunQing <yuanjunqing66@163.com>
> ---
>  arch/mips/kernel/genex.S | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
