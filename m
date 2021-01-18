Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E51BF2FA8BB
	for <lists+linux-mips@lfdr.de>; Mon, 18 Jan 2021 19:26:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405193AbhARSZb (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 18 Jan 2021 13:25:31 -0500
Received: from elvis.franken.de ([193.175.24.41]:34230 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2405569AbhARSZ2 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 18 Jan 2021 13:25:28 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1l1ZCf-00020w-00; Mon, 18 Jan 2021 19:24:37 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id A7DBDC06E7; Mon, 18 Jan 2021 19:24:19 +0100 (CET)
Date:   Mon, 18 Jan 2021 19:24:19 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Kevin Hao <haokexin@gmail.com>
Cc:     linux-mips@vger.kernel.org
Subject: Re: [PATCH] MIPS: OCTEON: Fix the boot broken when using built-in DTB
Message-ID: <20210118182419.GA16580@alpha.franken.de>
References: <20210109114958.16470-1-haokexin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210109114958.16470-1-haokexin@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, Jan 09, 2021 at 07:49:58PM +0800, Kevin Hao wrote:
> For the OCTEON boards, it need to patch the built-in DTB before using
> it. Previously it judges if it is a built-in DTB by checking
> fw_passed_dtb. But after commit 37e5c69ffd41 ("MIPS: head.S: Init
> fw_passed_dtb to builtin DTB", the fw_passed_dtb is initialized even
> when using built-in DTB. This causes the OCTEON boards boot broken due
> to an unpatched built-in DTB is used. Add more checks to judge if we
> really use built-in DTB or not.
> 
> Fixed: 37e5c69ffd41 ("MIPS: head.S: Init fw_passed_dtb to builtin DTB")
> Cc: stable@vger.kernel.org
> Signed-off-by: Kevin Hao <haokexin@gmail.com>
> ---
>  arch/mips/cavium-octeon/setup.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/mips/cavium-octeon/setup.c b/arch/mips/cavium-octeon/setup.c
> index 982826ba0ef7..41d9c80e9666 100644
> --- a/arch/mips/cavium-octeon/setup.c
> +++ b/arch/mips/cavium-octeon/setup.c
> @@ -1149,7 +1149,8 @@ void __init device_tree_init(void)
>  	bool do_prune;
>  	bool fill_mac;
>  
> -	if (fw_passed_dtb) {
> +	if (fw_passed_dtb && (fw_passed_dtb != (ulong)&__dtb_octeon_68xx_begin) &&
> +	    (fw_passed_dtb != (ulong)&__dtb_octeon_3xxx_begin)) {

well, if someone add a third dtb do the builtin DTBs, this might fail
again. Let's fix it for real...

>  		fdt = (void *)fw_passed_dtb;
>  		do_prune = false;
>  		fill_mac = true;

.... IMHO the real bug is d9df9fb901d2 MIPS: Octeon: Remove special handling
of CONFIG_MIPS_ELF_APPENDED_DTB=y. I'm tending to simply revert that commit.
A different option would be to not place the two __dtb_octeon dtbs into the
builtin dtb section, which looks like more work for not much gain...

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
