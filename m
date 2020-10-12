Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A93BC28B267
	for <lists+linux-mips@lfdr.de>; Mon, 12 Oct 2020 12:38:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387635AbgJLKik (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 12 Oct 2020 06:38:40 -0400
Received: from elvis.franken.de ([193.175.24.41]:58411 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387596AbgJLKiS (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 12 Oct 2020 06:38:18 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1kRvDc-0008KW-01; Mon, 12 Oct 2020 12:38:16 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 0D6E8C1140; Mon, 12 Oct 2020 12:29:35 +0200 (CEST)
Date:   Mon, 12 Oct 2020 12:29:34 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     "Maciej W. Rozycki" <macro@linux-mips.org>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] MIPS: cpu-probe: move fpu probing/handling into
 its own file
Message-ID: <20201012102934.GA7765@alpha.franken.de>
References: <20201008213327.11603-1-tsbogend@alpha.franken.de>
 <alpine.LFD.2.21.2010100128110.866917@eddie.linux-mips.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.LFD.2.21.2010100128110.866917@eddie.linux-mips.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, Oct 10, 2020 at 01:30:38AM +0100, Maciej W. Rozycki wrote:
> On Thu, 8 Oct 2020, Thomas Bogendoerfer wrote:
> 
> > +			/*
> > +			 * MAC2008 toolchain never landed in real world, so we're only
> > +			 * testing whether it can be disabled and don't try to enabled
> > +			 * it.
> > +			 */
> > +			fcsr0 = fcsr & ~(FPU_CSR_ABS2008 | FPU_CSR_NAN2008 | FPU_CSR_MAC2008);
> > +			write_32bit_cp1_register(CP1_STATUS, fcsr0);
> > +			fcsr0 = read_32bit_cp1_register(CP1_STATUS);
> > +
> > +			fcsr1 = fcsr | FPU_CSR_ABS2008 | FPU_CSR_NAN2008;
> > +			write_32bit_cp1_register(CP1_STATUS, fcsr1);
> > +			fcsr1 = read_32bit_cp1_register(CP1_STATUS);
> > +
> > +			write_32bit_cp1_register(CP1_STATUS, fcsr);
> > +
> > +			if (c->isa_level & (MIPS_CPU_ISA_M32R2 | MIPS_CPU_ISA_M64R2)) {
> > +				/*
> > +				 * The bit for MAC2008 might be reused by R6 in future,
> > +				 * so we only test for R2-R5.
> > +				 */
> 
>  Umm, this has formatting issues with lines extending beyond column #80.

I've fixed it while appling.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
