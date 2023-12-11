Return-Path: <linux-mips+bounces-643-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D64D180C316
	for <lists+linux-mips@lfdr.de>; Mon, 11 Dec 2023 09:25:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 91360280C31
	for <lists+linux-mips@lfdr.de>; Mon, 11 Dec 2023 08:25:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C00DB20DCC;
	Mon, 11 Dec 2023 08:25:41 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3764510A;
	Mon, 11 Dec 2023 00:25:38 -0800 (PST)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-5d6b9143782so35674707b3.0;
        Mon, 11 Dec 2023 00:25:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702283137; x=1702887937;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j2eWe2oiRzSTkXAZdruL7FMLjSewImdzh7HyKdRxUqI=;
        b=wt3Rq5OOiqu/yBHspSUY8gYpz2jKqNuD+wQmqfsrOE2IB2pr5KQw0CVNSKsYMfJg/R
         mIV6FEIbf0QvNyR7BocY27xzU49XdRbh0ZtoLTJx5qw0VUBOM5RQX3dLgb2PiwBogaqa
         uSL9I8AA2kLk44qIzJNMDSrcLPrUMW3fPEWbUUHSLcr/UNYEqLB+erVtXYQYghMkywhT
         moS+KBbbIbTAuqGnbkBgf8fFDYuZwct5gwAMR2B1nvPmRnI8TOgVp06Rtl7OkFcBSIwG
         3KXbzitAbhUipCQ6Fgkk9xZBhxBZCy4nC4/yqObD8nOUv1hfArEeA7yYCzrTZTojuEDc
         5sJg==
X-Gm-Message-State: AOJu0YwWOOb6kl9Utfo6YW9W23Ulsiu1YgsEL14CeoDx3eus8iOCD76F
	r5dEla+HZ2ApE+ZiFBL9URxiktQlunAiQg==
X-Google-Smtp-Source: AGHT+IGznTimJA4mSAu8adt3wu2sAMV0tN8lU0584QstnoDzM3+BXIPuN8HqHTzSSYsZE0s4uvfy5A==
X-Received: by 2002:a0d:d48c:0:b0:5d3:e835:bd67 with SMTP id w134-20020a0dd48c000000b005d3e835bd67mr3107076ywd.41.1702283136935;
        Mon, 11 Dec 2023 00:25:36 -0800 (PST)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com. [209.85.128.172])
        by smtp.gmail.com with ESMTPSA id q68-20020a818047000000b005d580a1fd70sm2796876ywf.75.2023.12.11.00.25.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Dec 2023 00:25:36 -0800 (PST)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-5d6b9143782so35674547b3.0;
        Mon, 11 Dec 2023 00:25:35 -0800 (PST)
X-Received: by 2002:a81:7285:0:b0:5d8:74e6:e4c5 with SMTP id
 n127-20020a817285000000b005d874e6e4c5mr2853116ywc.98.1702283135734; Mon, 11
 Dec 2023 00:25:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231208073036.7884-1-bhe@redhat.com> <ZXLI748b85be459B@fedora>
In-Reply-To: <ZXLI748b85be459B@fedora>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 11 Dec 2023 09:25:24 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWAaM+eJtiVbXXBO0xOmpqhrOiCO5itNsNdTiOxRXVtVw@mail.gmail.com>
Message-ID: <CAMuHMdWAaM+eJtiVbXXBO0xOmpqhrOiCO5itNsNdTiOxRXVtVw@mail.gmail.com>
Subject: Re: [PATCH 0/5] kexec: fix the incorrect ifdeffery and dependency of CONFIG_KEXEC
To: Baoquan He <bhe@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, 
	loongarch@lists.linux.dev, kexec@lists.infradead.org, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-sh@vger.kernel.org, x86@kernel.org, akpm@linux-foundation.org, 
	eric_devolder@yahoo.com, sfr@canb.auug.org.au, ignat@cloudflare.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Baoquan,

On Fri, Dec 8, 2023 at 8:43=E2=80=AFAM Baoquan He <bhe@redhat.com> wrote:
> Forgot adding kexec to CC, add it now.
>
> On 12/08/23 at 03:30pm, Baoquan He wrote:
> > The select of KEXEC for CRASH_DUMP in kernel/Kconfig.kexec will be
> > dropped, then compiling errors will be triggered if below config
> > items are set:
> >
> > =3D=3D=3D
> > CONFIG_CRASH_CORE=3Dy
> > CONFIG_KEXEC_CORE=3Dy
> > CONFIG_CRASH_DUMP=3Dy
> > =3D=3D=3D
> >
> > E.g on mips, below link error are seen:
> > --------------------------------------------------------------------
> > mipsel-linux-ld: kernel/kexec_core.o: in function `kimage_free':
> > kernel/kexec_core.c:(.text+0x2200): undefined reference to `machine_kex=
ec_cleanup'
> > mipsel-linux-ld: kernel/kexec_core.o: in function `__crash_kexec':
> > kernel/kexec_core.c:(.text+0x2480): undefined reference to `machine_cra=
sh_shutdown'
> > mipsel-linux-ld: kernel/kexec_core.c:(.text+0x2488): undefined referenc=
e to `machine_kexec'
> > mipsel-linux-ld: kernel/kexec_core.o: in function `kernel_kexec':
> > kernel/kexec_core.c:(.text+0x29b8): undefined reference to `machine_shu=
tdown'
> > mipsel-linux-ld: kernel/kexec_core.c:(.text+0x29c0): undefined referenc=
e to `machine_kexec'
> > --------------------------------------------------------------------
> >
> > Here, change the incorrect dependency of building kexec_core related ob=
ject
> > files, and the ifdeffery on architectures from CONFIG_KEXEC to
> > CONFIG_KEXEC_CORE.
> >
> > Testing:
> > =3D=3D=3D=3D=3D=3D=3D=3D
> > Passed on mips and loognarch with the LKP reproducer.
> >
> > Baoquan He (5):
> >   loongarch, kexec: change dependency of object files
> >   m68k, kexec: fix the incorrect ifdeffery and build dependency of
> >     CONFIG_KEXEC
> >   mips, kexec: fix the incorrect ifdeffery and dependency of
> >     CONFIG_KEXEC
> >   sh, kexec: fix the incorrect ifdeffery and dependency of CONFIG_KEXEC
> >   x86, kexec: fix the wrong ifdeffery CONFIG_KEXEC

I understand this series is v3 of "[PATCH v2] kexec_core: change
dependency of object files"? As this series does not contain a
changelog, can you please summarize what was changed?
Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

