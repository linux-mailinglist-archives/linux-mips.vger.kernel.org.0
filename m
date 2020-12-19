Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B4362DF049
	for <lists+linux-mips@lfdr.de>; Sat, 19 Dec 2020 16:48:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726748AbgLSPsQ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 19 Dec 2020 10:48:16 -0500
Received: from elvis.franken.de ([193.175.24.41]:50499 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726780AbgLSPsL (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 19 Dec 2020 10:48:11 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1kqeS8-0004Nk-01; Sat, 19 Dec 2020 16:47:28 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 7D200C0279; Sat, 19 Dec 2020 16:39:57 +0100 (CET)
Date:   Sat, 19 Dec 2020 16:39:57 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     jiaqingtong97@163.com, mark.tomlinson@alliedtelesis.co.nz,
        paulburton@kernel.org, linux-mips@vger.kernel.org
Subject: Re: [PATCH] MIPS: OCTEON: Add OCTEON II build and configuration
 option
Message-ID: <20201219153957.GB5012@alpha.franken.de>
References: <20201218162845.9317-1-jiaqingtong97@163.com>
 <c749749f-0d9b-461d-0f9b-f8ac828a7681@flygoat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c749749f-0d9b-461d-0f9b-f8ac828a7681@flygoat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, Dec 19, 2020 at 02:08:49PM +0800, Jiaxun Yang wrote:
> 
> 
> 在 2020/12/19 上午12:28, jiaqingtong97@163.com 写道:
> > From: Jia Qingtong <jiaqingtong97@163.com>
> > 
> > If building for OCTEON II only,we can select compiler options that
> > give better code, but will not run on earlier chips.
> 
> 
> I'd rather add a workaround Kconfig option and default y for it.
> In case no other optimization can be enabled for OCTANE2, like
> 
> WORKAROUND_OCTANE_BARRIER

please start them with WAR_ like the other workarounds I've converted
to Kconfig. Something like

WAR_OCTEON_BARRIER

But the description talks about different compiler options, which I don't
see in the patch ?

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
