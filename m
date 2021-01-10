Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD0842F05D5
	for <lists+linux-mips@lfdr.de>; Sun, 10 Jan 2021 08:16:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725783AbhAJHQI (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 10 Jan 2021 02:16:08 -0500
Received: from mout.gmx.net ([212.227.15.15]:47501 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725782AbhAJHQI (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 10 Jan 2021 02:16:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1610262842;
        bh=noDH0ChJmCU03kyt+rN//VJGTe/0j/EzmVstme6oq8A=;
        h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
        b=ZM+Zbhp+iVzuzN6vtrRTdRLfkcPYMBK1dLj/mEqbmeBiwA7RTXddcfHZyhRIVUFo7
         UcYasWeYkPLxU0u/9L1pRP/6Fu3Cdw2mE/XiY25cPqsejSSd7MCBCJnmMtlgN8egIq
         0ZBZNIBkfLPvXKPlt5W57Ex0yQhWn83TE4ggetps=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from Valinor ([82.203.165.132]) by mail.gmx.com (mrgmx004
 [212.227.17.184]) with ESMTPSA (Nemesis) id 1Ma20k-1kUr6r34AG-00W1NS; Sun, 10
 Jan 2021 08:14:01 +0100
Date:   Sun, 10 Jan 2021 09:15:36 +0200
From:   Lauri Kasanen <cand@gmx.com>
To:     Takashi Iwai <tiwai@suse.de>
Cc:     linux-mips@vger.kernel.org, tsbogend@alpha.franken.de,
        perex@perex.cz
Subject: Re: [PATCH 5/6 v2] sound: Add n64 driver
Message-Id: <20210110091536.b3bc5dce2ef9d6c94d3eb873@gmx.com>
In-Reply-To: <s5h5z45x24r.wl-tiwai@suse.de>
References: <20210108103513.336e6eb9ad323feff6758e20@gmx.com>
        <s5hsg7byezb.wl-tiwai@suse.de>
        <20210109092303.b9a2a2f678a5d1b19b7f27f3@gmx.com>
        <s5him86wmnr.wl-tiwai@suse.de>
        <20210109194601.f94ca38b2b99ddeb15705993@gmx.com>
        <s5ha6tivutv.wl-tiwai@suse.de>
        <s5h5z45x24r.wl-tiwai@suse.de>
X-Mailer: Sylpheed 3.5.0 (GTK+ 2.18.6; x86_64-unknown-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:inWlwNRlrAlWOHGFu8XN/wEUK9UccYWu0YROa6VtmUm3y+r2qz/
 dXsZo5XbJXP/9QRE946PgtSdKFGuWZe2qBL82IQOQJQBCFXDrOZP1IvOEByXTg/bxeVahpf
 E9j65xntfrJIQjuIeh3xtnXDerbfd/SXllQuwXaZrChI8z0PaaBISvWsGJkg8z28/uRF8V6
 d/r4qASCSRVpfwm+oZKNg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:X3v+72yBUnk=:wXo5hPagcB16fEV8cQE76c
 TtGGS/xi6ERXwCc+P2owpO5LkQoYP0u6LGf8IsJvY9vPjFnX+PzRjHMBuej1HWbsDUveus82Y
 n6f3ca3oMbZpDyuRIZqwTIaia038yAXN+17KpkFXEIoeI0fgUbT7rxM//FZcUbCsEd1MxkEku
 iQMbRl6i/E1SUHtIbUOzc4jpaHUJ8kup34iMzVCLko2w3weCAMO/Ujog/TT6Jg4/zNUihsWUr
 JBOVy+p546P2hr1wK8UJFxrEFj2p37dpuaWZteGh0y58F5sObCuJ7I0rIeL/QXpTt0KcDatMu
 eLVU5XoPQ8yEwR3ro5Sajb/Le9fxMUx0IVn6o39kz8W+yilInlnacWRGDJkew6Zzq3KBlzwvO
 NQcHospw+F6CZb62rl9M8GPB1RX9XH8XLT/eUzW5WqUPzEdGp5o0lfFCN4t5BTSdH8u8XfULx
 Sf4UVr2iuDDbbk0rTZYe6GoqUXJ7yVMtYHoylaMxta+jdjGK1QuCR0ybnC9iMIBysqfPUt66k
 l7LrPKGYpLiMM2PFDSW6vpjRdqH/L343DVE2w97lQneUD0CEvPrXZwGIl9pCrE2cnrug2DbwD
 a+c3/YAHWEl8Lkz9onKG75DoMwSZJBuw0DewCm9/QA4acTkS0hHKDcU4kAa9oEL72VxIa+tf9
 6/tTZ547CzQlGDCn5Ht4Ev5/G2Zg036Usy/bg88aRbz+7SJRcmbdUrFX97suOipv7mnFAuDUC
 0vQ4d6rs0WiSpui3AuW9MW5lKknPEQEPlxx4lN+zAz659+wha12MTmt9WyMZrrvWu/SwHCuVr
 KjAUyx2Zd7mtgwwia8BiiDExX+OplN0bVjTLMZ8Z78xV8jqaovhhPmg2N65nCjxDXVwwlP8kY
 SH6qbhiDw9mIZnfWq+6w==
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, 09 Jan 2021 21:54:12 +0100
Takashi Iwai <tiwai@suse.de> wrote:

> When the start starts, it copies the full period size data, and moves
> nextpos to period size while keeping pos 0.  And, at this moment, it's
> even possible that no enough data has been filled for the period
> size; this is practically a buffer underrun.
> Usually PCM core can catch the buffer underrun by comparing the
> current position reported by the pointer callback against the filled
> size, but in this case, PCM core can't know of it because the driver
> just tells the position 0.  This is one problem.
>
> Then, at the first period IRQ, the next period is copied, then nextpos
> becomes 2*period_size.  At this moment, pos =3D nextpos, hence it jumps
> from 0 to 2*periodsize out of sudden.  It's quite confusing behavior
> for applications.  That's the second problem.
>
> I guess that both problems could be avoided if n64audio_pointer()
> reports always nextpos instead of pos.

At first there was no nextpos, and _pointer() always reported pos. This
didn't work, the core played through the audio at chipmunk speed. So
there must be more that I don't understand here.

Let me describe the hw, perhaps a different approach would be better.
- the DMA unit requires 8-byte alignment and 8-divisible size (two
frames at the only supported format, s16be stereo)
- the DMA unit has errata if (start + len) & 0x3fff =3D=3D 0x2000, this
must never happen
- the audio IRQ is not a timer, it fires when the card's internal
buffers are empty and need immediate refill

- Lauri
