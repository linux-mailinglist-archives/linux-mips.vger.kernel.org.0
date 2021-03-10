Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1068334151
	for <lists+linux-mips@lfdr.de>; Wed, 10 Mar 2021 16:19:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232733AbhCJPTL (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 10 Mar 2021 10:19:11 -0500
Received: from elvis.franken.de ([193.175.24.41]:42327 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230270AbhCJPS5 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 10 Mar 2021 10:18:57 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1lK0bw-00088y-04; Wed, 10 Mar 2021 16:18:56 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 015FBC1D54; Wed, 10 Mar 2021 16:09:07 +0100 (CET)
Date:   Wed, 10 Mar 2021 16:09:07 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Bhaskar Chowdhury <unixbhaskar@gmail.com>
Cc:     f.fainelli@gmail.com, bcm-kernel-feedback-list@broadcom.com,
        linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, rdunlap@infradead.org
Subject: Re: [PATCH] arch: mips: bcm63xx: Spello fix in the file clk.c
Message-ID: <20210310150907.GE12960@alpha.franken.de>
References: <20210305020535.25006-1-unixbhaskar@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210305020535.25006-1-unixbhaskar@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Mar 05, 2021 at 07:35:35AM +0530, Bhaskar Chowdhury wrote:
> 
> 
> s/revelant/relevant/
> 
> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
> ---
>  arch/mips/bcm63xx/clk.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

applied to mips-next with fixed subject.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
