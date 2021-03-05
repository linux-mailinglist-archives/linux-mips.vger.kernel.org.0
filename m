Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8CC5832E350
	for <lists+linux-mips@lfdr.de>; Fri,  5 Mar 2021 09:06:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229526AbhCEIGC (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 5 Mar 2021 03:06:02 -0500
Received: from elvis.franken.de ([193.175.24.41]:44303 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229464AbhCEIFp (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 5 Mar 2021 03:05:45 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1lI5St-0005u4-00; Fri, 05 Mar 2021 09:05:39 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id B9985C0F58; Fri,  5 Mar 2021 08:20:07 +0100 (CET)
Date:   Fri, 5 Mar 2021 08:20:07 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     HongJieDeng <deng.hongjie@h3c.com>
Cc:     paulburton@kernel.org, chenhc@lemote.com,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        liulichao@loongson.cn, denghongjie@h3c.com
Subject: Re: [PATCH] MIPS: Support large stack.
Message-ID: <20210305072007.GA5022@alpha.franken.de>
References: <20210305031257.14936-1-deng.hongjie@h3c.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210305031257.14936-1-deng.hongjie@h3c.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Mar 05, 2021 at 11:12:57AM +0800, HongJieDeng wrote:
> From: Hongjie Deng <deng.hongjie@h3c.com>
> 
> We need more stack space, xori/ori no longer apply when
>  _THREAD_MASK exceeds 16 bits

who is we and why do need more ?

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
