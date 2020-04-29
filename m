Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C41521BE645
	for <lists+linux-mips@lfdr.de>; Wed, 29 Apr 2020 20:33:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726524AbgD2SdU (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 29 Apr 2020 14:33:20 -0400
Received: from elvis.franken.de ([193.175.24.41]:60630 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726456AbgD2SdT (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 29 Apr 2020 14:33:19 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1jTrWH-000430-00; Wed, 29 Apr 2020 20:33:17 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 09CF3C0344; Wed, 29 Apr 2020 20:22:32 +0200 (CEST)
Date:   Wed, 29 Apr 2020 20:22:32 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Huacai Chen <chenhc@lemote.com>
Cc:     linux-mips@vger.kernel.org, Fuxin Zhang <zhangfx@lemote.com>,
        Zhangjin Wu <wuzhangjin@gmail.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: Re: [PATCH V2] MIPS: perf: Add hardware perf events support for new
 Loongson-3
Message-ID: <20200429182231.GA21158@alpha.franken.de>
References: <1588145170-9451-1-git-send-email-chenhc@lemote.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1588145170-9451-1-git-send-email-chenhc@lemote.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Apr 29, 2020 at 03:26:10PM +0800, Huacai Chen wrote:
> New Loongson-3 means Loongson-3A R2 (Loongson-3A2000) and newer CPUs.
> Loongson-3 processors have three types of PMU types (so there are three
> event maps): Loongson-3A1000/Loonngson-3B1000/Loongson-3B1500 is Type-1,
> Loongson-3A2000/Loongson-3A3000 is Type-2, Loongson-3A4000+ is Type-3.
> 
> Signed-off-by: Huacai Chen <chenhc@lemote.com>
> ---
>  .../asm/mach-loongson64/cpu-feature-overrides.h    |   1 +
>  arch/mips/kernel/perf_event_mipsxx.c               | 358 +++++++++++++++++++--

checkpatch warns about missing break/fallthrough statement and indention
problems, could please look at this ? And as all the new code is only
usefull for loongsoon CPUs could you try to only compile it in, if it's
enabled for the image ?

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
