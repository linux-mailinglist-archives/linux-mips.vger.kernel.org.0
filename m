Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 151241405BE
	for <lists+linux-mips@lfdr.de>; Fri, 17 Jan 2020 10:00:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726596AbgAQJAA (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 17 Jan 2020 04:00:00 -0500
Received: from gate.crashing.org ([63.228.1.57]:51278 "EHLO gate.crashing.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726908AbgAQJAA (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 17 Jan 2020 04:00:00 -0500
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
        by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 00H8ws29002697;
        Fri, 17 Jan 2020 02:58:54 -0600
Received: (from segher@localhost)
        by gate.crashing.org (8.14.1/8.14.1/Submit) id 00H8wpV1002692;
        Fri, 17 Jan 2020 02:58:51 -0600
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date:   Fri, 17 Jan 2020 02:58:51 -0600
From:   Segher Boessenkool <segher@kernel.crashing.org>
To:     Christophe Leroy <christophe.leroy@c-s.fr>
Cc:     Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>, nathanl@linux.ibm.com,
        arnd@arndb.de, tglx@linutronix.de, vincenzo.frascino@arm.com,
        luto@kernel.org, x86@kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mips@vger.kernel.org
Subject: Re: [RFC PATCH v4 00/11] powerpc: switch VDSO to C implementation.
Message-ID: <20200117085851.GS3191@gate.crashing.org>
References: <cover.1579196675.git.christophe.leroy@c-s.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1579196675.git.christophe.leroy@c-s.fr>
User-Agent: Mutt/1.4.2.3i
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi!

On Thu, Jan 16, 2020 at 05:58:24PM +0000, Christophe Leroy wrote:
> On a powerpc8xx, with current powerpc/32 ASM VDSO:
> 
> gettimeofday:    vdso: 907 nsec/call
> clock-getres-realtime:    vdso: 484 nsec/call
> clock-gettime-realtime:    vdso: 899 nsec/call
> 
> The first patch adds VDSO generic C support without any changes to common code.
> Performance is as follows:
> 
> gettimeofday:    vdso: 1211 nsec/call
> clock-getres-realtime:    vdso: 722 nsec/call
> clock-gettime-realtime:    vdso: 1216 nsec/call
> 
> Then a few changes in the common code have allowed performance improvement. At
> the end of the series we have:
> 
> gettimeofday:    vdso: 974 nsec/call
> clock-getres-realtime:    vdso: 545 nsec/call
> clock-gettime-realtime:    vdso: 941 nsec/call
> 
> The final result is rather close to pure ASM VDSO:
> * 7% more on gettimeofday (9 cycles)
> * 5% more on clock-gettime-realtime (6 cycles)
> * 12% more on clock-getres-realtime (8 cycles)

Nice!  Much better.

It should be tested on more representative hardware, too, but this looks
promising alright :-)


Segher
