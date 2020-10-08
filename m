Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF672287151
	for <lists+linux-mips@lfdr.de>; Thu,  8 Oct 2020 11:19:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726875AbgJHJTk (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 8 Oct 2020 05:19:40 -0400
Received: from elvis.franken.de ([193.175.24.41]:51446 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726118AbgJHJTk (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 8 Oct 2020 05:19:40 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1kQS5J-0004K4-00; Thu, 08 Oct 2020 11:19:37 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id D030CC10F0; Thu,  8 Oct 2020 11:19:07 +0200 (CEST)
Date:   Thu, 8 Oct 2020 11:19:07 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: tx49xx: move tx4939_add_memory_regions into only
 user
Message-ID: <20201008091907.GA6481@alpha.franken.de>
References: <20201006135838.9920-1-tsbogend@alpha.franken.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201006135838.9920-1-tsbogend@alpha.franken.de>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Oct 06, 2020 at 03:58:37PM +0200, Thomas Bogendoerfer wrote:
> tx4939_add_memory_regions() is only used in txx9/rbtx4939/prom.c.
> 
> Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> ---
>  arch/mips/include/asm/txx9/tx4939.h   |  1 -
>  arch/mips/txx9/generic/setup_tx4939.c | 17 -----------------
>  arch/mips/txx9/rbtx4939/prom.c        | 14 +++++++++++++-
>  3 files changed, 13 insertions(+), 19 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
