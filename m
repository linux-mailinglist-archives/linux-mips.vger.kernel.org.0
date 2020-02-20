Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4E763165D4E
	for <lists+linux-mips@lfdr.de>; Thu, 20 Feb 2020 13:11:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727233AbgBTMLV (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 20 Feb 2020 07:11:21 -0500
Received: from mail-qk1-f194.google.com ([209.85.222.194]:38291 "EHLO
        mail-qk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726959AbgBTMLU (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 20 Feb 2020 07:11:20 -0500
Received: by mail-qk1-f194.google.com with SMTP id z19so3278183qkj.5;
        Thu, 20 Feb 2020 04:11:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=C7euBNC6YCslx00oQDgJ2Wi3lurW6SPfEjwkYCAhRlw=;
        b=eweRblFRqyt7jwOm6YKC3TjaqUvuhQfAH7PhGMFKVA/Td/QGpBPvW8ZMPlkOtFkvbn
         +7Qpgm4yuMcQZDumHho/XJP/EB07XXRgLguKQQ4kZ9k1b/rkS+P7ktDq36TmW0xEglpE
         jyFvb7vX9+ttZONjjqdI4sE78DKrkmjUFct+huQ5IWiaLLpFiLtjhub2VoZaCnIBmrI1
         TJyDqq4sAvv9ZLN3bj6TkKHIYQHwymKutZXwW2u8I57HkGxWdUSUzGEZLQ7a9hGbvnP4
         UdxQkK+/F/ZSdhcJx2qju8fzQG/fw+SimgvE8Z2swdGTA+5AWaCokdAqk85YAuO3kXOy
         FT0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=C7euBNC6YCslx00oQDgJ2Wi3lurW6SPfEjwkYCAhRlw=;
        b=TEm6LgYlQDtwdFuav1zoMpfWoL6OUmd1AnD0MS2ci0VkoT4e/eMyg8R+zQR4q1H7hQ
         lL9Oo4/kubz7ciJh++LnBRcC/5xJJXSqcOs1gtlxJcXXxh/llIyjrlKchTZ6cAmu+OKR
         UrybAjQ/0eMOR2EXUyPM8Rrr0e8CKN6T/iwCM8kl3QVsCDNESs8yLgsqpwgxm+EIeZqh
         AB3fEy7cXEnxLcj0n7HH9qFfpifBJoA/ME6cCuTBJjhpiB2VwBd95LV2WykJ2LZqYzAA
         fU9SndasQQCOAcNMd/TN+vf4HCY9fjpXGl4OqkkplJNu+/HRIGfxzJKA9GJqjusbWPqL
         RYhQ==
X-Gm-Message-State: APjAAAUR/VbF74CUK9VEJ4Ow9oyeNds4UlPPOy2NS035LB+BJ9Orh+ZR
        WYLQVmERVIoglxNWe7YU5fin2QhQ/sZSMD9xVPM/IYkA
X-Google-Smtp-Source: APXvYqyvj6vdIfP72q8CWowSR3P+jW7KE4wtWxwXmCS5S6Ev8+nigPSSW8X+yLP9khOwKW7xU70p407HL5Dprzsxkhc=
X-Received: by 2002:a37:6752:: with SMTP id b79mr28621584qkc.224.1582200679404;
 Thu, 20 Feb 2020 04:11:19 -0800 (PST)
MIME-Version: 1.0
References: <20200219191730.1277800-1-paulburton@kernel.org>
 <20200219191730.1277800-3-paulburton@kernel.org> <20200220112330.GA3053@alpha.franken.de>
In-Reply-To: <20200220112330.GA3053@alpha.franken.de>
From:   YunQiang Su <wzssyqa@gmail.com>
Date:   Thu, 20 Feb 2020 20:11:08 +0800
Message-ID: <CAKcpw6UDik=K6MdEayDPVaZP+BsqrbKoKAXJaHLERrxDmFF7+A@mail.gmail.com>
Subject: Re: [PATCH 2/2] MAINTAINERS: Set MIPS status to Odd Fixes
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Paul Burton <paulburton@kernel.org>,
        linux-mips <linux-mips@vger.kernel.org>,
        linux-kernel@vger.kernel.org, wayne.sun@cipunited.com,
        chris.wang@neocore.cn, Yunqiang Su <ysu@wavecomp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

CC people from NeoCore and CIP United, and my Wave Computing's mail address=
.

Thomas Bogendoerfer <tsbogend@alpha.franken.de> =E4=BA=8E2020=E5=B9=B42=E6=
=9C=8820=E6=97=A5=E5=91=A8=E5=9B=9B =E4=B8=8B=E5=8D=887:23=E5=86=99=E9=81=
=93=EF=BC=9A
>
> On Wed, Feb 19, 2020 at 11:17:30AM -0800, Paul Burton wrote:
> > My time with MIPS the company has reached its end, and so at best I'll
> > have little time spend on maintaining arch/mips/. Reflect that in
> > MAINTAINERS by changing status to Odd Fixes. Hopefully this might spur
> > the involvement of someone with more time, but even if not it should
> > help serve to avoid unrealistic expectations.
>
> I'd like to jump in as MIPS maintainer. I'm doing Linux MIPS kernel

It is a great news that you are willing to act as maintainer as Linux-MIPS.

> development since ages (started with an Olivetti M700 and kernel version
> 2.x) and right now time for doing the jobs isn't issue:-)
>

I noticed that you are mainly working some old machines.
And recently years, there are some new machines from Ingenic, Loongson, MTK=
 etc.
MIPS Inc also have some MIPSr6 IPs.
I think that you need some of these machines.

In the last years, we see that the single maintainer is not enough as peopl=
e may
quite busy.
Do you think that we need co-maintainers?

> Thomas.
>
> --
> Crap can work. Given enough thrust pigs will fly, but it's not necessaril=
y a
> good idea.                                                [ RFC1925, 2.3 =
]



--=20
YunQiang Su
