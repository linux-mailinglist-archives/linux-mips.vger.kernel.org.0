Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0DC039709C
	for <lists+linux-mips@lfdr.de>; Tue,  1 Jun 2021 11:51:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231201AbhFAJxi (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 1 Jun 2021 05:53:38 -0400
Received: from elvis.franken.de ([193.175.24.41]:59984 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230178AbhFAJxh (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 1 Jun 2021 05:53:37 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1lo13y-0001KW-00; Tue, 01 Jun 2021 11:51:54 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 14D7EC1B8B; Tue,  1 Jun 2021 11:29:50 +0200 (CEST)
Date:   Tue, 1 Jun 2021 11:29:50 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Ruiqi Gong <gongruiqi1@huawei.com>
Cc:     Wang Weiyang <wangweiyang2@huawei.com>, linux-mips@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH -next] MIPS: pm-cps: Make '__pcpu_scope_cps_cpu_state'
 static
Message-ID: <20210601092949.GA6961@alpha.franken.de>
References: <20210528070437.5780-1-gongruiqi1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210528070437.5780-1-gongruiqi1@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, May 28, 2021 at 03:04:37PM +0800, Ruiqi Gong wrote:
> Mark the per-CPU definition of cps_cpu_state as static to fix the following
> sparse tool complain:
> 
> arch/mips/kernel/pm-cps.c:66:1: warning:
>  symbol '__pcpu_scope_cps_cpu_state' was not declared. Should it be static?

did you compile/link a kernel with this patch ? I doubt that since there
is a refernec to this symbol in arch/mips/kernel/cps-vec.S.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
