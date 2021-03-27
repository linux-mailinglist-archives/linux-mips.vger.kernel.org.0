Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF87D34B5B3
	for <lists+linux-mips@lfdr.de>; Sat, 27 Mar 2021 10:42:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231240AbhC0JmL (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 27 Mar 2021 05:42:11 -0400
Received: from elvis.franken.de ([193.175.24.41]:53063 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230322AbhC0Jlo (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 27 Mar 2021 05:41:44 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1lQ5Rt-00055c-00; Sat, 27 Mar 2021 10:41:41 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id F0151C1D41; Sat, 27 Mar 2021 10:40:11 +0100 (CET)
Date:   Sat, 27 Mar 2021 10:40:11 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Mauri Sandberg <sandberg@mailfence.com>
Cc:     f.fainelli@gmail.com, linux-mips@vger.kernel.org
Subject: Re: [PATCH v2 0/1] MIPS: fix compilation error
Message-ID: <20210327094011.GA4259@alpha.franken.de>
References: <20210326134158.268164-1-sandberg@mailfence.com>
 <20210326164645.433147-1-sandberg@mailfence.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210326164645.433147-1-sandberg@mailfence.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Mar 26, 2021 at 06:46:44PM +0200, Mauri Sandberg wrote:
> Earlier I had some confusion with my configuration as compared to
> ath79_defconfig but now it looks like that enabling
> CONFIG_MIPS_ELF_APPENDED_DTB alone will break compilation.
> 
> Simple fix of removing 'const' did not work and something more is needed.

your first fix works perfect for me. Could please describe what the error
is ?

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
