Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 997E32FCB86
	for <lists+linux-mips@lfdr.de>; Wed, 20 Jan 2021 08:31:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726437AbhATHad (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 20 Jan 2021 02:30:33 -0500
Received: from elvis.franken.de ([193.175.24.41]:38028 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728275AbhATHaP (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 20 Jan 2021 02:30:15 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1l27vo-0005ye-00; Wed, 20 Jan 2021 08:29:32 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 0FF12C0A66; Tue, 19 Jan 2021 23:06:57 +0100 (CET)
Date:   Tue, 19 Jan 2021 23:06:56 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Kevin Hao <haokexin@gmail.com>
Cc:     Yasha Cherikovsky <yasha.che3@gmail.com>,
        linux-mips@vger.kernel.org
Subject: Re: [PATCH v2] Revert "MIPS: Octeon: Remove special handling of
 CONFIG_MIPS_ELF_APPENDED_DTB=y"
Message-ID: <20210119220656.GA16804@alpha.franken.de>
References: <20210119111531.37375-1-haokexin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210119111531.37375-1-haokexin@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Jan 19, 2021 at 07:15:31PM +0800, Kevin Hao wrote:
> This reverts commit d9df9fb901d25b941ab2cfb5b570d91fb2abf7a3.
> 
> For the OCTEON boards, it need to patch the built-in DTB before using
> it. Previously it judges if it is a built-in DTB by checking
> fw_passed_dtb. But after commit 37e5c69ffd41 ("MIPS: head.S: Init
> fw_passed_dtb to builtin DTB", the fw_passed_dtb is initialized even
> when using built-in DTB. This causes the OCTEON boards boot broken due
> to an unpatched built-in DTB is used. Revert the commit d9df9fb901d2 to
> restore the codes before the fw_passed_dtb is used and then fix this
> issue.
> 
> Fixed: 37e5c69ffd41 ("MIPS: head.S: Init fw_passed_dtb to builtin DTB")
> Cc: stable@vger.kernel.org
> Suggested-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Signed-off-by: Kevin Hao <haokexin@gmail.com>
> ---
>  arch/mips/cavium-octeon/setup.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
