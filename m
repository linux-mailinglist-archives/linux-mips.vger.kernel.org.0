Return-Path: <linux-mips+bounces-6735-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A015E9C6963
	for <lists+linux-mips@lfdr.de>; Wed, 13 Nov 2024 07:39:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2844F1F21BD8
	for <lists+linux-mips@lfdr.de>; Wed, 13 Nov 2024 06:39:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45719176AAE;
	Wed, 13 Nov 2024 06:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HA23/gpY"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com [209.85.166.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DAE014F9FD
	for <linux-mips@vger.kernel.org>; Wed, 13 Nov 2024 06:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731479971; cv=none; b=mAPKN/X9SynwKphnXhDZwPblsF3QjTuK9PJX4Rr5e9dyjoYIjp/0lLzDk5qYFQk4TM5hxR5YrlJZmsfivS2lW70jHon0cmtaXU19Bmrs9ARKIKNtzkUGw+YMZjLsYb5wUnfVU6Q+3aXQ/k/faGMelvvCDsK5sqeQryRhVmJ+ruY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731479971; c=relaxed/simple;
	bh=NqChDgcCmIDXUJypP2lQmENu4sUPXQC9JR6ckklf3Qo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eqXi0MAt4dD23QNiCFhKgZqh8BqKuvu768dIPJ98yGs/8Ytnkvph8nXiu3W2bU5JxfMiPDZz2BlyaXzSk7NJ6MNdW5p6tQFbq4L+JzGn5nhwoEXgCi4rpEQwKENGxH5y3MBWJVoxKyqUvR3jnNxeMUEB0KUD/Rqf/ZFSKg8IOKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HA23/gpY; arc=none smtp.client-ip=209.85.166.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-il1-f173.google.com with SMTP id e9e14a558f8ab-3a3b28ac9a1so68325ab.1
        for <linux-mips@vger.kernel.org>; Tue, 12 Nov 2024 22:39:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731479969; x=1732084769; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N7qspT+wf95zPOZ7q76BRXy/AchuwYaS09O1DcJSY1M=;
        b=HA23/gpYkg1jkeCc/3ccxn9XAljXjtUPPd6GPadqAosKBw9MVSAumC6qvQGN58+0op
         hXo1wEInU9MET+NruB3rgLUY+wQ6rchcUJW90tbKl02dZ9Dn27fG3yHT3Wd8/C5lksYk
         eo1dLrzkIRYVMSA/pj4EBpEjChpN9yY5DRiW3sqo+IZQhGIBX7zuPpoTXXeLQsK8Qi9K
         k3SkmyFm+I+CTO5lEaMpgGiqAkkDqCpefvwqUxCrp/lkGCZFtkLMFNvtNWxxY43eQWqz
         pQCYzoCySKbmct5lWoJOv6dxPVo+6w9bHuD79CxlnfdADstHA3Bjbl1RuHSC20tAmMxw
         GBWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731479969; x=1732084769;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N7qspT+wf95zPOZ7q76BRXy/AchuwYaS09O1DcJSY1M=;
        b=Qgok8HTdeVda7ya/j70v/um+AaxcjC0KuE1aIkQjUQ13iy9C1nuqKXAmgD0hxlIKtY
         kddmSmG02OOpJ0Gl0QaJ3X+/POkClbNNUy1WEpom7avnD0cEfF6/04OygNkMx7V5FyHg
         u3BdhALz8PUqc11uRVhkTgu6Vb261f33zlF5HCoQImoa86KSeT4dQjiXQ6oFc6bqwSmv
         XSlwnAPWzvzamV56+nC0zpSK79E1DuQIPw98MEjvmcE9W/78B/UHV0CZyx97pPn+CjJa
         uG0Tjw4HZnaXEepOzUHA6DYD06vVn29dpMU0BCAQULwvW7fZ60hG5ZKMo7iZ0EA6SxjS
         yiFA==
X-Forwarded-Encrypted: i=1; AJvYcCUQHvIGAtaoqlhlXBoNlQqZsBQ2pEnxXb0ltsyajZWqOlsT0ulzmGJctSZYrUoi4ZaW0aok4tZwjpEy@vger.kernel.org
X-Gm-Message-State: AOJu0YztbKKnP1mI2Us6iTsfupyhYvNyuDOIcXTAkJPF5A2y5012Noig
	Sq3ernfBWULZvrywNzZQWXv6QLre4WzgqCoYT03iQiOhaRecgBWLzKdcy2Ak/Q9IipXBkyrm6p7
	hs333s/TN9ZiYXaZGBjhhzqh5EEcneb7hA3gS
X-Gm-Gg: ASbGncusVAYID057FRD+XdkYkdxBzQibv/hszHXhsHAQVT1nm0R8/lbYwGyaP37rbqb
	9CPVRhA5EBWiYx2gaRXDiMgMj1MNa8dcW/Zr9QAsUfPPenbUYEJDnye325fU=
X-Google-Smtp-Source: AGHT+IHxOcHQ0bHLrNYW/pE/y8XrICeeyjXfQpw6RicFnmzFQy/ilxEuufaKh593DETyjFFwGCVtEPyoRVPxaJ4BtDA=
X-Received: by 2002:a05:6e02:1d1a:b0:3a6:ae08:f593 with SMTP id
 e9e14a558f8ab-3a7171c40e4mr1683455ab.3.1731479968459; Tue, 12 Nov 2024
 22:39:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241112200827.2594291-1-xur@google.com> <CAK7LNAQ_Si3feoaHujiWF0nHCu_kqb=3rrQf=OX1CoTDdZtjVA@mail.gmail.com>
In-Reply-To: <CAK7LNAQ_Si3feoaHujiWF0nHCu_kqb=3rrQf=OX1CoTDdZtjVA@mail.gmail.com>
From: Rong Xu <xur@google.com>
Date: Tue, 12 Nov 2024 22:39:16 -0800
Message-ID: <CAF1bQ=ShRDhTyEEZPR6V04gwtfcbSaNbbJipN63rUvhU+j+Wig@mail.gmail.com>
Subject: Re: [PATCH] vmlinux.lds.S: Explicitly set _stext for mips
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Nick Desaulniers <ndesaulniers@google.com>, 
	Klara Modin <klarasmodin@gmail.com>, linux-mips@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Masahiro,

Thank you so much for the suggestions. I'll send the updated patch shortly.

Best,

-Rong

On Tue, Nov 12, 2024 at 5:40=E2=80=AFPM Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:
>
> Please use "MIPS:" for the subject prefix
> because this patch only affects MIPS.
>
>
>
> On Wed, Nov 13, 2024 at 5:08=E2=80=AFAM Rong Xu <xur@google.com> wrote:
> >
> > With commit 622240ea8d71 ("vmlinux.lds.h: Adjust symbol ordering in
> > text output section"), symobls in sections .text.unlikely will be
> > placed before symbols in .text. This can lead to the misplacement
> > of _stext, which resides in the .text section, and result in a boot
> > hang.
> >
> > Explicitly set _stext to the beginning of text output section.
>
>
> I will insert this patch before 622240ea8d71 to avoid breakage.
>
> Please rephrase the commit description without referring to
> 622240ea8d71.
>
>
> For example, you can say as follows:
>
> ------------->-----------
> MIPS: move _stext definition to vmlinux.lds.S
>
> The _stext symbol is intended to reference the start of the text section.
> However, it currently relies on a fragile link order because the existing
> EXPORT(_stext) resides within the .text section, which is not guaranteed
> to be placed first.
>
> Move the _stext definition to the linker script to enforce an explicit
> ordering.
> ------------->-----------
>
>
> Please feel free to update the description, but this must be
> fixed regardless of your patch set.
>
> Even without your patch set, the .text section
> comes after .text.hot. So, it is broken.
>
> #define TEXT_TEXT                                                       \
>                 ALIGN_FUNCTION();                                       \
>                 *(.text.hot .text.hot.*)                                \
>                 *(TEXT_MAIN .text.fixup)                                \
>
>
>
>
> > Signed-off-by: Rong Xu <xur@google.com>
> > Reported-by: Klara Modin <klarasmodin@gmail.com>
> > Tested-by: Klara Modin <klarasmodin@gmail.com>
> > ---
> >  arch/mips/kernel/vmlinux.lds.S | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/arch/mips/kernel/vmlinux.lds.S b/arch/mips/kernel/vmlinux.=
lds.S
> > index 9ff55cb80a64..62c3db869a18 100644
> > --- a/arch/mips/kernel/vmlinux.lds.S
> > +++ b/arch/mips/kernel/vmlinux.lds.S
> > @@ -61,6 +61,11 @@ SECTIONS
> >         /* read-only */
> >         _text =3D .;      /* Text and read-only data */
> >         .text : {
> > +               /* Explicitly set _stext to the beginning of text outpu=
t
> > +                  section. _stext is in text section and might be matc=
hed
> > +                  after symbols in sections with a specific prefix (li=
ke
> > +                  .text.unlikely).  */
>
> I do not think this comment is necessary
> because this is a common pattern.
>
> The typical linker script example is documented.
> https://github.com/torvalds/linux/blob/v6.11-rc7/include/asm-generic/vmli=
nux.lds.h#L21
>
>
>
>
> Many architectures define _stext in vmlinux.lds.S
> without such verbose comments.
>
> $ find . -name vmlinux.lds.S | xargs grep "_stext =3D"
> ./arch/mips/kernel/vmlinux.lds.S: _stext =3D . ;
> ./arch/openrisc/kernel/vmlinux.lds.S:          _stext =3D .;
> ./arch/xtensa/kernel/vmlinux.lds.S:  _stext =3D .;
> ./arch/s390/kernel/vmlinux.lds.S: _stext =3D .; /* Start of text section =
*/
> ./arch/nios2/kernel/vmlinux.lds.S: _stext =3D .;
> ./arch/loongarch/kernel/vmlinux.lds.S: _stext =3D .;
> ./arch/x86/kernel/vmlinux.lds.S: _stext =3D .;
> ./arch/riscv/kernel/vmlinux.lds.S: _stext =3D .;
> ./arch/parisc/kernel/vmlinux.lds.S: _stext =3D .;
> ./arch/csky/kernel/vmlinux.lds.S: _stext =3D .;
> ./arch/arc/kernel/vmlinux.lds.S: _stext =3D .;
> ./arch/arm64/kernel/vmlinux.lds.S: _stext =3D .; /* Text and read-only da=
ta */
> ./arch/arm/kernel/vmlinux.lds.S: _stext =3D .; /* Text and read-only data=
 */
> ./arch/hexagon/kernel/vmlinux.lds.S: _stext =3D .;
> ./arch/powerpc/kernel/vmlinux.lds.S: _stext =3D .;
> ./arch/microblaze/kernel/vmlinux.lds.S: _stext =3D . ;
>
>
>
>
> > +               _stext =3D .;
>
> _etext is defined outside the .text {} block.
>
> If you want "_stext" and "_etext" to look symmetrical,
> perhaps you might want to change like this?
>
>
> diff --git a/arch/mips/kernel/vmlinux.lds.S b/arch/mips/kernel/vmlinux.ld=
s.S
> index 9ff55cb80a64..d575f945d422 100644
> --- a/arch/mips/kernel/vmlinux.lds.S
> +++ b/arch/mips/kernel/vmlinux.lds.S
> @@ -60,6 +60,7 @@ SECTIONS
>         . =3D LINKER_LOAD_ADDRESS;
>         /* read-only */
>         _text =3D .;      /* Text and read-only data */
> +       _stext =3D .;
>         .text : {
>                 TEXT_TEXT
>                 SCHED_TEXT
>
>
>
>
> If you move the _stext definition to the linker script,
> you can remove EXPORT(_stext) from
> arch/mips/kernel/head.S
>
>
>
>
>
>
>
> --
> Best Regards
> Masahiro Yamada

