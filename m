Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB1882CF4A4
	for <lists+linux-mips@lfdr.de>; Fri,  4 Dec 2020 20:21:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727175AbgLDTUw (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 4 Dec 2020 14:20:52 -0500
Received: from Galois.linutronix.de ([193.142.43.55]:49430 "EHLO
        galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726392AbgLDTUw (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 4 Dec 2020 14:20:52 -0500
Date:   Fri, 4 Dec 2020 20:20:09 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1607109610;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=8eM89ierKyEyQ9fvhT8fq7Xh8000XlLV716RqSWxKdg=;
        b=krkC377HGla50OZujwexptXlx95HSfTuawsbpOk8+BCxXVLCp/4TCrWsw0E2fyQPMwLANq
        WytZWDrM9LneSqzh0IrlNf3hLlzFuDdKZtWobEpjCFqvmbCHOsoBY77Z2j5MetehsrZy/i
        5VzDhh0CYpjyxiXSI/iepqa/iQCZvxX7/pDnPa1AmyRjIyYOAAcPvHD9O6EFh95EN7HmQI
        IlVNWvI/HLEbpONPm+nAX18U5XNIbixDtj6h2cdAjATKE10iNwp4rcdD/i7IA43cr1N8Mv
        ElBJOq/U3BORd//Sd3GVEmlYRn9zkvwDk2ZBtpa2vSBPEnb3wZqia4sXwQwHJA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1607109610;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=8eM89ierKyEyQ9fvhT8fq7Xh8000XlLV716RqSWxKdg=;
        b=3yF/segGxPRWNLTkuPb54M7GbHoDWxzutsnEutqrBlX9QzoIXOUbvxbL8rGvgSkG21WwJO
        7VvIQkn5705bccAg==
From:   Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To:     linux-kernel@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Dominik Brodowski <linux@dominikbrodowski.net>,
        Yoichi Yuasa <yuasa@linux-mips.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org
Subject: Re: [PATCH REPOST] pcmcia: Remove NEC VRC4173 CARDU
Message-ID: <20201204192009.46w4doqoqqvhgrnh@linutronix.de>
References: <20201113213408.2244169-1-bigeasy@linutronix.de>
 <20201119170622.yan5bt2chxvoxqgn@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20201119170622.yan5bt2chxvoxqgn@linutronix.de>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 2020-11-19 18:06:24 [+0100], To linux-kernel@vger.kernel.org wrote:
> On 2020-11-13 22:34:08 [+0100], To linux-kernel@vger.kernel.org wrote:
> > This driver is the very definition of bitrotting:
> > - Introduced in commit
> >   79a140932c776 ("[PATCH] mips: vR41xx updates")
> >   which is 2.6.11-rc3.
> >=20
> > - Provides ->register_callback which was removed in commit
> >   7f316b033b36a ("[PATCH] pcmcia: remove socket register_callback")
> >   which is v2.6.14-rc3
> >=20
> > - Uses INIT_WORK() with three arguments which was removed in commit
> >   65f27f38446e1 ("WorkStruct: Pass the work_struct pointer instead of c=
ontext data")
> >   which is v2.6.20-rc1
> >=20
> > - Provides ->inquire_socket and uses socket_cap_t which was removed in
> >   commit
> >   b7949fdacbe00 ("[PCMCIA] Remove inquire_socket")
> >   which is 2.5.72
> >=20
> > - Provides ->get_io_map which was removed in commit
> >   d7de1b64a23b9 ("[PCMCIA] pcmcia-2: Remove get_io_map and get_mem_map =
socket methods.")
> >   which is 2.5.66
> >=20
> > Remove VRC4173 CARDU from the tree because it never had the luck to be
> > successfully compiled. Let it finally find peace in byte heaven.
> =E2=80=A6
> > This is a repost of
> > 	https://lkml.kernel.org/r/20201001193234.gi6fp4vk3dypwifv@linutronix.de
> >=20
> > which was a repost of
> > 	https://lkml.kernel.org/r/20200916081629.cfi6svr3yjvzimqs@linutronix.de
>=20
> Andrew, are you okay with routing this via your tree?
> Nobody responded to this and as I documented in the patch description it
> never compiled so.

Andrew, any chance?
=20
Sebastian
