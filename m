Return-Path: <linux-mips+bounces-13117-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aI40Ee9GhGk/2QMAu9opvQ
	(envelope-from <linux-mips+bounces-13117-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 05 Feb 2026 08:29:51 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 832C8EF6D6
	for <lists+linux-mips@lfdr.de>; Thu, 05 Feb 2026 08:29:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 49A233012C46
	for <lists+linux-mips@lfdr.de>; Thu,  5 Feb 2026 07:29:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA70135C1BE;
	Thu,  5 Feb 2026 07:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=openadk.org header.i=@openadk.org header.b="m37OwDw6"
X-Original-To: linux-mips@vger.kernel.org
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3839435C1AC
	for <linux-mips@vger.kernel.org>; Thu,  5 Feb 2026 07:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.238.66.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770276578; cv=none; b=OEL9FflWNV4E1PlkFMqwgUtUuzYN7sb/+O/YiCUU1WLUX7aItcbnLnbvcfcjI9dGV+GXm2Rh6UINpdUhjndnppUQs74hkEeWvhSpTPHrTSr9NAUB9epnUwXvAKL9jHRKVCadIzFUwb7EAsQ/A+6kRhIxb2L5m3hhJ7vC8ifK+dU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770276578; c=relaxed/simple;
	bh=bnfRDuh5TxdeRBerCjCax/Fy2/YvXgK0kqjWZX3oBK8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FbYwHoi3eGSHlV1chReBInQMrlb+e9qpcuoiEPXfzVj9X4syr8IOZFACEgLAqWmFyjTLk0QatfoMC2MqZlSoWpb3c+QdQuj4iZlibHjTzHGJ+4KILRTsBeywfnr+72cJjDh0PytQyFwxa8Tg/2M4kDi1CkYFVKRrtKrARbdkTt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=openadk.org; spf=pass smtp.mailfrom=openadk.org; dkim=fail (0-bit key) header.d=openadk.org header.i=@openadk.org header.b=m37OwDw6 reason="key not found in DNS"; arc=none smtp.client-ip=89.238.66.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=openadk.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openadk.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=openadk.org; s=2022;
	t=1770276570; bh=bnfRDuh5TxdeRBerCjCax/Fy2/YvXgK0kqjWZX3oBK8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m37OwDw6idA9O+AX+u2ra+JkXXJEeQ4JQlRoSzMTTdI7e/W8eO4xsGJSHfoz9lzeQ
	 prAZojp79c1mPzpqdvllRDbOVDuHpHGqtE03Cyoq6EeiHDY1Hrgs6BkuzNj3u1/WJs
	 c401aa+ssPdDzHwGvodagxIPazBcazCj/9c9Zl5bOU2tyynV3HRyrAo/pcIrLqxmu/
	 mjkkzRIH4vtTBGJg7LpT/QM6nvHJTjMzS1FDEnL5fLM0X/qsyMJPA86ZweoPtz7Qwu
	 jGxqOmMlpFHLjuFZdG/sDebE70NQqX1vGkTQqAbwZUUBYsYbd424Qf/Jw6f8x4w2z2
	 Rxa6TjCWhMN8Q==
Received: by helium.openadk.org (Postfix, from userid 1000)
	id 6A10A31E0BA1; Thu, 05 Feb 2026 08:29:30 +0100 (CET)
Date: Thu, 5 Feb 2026 08:29:30 +0100
From: Waldemar Brodkorb <wbx@openadk.org>
To: Rong Zhang <rongrong@oss.cipunited.com>
Cc: Waldemar Brodkorb <wbx@openadk.org>,
	Jonas Gorski <jonas.gorski@gmail.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
	Rong Zhang <i@rong.moe>
Subject: Re: serial console on Mikrotik RB532 non-working
Message-ID: <aYRG2p4PX-oELYhU@waldemar-brodkorb.de>
References: <aX-d0ShTplHKZT33@waldemar-brodkorb.de>
 <f0413775-1a6f-49a6-841b-bf52214a2841@app.fastmail.com>
 <1e9086c1-0cec-4aa7-aab6-e1e605dd9ebf@app.fastmail.com>
 <aYI9jVbCU-RI2gv2@waldemar-brodkorb.de>
 <CAOiHx=kU_kNSatruew1FQk2s=nmOanLB3tXjTi9tQ8je2mk2FQ@mail.gmail.com>
 <aYMrN3EhBM0Ip7b3@waldemar-brodkorb.de>
 <CAOiHx=nJN9suqTV7XfuTmO1X9QZv0wn=VqwkEzGmPctAF09v9Q@mail.gmail.com>
 <aYN1_mED5-IiKC4E@waldemar-brodkorb.de>
 <c80062a1b781ff256426d659ab327654174177d1.camel@oss.cipunited.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c80062a1b781ff256426d659ab327654174177d1.camel@oss.cipunited.com>
X-Operating-System: Linux 6.12.63+deb13-amd64 x86_64
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[openadk.org];
	TAGGED_FROM(0.00)[bounces-13117-lists,linux-mips=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	R_DKIM_PERMFAIL(0.00)[openadk.org:s=2022];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[openadk.org,gmail.com,flygoat.com,vger.kernel.org,rong.moe];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wbx@openadk.org,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[openadk.org:~];
	TAGGED_RCPT(0.00)[linux-mips];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_SPAM(0.00)[0.973];
	DBL_BLOCKED_OPENRESOLVER(0.00)[franken.de:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,openadk.org:email]
X-Rspamd-Queue-Id: 832C8EF6D6
X-Rspamd-Action: no action

Hi Rong,
Rong Zhang wrote,

> Hi Waldemar,
> 
> On Wed, 2026-02-04 at 17:38 +0100, Waldemar Brodkorb wrote:
> > Hi Mips people,
> > Jonas Gorski wrote,
> > 
> > > On Wed, Feb 4, 2026 at 12:19 PM Waldemar Brodkorb <wbx@openadk.org> wrote:
> > > > 
> > > > Hi Jonas,
> > > > Jonas Gorski wrote,
> > > > 
> > > > > Hi,
> > > > > 
> > > > > On Tue, Feb 3, 2026 at 7:25 PM Waldemar Brodkorb <wbx@openadk.org> wrote:
> > > > > > 
> > > > > > Hi Jiaxun,
> > > > > > Jiaxun Yang wrote,
> > > > > > > 
> > > > > > > On Tue, 3 Feb 2026, at 3:24 PM, Jiaxun Yang wrote:
> > > > > > > > On Sun, 1 Feb 2026, at 6:39 PM, Waldemar Brodkorb wrote:
> > > > > > > > > Hi MIPS hackers,
> > > > > > > > > 
> > > > > > > > > I want to use the latest Linux kernel on my Mikrotik RB532, but the
> > > > > > > > > serial console is non working. I bisected the problem and the first
> > > > > > > > > breaking change is this commit:
> > > > > > > > 
> > > > > > > > Hi,
> > > > > > > > 
> > > > > > > > Can you try this?
> > > > > > > 
> > > > > > > Oops sorry I missed a flag, it should be:
> > > > > > > 
> > > > > > > diff --git a/arch/mips/rb532/devices.c b/arch/mips/rb532/devices.c
> > > > > > > index 8ecb56be81ac..239018540221 100644
> > > > > > > --- a/arch/mips/rb532/devices.c
> > > > > > > +++ b/arch/mips/rb532/devices.c
> > > > > > > @@ -213,11 +213,12 @@ static struct platform_device rb532_wdt = {
> > > > > > >  static struct plat_serial8250_port rb532_uart_res[] = {
> > > > > > >         {
> > > > > > >                 .type           = PORT_16550A,
> > > > > > > -               .membase        = (char *)KSEG1ADDR(REGBASE + UART0BASE),
> > > > > > > +               .mapbase        = REGBASE + UART0BASE,
> > > > > > > +               .mapsize        = SZ_4K,
> > > > > > >                 .irq            = UART0_IRQ,
> > > > > > >                 .regshift       = 2,
> > > > > > >                 .iotype         = UPIO_MEM,
> > > > > > > -               .flags          = UPF_BOOT_AUTOCONF,
> > > > > > > +               .flags          = UPF_BOOT_AUTOCONF | UPF_IOREMAP,
> > > > > > >         },
> > > > > > >         {
> > > > > > >                 .flags          = 0,
> > > > > > > 
> > > > > > 
> > > > > > I tried the patch, but it still hangs here:
> > > > > > 
> > > > > > RouterBOOT booter 2.18
> > > > > > 
> > > > > > RouterBoard 532
> > > > > > 
> > > > > > CPU frequency: 399 MHz
> > > > > >   Memory size:  32 MB
> > > > > > 
> > > > > > Press any key within 3 seconds to enter setup...
> > > > > > trying dhcp protocol... OK
> > > > > > resolved mac address 9C:BF:0D:00:D6:4E
> > > > > > Gateway: 192.168.1.254
> > > > > > transfer started ........................................ transfer ok, time=525.70s
> > > > > > setting up elf image... OK
> > > > > > jumping to kernel code
> > > > > > 
> > > > > > Nothing in tcpdump tries to mount nfs, so I believe serial console
> > > > > > breakage is not the only problem here.
> > > > > 
> > > > > Have you tried the patch on top of master or
> > > > > 6e690d54cfa802f939cefbd2fa2c91bd0b8bd1b6?
> > > > > 
> > > > > If it works on top of 6e690d54cfa802f939cefbd2fa2c91bd0b8bd1b6, then
> > > > > it fixes the serial issue, and you can do a new git bisect between
> > > > > 6e690d54cfa802f939cefbd2fa2c91bd0b8bd1b6 and master to find the next
> > > > > breakage, with the patch re-applied on top each step (so serial stays
> > > > > working).
> > > > 
> > > > Yes, thanks for the idea. I already had this idea in mind and I am 9
> > > > steps before I get the next breakage :)
> > > > 
> > > > Thanks for the heads up,
> > > 
> > > Also a small warning when doing a bisect with git am'd patches on top:
> > > always (git) reset to the original tested commit before doing git
> > > bisect <bood|bad>, else git bisect will account for these commits on
> > > top in calculating the next revision to test and may suggest the very
> > > same commit again you were originally testing.
> > > 
> > > It took a me a few steps until I noticed I was running in circles when
> > > I had to bisect with a few patches on top.
> > 
> > I just used patch and git stash for the job :)
> > So here is the result, the failing commit is:
> > commit 9f048fa487409e364cf866c957cf0b0d782ca5a3 (HEAD)
> > Author: Maciej W. Rozycki <macro@orcam.me.uk>
> > Date:   Thu Nov 13 05:21:10 2025 +0000
> > 
> >     MIPS: mm: Prevent a TLB shutdown on initial uniquification
> > 
> >     Depending on the particular CPU implementation a TLB shutdown may occur
> >     if multiple matching entries are detected upon the execution of a TLBP
> >     or the TLBWI/TLBWR instructions.  Given that we don't know what entries
> >     we have been handed we need to be very careful with the initial TLB
> >     setup and avoid all these instructions.
> > 
> >     Therefore read all the TLB entries one by one with the TLBR instruction,
> >     bypassing the content addressing logic, and truncate any large pages in
> >     place so as to avoid a case in the second step where an incoming entry
> >     for a large page at a lower address overlaps with a replacement entry
> >     chosen at another index.  Then preinitialize the TLB using addresses
> >     outside our usual unique range and avoiding clashes with any entries
> >     received, before making the usual call to local_flush_tlb_all().
> > 
> >     This fixes (at least) R4x00 cores if TLBP hits multiple matching TLB
> >     entries (SGI IP22 PROM for examples sets up all TLBs to the same virtual
> >     address).
> > 
> >     Signed-off-by: Maciej W. Rozycki <macro@orcam.me.uk>
> >     Fixes: 35ad7e181541 ("MIPS: mm: tlb-r4k: Uniquify TLB entries on init")
> >     Cc: stable@vger.kernel.org
> >     Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> >     Tested-by: Jiaxun Yang <jiaxun.yang@flygoat.com> # Boston I6400, M5150 sim
> >     Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> > 
> > Reverting this commit, make the RB532 boot. I need the UART patch, too.
> 
> FYI, this commit is buggy and has been fixed by commit 841ecc979b18d
> ("MIPS: mm: kmalloc tlb_vpn array to avoid stack overflow").

But if you take a look at the dmesg, I am using latest Linux GIT
master, which includes this commit. But still it is failing for me.

best regards
 Waldemar

