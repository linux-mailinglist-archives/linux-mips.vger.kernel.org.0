Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B45C226FF44
	for <lists+linux-mips@lfdr.de>; Fri, 18 Sep 2020 15:57:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726852AbgIRN5n (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 18 Sep 2020 09:57:43 -0400
Received: from elvis.franken.de ([193.175.24.41]:44599 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726299AbgIRN5h (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 18 Sep 2020 09:57:37 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1kJGtG-0002UB-02; Fri, 18 Sep 2020 15:57:30 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 6198BC0FDF; Fri, 18 Sep 2020 15:51:15 +0200 (CEST)
Date:   Fri, 18 Sep 2020 15:51:15 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Youling Tang <tangyouling@loongson.cn>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: netlogic: Remove unused code
Message-ID: <20200918135115.GC19202@alpha.franken.de>
References: <1599875679-8741-1-git-send-email-tangyouling@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1599875679-8741-1-git-send-email-tangyouling@loongson.cn>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, Sep 12, 2020 at 09:54:39AM +0800, Youling Tang wrote:
> Remove some unused code.
> 
> Signed-off-by: Youling Tang <tangyouling@loongson.cn>
> ---
>  arch/mips/include/asm/netlogic/psb-bootinfo.h | 15 ---------------
>  1 file changed, 15 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
