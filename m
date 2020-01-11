Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 85830138362
	for <lists+linux-mips@lfdr.de>; Sat, 11 Jan 2020 21:00:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731018AbgAKUAT (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 11 Jan 2020 15:00:19 -0500
Received: from Galois.linutronix.de ([193.142.43.55]:34038 "EHLO
        Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731016AbgAKUAT (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 11 Jan 2020 15:00:19 -0500
Received: from p5b06da22.dip0.t-ipconnect.de ([91.6.218.34] helo=nanos.tec.linutronix.de)
        by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
        (Exim 4.80)
        (envelope-from <tglx@linutronix.de>)
        id 1iqMvZ-0008H2-H7; Sat, 11 Jan 2020 21:00:09 +0100
Received: by nanos.tec.linutronix.de (Postfix, from userid 1000)
        id 4D705100C52; Sat, 11 Jan 2020 20:59:58 +0100 (CET)
From:   Thomas Gleixner <tglx@linutronix.de>
To:     Christophe Leroy <christophe.leroy@c-s.fr>, arnd@arndb.de,
        vincenzo.frascino@arm.com, luto@kernel.org
Cc:     linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        x86@kernel.org
Subject: Re: [PATCH] lib: vdso: mark __cvdso_clock_getres() as static
In-Reply-To: <e7becc50bee355e3872b84d91cc68ae8d7776bb9.1578764712.git.christophe.leroy@c-s.fr>
References: <e7becc50bee355e3872b84d91cc68ae8d7776bb9.1578764712.git.christophe.leroy@c-s.fr>
Date:   Sat, 11 Jan 2020 20:59:58 +0100
Message-ID: <875zhhsr0h.fsf@nanos.tec.linutronix.de>
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
> When __cvdso_clock_getres() became __cvdso_clock_getres_common()
> and a new __cvdso_clock_getres() was added, static qualifier was
> forgotten.
>
> Fixes: 502a590a170b ("lib/vdso: Move fallback invocation to the callers")
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>

I've already queued:

     https://lore.kernel.org/r/20191128111719.8282-1-vincenzo.frascino@arm.com

but thanks for caring!

Thanks,

        tglx
