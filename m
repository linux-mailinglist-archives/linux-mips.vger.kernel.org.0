Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ABC40129C96
	for <lists+linux-mips@lfdr.de>; Tue, 24 Dec 2019 03:07:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727008AbfLXCHp (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 23 Dec 2019 21:07:45 -0500
Received: from mail.kernel.org ([198.145.29.99]:46952 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726908AbfLXCHp (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 23 Dec 2019 21:07:45 -0500
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4ADF620CC7
        for <linux-mips@vger.kernel.org>; Tue, 24 Dec 2019 02:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1577153264;
        bh=nuWZ8yhnitZpPr2h+5PU5xzGudc3XC10lX5Ec91GR+s=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=E6kVU9g202rFhym4tXVVBYm1fF7zrf4imuKY1UsLFAoqO0HfSsUASADU8FpcnUTFX
         au8dQB0MMEwRaITZ7AkOA+CdDJ26kZ865Lo1+fULgI1ZCLw1Y/TN1ZP2AMm5x/siU4
         pk8YakrCG+Ck+yePKWOcsbZyKUUeS+p1lIRxmwIs=
Received: by mail-wr1-f51.google.com with SMTP id d16so18577123wre.10
        for <linux-mips@vger.kernel.org>; Mon, 23 Dec 2019 18:07:44 -0800 (PST)
X-Gm-Message-State: APjAAAV1kNbOfzKieopMa+vqZUBYekg1XtC+gDpToU0Ug213ACUxMHvt
        K0/jH+MCylJxeXYM6uOGEnh8wkmi6cFINBhTiB2WCg==
X-Google-Smtp-Source: APXvYqykVrvy0YjrN0kH0ZW9RItFuTqBfOCiQcjlBJoCQ0o5yZwU56b/UhrC0QUXlKV7VRHUBN0rn8CMmknayBiXVnU=
X-Received: by 2002:adf:eb09:: with SMTP id s9mr34073707wrn.61.1577153262733;
 Mon, 23 Dec 2019 18:07:42 -0800 (PST)
MIME-Version: 1.0
References: <cover.1577111363.git.christophe.leroy@c-s.fr> <47701b5fb73cf536db074031db8e6e3fa3695168.1577111365.git.christophe.leroy@c-s.fr>
In-Reply-To: <47701b5fb73cf536db074031db8e6e3fa3695168.1577111365.git.christophe.leroy@c-s.fr>
From:   Andy Lutomirski <luto@kernel.org>
Date:   Mon, 23 Dec 2019 18:07:30 -0800
X-Gmail-Original-Message-ID: <CALCETrULuV5iAU3kSjMdcpV6DFGEw1z2so0DfDca6hoLB4X4cA@mail.gmail.com>
Message-ID: <CALCETrULuV5iAU3kSjMdcpV6DFGEw1z2so0DfDca6hoLB4X4cA@mail.gmail.com>
Subject: Re: [RFC PATCH v2 01/10] lib: vdso: ensure all arches have 32bit fallback
To:     Christophe Leroy <christophe.leroy@c-s.fr>
Cc:     Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Arnd Bergmann <arnd@arndb.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        Andrew Lutomirski <luto@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        X86 ML <x86@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Dec 23, 2019 at 6:31 AM Christophe Leroy
<christophe.leroy@c-s.fr> wrote:
>
> In order to simplify next step which moves fallback call at arch
> level, ensure all arches have a 32bit fallback instead of handling
> the lack of 32bit fallback in the common code based
> on VDSO_HAS_32BIT_FALLBACK

I don't like this.  You've implemented what appear to be nonsensical
fallbacks (the 32-bit fallback for a 64-bit vDSO build?  There's no
such thing).

How exactly does this simplify patch 2?

--Andy
