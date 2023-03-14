Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CD8ED6B9B56
	for <lists+linux-mips@lfdr.de>; Tue, 14 Mar 2023 17:27:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229899AbjCNQ1M (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 14 Mar 2023 12:27:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230043AbjCNQ1I (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 14 Mar 2023 12:27:08 -0400
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 4904E54CA5
        for <linux-mips@vger.kernel.org>; Tue, 14 Mar 2023 09:26:57 -0700 (PDT)
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1pc7UG-00048S-01; Tue, 14 Mar 2023 17:26:56 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 13959C131B; Tue, 14 Mar 2023 17:19:15 +0100 (CET)
Date:   Tue, 14 Mar 2023 17:19:15 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org, chenhuacai@kernel.org
Subject: Re: [PATCH 0/5] MIPS: Loongson64: Clear chaos in barriers
Message-ID: <20230314161914.GB18446@alpha.franken.de>
References: <20230221131658.5381-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230221131658.5381-1-jiaxun.yang@flygoat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Feb 21, 2023 at 01:16:53PM +0000, Jiaxun Yang wrote:
> 
> Jiaxun Yang (5):
>   MIPS: Loongson64: Prefix ipi register address pointers with __iomem
>   MIPS: Loongson64: smp: Use nudge_writes instead of wbflush
>   MIPS: Loongson64: smp: Correct nudge_writes usage
>   MIPS: Loongson64: Remove CPU_HAS_WB
>   MIPS: Loongson64: Opt-out war_io_reorder_wmb
> 
>  arch/mips/Kconfig            |  1 -
>  arch/mips/include/asm/io.h   |  2 +-
>  arch/mips/loongson64/setup.c | 15 -----------
>  arch/mips/loongson64/smp.c   | 50 +++++++++++++-----------------------
>  4 files changed, 19 insertions(+), 49 deletions(-)

series applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
