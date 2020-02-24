Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4D8FA16A028
	for <lists+linux-mips@lfdr.de>; Mon, 24 Feb 2020 09:38:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727115AbgBXIiN convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Mon, 24 Feb 2020 03:38:13 -0500
Received: from mail-yb1-f193.google.com ([209.85.219.193]:33989 "EHLO
        mail-yb1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726216AbgBXIiN (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 24 Feb 2020 03:38:13 -0500
Received: by mail-yb1-f193.google.com with SMTP id u47so4304323ybi.1;
        Mon, 24 Feb 2020 00:38:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=GYdftOcIqrGMbrAGknl8JJ43sFoBTr6C6LGG7tEcZyE=;
        b=tFy+lyQBqWBtCuzuGcacCFqtsI/2lV9V+uTasqPEcqpIoDUBOZbJaeCOe/rHCV2zhU
         d0rlJ0O7djij5FYo+e6mPMeN0dm4TcgzwIPxotO5NNb90JAEuURWWYjgr7itRm5DfSQB
         m5dbKXZzI5BJ+NOuuCBw3yQm//ou8rm5FJPBGWQZSJI4KQILbSrUOvMjjNpXrgGiTipO
         vNXg9cN/0CIkEuQMVakC1tLn7Wb43bwlO8D5Rdroep5fYSPNX1No4e4rRTC04tLXd8DE
         M+3VfAiEY0rJj9pwKfHj7OdLA4p1wPbmE6hPV/ikGzWPongvmaKggm3/aESmmJ8CetOD
         GqFg==
X-Gm-Message-State: APjAAAVVqH86DrEXvKLOZS4s4P/SVH2qaJY8FFJ33D2DLjwQOlRz1GZF
        BOGvY4Duj3320GYV40GOfWjiQV055d+LyDz5irzdB28HvkU=
X-Google-Smtp-Source: APXvYqyTABrSBWAa0rXXjErNZDgSuBu8N3xv065QCGBydaKCKm9fR4HeekY/4vOml+q8tjIeE5MafCmHG9SbROnHgPc=
X-Received: by 2002:a25:86c9:: with SMTP id y9mr9650730ybm.376.1582533490824;
 Mon, 24 Feb 2020 00:38:10 -0800 (PST)
MIME-Version: 1.0
References: <20200219191730.1277800-1-paulburton@kernel.org>
 <20200219191730.1277800-3-paulburton@kernel.org> <1582387719.3.1@crapouillou.net>
In-Reply-To: <1582387719.3.1@crapouillou.net>
From:   =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date:   Mon, 24 Feb 2020 09:37:59 +0100
Message-ID: <CAAdtpL5JgO0Wtned6KKKKYyM7ZWQ6Y=9X=EQRWYYXgOZ7nbWBg@mail.gmail.com>
Subject: Re: [PATCH 2/2] MAINTAINERS: Set MIPS status to Odd Fixes
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     Paul Burton <paulburton@kernel.org>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, Feb 22, 2020 at 5:08 PM Paul Cercueil <paul@crapouillou.net> wrote:
>
> Hi,
>
> So I think Thomas is the best candidate to be maintainer, since he has
> both experience and free time ;)
>
> I'm sort-of the maintainer for the Ingenic platform and drivers, if
> Jiaxun wants to do the same for Loongson hardware, that would make
> Thomas' job easier. Having three co-maintainers with equal rights would
> be a total mess.

You might want to add yourself a R: entry in MAINTAINERS, to be listed
as designated reviewer on the Ingenic patches.
(Similarly for Jiaxun with Loongson).

>
> -Paul
>
>
> Le mer., févr. 19, 2020 at 11:17, Paul Burton <paulburton@kernel.org>
> a écrit :
> > My time with MIPS the company has reached its end, and so at best I'll
> > have little time spend on maintaining arch/mips/. Reflect that in
> > MAINTAINERS by changing status to Odd Fixes. Hopefully this might spur
> > the involvement of someone with more time, but even if not it should
> > help serve to avoid unrealistic expectations.
> >
> > Signed-off-by: Paul Burton <paulburton@kernel.org>
> > ---
> >  MAINTAINERS | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index afa228ade18e..67f05f6dbf77 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -11120,7 +11120,7 @@ W:    http://www.linux-mips.org/
> >  T:   git git://git.linux-mips.org/pub/scm/ralf/linux.git
> >  T:   git git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git
> >  Q:   http://patchwork.linux-mips.org/project/linux-mips/list/
> > -S:   Supported
> > +S:   Odd Fixes
> >  F:   Documentation/devicetree/bindings/mips/
> >  F:   Documentation/mips/
> >  F:   arch/mips/
>
>
