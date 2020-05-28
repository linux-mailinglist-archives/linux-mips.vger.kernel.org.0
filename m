Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF7E01E61B2
	for <lists+linux-mips@lfdr.de>; Thu, 28 May 2020 15:07:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390030AbgE1NHg (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 28 May 2020 09:07:36 -0400
Received: from elvis.franken.de ([193.175.24.41]:42402 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390049AbgE1NHf (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 28 May 2020 09:07:35 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1jeIFt-0002v1-00; Thu, 28 May 2020 15:07:29 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 173F2C05A4; Thu, 28 May 2020 14:39:20 +0200 (CEST)
Date:   Thu, 28 May 2020 14:39:20 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Tiezhu Yang <yangtiezhu@loongson.cn>
Cc:     Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>
Subject: Re: [PATCH] MIPS: Loongson64: Remove not used pci.c
Message-ID: <20200528123920.GA18321@alpha.franken.de>
References: <1590665351-2956-1-git-send-email-yangtiezhu@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1590665351-2956-1-git-send-email-yangtiezhu@loongson.cn>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, May 28, 2020 at 07:29:11PM +0800, Tiezhu Yang wrote:
> After commit 6423e59a64e7 ("MIPS: Loongson64: Switch to generic PCI
> driver"), arch/mips/loongson64/pci.c is not used any more, remove it.
> 
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> ---
>  arch/mips/loongson64/pci.c | 49 ----------------------------------------------
>  1 file changed, 49 deletions(-)
>  delete mode 100644 arch/mips/loongson64/pci.c

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
