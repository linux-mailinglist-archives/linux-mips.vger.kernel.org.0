Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8B75813FA47
	for <lists+linux-mips@lfdr.de>; Thu, 16 Jan 2020 21:14:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729936AbgAPUOJ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 16 Jan 2020 15:14:09 -0500
Received: from Galois.linutronix.de ([193.142.43.55]:53240 "EHLO
        Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729030AbgAPUOJ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 16 Jan 2020 15:14:09 -0500
Received: from p5b06da22.dip0.t-ipconnect.de ([91.6.218.34] helo=nanos.tec.linutronix.de)
        by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
        (Exim 4.80)
        (envelope-from <tglx@linutronix.de>)
        id 1isBWc-0000Wb-NU; Thu, 16 Jan 2020 21:13:54 +0100
Received: by nanos.tec.linutronix.de (Postfix, from userid 1000)
        id F20D7101226; Thu, 16 Jan 2020 21:13:53 +0100 (CET)
From:   Thomas Gleixner <tglx@linutronix.de>
To:     Christophe Leroy <christophe.leroy@c-s.fr>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>, nathanl@linux.ibm.com,
        arnd@arndb.de, vincenzo.frascino@arm.com, luto@kernel.org
Cc:     linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        x86@kernel.org
Subject: Re: [RFC PATCH v4 08/11] lib: vdso: allow fixed clock mode
In-Reply-To: <1b278bc1f6859d4df734fb2cde61cf298e6e07fd.1579196675.git.christophe.leroy@c-s.fr>
References: <cover.1579196675.git.christophe.leroy@c-s.fr> <1b278bc1f6859d4df734fb2cde61cf298e6e07fd.1579196675.git.christophe.leroy@c-s.fr>
Date:   Thu, 16 Jan 2020 21:13:53 +0100
Message-ID: <874kwvf9by.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain
X-Linutronix-Spam-Score: -1.0
X-Linutronix-Spam-Level: -
X-Linutronix-Spam-Status: No , -1.0 points, 5.0 required,  ALL_TRUSTED=-1,SHORTCIRCUIT=-0.0001
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Christophe Leroy <christophe.leroy@c-s.fr> writes:

Can you please adjust the prefix for future patches to lib/vdso: and
start the sentence after the colon with an uppercase letter?

> On arches like POWERPC, the clock is always the timebase, it

Please spell out architectures. Changelogs are not space constraint.

> cannot be changed on the fly and it is always VDSO capable.

Also this sentence does not make sense as it might suggests that
architectures with a fixed compile time known clocksource have something
named timebase. Something like this is more clear:

Some architectures have a fixed clocksource which is known at compile
time and cannot be replaced or disabled at runtime, e.g. timebase on
PowerPC. For such cases the clock mode check in the VDSO code is
pointless.

Hmm?

Thanks,

        tglx
