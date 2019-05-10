Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3E49D1A122
	for <lists+linux-mips@lfdr.de>; Fri, 10 May 2019 18:16:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727645AbfEJQQ6 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 10 May 2019 12:16:58 -0400
Received: from eddie.linux-mips.org ([148.251.95.138]:37718 "EHLO
        cvs.linux-mips.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727271AbfEJQQ6 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 10 May 2019 12:16:58 -0400
Received: (from localhost user: 'macro', uid#1010) by eddie.linux-mips.org
        with ESMTP id S23994582AbfEJQQ4RvYN4 (ORCPT
        <rfc822;linux-mips@vger.kernel.org> + 1 other);
        Fri, 10 May 2019 18:16:56 +0200
Date:   Fri, 10 May 2019 17:16:56 +0100 (BST)
From:   "Maciej W. Rozycki" <macro@linux-mips.org>
To:     Paul Burton <paul.burton@mips.com>
cc:     Valentin Schneider <valentin.schneider@arm.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        James Hogan <jhogan@kernel.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: Re: [PATCH 06/14] MIPS: entry: Remove unneeded need_resched() loop
In-Reply-To: <20190314181306.k6vxmaomyqalhi65@pburton-laptop>
Message-ID: <alpine.LFD.2.21.1905101706440.12665@eddie.linux-mips.org>
References: <20190311224752.8337-1-valentin.schneider@arm.com> <20190311224752.8337-7-valentin.schneider@arm.com> <20190314181306.k6vxmaomyqalhi65@pburton-laptop>
User-Agent: Alpine 2.21 (LFD 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, 14 Mar 2019, Paul Burton wrote:

> > @@ -66,7 +65,7 @@ need_resched:
> >  	andi	t0, 1
> >  	beqz	t0, restore_all
> >  	jal	preempt_schedule_irq
> > -	b	need_resched
> > +	j	restore_all
> 
> One nit - why change from branch to jump? It's not a big deal, but I'd
> prefer we stick with the branch ("b") instruction for a few reasons:
> 
> - restore_all is nearby so there's no issue with it being out of range
>   of a branch in any variation of the MIPS ISA.

 FYI, if it does go out of range for whatever reason, then for non-PIC 
code GAS will relax it to a jump anyway (with a relocation attached); for 
the regular MIPS ISA that is, where it has been doing that since forever 
(I meant to implement this for the microMIPS ISA too, but IIRC there was a 
complication there, probably coming from the existing more complex branch 
relaxation code and/or slightly different use of relocations, and then it 
fell through the cracks).

  Maciej
