Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8365A30442B
	for <lists+linux-mips@lfdr.de>; Tue, 26 Jan 2021 18:00:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729430AbhAZGCF (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 26 Jan 2021 01:02:05 -0500
Received: from elvis.franken.de ([193.175.24.41]:33808 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728214AbhAYMqv (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 25 Jan 2021 07:46:51 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1l403i-0008Aa-00; Mon, 25 Jan 2021 12:29:26 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id EC689C0458; Mon, 25 Jan 2021 12:24:20 +0100 (CET)
Date:   Mon, 25 Jan 2021 12:24:20 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Jinyang He <hejinyang@loongson.cn>
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, Paul Burton <paulburton@kernel.org>,
        Jun-Ru Chang <jrjang@realtek.com>
Subject: Re: [PATCH v2 0/4] MIPS: process: Some fixes and improvements about
 get_frame_info()
Message-ID: <20210125112420.GA5436@alpha.franken.de>
References: <1611207098-11381-1-git-send-email-hejinyang@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1611207098-11381-1-git-send-email-hejinyang@loongson.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Jan 21, 2021 at 01:31:34PM +0800, Jinyang He wrote:
> Not familiar with microMIPS. Not test on microMIPS.
> 
> Changelog v2:
> - Thanks to Thomas for suggesting that remove and sort header includes.
>   [PATCH 1/4] for details.
> - Thanks to Jiaxun for test v1 and told me it stuck at loading init.
>   I mistakenly thought that r_format.rs and pool32a_format.rs are the same.
>   See [PATCH 4/4] for details.
> 
> Jinyang He (4):
>   MIPS: process: Remove unnecessary headers inclusion
>   MIPS: microMIPS: Fix the judgment of mm_jr16_op and mm_jalr_op
>   MIPS: Fix get_frame_info() handing of function size
>   MIPS: Add is_jr_ra_ins() to end the loop early
> 
>  arch/mips/kernel/process.c | 87 ++++++++++++++++++++++++++--------------------
>  1 file changed, 50 insertions(+), 37 deletions(-)

I've re-added linux/random.h and asm/mips-cps.h in your first patch and
applied all four patches to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
