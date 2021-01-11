Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8E6E2F0F59
	for <lists+linux-mips@lfdr.de>; Mon, 11 Jan 2021 10:47:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727819AbhAKJnz (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 11 Jan 2021 04:43:55 -0500
Received: from mout.gmx.net ([212.227.17.22]:52425 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725897AbhAKJnz (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 11 Jan 2021 04:43:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1610358108;
        bh=HW+m4fwH2Natd93p0Kkj8KG2G2fTDvAz2rxJpb/lGBo=;
        h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
        b=DN5w5MlJh43eN6vMsFcLdfft4MeIWRxZl41jTMbkCdjimlYIqqedIX9MG7HIE9nDi
         a3M8KMTj735+mKBiNVz+6rA/FvmKpWRJ8bojxv1PXagsUmPfGCQBe9iEqTsJyGP4Sa
         NCOqYZGV9ybbBAnwQ6VmFez7KlmhzJSiFb6pKCB4=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from Valinor ([82.203.165.132]) by mail.gmx.com (mrgmx105
 [212.227.17.174]) with ESMTPSA (Nemesis) id 1MIdeX-1kksww3Jvp-00EdmB; Mon, 11
 Jan 2021 10:41:47 +0100
Date:   Mon, 11 Jan 2021 11:43:23 +0200
From:   Lauri Kasanen <cand@gmx.com>
To:     Takashi Iwai <tiwai@suse.de>
Cc:     linux-mips@vger.kernel.org, tsbogend@alpha.franken.de,
        perex@perex.cz
Subject: Re: [PATCH 5/6 v2] sound: Add n64 driver
Message-Id: <20210111114323.d522f6e30a705d0731b41b93@gmx.com>
In-Reply-To: <s5hk0sjvqz3.wl-tiwai@suse.de>
References: <20210108103513.336e6eb9ad323feff6758e20@gmx.com>
        <s5hsg7byezb.wl-tiwai@suse.de>
        <20210109092303.b9a2a2f678a5d1b19b7f27f3@gmx.com>
        <s5him86wmnr.wl-tiwai@suse.de>
        <20210109194601.f94ca38b2b99ddeb15705993@gmx.com>
        <s5ha6tivutv.wl-tiwai@suse.de>
        <s5h5z45x24r.wl-tiwai@suse.de>
        <20210110091536.b3bc5dce2ef9d6c94d3eb873@gmx.com>
        <s5hwnwlum21.wl-tiwai@suse.de>
        <20210110190332.8a818e931975f02b8f3d3881@gmx.com>
        <s5ho8hwvh91.wl-tiwai@suse.de>
        <20210110194146.58cf1d6d64a7fbc6d5336210@gmx.com>
        <s5hk0sjvqz3.wl-tiwai@suse.de>
X-Mailer: Sylpheed 3.5.0 (GTK+ 2.18.6; x86_64-unknown-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:msp0yH16Fd77cFzyIq7vHG1+sj9RcXA9ACmjirwRBWmiktXNpP7
 8AC+4h3I4B622V8LDNvv3j+bZe8PDnQGol4fvu0QvLbrw1J4eKFqiCM1+I4zrzatq1KgHCO
 33KI3HhNaXlVgginRWUZXt7qvoNl6mGVFn/A+8lIrTFNlLexRAehrl+WtI3edGkUcnF2Ava
 JLuEaTmpPm4f4dfpr5ofA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:KVmmElDvuRc=:ydqrH7KBrtLckpVqF43rpr
 2mCu7hfElVODAYEj5xdGuBzp95srplN8EhTYJuzy5CJwqzLlV8MBoQ+GF3wk6simxYCs/1WaX
 8MYkKKbSRMFccpDL9nyi2AykQbAXTVoW+Z1aU1kREybnIM/GrSaZ7LiSpL/oAPsriWzDUG5zR
 nyEqUFf0xFdTfgu5fLixAB1MjiBYx5Lp/aWueZnx+/b0YRxcH0sHelm0VzYVhva9zwygN9gpt
 kyhGbvXXNmNam1V6+Eu/XZqSudraZlBsxwbAef/dVEjzi2be+wplufKc4wNm4j6r0bOQH7vkD
 mVBI6dimcL6NJmIdBk6+MAFJZfEEBosNP3DOnMJ6RUYLxmW2MJLIRs4jZdT+rNaxWHMhLat91
 KZb9kbCgsyUJni5Wg89+ROZz0NTkECK0ZPPhXz00CzCwyolvyCILY6Lc5GLHt/+f2qLveYhDW
 QW2AvV3cxklAewuA8gIc7oeap2C7Jrr9GMZOLeUNXcwVJ4pu743SxgicvdCs2PUpnSEqjDjxr
 S32ZWOdpm/0M98CJDN/jnmbUqPDsPYhzMskr11hArZ0cSCNngpTyP3B3Qxb0/RAQE6Npe+qDc
 KKfzUgR56u0wc8cek+AaHpAUBNiFwHeG6wWkQjsXV9/jVOPkyOQbln4txmL+1tQSi8FApV9Zf
 PrBOjahfMvk0iIG8w6oxTUNFYA+Cwc5DpAjMhu8/joUAdEF5hwsoLODq2u3PMbHccHl72z1vV
 ow9jBj93nOpTi9g3kow/f/Sx/9OWBsZJqWDRYU2vtpGZIdkwEpZ3e4bofLytW0ZTUe03cF+4S
 lo8+KriFOINKu89b/q4sD6u+5dpWc11V0YGVyZ7fQd3cfUGzRM+lmmyr4t9wAmy4uAIQB2di0
 a5XFXUUPqBLIBsEOuQ1g==
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, 11 Jan 2021 09:05:04 +0100
Takashi Iwai <tiwai@suse.de> wrote:

> On Sun, 10 Jan 2021 18:41:46 +0100,
> Lauri Kasanen wrote:
> > It was returning nextpos, but the pointer printk was in bytes. 8192
> > bytes =3D 2048 frames.
>
> OK, then it must be right.
>
> Then I suppose that the update of pos should be changed in a different
> way; it should always point to the previous nextpos.  That is,
> something like:
>
> static void n64audio_push(struct n64audio_t *priv, uint8_t irq)
> {
> 	....
> 	if (irq)
> 		priv->chan.pos =3D priv->chan.nextpos;
> 	priv->chan.nextpos +=3D count;
> 	priv->chan.nextpos %=3D priv->chan.bufsize;
>
> If we use nextpos as the position, it'll lead to the double steps at
> the first IRQ handling without snd_pcm_period_elapsed() call (the
> first step missed it), and this may confuse PCM core.

This almost works, speed is correct, but the last part is played twice.

I wonder if the first, non-irq push should just push a silent buffer,
and not update pos or nextpos at all.

- Lauri
