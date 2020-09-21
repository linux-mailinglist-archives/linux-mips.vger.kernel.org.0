Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC599273483
	for <lists+linux-mips@lfdr.de>; Mon, 21 Sep 2020 23:00:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727513AbgIUVAJ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 21 Sep 2020 17:00:09 -0400
Received: from elvis.franken.de ([193.175.24.41]:49834 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727519AbgIUU7m (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 21 Sep 2020 16:59:42 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1kKSuS-0001Rx-02; Mon, 21 Sep 2020 22:59:40 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 210A4C0FE4; Mon, 21 Sep 2020 22:24:21 +0200 (CEST)
Date:   Mon, 21 Sep 2020 22:24:21 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Huacai Chen <chenhc@lemote.com>
Cc:     linux-mips@vger.kernel.org, Fuxin Zhang <zhangfx@lemote.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: Re: [PATCH V7 1/3] MIPS: context switch: Use save/restore instead of
 set/clear for Status.CU2
Message-ID: <20200921202421.GB29322@alpha.franken.de>
References: <1600679548-29154-1-git-send-email-chenhc@lemote.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1600679548-29154-1-git-send-email-chenhc@lemote.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Sep 21, 2020 at 05:12:26PM +0800, Huacai Chen wrote:
> Some processors (such as Loongson-3) need to enable CU2 in kernel mode,
> current set/clear method will lose Status.CU2 during context switching,
> so use save/restore method instead.
> 
> Signed-off-by: Huacai Chen <chenhc@lemote.com>
> ---
>  arch/mips/include/asm/switch_to.h | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

applied patches 1-3 to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
