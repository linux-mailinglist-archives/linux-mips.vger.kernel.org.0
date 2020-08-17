Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D271246574
	for <lists+linux-mips@lfdr.de>; Mon, 17 Aug 2020 13:31:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728464AbgHQLbh (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 17 Aug 2020 07:31:37 -0400
Received: from elvis.franken.de ([193.175.24.41]:49801 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728465AbgHQLbZ (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 17 Aug 2020 07:31:25 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1k7dMD-0003tH-03; Mon, 17 Aug 2020 13:31:17 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id A781AC0D74; Mon, 17 Aug 2020 13:22:37 +0200 (CEST)
Date:   Mon, 17 Aug 2020 13:22:37 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Zejiang Tang <tangzejiang@loongson.cn>
Cc:     Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@redhat.com>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, Xuefeng Li <lixuefeng@loongson.cn>
Subject: Re: [PATCH v2] MIPS: ftrace: Remove redundant #ifdef
 CONFIG_DYNAMIC_FTRACE
Message-ID: <20200817112237.GD11725@alpha.franken.de>
References: <1597372824-8270-1-git-send-email-tangzejiang@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1597372824-8270-1-git-send-email-tangzejiang@loongson.cn>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Aug 14, 2020 at 10:40:24AM +0800, Zejiang Tang wrote:
> There exists redundant #ifdef CONFIG_DYNAMIC_FTRACE in ftrace.c, remove it.
> 
> Signed-off-by: Zejiang Tang <tangzejiang@loongson.cn>
> Reviewed-by: Steven Rostedt (VMware) <rostedt@goodmis.org>
> ---
>  arch/mips/kernel/ftrace.c | 4 ----
>  1 file changed, 4 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
