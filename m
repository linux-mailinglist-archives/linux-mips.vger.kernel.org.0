Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9EF1F2FDC41
	for <lists+linux-mips@lfdr.de>; Wed, 20 Jan 2021 23:17:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726935AbhATWMZ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 20 Jan 2021 17:12:25 -0500
Received: from elvis.franken.de ([193.175.24.41]:39277 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388405AbhATVPp (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 20 Jan 2021 16:15:45 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1l2Kog-0005Z3-00; Wed, 20 Jan 2021 22:15:02 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 3C53AC0A90; Wed, 20 Jan 2021 18:39:12 +0100 (CET)
Date:   Wed, 20 Jan 2021 18:39:12 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Kevin Hao <haokexin@gmail.com>
Cc:     linux-mips@vger.kernel.org
Subject: Re: [PATCH] MIPS: OCTEON: Fix the boot broken when using built-in DTB
Message-ID: <20210120173912.GA16543@alpha.franken.de>
References: <20210109114958.16470-1-haokexin@gmail.com>
 <20210118182419.GA16580@alpha.franken.de>
 <20210119105648.GA343327@pek-khao-d2.corp.ad.wrs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210119105648.GA343327@pek-khao-d2.corp.ad.wrs.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Jan 19, 2021 at 06:56:48PM +0800, Kevin Hao wrote:
> > .... IMHO the real bug is d9df9fb901d2 MIPS: Octeon: Remove special handling
> > of CONFIG_MIPS_ELF_APPENDED_DTB=y. I'm tending to simply revert that commit.
> 
> Yes, this indeed seem much better. I will send a patch to revert d9df9fb901d2.
> Another issue is that the name of fw_passed_dtb seems pretty confusion after the
> change of commit 37e5c69ffd41. Could we rename it to something like final_dtb_addr?

this wouldn't make the mess smaller, IMHO. My idea is to add a helper
function, which deals with all the possible sources of dtbs, which
could be used instead of fw_passed_dtb. This gets rid of the ugly
#ifdefry in head.S and hopefull makes future changes less error prone.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
