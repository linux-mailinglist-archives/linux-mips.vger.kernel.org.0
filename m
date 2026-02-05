Return-Path: <linux-mips+bounces-13116-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0AxPC4g5hGl51QMAu9opvQ
	(envelope-from <linux-mips+bounces-13116-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 05 Feb 2026 07:32:40 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CBE7EEF089
	for <lists+linux-mips@lfdr.de>; Thu, 05 Feb 2026 07:32:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B01AA300D729
	for <lists+linux-mips@lfdr.de>; Thu,  5 Feb 2026 06:32:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4D9984A35;
	Thu,  5 Feb 2026 06:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oss.cipunited.com header.i=@oss.cipunited.com header.b="Ot6BXrgb"
X-Original-To: linux-mips@vger.kernel.org
Received: from sg-1-12.ptr.blmpb.com (sg-1-12.ptr.blmpb.com [118.26.132.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1DA430DD13
	for <linux-mips@vger.kernel.org>; Thu,  5 Feb 2026 06:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=118.26.132.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770273155; cv=none; b=G+xBwtPI/yjuxR8SoewSvx1ZLdqyXWDJq/ekqkMh3bjJor3HAXRCX85g5AeDX3vCYxMUGGBEIJ2dgA25h90H3A9tWqzvh2KcSopyP3r80lRI3+rR6WuDu1TUuyhneybl6wK+8s9k+pJvSCFlNGHOPLC7wTZJLZomsM471I+cxsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770273155; c=relaxed/simple;
	bh=t+mLMYldgMqSqU2bo2Jsjkc6ZcwXb5J9tg0BYZOEUCI=;
	h=References:From:Message-Id:Cc:In-Reply-To:Date:Mime-Version:
	 Content-Type:To:Subject; b=rx+sWEuZWEh8Ug4Fi1zJkMKq8P3vmV8+ihid9IjWvMHNic//S/OpGhlDg3O8Jsnu+ZE9xeNfl5H/TJvwTvQqjnCYZKYs2MYk1GdCr3ZotkVAnXbe9DnkVLZFPjkKnzSAUag6x/qJ0YxXVVJHaRUU6gc/yoPmmcfPt87p0SH9lrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.cipunited.com; spf=pass smtp.mailfrom=oss.cipunited.com; dkim=pass (2048-bit key) header.d=oss.cipunited.com header.i=@oss.cipunited.com header.b=Ot6BXrgb; arc=none smtp.client-ip=118.26.132.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.cipunited.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.cipunited.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=feishu2303200042; d=oss.cipunited.com; t=1770273134;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=l5HTEBjhQ0PnpXy18xFPFuhg/5n4Ew3OMEKAju8YFog=;
 b=Ot6BXrgbKUxGrvEVcn1g5auzrmqAD9mlcCtUWNESc9GYI9/dNR6UMW865f906OYUfl10Ih
 HSobP4yh+rxv2D86yWNnvPPDZg2yHQBrcZ3wadUUzLIMdjun9SieYXqjlvW2n5GcjSeCaW
 ojEksx/sBwZ8oZMbNPNmqvvX5GfoX478ZzPfbFkJstzzT9hY8v/mrRTJ9AyKL8sWy1VhHy
 jLT4iOD3mEJsYmzahRMtzYII63zGlbmQbry2DmIhsnWXK35CFnwMyHDVVPJOLWYt3OSRzb
 DUOrWobsjkKit8jK0KbRMT57V3nt/ehpnNnTqycS1TRDOwEqRO3/zEPN0Qr/VQ==
References: <aX-d0ShTplHKZT33@waldemar-brodkorb.de> <f0413775-1a6f-49a6-841b-bf52214a2841@app.fastmail.com> <1e9086c1-0cec-4aa7-aab6-e1e605dd9ebf@app.fastmail.com> <aYI9jVbCU-RI2gv2@waldemar-brodkorb.de> <CAOiHx=kU_kNSatruew1FQk2s=nmOanLB3tXjTi9tQ8je2mk2FQ@mail.gmail.com> <aYMrN3EhBM0Ip7b3@waldemar-brodkorb.de> <CAOiHx=nJN9suqTV7XfuTmO1X9QZv0wn=VqwkEzGmPctAF09v9Q@mail.gmail.com> <aYN1_mED5-IiKC4E@waldemar-brodkorb.de>
X-Original-From: Rong Zhang <rongrong@oss.cipunited.com>
From: "Rong Zhang" <rongrong@oss.cipunited.com>
X-Lms-Return-Path: <lba+26984396d+2be3a7+vger.kernel.org+rongrong@oss.cipunited.com>
User-Agent: Evolution 3.56.2-8
Message-Id: <c80062a1b781ff256426d659ab327654174177d1.camel@oss.cipunited.com>
Received: from [192.168.8.156] ([1.192.16.122]) by smtp.feishu.cn with ESMTPS; Thu, 05 Feb 2026 14:32:12 +0800
Cc: "Jiaxun Yang" <jiaxun.yang@flygoat.com>, 
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, 
	"Rong Zhang" <i@rong.moe>
In-Reply-To: <aYN1_mED5-IiKC4E@waldemar-brodkorb.de>
Date: Thu, 05 Feb 2026 14:27:10 +0800
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
To: "Waldemar Brodkorb" <wbx@openadk.org>, 
	"Jonas Gorski" <jonas.gorski@gmail.com>
Subject: Re: serial console on Mikrotik RB532 non-working
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[oss.cipunited.com,none];
	R_DKIM_ALLOW(-0.20)[oss.cipunited.com:s=feishu2303200042];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[openadk.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-13116-lists,linux-mips=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rongrong@oss.cipunited.com,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[oss.cipunited.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.cipunited.com:mid,oss.cipunited.com:dkim,openadk.org:email]
X-Rspamd-Queue-Id: CBE7EEF089
X-Rspamd-Action: no action

Hi Waldemar,

On Wed, 2026-02-04 at 17:38 +0100, Waldemar Brodkorb wrote:
> Hi Mips people,
> Jonas Gorski wrote,
>=20
> > On Wed, Feb 4, 2026 at 12:19=E2=80=AFPM Waldemar Brodkorb <wbx@openadk.=
org> wrote:
> > >=20
> > > Hi Jonas,
> > > Jonas Gorski wrote,
> > >=20
> > > > Hi,
> > > >=20
> > > > On Tue, Feb 3, 2026 at 7:25=E2=80=AFPM Waldemar Brodkorb <wbx@opena=
dk.org> wrote:
> > > > >=20
> > > > > Hi Jiaxun,
> > > > > Jiaxun Yang wrote,
> > > > > >=20
> > > > > > On Tue, 3 Feb 2026, at 3:24 PM, Jiaxun Yang wrote:
> > > > > > > On Sun, 1 Feb 2026, at 6:39 PM, Waldemar Brodkorb wrote:
> > > > > > > > Hi MIPS hackers,
> > > > > > > >=20
> > > > > > > > I want to use the latest Linux kernel on my Mikrotik RB532,=
 but the
> > > > > > > > serial console is non working. I bisected the problem and t=
he first
> > > > > > > > breaking change is this commit:
> > > > > > >=20
> > > > > > > Hi,
> > > > > > >=20
> > > > > > > Can you try this?
> > > > > >=20
> > > > > > Oops sorry I missed a flag, it should be:
> > > > > >=20
> > > > > > diff --git a/arch/mips/rb532/devices.c b/arch/mips/rb532/device=
s.c
> > > > > > index 8ecb56be81ac..239018540221 100644
> > > > > > --- a/arch/mips/rb532/devices.c
> > > > > > +++ b/arch/mips/rb532/devices.c
> > > > > > @@ -213,11 +213,12 @@ static struct platform_device rb532_wdt =
=3D {
> > > > > >  static struct plat_serial8250_port rb532_uart_res[] =3D {
> > > > > >         {
> > > > > >                 .type           =3D PORT_16550A,
> > > > > > -               .membase        =3D (char *)KSEG1ADDR(REGBASE +=
 UART0BASE),
> > > > > > +               .mapbase        =3D REGBASE + UART0BASE,
> > > > > > +               .mapsize        =3D SZ_4K,
> > > > > >                 .irq            =3D UART0_IRQ,
> > > > > >                 .regshift       =3D 2,
> > > > > >                 .iotype         =3D UPIO_MEM,
> > > > > > -               .flags          =3D UPF_BOOT_AUTOCONF,
> > > > > > +               .flags          =3D UPF_BOOT_AUTOCONF | UPF_IOR=
EMAP,
> > > > > >         },
> > > > > >         {
> > > > > >                 .flags          =3D 0,
> > > > > >=20
> > > > >=20
> > > > > I tried the patch, but it still hangs here:
> > > > >=20
> > > > > RouterBOOT booter 2.18
> > > > >=20
> > > > > RouterBoard 532
> > > > >=20
> > > > > CPU frequency: 399 MHz
> > > > >   Memory size:  32 MB
> > > > >=20
> > > > > Press any key within 3 seconds to enter setup...
> > > > > trying dhcp protocol... OK
> > > > > resolved mac address 9C:BF:0D:00:D6:4E
> > > > > Gateway: 192.168.1.254
> > > > > transfer started ........................................ transfe=
r ok, time=3D525.70s
> > > > > setting up elf image... OK
> > > > > jumping to kernel code
> > > > >=20
> > > > > Nothing in tcpdump tries to mount nfs, so I believe serial consol=
e
> > > > > breakage is not the only problem here.
> > > >=20
> > > > Have you tried the patch on top of master or
> > > > 6e690d54cfa802f939cefbd2fa2c91bd0b8bd1b6?
> > > >=20
> > > > If it works on top of 6e690d54cfa802f939cefbd2fa2c91bd0b8bd1b6, the=
n
> > > > it fixes the serial issue, and you can do a new git bisect between
> > > > 6e690d54cfa802f939cefbd2fa2c91bd0b8bd1b6 and master to find the nex=
t
> > > > breakage, with the patch re-applied on top each step (so serial sta=
ys
> > > > working).
> > >=20
> > > Yes, thanks for the idea. I already had this idea in mind and I am 9
> > > steps before I get the next breakage :)
> > >=20
> > > Thanks for the heads up,
> >=20
> > Also a small warning when doing a bisect with git am'd patches on top:
> > always (git) reset to the original tested commit before doing git
> > bisect <bood|bad>, else git bisect will account for these commits on
> > top in calculating the next revision to test and may suggest the very
> > same commit again you were originally testing.
> >=20
> > It took a me a few steps until I noticed I was running in circles when
> > I had to bisect with a few patches on top.
>=20
> I just used patch and git stash for the job :)
> So here is the result, the failing commit is:
> commit 9f048fa487409e364cf866c957cf0b0d782ca5a3 (HEAD)
> Author: Maciej W. Rozycki <macro@orcam.me.uk>
> Date:   Thu Nov 13 05:21:10 2025 +0000
>=20
>     MIPS: mm: Prevent a TLB shutdown on initial uniquification
>=20
>     Depending on the particular CPU implementation a TLB shutdown may occ=
ur
>     if multiple matching entries are detected upon the execution of a TLB=
P
>     or the TLBWI/TLBWR instructions.  Given that we don't know what entri=
es
>     we have been handed we need to be very careful with the initial TLB
>     setup and avoid all these instructions.
>=20
>     Therefore read all the TLB entries one by one with the TLBR instructi=
on,
>     bypassing the content addressing logic, and truncate any large pages =
in
>     place so as to avoid a case in the second step where an incoming entr=
y
>     for a large page at a lower address overlaps with a replacement entry
>     chosen at another index.  Then preinitialize the TLB using addresses
>     outside our usual unique range and avoiding clashes with any entries
>     received, before making the usual call to local_flush_tlb_all().
>=20
>     This fixes (at least) R4x00 cores if TLBP hits multiple matching TLB
>     entries (SGI IP22 PROM for examples sets up all TLBs to the same virt=
ual
>     address).
>=20
>     Signed-off-by: Maciej W. Rozycki <macro@orcam.me.uk>
>     Fixes: 35ad7e181541 ("MIPS: mm: tlb-r4k: Uniquify TLB entries on init=
")
>     Cc: stable@vger.kernel.org
>     Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>     Tested-by: Jiaxun Yang <jiaxun.yang@flygoat.com> # Boston I6400, M515=
0 sim
>     Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
>=20
> Reverting this commit, make the RB532 boot. I need the UART patch, too.

FYI, this commit is buggy and has been fixed by commit 841ecc979b18d
("MIPS: mm: kmalloc tlb_vpn array to avoid stack overflow").

Thanks,
Rong

> Attached is the dmesg from the device.
>=20
> Anyone knows how to fix this issue?
>=20
> best regards
>  Waldemar
>

