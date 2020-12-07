Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7FC902D14DB
	for <lists+linux-mips@lfdr.de>; Mon,  7 Dec 2020 16:39:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725887AbgLGPgB (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 7 Dec 2020 10:36:01 -0500
Received: from [157.25.102.26] ([157.25.102.26]:58306 "EHLO orcam.me.uk"
        rhost-flags-FAIL-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725822AbgLGPgB (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 7 Dec 2020 10:36:01 -0500
Received: from bugs.linux-mips.org (eddie.linux-mips.org [IPv6:2a01:4f8:201:92aa::3])
        by orcam.me.uk (Postfix) with ESMTPS id 76CAD2BE0EC;
        Mon,  7 Dec 2020 15:35:28 +0000 (GMT)
Date:   Mon, 7 Dec 2020 15:35:23 +0000 (GMT)
From:   "Maciej W. Rozycki" <macro@linux-mips.org>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
cc:     Jinyang He <hejinyang@loongson.cn>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: KASLR: Fix sync_icache() trapped in loop when
 synci_step is zero
In-Reply-To: <20201202103943.GA9065@alpha.franken.de>
Message-ID: <alpine.LFD.2.21.2012071526120.2104409@eddie.linux-mips.org>
References: <1606878005-11427-1-git-send-email-hejinyang@loongson.cn> <20201202103943.GA9065@alpha.franken.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, 2 Dec 2020, Thomas Bogendoerfer wrote:

> PS: Does anybody know a reason, why this code doesn't use an old fashioned
> dache/icache flushing, which might be slower but would work also on
> legecy cores ?

 Hmm, this was contributed by ImgTec in 2016 only, so I guess there was no 
reason as such but merely the lack of care about older systems (mind that 
those people really didn't have any at that point).  The option to enable 
this code is only available for R2 and newer CPUs so at least we are safe.

  Maciej
