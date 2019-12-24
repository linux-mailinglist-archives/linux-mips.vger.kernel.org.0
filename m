Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 36FB0129C7F
	for <lists+linux-mips@lfdr.de>; Tue, 24 Dec 2019 02:59:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727012AbfLXB7v (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 23 Dec 2019 20:59:51 -0500
Received: from mail.kernel.org ([198.145.29.99]:44484 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727005AbfLXB7v (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 23 Dec 2019 20:59:51 -0500
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 86A032073A
        for <linux-mips@vger.kernel.org>; Tue, 24 Dec 2019 01:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1577152790;
        bh=mZIM8/IGO6yj32EzkYlDoUvjeWHo1IO0ajLflWLHJ1E=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=gQGYXs7XTcbdCfx0BUILVDNAMT4zxirLNFz98MThf9EREN5BxfkbsJw1pENHZhpvR
         MLaDU2z5hlCSoTZKzvSyt5ddAtld9M3HziJaduUZk8pJMfEqoz5qyPbPWjvDQ7yqcS
         gb1Iu7wGTPj/8sHQNHy4Kn8t7wlqyf4zPSt/wAiA=
Received: by mail-wr1-f45.google.com with SMTP id c14so18577224wrn.7
        for <linux-mips@vger.kernel.org>; Mon, 23 Dec 2019 17:59:50 -0800 (PST)
X-Gm-Message-State: APjAAAX5w8dWWGMS5O91jDjcEnZD+8U90BCKWV8Bs20qaJOpj462Wkqn
        RROiXwZKJTE6LrH0WWEvsL7tvDXKIVKUGVJ5IV+OPQ==
X-Google-Smtp-Source: APXvYqxAMnRl94bz0dtBWu5DeU1T1h7ThWeUzu+q0KQ6Q4rmgmqNaGXBhJRposss35afzcm4hhvUi2inaUTSmKyfilU=
X-Received: by 2002:adf:f2c1:: with SMTP id d1mr31723699wrp.111.1577152789083;
 Mon, 23 Dec 2019 17:59:49 -0800 (PST)
MIME-Version: 1.0
References: <cover.1577111363.git.christophe.leroy@c-s.fr> <fdf1a968a8f7edd61456f1689ac44082ebb19c15.1577111367.git.christophe.leroy@c-s.fr>
In-Reply-To: <fdf1a968a8f7edd61456f1689ac44082ebb19c15.1577111367.git.christophe.leroy@c-s.fr>
From:   Andy Lutomirski <luto@kernel.org>
Date:   Mon, 23 Dec 2019 17:59:36 -0800
X-Gmail-Original-Message-ID: <CALCETrUZ8rhvhJSYutypUoSf2tGBZPais79fx+8BHWH=Vk4dBw@mail.gmail.com>
Message-ID: <CALCETrUZ8rhvhJSYutypUoSf2tGBZPais79fx+8BHWH=Vk4dBw@mail.gmail.com>
Subject: Re: [RFC PATCH v2 08/10] lib: vdso: Avoid duplication in __cvdso_clock_getres()
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
> VDSO_HRES and VDSO_RAW clocks are handled the same way.
>
> Don't duplicate code.
>
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>

Reviewed-by: Andy Lutomirski <luto@kernel.org>
