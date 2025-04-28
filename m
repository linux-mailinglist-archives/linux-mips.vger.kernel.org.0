Return-Path: <linux-mips+bounces-8844-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B710FA9EDBE
	for <lists+linux-mips@lfdr.de>; Mon, 28 Apr 2025 12:20:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D0A6117A28E
	for <lists+linux-mips@lfdr.de>; Mon, 28 Apr 2025 10:20:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F5DC25F79E;
	Mon, 28 Apr 2025 10:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="T7w5VshK"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D4E01AC44D
	for <linux-mips@vger.kernel.org>; Mon, 28 Apr 2025 10:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745835646; cv=none; b=bv+YvjQHsjgpRx8Ge9eHA+mSSCmT6hxAYfAV3iNuDX132YI1PXRunwGhs7q6XuX+C40bTFjzFpd+pDfEqLyAhh5eWoNUUBFLC9X349oZRA5+iBA/DTrzDspHiHE11pGLv1BlMN3iOmM/9pjjYXQ1rGxnpgV/9mK+v97B3BmdrXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745835646; c=relaxed/simple;
	bh=6y3GJQkg3WO6HZVx8AbKk9AKup+Iuho9Ws+zs6rdbvQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sZPrO/cDmiQO2Nf7o5kJR/eTgdbfmsFeAaGXa2509O8xpZLsNCE8D00VR8D+fD4JMlAV0oYJDJgoo5GeFmZ6NRxkEcwK6Zbs5OdbyoCk0fGUGxyq/4wZn54gKXTi7xrl7xy8O3PAB0lNf7FQfQEB0IIropv5MyB9Fm8ULXmJSJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=T7w5VshK; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-30bfca745c7so41431751fa.0
        for <linux-mips@vger.kernel.org>; Mon, 28 Apr 2025 03:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745835642; x=1746440442; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4sK5PIgmZ1Mpik4wrEId0UQH2tIcaV83eQP9njHyGcE=;
        b=T7w5VshK4RzwpVIjbJ27iY1o0pnOA5jHWAH4IPn7YkGWOpLbmziT+KSN+IbaHX3PlQ
         inEuHLyDtbIVIxKUQ8HxNt5CNP8Lk57OP+T0DsjPgEr2I7fydmR0PRR5d0tSc/2TnFHl
         FECSB8JX8BNm3X/QvtdpZV+LSwtpHW9bx5tdfUdanUg+iXqqeZEKAsMjrfY92e7JC83z
         5nBGIMg4tI3Ffb2fwnYTmADWN8Gyrm/D6XQaXGxXw/YFm4Vpa8SbhZ3I58iDhwy5MfKB
         dzy5mUGZzBdIZ8h1S2JrKjYsQUuuwtYJ8zP1Y/er4yRYQ7/aoJAWH8fMuO9aZ0TW4n0Y
         h7NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745835642; x=1746440442;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4sK5PIgmZ1Mpik4wrEId0UQH2tIcaV83eQP9njHyGcE=;
        b=eyVPBkRRVL4ga86gu+BX6IvTT7SclYt8Rhhi6QYxmEMvI/IevOqSIvlS9BixLVOpjT
         Sgq6Ina6zBjcyyx/g+vXBI+mRiGakSqSAghDPjvt+EjSnBtHUYWmEKBXpRN0RfQi0mEk
         u+kbHaaMWddJo8AwhTYex0Vc5UUSvKAaRq/mEB5U+YawhqI5BdxQcViKXD9lJUIZzmgp
         Xbbeey7mhwEC/2Lw0eUCIc7uueVs2vmUHyc/BIWll+P76TuQbosXyxMSXQhVC/qoKDnx
         3oDJsB/bpWdQjdZw91CRsI+l2tg4i7BLqkIPIh9Ot3rYQKrvcgtRVvP8c4jS0RQbNmKb
         GNqA==
X-Forwarded-Encrypted: i=1; AJvYcCXRZB1tkmFK8pbaHMnO0iJuAvLJ3CkQvDNzZY+7xCSu79fpMWncPj9fAk55s0wRt7xDONMoe5IURwti@vger.kernel.org
X-Gm-Message-State: AOJu0YwXxz4QWsefyrumSmRlwjOhfDYy7DPmk0apieywG3fwaF0l3OzB
	4HNp+bIRjp7P+YUp5T2FyZnxq2jlkI7ihDgxEf3AHjNDuotj133J9ORKMun+zH5knIVITuOVzX2
	icw2ghwarQS2tI+FDdOZhsxzDYWvhYHyNgfhQ/Q==
X-Gm-Gg: ASbGncuJuXFOrY4iOWvazm3Mv/Mlprbxcf19AMVUyxSlWNR444RyJwPlQcXWvoJLNBq
	rxiaHjRGDZKdBMu5N8jJcMuCxU5mkr+4L/axeZTEkXcbIv0TBE8yMYXeT4rl4zT+PoUGOOpf58z
	iAD836QJgmOu2NqFD1Izs5ts9vV9c/aHVhKQto0dI6fFBypnEjHDgUGtE=
X-Google-Smtp-Source: AGHT+IFxSYOh5ACpZ7FmM+wW1wuiew0INq7bJoRMxvSARAwFZSyWC46QwXnSDBXQD+ntiOOavQU0/IWYQ9ZRT/nnGII=
X-Received: by 2002:a2e:be1b:0:b0:30b:b9e4:13cd with SMTP id
 38308e7fff4ca-31905b6a701mr38067671fa.2.1745835642321; Mon, 28 Apr 2025
 03:20:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250403161143.361461-1-marco.crivellari@suse.com>
 <20250403161143.361461-3-marco.crivellari@suse.com> <CAAhV-H4dQ8hRfBm2JWmgMzYH5tuy4ph6hyOSXQBLOvtCQ+K9dQ@mail.gmail.com>
 <alpine.DEB.2.21.2504280426010.31828@angie.orcam.me.uk> <CAAhV-H4WTrYecBj0wev8AUi_of_qAnvHCk4heTU5P_3pMZv4fA@mail.gmail.com>
In-Reply-To: <CAAhV-H4WTrYecBj0wev8AUi_of_qAnvHCk4heTU5P_3pMZv4fA@mail.gmail.com>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Mon, 28 Apr 2025 12:20:31 +0200
X-Gm-Features: ATxdqUFj9iVuicJaDf0xifwnqp09kIdWJ30vAMX4UW7_WZ6gAcWBeXZTcI6VmEE
Message-ID: <CAAofZF4J6H5jgqKu=KUowBrwfHJyGEzL5ThC_DOs-XPdgm497A@mail.gmail.com>
Subject: Re: [PATCH v7 2/2] MIPS: Move r4k_wait() to .cpuidle.text section
To: Huacai Chen <chenhuacai@kernel.org>
Cc: "Maciej W. Rozycki" <macro@orcam.me.uk>, linux-mips@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Frederic Weisbecker <frederic@kernel.org>, Anna-Maria Behnsen <anna-maria@linutronix.de>, 
	Thomas Gleixner <tglx@linutronix.de>, Peter Zijlstra <peterz@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

If it sounds good also to Maciej, I will submit the new version with the
space before "ax" (and of course, the ".previous").

Thank you.

On Mon, Apr 28, 2025 at 6:11=E2=80=AFAM Huacai Chen <chenhuacai@kernel.org>=
 wrote:
>
> On Mon, Apr 28, 2025 at 11:28=E2=80=AFAM Maciej W. Rozycki <macro@orcam.m=
e.uk> wrote:
> >
> > On Mon, 28 Apr 2025, Huacai Chen wrote:
> >
> > > > diff --git a/arch/mips/kernel/genex.S b/arch/mips/kernel/genex.S
> > > > index 46d975d00298..2cf312d9a3b0 100644
> > > > --- a/arch/mips/kernel/genex.S
> > > > +++ b/arch/mips/kernel/genex.S
> > > > @@ -104,6 +104,7 @@ handle_vcei:
> > > >
> > > >         __FINIT
> > > >
> > > > +       .section .cpuidle.text,"ax"
> > > If you submit a new version, adding a space before "ax" will be a lit=
tle better.
> >
> >  We use no space across our port though, which is why I haven't request=
ed
> > that before.
>
> Current status:
> arch/mips/include/asm/ftrace.h:         ".section .fixup, \"ax\"\n"
>          \
> arch/mips/include/asm/ftrace.h:         ".section .fixup, \"ax\"\n"     \
> arch/mips/include/asm/futex.h:          "       .section .fixup,\"ax\"
>                  \n"     \
> arch/mips/include/asm/futex.h:          "       .section .fixup,\"ax\"
>                  \n"     \
> arch/mips/include/asm/futex.h:          "       .section .fixup,\"ax\"
>                          \n"
> arch/mips/include/asm/futex.h:          "       .section .fixup,\"ax\"
>                          \n"
> arch/mips/include/asm/paccess.h:        ".section\t.fixup,\"ax\"\n"
>                                  \
> arch/mips/include/asm/paccess.h:        ".section\t.fixup,\"ax\"\n"
>                                  \
>
> So there are a few files which have spaces.
>
> Huacai
>
>
> >
> >   Maciej



--=20

Marco Crivellari

L3 Support Engineer, Technology & Product




marco.crivellari@suse.com

