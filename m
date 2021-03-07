Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E8F53304E5
	for <lists+linux-mips@lfdr.de>; Sun,  7 Mar 2021 22:49:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233152AbhCGVtI (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 7 Mar 2021 16:49:08 -0500
Received: from angie.orcam.me.uk ([157.25.102.26]:37520 "EHLO
        angie.orcam.me.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233093AbhCGVs3 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 7 Mar 2021 16:48:29 -0500
Received: by angie.orcam.me.uk (Postfix, from userid 500)
        id 64F1792009C; Sun,  7 Mar 2021 22:47:35 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
        by angie.orcam.me.uk (Postfix) with ESMTP id 5AE0492009B;
        Sun,  7 Mar 2021 22:47:35 +0100 (CET)
Date:   Sun, 7 Mar 2021 22:47:35 +0100 (CET)
From:   "Maciej W. Rozycki" <macro@orcam.me.uk>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
cc:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Serge Semin <fancer.lancer@gmail.com>,
        Mike Rapoport <rppt@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Roman Gushchin <guro@fb.com>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, Kamal Dasu <kdasu.kdev@gmail.com>
Subject: Re: [PATCH v2] MIPS: kernel: Reserve exception base early to prevent
 corruption
In-Reply-To: <20210307212001.GA7835@alpha.franken.de>
Message-ID: <alpine.DEB.2.21.2103072236300.51127@angie.orcam.me.uk>
References: <20210306082910.3472-1-tsbogend@alpha.franken.de> <20210307200612.6ftvptnj4txaf2uy@mobilestation> <20210307212001.GA7835@alpha.franken.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sun, 7 Mar 2021, Thomas Bogendoerfer wrote:

> > Are you sure all of them have "cpu_has_mips_r2_r6" macro returning
> > true (false) in order to safely use the lowest region in accordance
> > with the conditional statement you've added?
> 
> some of them are not R2 (SB1), others are. 

 For the record Malta is just about anything from MIPS IV up (though the 
QED RM5261 and RM7061 core cards have been quite rare).

  Maciej
