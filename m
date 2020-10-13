Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5897F28CB0F
	for <lists+linux-mips@lfdr.de>; Tue, 13 Oct 2020 11:32:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391065AbgJMJcl (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 13 Oct 2020 05:32:41 -0400
Received: from elvis.franken.de ([193.175.24.41]:60144 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388637AbgJMJcl (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 13 Oct 2020 05:32:41 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1kSGfg-0003Vf-01; Tue, 13 Oct 2020 11:32:40 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 75A31C01C7; Tue, 13 Oct 2020 11:32:17 +0200 (CEST)
Date:   Tue, 13 Oct 2020 11:32:17 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Chuanhong Guo <gch981213@gmail.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mips: ralink: enable zboot support
Message-ID: <20201013093217.GB18418@alpha.franken.de>
References: <20201013020554.1317237-1-gch981213@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201013020554.1317237-1-gch981213@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Oct 13, 2020 at 10:05:47AM +0800, Chuanhong Guo wrote:
> Some of these ralink devices come with an ancient u-boot which can't
> extract LZMA properly when image gets too big.
> Enable zboot support to get a self-extracting kernel instead of relying
> on broken u-boot support.
> 
> Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
> ---
>  arch/mips/Kconfig | 1 +
>  1 file changed, 1 insertion(+)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
