Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2ECA3D0BD7
	for <lists+linux-mips@lfdr.de>; Wed, 21 Jul 2021 12:13:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234280AbhGUIq2 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 21 Jul 2021 04:46:28 -0400
Received: from elvis.franken.de ([193.175.24.41]:43139 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237250AbhGUIhW (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 21 Jul 2021 04:37:22 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1m68MW-0005tP-00; Wed, 21 Jul 2021 11:17:56 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 34C8DC0EF6; Wed, 21 Jul 2021 11:03:37 +0200 (CEST)
Date:   Wed, 21 Jul 2021 11:03:37 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Huang Pei <huangpei@loongson.cn>
Cc:     ambrosehua@gmail.com, Bibo Mao <maobibo@loongson.cn>,
        linux-mips@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Paul Burton <paulburton@kernel.org>,
        Li Xuefeng <lixuefeng@loongson.cn>,
        Yang Tiezhu <yangtiezhu@loongson.cn>,
        Gao Juxin <gaojuxin@loongson.cn>,
        Huacai Chen <chenhuacai@loongson.cn>,
        Jinyang He <hejinyang@loongson.cn>,
        Joshua Kinard <kumba@gentoo.org>
Subject: Re: [PATCH] MIPS: check return value of pgtable_pmd_page_ctor
Message-ID: <20210721090337.GA5744@alpha.franken.de>
References: <20210721052023.2111877-1-huangpei@loongson.cn>
 <20210721052023.2111877-2-huangpei@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210721052023.2111877-2-huangpei@loongson.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Jul 21, 2021 at 01:20:23PM +0800, Huang Pei wrote:
> +. According to Documentation/vm/split_page_table_lock, handle failure
> of pgtable_pmd_page_ctor
> 
> +. Use GFP_KERNEL_ACCOUNT instead of GFP_KERNEL|__GFP_ACCOUNT
> 
> +. Adjust coding style
> 
> Reported-by: Joshua Kinard <kumba@gentoo.org>
> Signed-off-by: Huang Pei <huangpei@loongson.cn>

do we need a Fixes tag ?

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
