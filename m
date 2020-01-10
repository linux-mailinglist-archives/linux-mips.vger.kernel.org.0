Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1051E13783D
	for <lists+linux-mips@lfdr.de>; Fri, 10 Jan 2020 22:02:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727095AbgAJVCn (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 10 Jan 2020 16:02:43 -0500
Received: from mail-pj1-f65.google.com ([209.85.216.65]:50499 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726836AbgAJVCm (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 10 Jan 2020 16:02:42 -0500
Received: by mail-pj1-f65.google.com with SMTP id r67so1451785pjb.0
        for <linux-mips@vger.kernel.org>; Fri, 10 Jan 2020 13:02:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amacapital-net.20150623.gappssmtp.com; s=20150623;
        h=content-transfer-encoding:from:mime-version:subject:date:message-id
         :references:cc:in-reply-to:to;
        bh=jfaknLo6dB7P4TvTZQmRLqfYR5CIiTdIXE9lXNwSsYU=;
        b=diDEq6At2DzWHKg+ysDMV1tW4o5AwiDyePd9VJ3pD+hsHR8cFV1SQyA59/kk5j+xgK
         1TsiRsOtgi+SYWZwPpnwbgbMpOpTBFOKIhld9J4VOn7z8Dvcdp0cMv0hT4o/pvqNYmDt
         o4KzRsf6U3mSxqr+NmFY1NZJnZtU2+mfib5RYv0qXqMmAsYYbLhAWvkbyVPGWDeCmn8R
         7u0u0fxOpKaCifg3xTVtRj86GX6J5Y91BN2RZHE6YugaM1ohryvVWffdKXI4ka0Un7Ss
         RKeBRruVTUOlB+gGzitr3sXC8NAV3FbdCW7mfIrVpeM7E4B6rp/ZzqXS+QVwjmw5GjMb
         dA7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:content-transfer-encoding:from:mime-version
         :subject:date:message-id:references:cc:in-reply-to:to;
        bh=jfaknLo6dB7P4TvTZQmRLqfYR5CIiTdIXE9lXNwSsYU=;
        b=ldP5dGWhAtCM0BLVl5AZMSNVDEU55NIWGK0z8BhYkt3ModDbwXk82VCIaJFKvZo0X2
         Wsaztlnpb1sBhJIrC7v9SAgHyABJNwa8u/7XoE07FxLx8DFC9GuwHUoLq+YozE3dFZLf
         SirHu7j00izzCHxCPuMpxJYLH0n3pS1V1PEz/nFGZ1BOEUOChjczPK4dIGJo6qo+pv19
         kKabStIig+4zPzqpPBze1XfOTXEuiAIDX341d87/Lp9Zsqn2Vz6YhL5U+uQ+oAupqvwB
         SBA8S9tVpr2xKwgmnRe3WN8Lu7F4SLCdRBn4db6eiuRrUOJgi0cUVPl2JJlBv5RqprPk
         oRcA==
X-Gm-Message-State: APjAAAU94Puo0+qaZss4hzwfpfrYPuqdgbQLD77ErEU9cRmUjr0Q3Tzz
        Ny/4H+krG1U/85BDsNAYlGaDxw==
X-Google-Smtp-Source: APXvYqwcK5EuXgyJPF3Ld4Ugh4h8SPw00JyrmxOuZ/D2wMI6lxIb8hITf4wySqQXcJ4mHz7I9DvGuA==
X-Received: by 2002:a17:902:ff12:: with SMTP id f18mr545089plj.256.1578690162146;
        Fri, 10 Jan 2020 13:02:42 -0800 (PST)
Received: from [10.197.30.113] ([139.104.2.240])
        by smtp.gmail.com with ESMTPSA id d22sm3725278pgg.52.2020.01.10.13.02.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jan 2020 13:02:41 -0800 (PST)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From:   Andy Lutomirski <luto@amacapital.net>
Mime-Version: 1.0 (1.0)
Subject: Re: [RFC PATCH v2 01/10] lib: vdso: ensure all arches have 32bit fallback
Date:   Fri, 10 Jan 2020 11:02:38 -1000
Message-Id: <53785EAC-A04C-4B02-9698-D11D75BE2C4D@amacapital.net>
References: <87sgknrpxy.fsf@nanos.tec.linutronix.de>
Cc:     Andy Lutomirski <luto@kernel.org>,
        Christophe Leroy <christophe.leroy@c-s.fr>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Arnd Bergmann <arnd@arndb.de>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        Andrew Lutomirski <luto@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        X86 ML <x86@kernel.org>
In-Reply-To: <87sgknrpxy.fsf@nanos.tec.linutronix.de>
To:     Thomas Gleixner <tglx@linutronix.de>
X-Mailer: iPhone Mail (17C54)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



> On Jan 10, 2020, at 10:56 AM, Thomas Gleixner <tglx@linutronix.de> wrote:
>=20
> =EF=BB=BFAndy Lutomirski <luto@kernel.org> writes:
>=20
>>> On Mon, Dec 23, 2019 at 6:31 AM Christophe Leroy
>>> <christophe.leroy@c-s.fr> wrote:
>>>=20
>>> In order to simplify next step which moves fallback call at arch
>>> level, ensure all arches have a 32bit fallback instead of handling
>>> the lack of 32bit fallback in the common code based
>>> on VDSO_HAS_32BIT_FALLBACK
>>=20
>> I don't like this.  You've implemented what appear to be nonsensical
>> fallbacks (the 32-bit fallback for a 64-bit vDSO build?  There's no
>> such thing).
>>=20
>> How exactly does this simplify patch 2?
>=20
> There is a patchset from Vincenzo which fell through the cracks which
> addresses the VDS_HAS_32BIT_FALLBACK issue properly. I'm about to pick
> it up. See:
>=20
> https://lore.kernel.org/lkml/20190830135902.20861-1-vincenzo.frascino@arm.=
com/
>=20

Thanks.  I had been wondering why the conditionals were still there, since I=
 remember seeing these patches.

> Thanks,
>=20
>        tglx
