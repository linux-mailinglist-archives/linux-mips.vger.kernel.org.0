Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 373781ACDE4
	for <lists+linux-mips@lfdr.de>; Thu, 16 Apr 2020 18:41:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388208AbgDPQlg (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 16 Apr 2020 12:41:36 -0400
Received: from elvis.franken.de ([193.175.24.41]:42211 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731023AbgDPQlf (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 16 Apr 2020 12:41:35 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1jP7Zy-0001kl-05; Thu, 16 Apr 2020 18:41:30 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 4946EC0144; Thu, 16 Apr 2020 18:40:55 +0200 (CEST)
Date:   Thu, 16 Apr 2020 18:40:55 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Tiezhu Yang <yangtiezhu@loongson.cn>
Cc:     Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>
Subject: Re: [PATCH] MIPS: Loongson: Use CONFIG_NR_CPUS_DEFAULT_64 to support
 more CPUs
Message-ID: <20200416164055.GF24743@alpha.franken.de>
References: <1585638006-19439-1-git-send-email-yangtiezhu@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1585638006-19439-1-git-send-email-yangtiezhu@loongson.cn>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Mar 31, 2020 at 03:00:06PM +0800, Tiezhu Yang wrote:
> When I update the mainline kernel on the Loongson 2-way platform which
> has 8 CPUs, it only shows 4 CPUs due to NR_CPUS is 4, this is obviously
> wrong.
> 
> In order to support more CPUs on the Loongson platform, it is better
> to use CONFIG_NR_CPUS_DEFAULT_64 instead of CONFIG_NR_CPUS_DEFAULT_4
> to specify the maximum number of CPUs which the kernel will support.
> 
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> ---
>  arch/mips/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
