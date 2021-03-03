Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9C6D32C88E
	for <lists+linux-mips@lfdr.de>; Thu,  4 Mar 2021 02:15:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240398AbhCDAuv (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 3 Mar 2021 19:50:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234271AbhCCWH3 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 3 Mar 2021 17:07:29 -0500
Received: from angie.orcam.me.uk (angie.orcam.me.uk [IPv6:2001:4190:8020::4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 3DCAFC061763;
        Wed,  3 Mar 2021 13:54:39 -0800 (PST)
Received: by angie.orcam.me.uk (Postfix, from userid 500)
        id 69B8E92009C; Wed,  3 Mar 2021 22:50:56 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
        by angie.orcam.me.uk (Postfix) with ESMTP id 5B28392009B;
        Wed,  3 Mar 2021 22:50:56 +0100 (CET)
Date:   Wed, 3 Mar 2021 22:50:56 +0100 (CET)
From:   "Maciej W. Rozycki" <macro@orcam.me.uk>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
cc:     Florian Fainelli <f.fainelli@gmail.com>,
        linux-mips@vger.kernel.org, rppt@kernel.org,
        fancer.lancer@gmail.com, guro@fb.com,
        Andrew Morton <akpm@linux-foundation.org>,
        paul@crapouillou.net,
        Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Kamal Dasu <kdasu.kdev@gmail.com>,
        Yanteng Si <siyanteng@loongson.cn>,
        Huacai Chen <chenhuacai@kernel.org>,
        "open list:BROADCOM BMIPS MIPS ARCHITECTURE" 
        <bcm-kernel-feedback-list@broadcom.com>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] MIPS: BMIPS: Reserve exception base to prevent
 corruption
In-Reply-To: <20210303181541.GA25675@alpha.franken.de>
Message-ID: <alpine.DEB.2.21.2103032249550.19637@angie.orcam.me.uk>
References: <20210301092241.i7dxo7zbg3ar55d6@mobilestation> <20210302041940.3663823-1-f.fainelli@gmail.com> <20210302235411.GA3897@alpha.franken.de> <4e3640d4-7fc2-96dc-de00-599b3ac80757@gmail.com> <20210303094134.GA18354@alpha.franken.de>
 <alpine.DEB.2.21.2103031844510.19637@angie.orcam.me.uk> <20210303181541.GA25675@alpha.franken.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, 3 Mar 2021, Thomas Bogendoerfer wrote:

> >  What's up with the R3k (the usual trigger for me) here?
> 
> I've moved r3k cpu_probe() to it's own file and when moving ebase
> reservation to cpu_probe(), I need to add it there as well. So just
> a mechanic step, I've missed.

 Ah, right, I didn't notice the split.  Thanks for taking care of it!

  Maciej
