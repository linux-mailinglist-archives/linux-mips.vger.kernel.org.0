Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3822A18B390
	for <lists+linux-mips@lfdr.de>; Thu, 19 Mar 2020 13:38:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727023AbgCSMhy (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 19 Mar 2020 08:37:54 -0400
Received: from elvis.franken.de ([193.175.24.41]:51026 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726589AbgCSMhy (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 19 Mar 2020 08:37:54 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1jEuQl-0004K1-01; Thu, 19 Mar 2020 13:37:47 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 9A896C026A; Thu, 19 Mar 2020 13:33:37 +0100 (CET)
Date:   Thu, 19 Mar 2020 13:33:37 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Tiezhu Yang <yangtiezhu@loongson.cn>
Cc:     Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>
Subject: Re: [PATCH] MIPS: Loongson: Do not initialise statics to 0
Message-ID: <20200319123337.GA10783@alpha.franken.de>
References: <1584450586-27917-1-git-send-email-yangtiezhu@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1584450586-27917-1-git-send-email-yangtiezhu@loongson.cn>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Mar 17, 2020 at 09:09:46PM +0800, Tiezhu Yang wrote:
> Fix the following checkpatch error:
> 
> ERROR: do not initialise statics to 0
> #125: FILE: loongson64/numa.c:125:
> +	static unsigned long num_physpages = 0;
> 
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>

Applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
