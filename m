Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3533DA4C3E
	for <lists+linux-mips@lfdr.de>; Sun,  1 Sep 2019 23:15:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728942AbfIAVO4 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 1 Sep 2019 17:14:56 -0400
Received: from eddie.linux-mips.org ([148.251.95.138]:44868 "EHLO
        cvs.linux-mips.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728851AbfIAVO4 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 1 Sep 2019 17:14:56 -0400
Received: (from localhost user: 'macro', uid#1010) by eddie.linux-mips.org
        with ESMTP id S23992965AbfIAVOx7FUDl (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 1 Sep 2019 23:14:53 +0200
Date:   Sun, 1 Sep 2019 22:14:53 +0100 (BST)
From:   "Maciej W. Rozycki" <macro@linux-mips.org>
To:     Fredrik Noring <noring@nocrew.org>
cc:     linux-mips@vger.kernel.org
Subject: Re: [PATCH 001/120] MIPS: R5900: Initial support for the Emotion
 Engine in the PlayStation 2
In-Reply-To: <074470b707e277f2277bfedfe89ee4acbe159396.1567326213.git.noring@nocrew.org>
Message-ID: <alpine.LFD.2.21.1909012203460.2031@eddie.linux-mips.org>
References: <cover.1567326213.git.noring@nocrew.org> <074470b707e277f2277bfedfe89ee4acbe159396.1567326213.git.noring@nocrew.org>
User-Agent: Alpine 2.21 (LFD 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sun, 1 Sep 2019, Fredrik Noring wrote:

> diff --git a/arch/mips/include/asm/cpu.h b/arch/mips/include/asm/cpu.h
> index 290369fa44a4..05a0f5a07f08 100644
> --- a/arch/mips/include/asm/cpu.h
> +++ b/arch/mips/include/asm/cpu.h
> @@ -83,6 +83,7 @@
>  #define PRID_IMP_R4650		0x2200		/* Same as R4640 */
>  #define PRID_IMP_R5000		0x2300
>  #define PRID_IMP_TX49		0x2d00
> +#define PRID_IMP_R5900		0x2e00		/* PlayStation 2 */
>  #define PRID_IMP_SONIC		0x2400
>  #define PRID_IMP_MAGIC		0x2500
>  #define PRID_IMP_RM7000		0x2700

 Hmm, I don't know why PRID_IMP_TX49 has been misplaced, 18 years ago with 
commit b8c80cd25ffe ("Add missing PrId values for TX39 / TX 49 CPUs."), 
however I suggest that PRID_IMP_R5900 does not make things worse.  I.e. 
please place it between PRID_IMP_NEVADA and PRID_IMP_RM9000.

  Maciej
