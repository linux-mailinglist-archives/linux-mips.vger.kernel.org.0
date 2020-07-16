Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45D1222202C
	for <lists+linux-mips@lfdr.de>; Thu, 16 Jul 2020 12:03:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726964AbgGPKCO (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 16 Jul 2020 06:02:14 -0400
Received: from elvis.franken.de ([193.175.24.41]:38173 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726960AbgGPKB6 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 16 Jul 2020 06:01:58 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1jw0iB-0008Mc-06; Thu, 16 Jul 2020 12:01:55 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id C5791C080E; Thu, 16 Jul 2020 12:01:30 +0200 (CEST)
Date:   Thu, 16 Jul 2020 12:01:30 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Huacai Chen <chenhc@lemote.com>
Cc:     linux-mips@vger.kernel.org, Fuxin Zhang <zhangfx@lemote.com>,
        Zhangjin Wu <wuzhangjin@gmail.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: Re: [PATCH 3/4] MIPS: Loongson64: Load LS7A dtbs
Message-ID: <20200716100130.GJ8455@alpha.franken.de>
References: <1594294424-26218-1-git-send-email-chenhc@lemote.com>
 <1594294424-26218-3-git-send-email-chenhc@lemote.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1594294424-26218-3-git-send-email-chenhc@lemote.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Jul 09, 2020 at 07:33:43PM +0800, Huacai Chen wrote:
> From: Jiaxun Yang <jiaxun.yang@flygoat.com>
> 
> Load correct devicetree according to PRID and PCH type.
> 
> Signed-off-by: Huacai Chen <chenhc@lemote.com>
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>  arch/mips/loongson64/env.c | 56 ++++++++++++++++++++++++++++------------------
>  1 file changed, 34 insertions(+), 22 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
