Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9E33E13944E
	for <lists+linux-mips@lfdr.de>; Mon, 13 Jan 2020 16:08:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727494AbgAMPIY (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 13 Jan 2020 10:08:24 -0500
Received: from Galois.linutronix.de ([193.142.43.55]:39143 "EHLO
        Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726399AbgAMPIX (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 13 Jan 2020 10:08:23 -0500
Received: from [5.158.153.52] (helo=nanos.tec.linutronix.de)
        by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
        (Exim 4.80)
        (envelope-from <tglx@linutronix.de>)
        id 1ir1K8-0003m8-Or; Mon, 13 Jan 2020 16:08:12 +0100
Received: by nanos.tec.linutronix.de (Postfix, from userid 1000)
        id 50A5D105BF0; Mon, 13 Jan 2020 16:08:12 +0100 (CET)
From:   Thomas Gleixner <tglx@linutronix.de>
To:     Christophe Leroy <christophe.leroy@c-s.fr>, arnd@arndb.de,
        vincenzo.frascino@arm.com, luto@kernel.org
Cc:     linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        x86@kernel.org
Subject: Re: [PATCH] lib: vdso: mark __cvdso_clock_getres() as static
In-Reply-To: <658045cd-3f97-946d-6920-bea772e9be24@c-s.fr>
References: <e7becc50bee355e3872b84d91cc68ae8d7776bb9.1578764712.git.christophe.leroy@c-s.fr> <875zhhsr0h.fsf@nanos.tec.linutronix.de> <658045cd-3f97-946d-6920-bea772e9be24@c-s.fr>
Date:   Mon, 13 Jan 2020 16:08:12 +0100
Message-ID: <87y2ubqtr7.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Christophe Leroy <christophe.leroy@c-s.fr> writes:
> Is there a git tree with the latest VDSO status ?
>
> https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git?h=timers%2Fvdso 
> is 6 monthes old.

Will push a new one later today. I'll let you know.

Thanks,

        tglx

