Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 33FCF1DFDAE
	for <lists+linux-mips@lfdr.de>; Sun, 24 May 2020 10:35:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727987AbgEXIf5 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 24 May 2020 04:35:57 -0400
Received: from elvis.franken.de ([193.175.24.41]:36808 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726331AbgEXIf5 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 24 May 2020 04:35:57 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1jcm6r-0004rA-04; Sun, 24 May 2020 10:35:53 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id E6034C01D2; Sun, 24 May 2020 09:41:25 +0200 (CEST)
Date:   Sun, 24 May 2020 09:41:25 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Kaige Li <likaige@loongson.cn>
Cc:     linux-mips@vger.kernel.org, Tiezhu Yang <yangtiezhu@loongson.cn>,
        Xuefeng Li <lixuefeng@loongson.cn>
Subject: Re: [PATCH] MIPS: tools: Fix resource leak in elf-entry.c
Message-ID: <20200524074125.GE4161@alpha.franken.de>
References: <1589461181-29695-1-git-send-email-likaige@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1589461181-29695-1-git-send-email-likaige@loongson.cn>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, May 14, 2020 at 08:59:41PM +0800, Kaige Li wrote:
> There is a file descriptor resource leak in elf-entry.c, fix this
> by adding fclose() before return and die.
> 
> Signed-off-by: Kaige Li <likaige@loongson.cn>
> ---
>  arch/mips/tools/elf-entry.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
