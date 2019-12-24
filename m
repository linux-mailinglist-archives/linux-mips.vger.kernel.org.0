Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EFD85129C7D
	for <lists+linux-mips@lfdr.de>; Tue, 24 Dec 2019 02:58:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727134AbfLXB6j (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 23 Dec 2019 20:58:39 -0500
Received: from mail.kernel.org ([198.145.29.99]:43976 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726997AbfLXB6j (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 23 Dec 2019 20:58:39 -0500
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8A45F21569
        for <linux-mips@vger.kernel.org>; Tue, 24 Dec 2019 01:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1577152718;
        bh=wrDzBWpOKSiwcb+qBm67fhEmniMtsPe08K1CDqJG+aQ=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=oFYra1GnrPYPW0VIb0ihhkc/X1ko+xfQht7/2IKlWIyfO6uNchY0GOmxSOCGWBnY+
         oQU08j1ThgwFiIxFVbPwHNZ4a4Bg8WDDE6yE6w4LCePbFzjER6HYQqZgnlhUqcpAns
         WZQxExfAhEzKuKRq9E0Du+n4NTas+PLc/RJdGJLU=
Received: by mail-wm1-f52.google.com with SMTP id b19so1252821wmj.4
        for <linux-mips@vger.kernel.org>; Mon, 23 Dec 2019 17:58:38 -0800 (PST)
X-Gm-Message-State: APjAAAUbXkrKlmpIF0tjXYiqhqr64cOZlIXwPdup3W2hmSwqA80vIClo
        v099q483Tm3NFygADT99G4eOC+iVZdFWZnILR5zThw==
X-Google-Smtp-Source: APXvYqxwNlYNszeowAFN0oKu0h4yW9ADusJeScbE5XRItW37UFXluNES85cpW6MmdJIXJdPRzP47hHREp3dIH3wiI6I=
X-Received: by 2002:a7b:cbc9:: with SMTP id n9mr1469926wmi.89.1577152716961;
 Mon, 23 Dec 2019 17:58:36 -0800 (PST)
MIME-Version: 1.0
References: <cover.1577111363.git.christophe.leroy@c-s.fr> <fc1ff722c7cbe63a63ae02ade3a714d2049d54a5.1577111367.git.christophe.leroy@c-s.fr>
In-Reply-To: <fc1ff722c7cbe63a63ae02ade3a714d2049d54a5.1577111367.git.christophe.leroy@c-s.fr>
From:   Andy Lutomirski <luto@kernel.org>
Date:   Mon, 23 Dec 2019 17:58:24 -0800
X-Gmail-Original-Message-ID: <CALCETrV1TWD4iMoGFX6abxXFukz081Y2XaXy6p1KJBNLpp6ZTA@mail.gmail.com>
Message-ID: <CALCETrV1TWD4iMoGFX6abxXFukz081Y2XaXy6p1KJBNLpp6ZTA@mail.gmail.com>
Subject: Re: [RFC PATCH v2 07/10] lib: vdso: don't use READ_ONCE() in __c_kernel_time()
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
> READ_ONCE() forces the read of the 64 bit value of
> vd[CS_HRES_COARSE].basetime[CLOCK_REALTIME].sec allthough
> only the lower part is needed.

Seems reasonable and very unlikely to be harmful.  That being said,
this function really ought to be considered deprecated -- 32-bit
time_t is insufficient.

Do you get even better code if you move the read into the if statement?

Reviewed-by: Andy Lutomirski <luto@kernel.org>

--Andy
