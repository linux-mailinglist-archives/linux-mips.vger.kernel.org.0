Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E95921B49E9
	for <lists+linux-mips@lfdr.de>; Wed, 22 Apr 2020 18:11:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726189AbgDVQLM (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 22 Apr 2020 12:11:12 -0400
Received: from elvis.franken.de ([193.175.24.41]:50617 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726183AbgDVQLL (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 22 Apr 2020 12:11:11 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1jRHxm-0002nO-00; Wed, 22 Apr 2020 18:11:02 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 10950C02B8; Wed, 22 Apr 2020 18:10:45 +0200 (CEST)
Date:   Wed, 22 Apr 2020 18:10:45 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Huacai Chen <chenhc@lemote.com>
Cc:     linux-mips@vger.kernel.org, Fuxin Zhang <zhangfx@lemote.com>,
        Zhangjin Wu <wuzhangjin@gmail.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Pei Huang <huangpei@loongson.cn>,
        Shuangshuang Zhang <zhangshuangshuang@loongson.cn>
Subject: Re: [PATCH V2 2/3] MIPS: Move unaligned load/store helpers to inst.h
Message-ID: <20200422161044.GA22753@alpha.franken.de>
References: <1587548422-10707-1-git-send-email-chenhc@lemote.com>
 <1587548422-10707-2-git-send-email-chenhc@lemote.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1587548422-10707-2-git-send-email-chenhc@lemote.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Apr 22, 2020 at 05:40:21PM +0800, Huacai Chen wrote:
> Move unaligned load/store helpers from unaligned.c to inst.h, then
> other parts of the kernel can use these helpers.
> 
> Signed-off-by: Pei Huang <huangpei@loongson.cn>
> Signed-off-by: Shuangshuang Zhang <zhangshuangshuang@loongson.cn>
> Signed-off-by: Huacai Chen <chenhc@lemote.com>
> Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>  arch/mips/include/asm/inst.h | 773 ++++++++++++++++++++++++++++++++++++++++++
>  arch/mips/kernel/unaligned.c | 775 -------------------------------------------

this patch still has checkpatch errors/warnings and more serious
it breaks at least IP30 builds.

Patch 3 also contains checkpatch errors.

Please fix them before submitting again.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
