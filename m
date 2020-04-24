Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 078CD1B81B4
	for <lists+linux-mips@lfdr.de>; Fri, 24 Apr 2020 23:46:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726027AbgDXVqS (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 24 Apr 2020 17:46:18 -0400
Received: from elvis.franken.de ([193.175.24.41]:53506 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726038AbgDXVqS (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 24 Apr 2020 17:46:18 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1jS69H-0007ly-02; Fri, 24 Apr 2020 23:46:15 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 84A6CC02FB; Fri, 24 Apr 2020 23:46:02 +0200 (CEST)
Date:   Fri, 24 Apr 2020 23:46:02 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Liangliang Huang <huanglllzu@gmail.com>
Cc:     linux-mips@vger.kernel.org, Fuxin Zhang <zhangfx@lemote.com>,
        Zhangjin Wu <wuzhangjin@gmail.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Liangliang Huang <huangll@lemote.com>
Subject: Re: [PATCH] MIPS: arch_send_call_function_single_ipi() calling
 conventions change
Message-ID: <20200424214602.GA23781@alpha.franken.de>
References: <20200423234421.13805-1-huangll@lemote.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200423234421.13805-1-huangll@lemote.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Apr 23, 2020 at 07:44:21PM -0400, Liangliang Huang wrote:
> Use mp_ops->send_ipi_single() instead of mp_ops->send_ipi_mask() in
> arch_send_call_function_single_ipi(). send_ipi_single() can send
> IPI signal to a special cpu more efficiently.
> 
> Signed-off-by: Liangliang Huang <huangll@lemote.com>
> ---
>  arch/mips/include/asm/smp.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
