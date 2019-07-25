Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 001CD75905
	for <lists+linux-mips@lfdr.de>; Thu, 25 Jul 2019 22:42:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726508AbfGYUm2 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 25 Jul 2019 16:42:28 -0400
Received: from outils.crapouillou.net ([89.234.176.41]:34074 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726195AbfGYUm1 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 25 Jul 2019 16:42:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1564087345; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=wd/8RY8QtDpKhjy989F9knR8y6y/xiYlDP4O6NQdYHE=;
        b=uAZM9BM/qI0q0R0385qtFObwkPKHfE1FfrOEybVSU6F4cSubWFYk4SzfU+gQ3oXlhNKr95
        GvmdIoBuDI3yn+PA1xHVNwsi/O307s4J6uyrgsXjWp8Rhy4uGzPsB2TeheIxAeR4Y5KaIv
        GfwfboMFslZNsooUKr5k23NnF0HUVRo=
Date:   Thu, 25 Jul 2019 16:42:11 -0400
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH] MIPS: Add support for partial kernel mode on Xburst CPUs
To:     Paul Burton <paul.burton@mips.com>
Cc:     Ralf Baechle <ralf@linux-mips.org>,
        James Hogan <jhogan@kernel.org>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, od@zcrc.me
Message-Id: <1564087331.1848.1@crapouillou.net>
In-Reply-To: <20190725165930.yvlvmavcgqocl3nn@pburton-laptop>
References: <20190724234654.16555-1-paul@crapouillou.net>
        <20190725165930.yvlvmavcgqocl3nn@pburton-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



Le jeu. 25 juil. 2019 =E0 12:59, Paul Burton <paul.burton@mips.com> a=20
=E9crit :
> Hi Paul,
>=20
> On Wed, Jul 24, 2019 at 07:46:54PM -0400, Paul Cercueil wrote:
>>  Support partial kernel mode of Xburst CPUs found in Ingenic SoCs.
>>  Partial kernel mode means the userspace applications have access to
>>  the TCSM0 banks of the VPU,
>=20
> So far so (reasonably) good :)
>=20
>>  and can execute cache instructions.
>=20
> Aaaah! Scary!
>=20
> Does this allow *all* cache instructions? If so that's a big security=20
> &
> stability hole - if userland can invalidate kernel data or data from
> other programs then it can create all sorts of chaos.

It looked a bit fishy to me as well, but I couldn't point a finger to
the exact problem. I don't exactly know what it allows and what it
doesn't.

> Also do you know which Ingenic SoCs this is available on? I see it
> documented in the JZ4780 Programming Manual, but Config7 bit 6 is=20
> shown
> as reserved in my copy of the XBurst1 CPU Core Programming Manual.

I have no idea. I assume all SoCs with a VPU. I know the JZ4770 has it.

> I notice the JZ4780 documentation says it allows access "including=20
> TCSM,
> CACHE instructions" which is scary too since it doesn't say that's=20
> *all*
> it allows access to. Though just cache instructions by themselves are
> enough to be game over for any notion of security as mentioned above.
>=20
> What is it you want to do with this? I'm wondering if we could achieve
> your goal is in a safer way.

The plan was to be able to communicate with the firmware running on the
VPU without going through expensive context switches all the time.

I guess we could mmap() the TCSM memories, but we'd need to bypass the
data cache (is there a flag for that?).

> Thanks,
>     Paul

=

