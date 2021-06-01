Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DBD37397098
	for <lists+linux-mips@lfdr.de>; Tue,  1 Jun 2021 11:51:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230519AbhFAJxh (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 1 Jun 2021 05:53:37 -0400
Received: from elvis.franken.de ([193.175.24.41]:59994 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230262AbhFAJxh (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 1 Jun 2021 05:53:37 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1lo13y-0001KW-01; Tue, 01 Jun 2021 11:51:54 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 5D3FFC1B8C; Tue,  1 Jun 2021 11:47:36 +0200 (CEST)
Date:   Tue, 1 Jun 2021 11:47:36 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Tiezhu Yang <yangtiezhu@loongson.cn>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] MIPS: Loongson64: Make some functions static in smp.c
Message-ID: <20210601094736.GB6961@alpha.franken.de>
References: <1622116373-24218-1-git-send-email-yangtiezhu@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1622116373-24218-1-git-send-email-yangtiezhu@loongson.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, May 27, 2021 at 07:52:53PM +0800, Tiezhu Yang wrote:
> Make some functions static to fix the following sparse warnings:
> 
>   arch/mips/loongson64/smp.c:54:5: sparse: sparse: symbol 'ipi_read_clear' was not declared. Should it be static?
>   arch/mips/loongson64/smp.c:55:6: sparse: sparse: symbol 'ipi_write_action' was not declared. Should it be static?
>   arch/mips/loongson64/smp.c:56:6: sparse: sparse: symbol 'ipi_write_enable' was not declared. Should it be static?
>   arch/mips/loongson64/smp.c:57:6: sparse: sparse: symbol 'ipi_clear_buf' was not declared. Should it be static?
>   arch/mips/loongson64/smp.c:58:6: sparse: sparse: symbol 'ipi_write_buf' was not declared. Should it be static?
> 
> Fixes: fed4955f304e ("MIPS: Loongson64: Add Mail_Send support for 3A4000+ CPU")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> ---
>  arch/mips/loongson64/smp.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
