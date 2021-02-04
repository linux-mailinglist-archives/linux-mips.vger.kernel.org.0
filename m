Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5EF9430F4AE
	for <lists+linux-mips@lfdr.de>; Thu,  4 Feb 2021 15:13:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236613AbhBDONA (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 4 Feb 2021 09:13:00 -0500
Received: from elvis.franken.de ([193.175.24.41]:52103 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236549AbhBDOBV (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 4 Feb 2021 09:01:21 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1l7fBQ-0004tX-01; Thu, 04 Feb 2021 15:00:32 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 0E11CC0D54; Thu,  4 Feb 2021 15:00:07 +0100 (CET)
Date:   Thu, 4 Feb 2021 15:00:07 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Florian Fainelli <f.fainelli@gmail.com>,
        Paul Burton <paulburton@kernel.org>,
        John Crispin <john@phrozen.org>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com
Subject: Re: [PATCH] MIPS: of: Introduce helper function to get DTB
Message-ID: <20210204140006.GB13761@alpha.franken.de>
References: <20210127132431.143374-1-tsbogend@alpha.franken.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210127132431.143374-1-tsbogend@alpha.franken.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Jan 27, 2021 at 02:24:30PM +0100, Thomas Bogendoerfer wrote:
> Selection of the DTB to be used was burried in more or less readable
> code in head.S. Move this code into a inline helper function and
> use it.
> 
> Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> ---
>  arch/mips/ath79/setup.c               | 13 +++++------
>  arch/mips/bmips/setup.c               |  7 +++---
>  arch/mips/generic/init.c              |  5 ++---
>  arch/mips/include/asm/bootinfo.h      | 22 ++++++++++++++++++-
>  arch/mips/include/asm/octeon/octeon.h |  1 -
>  arch/mips/kernel/head.S               | 31 ---------------------------
>  arch/mips/kernel/setup.c              |  4 ----
>  arch/mips/lantiq/prom.c               |  7 ++----
>  arch/mips/pic32/pic32mzda/init.c      | 15 +------------
>  arch/mips/ralink/of.c                 | 11 +++-------
>  10 files changed, 39 insertions(+), 77 deletions(-)

applied to mips-next.

Thomas,

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
