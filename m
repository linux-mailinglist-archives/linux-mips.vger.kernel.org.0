Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 503D8142EA8
	for <lists+linux-mips@lfdr.de>; Mon, 20 Jan 2020 16:20:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726942AbgATPUk (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 20 Jan 2020 10:20:40 -0500
Received: from gate.crashing.org ([63.228.1.57]:52061 "EHLO gate.crashing.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726626AbgATPUk (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 20 Jan 2020 10:20:40 -0500
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
        by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 00KFJb5J002311;
        Mon, 20 Jan 2020 09:19:38 -0600
Received: (from segher@localhost)
        by gate.crashing.org (8.14.1/8.14.1/Submit) id 00KFJbq8002310;
        Mon, 20 Jan 2020 09:19:37 -0600
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date:   Mon, 20 Jan 2020 09:19:36 -0600
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
Message-ID: <20200120151936.GB3191@gate.crashing.org>
References: <cover.1579196675.git.christophe.leroy@c-s.fr> <20200117085851.GS3191@gate.crashing.org> <3027b6d2-47a9-a871-7c52-050a5f9c6ab7@c-s.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3027b6d2-47a9-a871-7c52-050a5f9c6ab7@c-s.fr>
User-Agent: Mutt/1.4.2.3i
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Jan 20, 2020 at 02:56:00PM +0000, Christophe Leroy wrote:
> >Nice!  Much better.
> >
> >It should be tested on more representative hardware, too, but this looks
> >promising alright :-)
> 
> mpc832x (e300c2 core) at 333 MHz:
> 
> Before:
> 
> gettimeofday:    vdso: 235 nsec/call
> clock-gettime-realtime:    vdso: 244 nsec/call
> 
> With the series:
> 
> gettimeofday:    vdso: 271 nsec/call
> clock-gettime-realtime:    vdso: 281 nsec/call

Those are important, and degrade ~15%.  That is acceptable IMO, but do
you see a way to optimise this (later)?

Anyway, excellent results, thanks for your persistence!


Segher
