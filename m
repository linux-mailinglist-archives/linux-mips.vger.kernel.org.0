Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C053284AF6
	for <lists+linux-mips@lfdr.de>; Tue,  6 Oct 2020 13:31:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726304AbgJFLbr (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 6 Oct 2020 07:31:47 -0400
Received: from elvis.franken.de ([193.175.24.41]:47835 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726087AbgJFLbo (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 6 Oct 2020 07:31:44 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1kPlC2-0006R2-01; Tue, 06 Oct 2020 13:31:42 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 3C903C10EF; Tue,  6 Oct 2020 13:31:16 +0200 (CEST)
Date:   Tue, 6 Oct 2020 13:31:16 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: alchemy: Share prom_init implementation
Message-ID: <20201006113116.GB8673@alpha.franken.de>
References: <20201005094815.49773-1-tsbogend@alpha.franken.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201005094815.49773-1-tsbogend@alpha.franken.de>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Oct 05, 2020 at 11:48:14AM +0200, Thomas Bogendoerfer wrote:
> All boards have the same prom_init() function. Move it to common code and
> delete the duplicates.
> 
> Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> ---
>  arch/mips/alchemy/board-gpr.c          | 17 -----------------
>  arch/mips/alchemy/board-mtx1.c         | 17 -----------------
>  arch/mips/alchemy/board-xxs1500.c      | 18 ------------------
>  arch/mips/alchemy/common/prom.c        | 20 ++++++++++++++++++++
>  arch/mips/alchemy/devboards/platform.c | 17 -----------------
>  5 files changed, 20 insertions(+), 69 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
