Return-Path: <linux-mips+bounces-6798-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D32F9D8EF3
	for <lists+linux-mips@lfdr.de>; Tue, 26 Nov 2024 00:21:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 89501169C09
	for <lists+linux-mips@lfdr.de>; Mon, 25 Nov 2024 23:21:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B917A195B18;
	Mon, 25 Nov 2024 23:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0quqGKh7"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6EB56F06D
	for <linux-mips@vger.kernel.org>; Mon, 25 Nov 2024 23:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732576875; cv=none; b=S3GQFDbQLGjWHtxnmuNb4jMlXvZzR7LU9aoFUJKOqre+GD79X5LlAoIl041Ky2hto6yTfUB+SG49RPcGjJpfw9lkkNvxhH25lf1D2eUf/t5QkRb+oQmehiW4r2RZvsyRGo5yxcDuuTmPEiLOukyFBHgM7WNQxvzsM2vkHsj0mvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732576875; c=relaxed/simple;
	bh=JDO63Vt2zUeewcO0avIggf7SJKJ8NVtQjIKTIhFu9pY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mKVQEwQ7HanPIv+IeV+heZuiTky+Yt4sZdN8rSoUxsqpbYKwAw3qAOgoO9cFwQGnU8EKS2+CCW6bw+7TJW+LoQ7q1bCu4gX79Z0R0thkvKsQ/rKosQ0oxtMM9X7cqB65NEb8hTWAfacB+vHQlIUJIQwGtZrRGDuxGCAPMj4Twpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0quqGKh7; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-46687f60b73so51751cf.0
        for <linux-mips@vger.kernel.org>; Mon, 25 Nov 2024 15:21:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732576871; x=1733181671; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=knlwvECQqDVjMzgrFvwnm3om8IEysGDo7JBjjkbDRnY=;
        b=0quqGKh7xTk6/vDEl6MWKd7vM6FkCoMwjcQpKs2DisuHuDyObMOfrKBcsv1wsOgABp
         onOrKmZ100dlfsU+cGMTxCuSvOsrNlvpkw4D8cKDi0YcOmMW3n7LXdK9Sz7LFqQmjcuL
         VI60Jz4cizyNlc9HGETAOGcwD98bbenStp9B+/qoQ5hGPzooKp76L7CFBQENYBz47L59
         vl2ShFCESBjAvcnC/Ze14g79Gawf5AHpmNPjAUHtE/Pjy/Khzf2XvmeJwfR6p2LyDbHU
         QWfOJLi4i9RkRCAbFk6bfkRl4ZnzMr1FITTiHJE4R+vc7bDRLVp4HJwkjqPLP64kXvx4
         mGbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732576871; x=1733181671;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=knlwvECQqDVjMzgrFvwnm3om8IEysGDo7JBjjkbDRnY=;
        b=s6FSxvyC8MnJwsQ3xpxr4NFMGNzDyc4kyE1dVuCCLIRGc68RRLAej3tQUjW9qZDqV9
         6VbrOjNEo7qn3ecS3V253CY6ig2SylR2JiE4bLZVlDybwC912nBBeZ993kaSiPu3yz2Z
         lTmAGJPJH0AnyqDS85FD1mxjQxCfbCNILpwHzzy0AerQt/zxDvcQvPURcVJUuvsHsVIH
         NKxa0FJRtEcdROXfEHDNcElBdFjJrHvl4g/gb8nmAVnA1A+yNfQ+4ts+6CtVARqzwkUZ
         8jRz/EWyVH0Nd7F+ZeM/UDvx0ZtyEE/8p5eWq2ucX7OaHD4+IgPOKMnoKuQbb9kahm2j
         HH8Q==
X-Forwarded-Encrypted: i=1; AJvYcCW6Z1IAqX+1o6NYkJKn6TCOdiuqy2pnQV/5T0U5pli9E3iRUOh+lKhladNhy4oXxNMs0FPKDpjVfa+3@vger.kernel.org
X-Gm-Message-State: AOJu0YxNqHw779ztoAWIw48FKI5ntEHQzxE+TOB3bmWqENo1QyT9HEb7
	O6B049f7DTwRa1Ni1LQ9fwcV4lui/zPlJBQcfmPM702h9TRrJDsQPI661KDsXdiYovWtH2h38QY
	5X22CsjDXOexWyG6qqlRm2RUTEH5RBNqO9MkoqGzTKekdYMVDd0mb
X-Gm-Gg: ASbGncvdJbQhDRl+X3O6ymn+32BoJ7lFSh6pu6TjJKiLGTitTo0C7+8vzNsjcgkWBXN
	GBe62p9mL64snW1mP0K0fcY95vc6RB6ld2iJHdjFDTfkbynFcAZ2ZWnqlwpXRGw==
X-Google-Smtp-Source: AGHT+IHmSxd94r8C7grBqTd45WeWFajX9adxDqBqnVOa3dcxOvJmZFZJ3CQZajOpLqwQSbgtFelKCyDRCSSUaXjoOjI=
X-Received: by 2002:a05:622a:5104:b0:45f:89c:e55 with SMTP id
 d75a77b69052e-466a4849250mr1267711cf.8.1732576871409; Mon, 25 Nov 2024
 15:21:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cd252b78-077b-441e-8371-106d71258ff3@alliedtelesis.co.nz>
 <84d9200e-25b4-4bd8-8eb5-c954ff92ac08@alliedtelesis.co.nz>
 <CAF1bQ=RU2dZU3ENy3MLM4FvrZNaZprgPAM5vbRtUVDixJNQ_zg@mail.gmail.com>
 <c6719149-8531-4174-824e-a3caf4bc6d0e@alliedtelesis.co.nz>
 <CAF1bQ=QEL3XZYsNL-f7jmbDOVWHSVfhZSYx0iddct3nz8_Yf1A@mail.gmail.com> <5eeb60df-e966-47ae-a381-bc7496d4fa8f@alliedtelesis.co.nz>
In-Reply-To: <5eeb60df-e966-47ae-a381-bc7496d4fa8f@alliedtelesis.co.nz>
From: Rong Xu <xur@google.com>
Date: Mon, 25 Nov 2024 15:20:59 -0800
Message-ID: <CAF1bQ=TK_ip7WPXn910NGDW0PZcNFd9a_jbY=4h=6FHpH7C4fg@mail.gmail.com>
Subject: Re: RTL9300 (mips) fails to boot with commit d4a7f2510ff4
 ("vmlinux.lds.h: Adjust symbol ordering in text output section")
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: "Han Yao Yeo (atg)" <hanyao.yeo@alliedtelesis.com.sg>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Masahiro Gotoh <gotoh@allied-telesis.co.jp>, 
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I sent out a patch using the __HEAD method. Compared to the
"*head.o(.text)", this only places
__kernel_entry at the beginning of the text section, and leaves others
reordered by the linker script.
I think it should work. Chris: Could you test it?

Thanks,

-Rong


On Mon, Nov 25, 2024 at 11:26=E2=80=AFAM Chris Packham
<chris.packham@alliedtelesis.co.nz> wrote:
>
>
> On 26/11/24 07:48, Rong Xu wrote:
> > Thanks for confirming this! It looks like we do need to put all
> > symbols from head.o before any other symbols.
> > To be clear, the patch I mentioned was not trying to do that -- it
> > just makes sure the _stext is in the right places.
> Looking at other architectures it may just be a matter of adding __HEAD
> to an appropriate place in arch/mips/kernel/head.S and HEAD_TEXT_SECTION
> to arch/mips/kernel/vmlinux.lds.S. It might even be possible to drop
> mips from scripts/head-object-list.txt.
>
> > I'll draft a patch for this.
>
> I can give any patch a quick test on my setup.
>
> >
> > On Sun, Nov 24, 2024 at 12:40=E2=80=AFPM Chris Packham
> > <Chris.Packham@alliedtelesis.co.nz> wrote:
> >> Hi Rong,
> >>
> >> On 22/11/24 18:02, Rong Xu wrote:
> >>> Does the following patch fix your issue?
> >>> https://lore.kernel.org/lkml/CAK7LNAQSpM2hh2=3DWgribb92nHF5_peRb+gxdO=
1Bt1MkeL8N+hw@mail.gmail.com/t/
> >>>
> >>> Masahiro Yamada already applied the patch to kbuild-tree.
> >>>
> >>> I also proposed a similar fix as yours. But we believe the above patc=
h
> >>> should also work (and probably is better).
> >>>
> >>> Please try and let us know.
> >> Looks like linux-next already has that patch and no it doesn't fix my
> >> issue. For the record here's the start of my System.map
> >>
> >> $ head System.map
> >> ffffffff80100000 T __split_text_end
> >> ffffffff80100000 T __split_text_start
> >> ffffffff80100000 T __unlikely_text_start
> >> ffffffff80100000 T _stext
> >> ffffffff80100000 T _text
> >> ffffffff80100000 t run_init_process
> >> ffffffff80100138 t try_to_run_init_process
> >> ffffffff8010018c t put_page
> >> ffffffff801001d0 t nr_blocks.isra.0
> >> ffffffff80100208 T ack_bad_irq
> >>
> >> It does look like whatever is supposed to put head.o first isn't kicki=
ng
> >> in for me.
> >>
> >>> Thanks!
> >>>
> >>> -Rong
> >>>
> >>> On Thu, Nov 21, 2024 at 6:29=E2=80=AFPM Chris Packham
> >>> <chris.packham@alliedtelesis.co.nz> wrote:
> >>>> On 22/11/24 14:58, Chris Packham wrote:
> >>>>> Hi Rong,
> >>>>>
> >>>>> I was just trying some of my in-flight changes against linux-next a=
nd
> >>>>> found that my RTL9300* based board no longer boots (nothing on the
> >>>>> serial console after U-Boot hands off to the kernel).
> >>>>>
> >>>>> A bisect between Linus's tree and linux-next/master points to commi=
t
> >>>>> d4a7f2510ff4 ("vmlinux.lds.h: Adjust symbol ordering in text output
> >>>>> section"). A build on d4a7f2510ff4^ boots successfully. That series=
 is
> >>>>> well beyond my area of knowledge, there may be something that the M=
IPS
> >>>>> SoCs are doing (or not doing) that is being affected by the section=
s
> >>>>> moving.
> >>>> Based on the sparc change that accompanied this commit the following
> >>>> does seem to restore working order for me:
> >>>>
> >>>> diff --git a/arch/mips/kernel/vmlinux.lds.S b/arch/mips/kernel/vmlin=
ux.lds.S
> >>>> index d575f945d422..e90b0f68290c 100644
> >>>> --- a/arch/mips/kernel/vmlinux.lds.S
> >>>> +++ b/arch/mips/kernel/vmlinux.lds.S
> >>>> @@ -62,6 +62,8 @@ SECTIONS
> >>>>            _text =3D .;      /* Text and read-only data */
> >>>>            _stext =3D .;
> >>>>            .text : {
> >>>> +               /* Match text section symbols in head.S first */
> >>>> +               *head.o(.text)
> >>>>                    TEXT_TEXT
> >>>>                    SCHED_TEXT
> >>>>                    LOCK_TEXT
> >>>>
> >>>> No idea if that's appropriate
> >>>>

