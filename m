Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9CA75160533
	for <lists+linux-mips@lfdr.de>; Sun, 16 Feb 2020 19:11:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725899AbgBPSLO convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Sun, 16 Feb 2020 13:11:14 -0500
Received: from mout.kundenserver.de ([217.72.192.73]:43101 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725993AbgBPSLO (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 16 Feb 2020 13:11:14 -0500
Received: from mail-qv1-f52.google.com ([209.85.219.52]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1MC2wN-1jAr2z21oT-00CPB6; Sun, 16 Feb 2020 19:11:12 +0100
Received: by mail-qv1-f52.google.com with SMTP id p2so6627875qvo.10;
        Sun, 16 Feb 2020 10:11:12 -0800 (PST)
X-Gm-Message-State: APjAAAVdAhhTXGBVMxgMhlinMFl8qxvoz+FGEi4vwpbT8vMIN8Hait9+
        smgBddOrmaIFqF1v5j8umdU+g1E335ROqP2UhmE=
X-Google-Smtp-Source: APXvYqzvtOyO80NGJ0NQzbdKQvJf1lkKW8T220YClkzb69MFsE4nIeROks8Hz90TjXKc5YYn+5v58NnqAVTN3OLIhHE=
X-Received: by 2002:a05:6214:524:: with SMTP id x4mr10124633qvw.4.1581876671327;
 Sun, 16 Feb 2020 10:11:11 -0800 (PST)
MIME-Version: 1.0
References: <cover.1577111363.git.christophe.leroy@c-s.fr> <bd4557a7-9715-59aa-5d8e-488c5e516a98@c-s.fr>
 <20200109200733.GS3191@gate.crashing.org> <77a8bf25-6615-6c0a-56d4-eae7aa8a8f09@c-s.fr>
 <20200111113328.GX3191@gate.crashing.org>
In-Reply-To: <20200111113328.GX3191@gate.crashing.org>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Sun, 16 Feb 2020 19:10:55 +0100
X-Gmail-Original-Message-ID: <CAK8P3a11wX1zJ+TAacDTkYsrzvfdVmNrcB6OC23aFvCxF57opQ@mail.gmail.com>
Message-ID: <CAK8P3a11wX1zJ+TAacDTkYsrzvfdVmNrcB6OC23aFvCxF57opQ@mail.gmail.com>
Subject: Re: Surprising code generated for vdso_read_begin()
To:     Segher Boessenkool <segher@kernel.crashing.org>
Cc:     Christophe Leroy <christophe.leroy@c-s.fr>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Thomas Gleixner <tglx@linutronix.de>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        Andy Lutomirski <luto@kernel.org>,
        "the arch/x86 maintainers" <x86@kernel.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Provags-ID: V03:K1:HLqAkIdoPfiPyFHDmbvrtr7n5xYGZph2jMmE62iSDBEnJFcP4Qc
 /SnGSw2icyqhgyrplUKr8475IJrVw8nnHseRauGk4BEdX1ZxxVYn7cydGBYeWj3jBAax9Hb
 WkLyZIbs6QouruTACgn8W6ljRDG3ctdYHnqdTmww8WpSgBHO4GPc4LxGGMxhj5qA7mqGVoK
 MmLLeVohRb/RD/yXVbwOw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:TogwV+iRtEQ=:cU9tZONLF1toHxisqha2Fb
 KzA/Yaf3sW5bq2jYKfVL9Dg6sef78hInu/lOHeohFGLDnfLlOi67PvhWEzDXQ8ljDc3o/mRKC
 rHSMe7X08knS3o6SHgg46AQ/RIocNdco1Nr+RE4zM5AKNK3ZjfCgs0aGFl3oUBp8/bWCfv/Rz
 sPxbdMf1KmoOnXyzm6n+XijtBDA991owf073r/xmk14kgK+FYKLGGWB7lxFCZp7Uwcs981Ud3
 g60zYQ8RicLHPwwiMlUDlZ6B1F5fsyncH36B1dtR0NYcuKuAf8e3vNKcWdRIUHNkNrlXEz6Q1
 Sf/xlFDheBhryTBIW+xcGfB51Ze6u4qrMkVf6GJ6mwmIu29kwUnM8xJ5m0CNwo2frkfgaqrJ4
 Bbh09sG0X9+gwAi5MeEqXciInTnz77zYSOSdK95G4O/n0cASKkHaCICLnQSkLajpQEpQVK5yc
 DZ+4Tzv2t/lmOdd8KsF3Tq5z2GZww7Zi/2YeCGv1tdQXx5a34KiLltsNIauHIvf9fPYG3uj0R
 KvzWtc//q6opalb2/MWhlq/vDcVI8B6qnUUBJgNnQHm8q2wpXMXxAAUIz9LFM3vpd+f8S2x8S
 feak26XmKB8ofpLlQareojXGbbdUmKkxETNxvWG3mrabe070PyDSKuE5j7kQwDpQHIA2OIhgy
 Ie0m9k86ZBM9BuAQ8puc3ciPng5G+QrpOIPoU9hrK8RDw6JFE6FdX7Y8U6aytk6JMIrN2WVhG
 GPycFqA1LqgXc0P1zcDj1/ci6mBYmkt+Q9RaQwpsoRPvL3cNwmL8vF4zNbIdDf260+x0dvvZg
 zaYgIbCTw2Xo2mDM6n/GhN3Thk0jde791M+5ND5VRc+X4PIw5M=
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, Jan 11, 2020 at 12:33 PM Segher Boessenkool
<segher@kernel.crashing.org> wrote:
>
> On Fri, Jan 10, 2020 at 07:45:44AM +0100, Christophe Leroy wrote:
> > Le 09/01/2020 à 21:07, Segher Boessenkool a écrit :
> > >It looks like the compiler did loop peeling.  What GCC version is this?
> > >Please try current trunk (to become GCC 10), or at least GCC 9?
> >
> > It is with GCC 5.5
> >
> > https://mirrors.edge.kernel.org/pub/tools/crosstool/ doesn't have more
> > recent than 8.1
>
> Arnd, can you update the tools?  We are at 8.3 and 9.2 now :-)  Or is
> this hard and/or painful to do?

To follow up on this older thread, I have now uploaded 6.5, 7.5, 8.3 and 9.2
binaries, as well as a recent 10.0 snapshot.

I hope these work, let me know if there are problems.

       Arnd
