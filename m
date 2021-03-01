Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F40D132757E
	for <lists+linux-mips@lfdr.de>; Mon,  1 Mar 2021 01:11:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231185AbhCAALB (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 28 Feb 2021 19:11:01 -0500
Received: from angie.orcam.me.uk ([157.25.102.26]:37156 "EHLO
        angie.orcam.me.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230167AbhCAALB (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 28 Feb 2021 19:11:01 -0500
Received: by angie.orcam.me.uk (Postfix, from userid 500)
        id 800F692009C; Mon,  1 Mar 2021 01:10:19 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
        by angie.orcam.me.uk (Postfix) with ESMTP id 79F5B92009B;
        Mon,  1 Mar 2021 01:10:19 +0100 (CET)
Date:   Mon, 1 Mar 2021 01:10:19 +0100 (CET)
From:   "Maciej W. Rozycki" <macro@orcam.me.uk>
To:     Jinyang He <hejinyang@loongson.cn>
cc:     "open list:MIPS" <linux-mips@vger.kernel.org>
Subject: Re: [Question] How to save_stack_trace_tsk_reliable() on mips?
In-Reply-To: <a0823990-420f-8091-7866-8ad588ef542d@loongson.cn>
Message-ID: <alpine.DEB.2.21.2103010043260.44210@angie.orcam.me.uk>
References: <a0823990-420f-8091-7866-8ad588ef542d@loongson.cn>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, 4 Feb 2021, Jinyang He wrote:

> Excuse me. Here is a question mail. How to get a reliable stack
> of tasks on mips?

 You need stack unwinding information.  High-level programming language 
exception handling uses that too.  The information is in the DWARF format, 
also used for debugging, and stored in a separate section within the ELF 
module in question (for debugging it can be stored separately, but for 
exception handling obviously it cannot, as the runtime needs to have it 
mapped in memory and accessible without referring to other files).

> First, why save_stack_trace_tsk() to get stack is unreliable? Is it
> because the asm code does not obey with gcc's stack rules, or others?

 The stack frame as specified by the MIPS psABI does not have a fixed 
format, so it is not possible to interpret its contents by just examining 
them without additional information.

> Secondly, can we use some methods to make the task stack reliable? For
> example, use the fp register, can this method work? But it seems make
> no sense for asm code unless each asm code do some fp work.

 The use of a hard frame pointer register does not change anything, 
because the variable stack frame format does not provide the information 
as to where exactly the previous frame pointer or the return address have 
been stored.  You still need additional information.

> I found that the powerpc implemented save_stack_trace_tsk_reliable(),
> and the x86 and s390 implemented the arch_stack_walk_reliable(). x86
> implemented it through ORC unwind. For powerpc, it may implement it
> through its ABI (I guess, I'm not familiar with them). Do we have a
> chance to implement it in some way?

 I worked with the Power psABI and it has a fixed stack frame format where 
you can figure out the location of the previous frame pointer and the link 
register from the current frame pointer.  This is enough information to be 
able to backtrace.  ISTR x86 has a similar stack frame design, though I'm 
not sure offhand how the case of `-fomit-frame-pointer' code is handled.  
No idea as to the S/390, but I guess it follows the pattern.

> Finally, I found that some emails related to ORC unwind on ARM from the
> livepatch mail list. It is difficult for me to understand. Is anyone
> interested in ORC unwind on MIPS and have researched it?

 I can't comment on this part, I don't know what ORC is.

 HTH,

  Maciej
