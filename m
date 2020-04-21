Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 861FE1B2BC2
	for <lists+linux-mips@lfdr.de>; Tue, 21 Apr 2020 17:58:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726124AbgDUP6S (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 21 Apr 2020 11:58:18 -0400
Received: from elvis.franken.de ([193.175.24.41]:49339 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726063AbgDUP6S (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 21 Apr 2020 11:58:18 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1jQvHs-0000iB-00; Tue, 21 Apr 2020 17:58:16 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 62247C0211; Tue, 21 Apr 2020 17:06:24 +0200 (CEST)
Date:   Tue, 21 Apr 2020 17:06:24 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Tiezhu Yang <yangtiezhu@loongson.cn>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>
Subject: Re: [PATCH v3 0/3] MIPS: Fix some issues about arch_mem_init()
Message-ID: <20200421150624.GA16684@alpha.franken.de>
References: <1587470386-27133-1-git-send-email-yangtiezhu@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1587470386-27133-1-git-send-email-yangtiezhu@loongson.cn>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Apr 21, 2020 at 07:59:43PM +0800, Tiezhu Yang wrote:
> v3:
>   - remove the Fixes tag of patch 2/3
> 
> v2:
>   - modify the subject of patch 3/3
> 
> Tiezhu Yang (3):
>   MIPS: Do not initialise globals to 0
>   MIPS: Cleanup code about plat_mem_setup()
>   MIPS: Make sparse_init() using top-down allocation
> 
>  arch/mips/include/asm/bootinfo.h |  2 +-
>  arch/mips/kernel/setup.c         | 14 +++++++++++---
>  2 files changed, 12 insertions(+), 4 deletions(-)

all three patches applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
