Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A217527EAFE
	for <lists+linux-mips@lfdr.de>; Wed, 30 Sep 2020 16:34:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728496AbgI3Oe3 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 30 Sep 2020 10:34:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728149AbgI3Oe3 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 30 Sep 2020 10:34:29 -0400
X-Greylist: delayed 48928 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 30 Sep 2020 07:34:29 PDT
Received: from orcam.me.uk (unknown [IPv6:2001:4190:8020::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 85E9EC061755
        for <linux-mips@vger.kernel.org>; Wed, 30 Sep 2020 07:34:29 -0700 (PDT)
Received: from bugs.linux-mips.org (eddie.linux-mips.org [IPv6:2a01:4f8:201:92aa::3])
        by orcam.me.uk (Postfix) with ESMTPS id 2F6B02BE086;
        Wed, 30 Sep 2020 15:34:28 +0100 (BST)
Date:   Wed, 30 Sep 2020 15:34:25 +0100 (BST)
From:   "Maciej W. Rozycki" <macro@linux-mips.org>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
cc:     Necip Fazil Yildiran <fazilyildiran@gmail.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        paul@pgazz.com, jeho@cs.utexas.edu
Subject: Re: [PATCH] MIPS: remove the obsolete RM7000 extended interrupts
 handler
In-Reply-To: <20200918135053.GB19202@alpha.franken.de>
Message-ID: <alpine.LFD.2.21.2009301529080.333514@eddie.linux-mips.org>
References: <20200912142306.3604968-1-fazilyildiran@gmail.com> <20200918135053.GB19202@alpha.franken.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, 18 Sep 2020, Thomas Bogendoerfer wrote:

> > IRQ_CPU_RM7K has been a non-visible config selected nowhere since
> > PMC-Sierra Yosemite support has been removed with commit bdf20507da11
> > ("MIPS: PMC-Sierra Yosemite: Remove support."). By the same token, the
> > handler for RM7000 extended interrupts has been obsolete.
> > 
> > Remove the obsolete code.
> 
> not yet;-) I have an RM7000 based system in my basement... I'm also
> not sure, if R7k O2s need that.

 One of the more exotic Malta daughtercards used that too I believe.  I'd 
have to check the docs.  Of course getting hands on such a daughtercard is 
another matter, but we continue having RM7000 enabled for the Malta.

  Maciej
