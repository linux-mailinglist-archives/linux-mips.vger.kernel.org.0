Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2711E1E3FA7
	for <lists+linux-mips@lfdr.de>; Wed, 27 May 2020 13:17:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387961AbgE0LRS (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 27 May 2020 07:17:18 -0400
Received: from elvis.franken.de ([193.175.24.41]:41021 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387397AbgE0LRS (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 27 May 2020 07:17:18 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1jdu3b-0000sS-00; Wed, 27 May 2020 13:17:11 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id B99A5C045B; Wed, 27 May 2020 12:49:52 +0200 (CEST)
Date:   Wed, 27 May 2020 12:49:52 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Lichao Liu <liulichao@loongson.cn>
Cc:     Paul Burton <paulburton@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Max Filippov <jcmvbkbc@gmail.com>, yuanjunqing@loongson.cn,
        linux-mips@vger.kernel.org
Subject: Re: [PATCH] MIPS: CPU_LOONGSON2EF need software to maintain cache
 consistency
Message-ID: <20200527104952.GA12716@alpha.franken.de>
References: <20200526111438.3788-1-liulichao@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200526111438.3788-1-liulichao@loongson.cn>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, May 26, 2020 at 07:14:38PM +0800, Lichao Liu wrote:
> CPU_LOONGSON2EF need software to maintain cache consistency,
> so modify the 'cpu_needs_post_dma_flush' function to return true
> when the cpu type is CPU_LOONGSON2EF.
> ---
>  arch/mips/mm/dma-noncoherent.c | 1 +
>  1 file changed, 1 insertion(+)

Please add your signed-off-by.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
