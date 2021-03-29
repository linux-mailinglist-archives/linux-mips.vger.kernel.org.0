Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24E6A34CD13
	for <lists+linux-mips@lfdr.de>; Mon, 29 Mar 2021 11:31:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231776AbhC2Jaq (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 29 Mar 2021 05:30:46 -0400
Received: from elvis.franken.de ([193.175.24.41]:33841 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231852AbhC2JaX (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 29 Mar 2021 05:30:23 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1lQoE1-0003qb-04; Mon, 29 Mar 2021 11:30:21 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 0D378C1D90; Mon, 29 Mar 2021 11:25:46 +0200 (CEST)
Date:   Mon, 29 Mar 2021 11:25:46 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
Cc:     John Crispin <john@phrozen.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/2] MIPS: ralink: annotate prom_soc_init() with __init
Message-ID: <20210329092545.GD8484@alpha.franken.de>
References: <20210327053840.471155-1-ilya.lipnitskiy@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210327053840.471155-1-ilya.lipnitskiy@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Mar 26, 2021 at 10:38:39PM -0700, Ilya Lipnitskiy wrote:
> prom_soc_init is only called from prom_init in arch/mips/ralink/prom.c,
> which is already annotated with __init, so annotate prom_soc_init with
> __init too.
> 
> Signed-off-by: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
> ---
>  arch/mips/ralink/common.h | 2 +-
>  arch/mips/ralink/mt7620.c | 2 +-
>  arch/mips/ralink/mt7621.c | 2 +-
>  arch/mips/ralink/rt288x.c | 2 +-
>  arch/mips/ralink/rt305x.c | 2 +-
>  arch/mips/ralink/rt3883.c | 2 +-
>  6 files changed, 6 insertions(+), 6 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
