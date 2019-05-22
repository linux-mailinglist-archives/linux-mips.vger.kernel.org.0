Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D3C362652F
	for <lists+linux-mips@lfdr.de>; Wed, 22 May 2019 15:54:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728388AbfEVNyc (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 22 May 2019 09:54:32 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:46299 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726770AbfEVNyb (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 22 May 2019 09:54:31 -0400
Received: by mail-lf1-f68.google.com with SMTP id l26so1740041lfh.13;
        Wed, 22 May 2019 06:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=3ZTrwMxN/5lsR/yBgeQOj8ooUaQuQVd2rlB+XWMlCww=;
        b=gcrno6pLfvE1Y4bOELD/4ycqwW+20kE2jaeYTrHTrtfcQMlyRjjw24sDf+ht19fa6o
         NfDlQydamNYxgIAIg4+D/jlZJYs6YUAf4opPIpYhxss3G81n/o5MxzH3lHX3tPXATjEw
         OoFyO80YdiJy1KDj4X8OZLHuQuOAVlbxFGFd1JgspFLL8GsUlyOsMenh0ekW7/APgAr7
         fzwJa7RM0346nVGN5677Dk71QzEZSf8kCE/E1dQAS/DlHAFzD5NbIggot6weqdBCPZGu
         UQEREKUk7evskL4TivJjHxYXl+09zPQB+9QTYH1WxXqcpYWjfbmzgZaOTus1Vm8d8GGv
         55uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=3ZTrwMxN/5lsR/yBgeQOj8ooUaQuQVd2rlB+XWMlCww=;
        b=XQVsa/VYTFgqZ7ZQmm2PkzbE32K7M4MjyV98zmfUZvKG5zhQQFB5602yFf47P1Hxoh
         0NctO96ZZmfN9BNpo8D2dpITskD6R4DNuNVUR6tJR8Us5rQugWf60yNfneab26Bu/KQf
         VqgW14iBYnOcN+sdyNQbal5vGT2bvus1pytkm0veWRHUivhogbZkyUe6MV2nWT0IMYuz
         56X5e8rbO2mHtSSgoDTo0bLjeCHPwGBp0fyAI3RHR6mt1OhpT8gawKQvTsqHurSPqMU7
         ekk6aYB4lpkxlkLGcugfSpLYlNB+D/KNB8TiyhS3votgGlczxsJPh0olRGmjhZn2tvfh
         VQPw==
X-Gm-Message-State: APjAAAVjEK48Sx4HJvvmtH8HmBJhFmH2obv2zHz38ERrmaHRCj1tLz0T
        +Y58HD3WVbN+KrNpaGW0P2k=
X-Google-Smtp-Source: APXvYqyh7w7bH7z8KJW9Gi98UFsM6J9VYBV/15sxp5N9UEMUQBKHI8KSzd8ZmKelZDEJmV1lK3vfDw==
X-Received: by 2002:ac2:43c2:: with SMTP id u2mr36442843lfl.159.1558533268909;
        Wed, 22 May 2019 06:54:28 -0700 (PDT)
Received: from mobilestation ([83.220.237.191])
        by smtp.gmail.com with ESMTPSA id w11sm1938109lfe.32.2019.05.22.06.54.26
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 22 May 2019 06:54:28 -0700 (PDT)
Date:   Wed, 22 May 2019 16:54:23 +0300
From:   Serge Semin <fancer.lancer@gmail.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Mike Rapoport <rppt@linux.ibm.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Michal Hocko <mhocko@suse.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Bogendoerfer <tbogendoerfer@suse.de>,
        Huacai Chen <chenhc@lemote.com>,
        Stefan Agner <stefan@agner.ch>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Juergen Gross <jgross@suse.com>, linux-mips@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Atsushi Nemoto <anemo@mba.ocn.ne.jp>,
        "Maciej W. Rozycki" <macro@linux-mips.org>
Subject: Re: [PATCH 04/12] mips: Reserve memory for the kernel image resources
Message-ID: <20190522135422.q6w7lcvh5fgpf7a5@mobilestation>
References: <20190423224748.3765-1-fancer.lancer@gmail.com>
 <20190423224748.3765-5-fancer.lancer@gmail.com>
 <CAMuHMdWPmL5Z86cgJ4N-U-3XKr4ys8Y7U85okDcXYEu7z4ybaw@mail.gmail.com>
 <20190521155309.GB24470@rapoport-lnx>
 <CAMuHMdWK6-ge-j1NbunDu_Jy7JOwbMfTzNQ767MViuTo4DNf+A@mail.gmail.com>
 <20190522080802.GA31930@rapoport-lnx>
 <CAMuHMdWS9vMUuWAbgZ9tpNcStXOvP2eRkA7WtPOERA3keLq9Eg@mail.gmail.com>
 <20190522133402.duhybxf66oubx6ng@mobilestation>
 <CAMuHMdUR90cabKys=ZAJxyH3okiof-7gu3k8TUer55LA_Nse5A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="qrcxxnjro5uvxfxh"
Content-Disposition: inline
In-Reply-To: <CAMuHMdUR90cabKys=ZAJxyH3okiof-7gu3k8TUer55LA_Nse5A@mail.gmail.com>
User-Agent: NeoMutt/20180716
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


--qrcxxnjro5uvxfxh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 22, 2019 at 03:44:47PM +0200, Geert Uytterhoeven wrote:
> Hi Serge,
>
> ...
> 
> >
> > The problem might be fixed there by the next patch:
> > ---
> > diff --git a/arch/mips/dec/prom/memory.c b/arch/mips/dec/prom/memory.c
> > index 5073d2ed78bb..5a0c734b5d04 100644
> > --- a/arch/mips/dec/prom/memory.c
> > +++ b/arch/mips/dec/prom/memory.c
> > @@ -91,29 +91,14 @@ void __init prom_meminit(u32 magic)
> >                 pmax_setup_memory_region();
> >         else
> >                 rex_setup_memory_region();
> > -}
> > -
> > -void __init prom_free_prom_memory(void)
> > -{
> > -       unsigned long end;
> > -
> > -       /*
> > -        * Free everything below the kernel itself but leave
> > -        * the first page reserved for the exception handlers.
> > -        */
> >
> >  #if IS_ENABLED(CONFIG_DECLANCE)
> >         /*
> > -        * Leave 128 KB reserved for Lance memory for
> > -        * IOASIC DECstations.
> > +        * Reserve 128 KB for Lance memory for IOASIC DECstations.
> >          *
> >          * XXX: save this address for use in dec_lance.c?
> >          */
> >         if (IOASIC)
> > -               end = __pa(&_text) - 0x00020000;
> > -       else
> > +               memblock_reserve(__pa_symbol(&_text), 0x00020000);
> 
> Shouldn't that be
> 
>     memblock_reserve(__pa_symbol(&_text) - 0x00020000, 0x00020000);
> 
> ?
> 

Right. Thanks. The updated version of the patch is attached to this email.

-Sergey

> >  #endif
> > -               end = __pa(&_text);
> > -
> > -       free_init_pages("unused PROM memory", PAGE_SIZE, end);
> >  }
> > ---
> >
> > Didn't wanna use prom_FREE_prom_memory to actually reserve a memory
> > chunk, so I moved the reservation into the prom_meminit() method.
> 
> I guess Maciej will test this on real hardware, eventually...
> 
> > Regarding the first page for the exception handlers. We don't need
> > to reserve it here, since it is already done in arch/mips/kernel/traps.c .
> 
> Thanks for checking! That was actually something I was still wondering
> about...
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> -- 
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds

--qrcxxnjro5uvxfxh
Content-Type: text/x-patch; charset=us-ascii
Content-Disposition: attachment; filename="fix_dec.patch"

diff --git a/arch/mips/dec/prom/memory.c b/arch/mips/dec/prom/memory.c
index 5073d2ed78bb..031c0cd45d85 100644
--- a/arch/mips/dec/prom/memory.c
+++ b/arch/mips/dec/prom/memory.c
@@ -91,29 +91,14 @@ void __init prom_meminit(u32 magic)
 		pmax_setup_memory_region();
 	else
 		rex_setup_memory_region();
-}
-
-void __init prom_free_prom_memory(void)
-{
-	unsigned long end;
-
-	/*
-	 * Free everything below the kernel itself but leave
-	 * the first page reserved for the exception handlers.
-	 */
 
 #if IS_ENABLED(CONFIG_DECLANCE)
 	/*
-	 * Leave 128 KB reserved for Lance memory for
-	 * IOASIC DECstations.
+	 * Reserve 128 KB for Lance memory for IOASIC DECstations.
 	 *
 	 * XXX: save this address for use in dec_lance.c?
 	 */
 	if (IOASIC)
-		end = __pa(&_text) - 0x00020000;
-	else
+		memblock_reserve(__pa_symbol(&_text) - 0x00020000, 0x00020000);
 #endif
-		end = __pa(&_text);
-
-	free_init_pages("unused PROM memory", PAGE_SIZE, end);
 }

--qrcxxnjro5uvxfxh--
