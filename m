Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 168302E93AA
	for <lists+linux-mips@lfdr.de>; Mon,  4 Jan 2021 11:50:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727034AbhADKtH (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 4 Jan 2021 05:49:07 -0500
Received: from elvis.franken.de ([193.175.24.41]:57210 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726657AbhADKtH (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 4 Jan 2021 05:49:07 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1kwNPU-0001xs-02; Mon, 04 Jan 2021 11:48:24 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 88C63C0808; Mon,  4 Jan 2021 11:42:35 +0100 (CET)
Date:   Mon, 4 Jan 2021 11:42:35 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org, Tiezhu Yang <yangtiezhu@loongson.cn>,
        Huacai Chen <chenhc@lemote.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] MIPS: Loongson64: Set cluster for cores
Message-ID: <20210104104235.GC4765@alpha.franken.de>
References: <20201230033950.13839-1-jiaxun.yang@flygoat.com>
 <20201230033950.13839-2-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201230033950.13839-2-jiaxun.yang@flygoat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Dec 30, 2020 at 11:39:49AM +0800, Jiaxun Yang wrote:
> cluster is required for cacheinfo to set shared_cpu_map correctly.
> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> Reviewed-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> Tested-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> ---
>  arch/mips/loongson64/smp.c | 2 ++
>  1 file changed, 2 insertions(+)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
