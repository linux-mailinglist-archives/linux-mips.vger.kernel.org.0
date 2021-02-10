Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 43C2F3163F2
	for <lists+linux-mips@lfdr.de>; Wed, 10 Feb 2021 11:35:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230514AbhBJKfM (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 10 Feb 2021 05:35:12 -0500
Received: from angie.orcam.me.uk ([157.25.102.26]:47344 "EHLO
        angie.orcam.me.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230448AbhBJKc6 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 10 Feb 2021 05:32:58 -0500
Received: by angie.orcam.me.uk (Postfix, from userid 500)
        id 9EE869200B4; Wed, 10 Feb 2021 11:32:11 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
        by angie.orcam.me.uk (Postfix) with ESMTP id 97DB79200B3;
        Wed, 10 Feb 2021 11:32:11 +0100 (CET)
Date:   Wed, 10 Feb 2021 11:32:11 +0100 (CET)
From:   "Maciej W. Rozycki" <macro@orcam.me.uk>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
cc:     Yanteng Si <siyanteng@loongson.cn>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhuacai@gmail.com>, siyanteng01@gmail.com,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-mips@vger.kernel.org
Subject: Re: [PATCH v2] MIPS: mm: remove function __uncached_access()
In-Reply-To: <20210126143705.GA14767@alpha.franken.de>
Message-ID: <alpine.DEB.2.21.2102101124390.35623@angie.orcam.me.uk>
References: <20210124073755.1287129-1-siyanteng@loongson.cn> <20210126143705.GA14767@alpha.franken.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, 26 Jan 2021, Thomas Bogendoerfer wrote:

> it might help to split this patch into two patches. Put the
> loogonson2ef stuff into the first patch with the explaination, that
> we no longer need the MESA workaround (which shouldn't be there in
> the first place, IMHO)
> 
> >  arch/mips/mm/cache.c               |  8 --------
> >  drivers/char/mem.c                 |  7 -------
> 
> and the rest into a second patch, with a comment that MIPS can now use
> the default uncached_access like other archs.

 It might make sense to mention that effectively this is a revert of 
commit 24e9d0b96dac ("[MIPS] Hook for platforms to define cachability of 
/dev/mem regions"), which has become unneeded with the removal of the last 
user (which in turn ultimately was a descendent of commit 42d226c7248a 
("[MIPS] New files for lemote fulong mini-PC support")).

  Maciej
