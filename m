Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9DB8B289CCB
	for <lists+linux-mips@lfdr.de>; Sat, 10 Oct 2020 02:51:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729084AbgJJAt7 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 9 Oct 2020 20:49:59 -0400
Received: from [157.25.102.26] ([157.25.102.26]:57356 "EHLO orcam.me.uk"
        rhost-flags-FAIL-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728800AbgJJAax (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 9 Oct 2020 20:30:53 -0400
Received: from bugs.linux-mips.org (eddie.linux-mips.org [IPv6:2a01:4f8:201:92aa::3])
        by orcam.me.uk (Postfix) with ESMTPS id ACDA22BE086;
        Sat, 10 Oct 2020 01:30:41 +0100 (BST)
Date:   Sat, 10 Oct 2020 01:30:38 +0100 (BST)
From:   "Maciej W. Rozycki" <macro@linux-mips.org>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] MIPS: cpu-probe: move fpu probing/handling into
 its own file
In-Reply-To: <20201008213327.11603-1-tsbogend@alpha.franken.de>
Message-ID: <alpine.LFD.2.21.2010100128110.866917@eddie.linux-mips.org>
References: <20201008213327.11603-1-tsbogend@alpha.franken.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, 8 Oct 2020, Thomas Bogendoerfer wrote:

> +			/*
> +			 * MAC2008 toolchain never landed in real world, so we're only
> +			 * testing whether it can be disabled and don't try to enabled
> +			 * it.
> +			 */
> +			fcsr0 = fcsr & ~(FPU_CSR_ABS2008 | FPU_CSR_NAN2008 | FPU_CSR_MAC2008);
> +			write_32bit_cp1_register(CP1_STATUS, fcsr0);
> +			fcsr0 = read_32bit_cp1_register(CP1_STATUS);
> +
> +			fcsr1 = fcsr | FPU_CSR_ABS2008 | FPU_CSR_NAN2008;
> +			write_32bit_cp1_register(CP1_STATUS, fcsr1);
> +			fcsr1 = read_32bit_cp1_register(CP1_STATUS);
> +
> +			write_32bit_cp1_register(CP1_STATUS, fcsr);
> +
> +			if (c->isa_level & (MIPS_CPU_ISA_M32R2 | MIPS_CPU_ISA_M64R2)) {
> +				/*
> +				 * The bit for MAC2008 might be reused by R6 in future,
> +				 * so we only test for R2-R5.
> +				 */

 Umm, this has formatting issues with lines extending beyond column #80.

  Maciej
