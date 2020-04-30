Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 519921BFFC2
	for <lists+linux-mips@lfdr.de>; Thu, 30 Apr 2020 17:11:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726691AbgD3PLi (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 30 Apr 2020 11:11:38 -0400
Received: from elvis.franken.de ([193.175.24.41]:33630 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726699AbgD3PLi (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 30 Apr 2020 11:11:38 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1jUAqa-0005Uk-00; Thu, 30 Apr 2020 17:11:32 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 30965C0358; Thu, 30 Apr 2020 17:05:45 +0200 (CEST)
Date:   Thu, 30 Apr 2020 17:05:45 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Tiezhu Yang <yangtiezhu@loongson.cn>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>
Subject: Re: [PATCH] MIPS: tools: Show result for loongson3-llsc-check
Message-ID: <20200430150545.GA17822@alpha.franken.de>
References: <1588250184-18730-1-git-send-email-yangtiezhu@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1588250184-18730-1-git-send-email-yangtiezhu@loongson.cn>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Apr 30, 2020 at 08:36:24PM +0800, Tiezhu Yang wrote:
> It is better to show the result before loongson3-llsc-check exit,
> otherwise we can see nothing if the return status is EXIT_SUCCESS,
> it seems confusing.
> 
> E.g. without this patch:
> 
> [loongson@localhost tools]$ ./loongson3-llsc-check ../../../vmlinux
> [loongson@localhost tools]$
> 
> With this patch:
> 
> [loongson@localhost tools]$ ./loongson3-llsc-check ../../../vmlinux
> loongson3-llsc-check returns success
> [loongson@localhost tools]$
> 
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> ---
>  arch/mips/tools/loongson3-llsc-check.c | 2 ++
>  1 file changed, 2 insertions(+)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
