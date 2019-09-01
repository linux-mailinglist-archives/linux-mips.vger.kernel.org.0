Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9E7A6A4C69
	for <lists+linux-mips@lfdr.de>; Mon,  2 Sep 2019 00:00:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729037AbfIAWAt (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 1 Sep 2019 18:00:49 -0400
Received: from eddie.linux-mips.org ([148.251.95.138]:50124 "EHLO
        cvs.linux-mips.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729031AbfIAWAt (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 1 Sep 2019 18:00:49 -0400
Received: (from localhost user: 'macro', uid#1010) by eddie.linux-mips.org
        with ESMTP id S23994559AbfIAWArnueOX (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 2 Sep 2019 00:00:47 +0200
Date:   Sun, 1 Sep 2019 23:00:47 +0100 (BST)
From:   "Maciej W. Rozycki" <macro@linux-mips.org>
To:     Fredrik Noring <noring@nocrew.org>
cc:     linux-mips@vger.kernel.org
Subject: Re: [PATCH 002/120] MIPS: R5900: Trap the RDHWR instruction as an
 SQ address exception
In-Reply-To: <4f856a5ea2c039c6639df875d11b5bff1bf7ecd2.1567326213.git.noring@nocrew.org>
Message-ID: <alpine.LFD.2.21.1909012246270.2031@eddie.linux-mips.org>
References: <cover.1567326213.git.noring@nocrew.org> <4f856a5ea2c039c6639df875d11b5bff1bf7ecd2.1567326213.git.noring@nocrew.org>
User-Agent: Alpine 2.21 (LFD 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sun, 1 Sep 2019, Fredrik Noring wrote:

> CONFIG_DEFAULT_MMAP_MIN_ADDR must not be less than PAGE_SIZE to reliably
> trap and emulate RDHWR, so this is made a BUILD_BUG_ON for the R5900.

 I think a more complex solution is required as the value can be changed 
at run time, via /proc/sys/vm/mmap_min_addr, defeating this protection.  
E.g. by introducing an ARCH_MIN_MMAP_MIN_ADDR minimum value, by default 0 
unless overridden by the architecture selected, and then using it for both 
the default DEFAULT_MMAP_MIN_ADDR value and the minimum accepted via 
/proc/sys/vm/mmap_min_addr.

> diff --git a/arch/mips/kernel/unaligned.c b/arch/mips/kernel/unaligned.c
> index 92bd2b0f0548..f490944d73cf 100644
> --- a/arch/mips/kernel/unaligned.c
> +++ b/arch/mips/kernel/unaligned.c
> @@ -1342,6 +1375,7 @@ static void emulate_load_store_insn(struct pt_regs *regs,
>  		cu2_notifier_call_chain(CU2_SDC2_OP, regs);
>  		break;
>  #endif
> +
>  	default:
>  		/*
>  		 * Pheeee...  We encountered an yet unknown instruction or

 Extraneous change.

  Maciej
