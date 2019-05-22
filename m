Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C8A83264C8
	for <lists+linux-mips@lfdr.de>; Wed, 22 May 2019 15:34:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729238AbfEVNeO (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 22 May 2019 09:34:14 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:32824 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727975AbfEVNeN (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 22 May 2019 09:34:13 -0400
Received: by mail-lj1-f196.google.com with SMTP id w1so2140024ljw.0;
        Wed, 22 May 2019 06:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=14QlJRJWq59KvU1Q1jnmbY57wwH1e/15veo4ydyj84A=;
        b=ANWmTjXEV7vN5ajAq35aQmfEnGb1lfHDTKS9vcAfD7TqDmiPMKGmFHDpu8SfXJYXq8
         P1zclsfr0+W2tMYsQgHLynYBe5GXBKdEJGu29wCdW1IM2XAWmoiBVd3fKV5/fVhy9Jj3
         wcrWrFnW/T2urGVTL2RrhN54W1g08Eax+h2f5Yapc7/LczXL9Ef/4TZmPNSRGyxC4tpw
         Gc5iUxd79nA/y6Pi1nYcYfM62awXNmUJv6ag6W1xWfWP077Jhw5PbvdH0XNL0r3SrpNl
         TYgfY3SDqqFd01Mikcndfyo2UMlz+hqtdHhvshSpdx4AD1H4SZ6mQLaKiCt3yFOpoW4/
         C6aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=14QlJRJWq59KvU1Q1jnmbY57wwH1e/15veo4ydyj84A=;
        b=qnPxDK8xHS/rIMwzFf+gzp1tMoL5n/C1sZ/Z2nwes9hq/o0mFDQiJq9oSBI4b1tiQS
         S/a6iUvMwpicawGpPrxRdcWHhe+c4atJhS0Uf3YHOnbBH8UtRvqYPmYF3LnH3cd8rn3m
         DITQS2ZTLBWVYyu96gdFKjCFcTHCfpTK5y4XBW8GOTNXPIWtgaGZKaszFVzPzUsPGTNQ
         tH0Ai3s/KlBqb6PFhhjXHgyjafvw4RKy2QtGzGxlmihYlmzqC1u1NUP/20sKLpFLWFj5
         S4B33Od+sqbXEMrISVwpaVqARQ5X/mR/T9rplmCa5lPrLA4gSo2ZEv+n/jjCYFeMSSfT
         H94w==
X-Gm-Message-State: APjAAAUELRJUZRbwA2Zv4Tt/wiqD8rivsml9ssrueF6U1IIfASbpCMp1
        NAHxdBXg3CS15Y5Y5j6mM4gt8H0mEVw=
X-Google-Smtp-Source: APXvYqzBhqPPTj2BNTyxpb4Hji+gQdSf9AmROFUOdma1lW10NIbUM2X2o/bBLkO2SUBDHdSDKrElDg==
X-Received: by 2002:a2e:9b46:: with SMTP id o6mr7891853ljj.76.1558532050686;
        Wed, 22 May 2019 06:34:10 -0700 (PDT)
Received: from mobilestation ([83.220.237.191])
        by smtp.gmail.com with ESMTPSA id j14sm5496504lfb.76.2019.05.22.06.34.08
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 22 May 2019 06:34:09 -0700 (PDT)
Date:   Wed, 22 May 2019 16:34:04 +0300
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
Message-ID: <20190522133402.duhybxf66oubx6ng@mobilestation>
References: <20190423224748.3765-1-fancer.lancer@gmail.com>
 <20190423224748.3765-5-fancer.lancer@gmail.com>
 <CAMuHMdWPmL5Z86cgJ4N-U-3XKr4ys8Y7U85okDcXYEu7z4ybaw@mail.gmail.com>
 <20190521155309.GB24470@rapoport-lnx>
 <CAMuHMdWK6-ge-j1NbunDu_Jy7JOwbMfTzNQ767MViuTo4DNf+A@mail.gmail.com>
 <20190522080802.GA31930@rapoport-lnx>
 <CAMuHMdWS9vMUuWAbgZ9tpNcStXOvP2eRkA7WtPOERA3keLq9Eg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdWS9vMUuWAbgZ9tpNcStXOvP2eRkA7WtPOERA3keLq9Eg@mail.gmail.com>
User-Agent: NeoMutt/20180716
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello folks,

On Wed, May 22, 2019 at 10:14:47AM +0200, Geert Uytterhoeven wrote:
> Hi Mike,
> 
> On Wed, May 22, 2019 at 10:08 AM Mike Rapoport <rppt@linux.ibm.com> wrote:
> > On Wed, May 22, 2019 at 09:47:04AM +0200, Geert Uytterhoeven wrote:
> > > On Tue, May 21, 2019 at 5:53 PM Mike Rapoport <rppt@linux.ibm.com> wrote:
> > > > On Tue, May 21, 2019 at 04:56:39PM +0200, Geert Uytterhoeven wrote:
> > > > > On Wed, Apr 24, 2019 at 12:50 AM Serge Semin <fancer.lancer@gmail.com> wrote:
> > > > > > The reserved_end variable had been used by the bootmem_init() code
> > > > > > to find a lowest limit of memory available for memmap blob. The original
> > > > > > code just tried to find a free memory space higher than kernel was placed.
> > > > > > This limitation seems justified for the memmap ragion search process, but
> > > > > > I can't see any obvious reason to reserve the unused space below kernel
> > > > > > seeing some platforms place it much higher than standard 1MB. Moreover
> > > > > > the RELOCATION config enables it to be loaded at any memory address.
> > > > > > So lets reserve the memory occupied by the kernel only, leaving the region
> > > > > > below being free for allocations. After doing this we can now discard the
> > > > > > code freeing a space between kernel _text and VMLINUX_LOAD_ADDRESS symbols
> > > > > > since it's going to be free anyway (unless marked as reserved by
> > > > > > platforms).
> > > > > >
> > > > > > Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
> > > > >
> > > > > This is now commit b93ddc4f9156205e ("mips: Reserve memory for the kernel
> > > > > image resources") in v5.2-rc1, which causes rbtx4927 to crash during boot:
> > > > >
> > > > >     VFS: Mounted root (nfs filesystem) on device 0:13.
> > > > >     devtmpfs: mounted
> > > > >     BUG: Bad page state in process swapper  pfn:00001
> > > > >     page:804b7820 refcount:0 mapcount:-128 mapping:00000000 index:0x1
> > > > >     flags: 0x0()
> > > > >     raw: 00000000 00000100 00000200 00000000 00000001 00000000 ffffff7f 00000000
> > > > >     page dumped because: nonzero mapcount
> > > > >     Modules linked in:
> > > > >     CPU: 0 PID: 1 Comm: swapper Not tainted
> > > > > 5.2.0-rc1-rbtx4927-00468-g3c05ea3d4077b756-dirty #137
> > > > >     Stack : 00000000 10008400 8040dd2c 87c1b974 8044af63 8040dd2c
> > > > > 00000001 804a3490
> > > > >             00000001 81000000 0030f231 80148558 00000003 10008400
> > > > > 87c1dd80 7599ee13
> > > > >             00000000 00000000 804b0000 00000000 00000007 00000000
> > > > > 00000085 00000000
> > > > >             62722d31 00000084 804b0000 39347874 00000000 804b7820
> > > > > 8040cef8 81000010
> > > > >             00000001 00000007 00000001 81000000 00000008 8021de24
> > > > > 00000000 804a0000
> > > > >             ...
> > > > >     Call Trace:
> > > > >     [<8010adec>] show_stack+0x74/0x104
> > > > >     [<801a5e44>] bad_page+0x130/0x138
> > > > >     [<801a654c>] free_pcppages_bulk+0x17c/0x3b0
> > > > >     [<801a789c>] free_unref_page+0x40/0x68
> > > > >     [<801120f4>] free_init_pages+0xec/0x104
> > > > >     [<803bdde8>] free_initmem+0x10/0x58
> > > > >     [<803bdb8c>] kernel_init+0x20/0x100
> > > > >     [<801057c8>] ret_from_kernel_thread+0x14/0x1c
> > > > >     Disabling lock debugging due to kernel taint
> > > > >     BUG: Bad page state in process swapper  pfn:00002
> > > > >     [...]
> > > > >
> > > > > CONFIG_RELOCATABLE is not set, so the only relevant part is the
> > > > > change quoted below.
> > > > >
> > > > > > --- a/arch/mips/kernel/setup.c
> > > > > > +++ b/arch/mips/kernel/setup.c
> > > > > > @@ -371,7 +371,6 @@ static void __init bootmem_init(void)
> > > > > >
> > > > > >  static void __init bootmem_init(void)
> > > > > >  {
> > > > > > -       unsigned long reserved_end;
> > > > > >         phys_addr_t ramstart = PHYS_ADDR_MAX;
> > > > > >         int i;
> > > > > >
> > > > > > @@ -382,10 +381,10 @@ static void __init bootmem_init(void)
> > > > > >          * will reserve the area used for the initrd.
> > > > > >          */
> > > > > >         init_initrd();
> > > > > > -       reserved_end = (unsigned long) PFN_UP(__pa_symbol(&_end));
> > > > > >
> > > > > > -       memblock_reserve(PHYS_OFFSET,
> > > > > > -                        (reserved_end << PAGE_SHIFT) - PHYS_OFFSET);
> > > > > > +       /* Reserve memory occupied by kernel. */
> > > > > > +       memblock_reserve(__pa_symbol(&_text),
> > > > > > +                       __pa_symbol(&_end) - __pa_symbol(&_text));
> > > > > >
> > > > > >         /*
> > > > > >          * max_low_pfn is not a number of pages. The number of pages
> 
> > > > > Hence the old code reserved 1 MiB extra at the beginning.
> > > > >
> > > > > Note that the new code also dropped the rounding up of the memory block
> > > > > size to a multiple of PAGE_SIZE. I'm not sure the latter actually
> > > > > matters or not.
> > > >
> > > > I'd say that bad page state for pfn 1 is caused by "freeing" the first 1M.
> > >
> > > Yes, by prom_free_prom_memory(), as pointed out by Serge.
> >
> > I wonder how other MIPS variants would react to the fact that the memory
> > below the kernel is not reserved ;-)
> 
> Exactly...
> 
> Looks like at least arch/mips/dec/prom/memory.c needs a similar but\
> more complicated fix, due to declance handling...
> 

The problem might be fixed there by the next patch:
---
diff --git a/arch/mips/dec/prom/memory.c b/arch/mips/dec/prom/memory.c
index 5073d2ed78bb..5a0c734b5d04 100644
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
+		memblock_reserve(__pa_symbol(&_text), 0x00020000);
 #endif
-		end = __pa(&_text);
-
-	free_init_pages("unused PROM memory", PAGE_SIZE, end);
 }
---

Didn't wanna use prom_FREE_prom_memory to actually reserve a memory
chunk, so I moved the reservation into the prom_meminit() method.

Regarding the first page for the exception handlers. We don't need
to reserve it here, since it is already done in arch/mips/kernel/traps.c .

Regards,
-Sergey


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
