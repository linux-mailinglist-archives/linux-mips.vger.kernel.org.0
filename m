Return-Path: <linux-mips+bounces-13109-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YBX6Onosg2kxigMAu9opvQ
	(envelope-from <linux-mips+bounces-13109-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 04 Feb 2026 12:24:42 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 550CAE509F
	for <lists+linux-mips@lfdr.de>; Wed, 04 Feb 2026 12:24:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 97A82309A1FE
	for <lists+linux-mips@lfdr.de>; Wed,  4 Feb 2026 11:19:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 657323E9F6D;
	Wed,  4 Feb 2026 11:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=openadk.org header.i=@openadk.org header.b="flHUpu0I"
X-Original-To: linux-mips@vger.kernel.org
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E6552F2905
	for <linux-mips@vger.kernel.org>; Wed,  4 Feb 2026 11:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.238.66.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770203962; cv=none; b=gIhnhxDc3rDQByDfL5LJwCj64XDDOBNwXQNzRUoyIFdX8idUb04dJmnOpacJ+puB26maLYH646qyRE04Wo6OBDFnEX2PrGngzAKkesL2h1Co3C5AKpEL5GbgglW/j2wh0fdGErWVrrJggALKn478MBy6VUYFSjUoSxiPt9Bj8DM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770203962; c=relaxed/simple;
	bh=ZP33gNfyibZuDnGngJwaJ2t7547tAzKfzTo5POg3W4Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mpf+fDMEwDsrKuCBIMvKWhQW+j/tZcc+xfatwvV1Hqb9gg72Idr0dys1NRuKC9TGowULx1DSvoeI8Gq5GOXpcxm3rTF6AUzwJbClSoPH+FBBwXgyeKxRw/HFpr0RB7AMBH9W2t3IMVOvMc6oEHXG/NNbnBCb5vgfl0a6/KNrqAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=openadk.org; spf=pass smtp.mailfrom=openadk.org; dkim=fail (0-bit key) header.d=openadk.org header.i=@openadk.org header.b=flHUpu0I reason="key not found in DNS"; arc=none smtp.client-ip=89.238.66.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=openadk.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openadk.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=openadk.org; s=2022;
	t=1770203959; bh=ZP33gNfyibZuDnGngJwaJ2t7547tAzKfzTo5POg3W4Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=flHUpu0I99jozykLnqcM3+f7LXClogbvUxsACMHB7DOtj2ILzoVSoxvHsTNcifgc3
	 4HSdhdm568hQTh9inpIZTj/sOp+KYGAaMtnyEwHfDzNSDSAIPUHCq5lzmb25Un4twP
	 5NbLK65F82cJQzosZilldH9vZ/FuAvTifkAGkOy6lxRNbZLlMRJT7JKA2ji9zXtWbG
	 ji3CtM0MM4X6aVMaa1CpmHrfzXB2HKpQEMUknnq/4CgZUUACg6j0kj59IZwlYbI7PJ
	 6tO0GMtuW3zJKAIL6zhn0W67R98B7O01CDt55bwRNfSToaSCpHYRTCELTjbRZZkptH
	 Om39XHtmOJGeQ==
Received: by helium.openadk.org (Postfix, from userid 1000)
	id D7F4931E0B83; Wed, 04 Feb 2026 12:19:19 +0100 (CET)
Date: Wed, 4 Feb 2026 12:19:19 +0100
From: Waldemar Brodkorb <wbx@openadk.org>
To: Jonas Gorski <jonas.gorski@gmail.com>
Cc: Waldemar Brodkorb <wbx@openadk.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: Re: serial console on Mikrotik RB532 non-working
Message-ID: <aYMrN3EhBM0Ip7b3@waldemar-brodkorb.de>
References: <aX-d0ShTplHKZT33@waldemar-brodkorb.de>
 <f0413775-1a6f-49a6-841b-bf52214a2841@app.fastmail.com>
 <1e9086c1-0cec-4aa7-aab6-e1e605dd9ebf@app.fastmail.com>
 <aYI9jVbCU-RI2gv2@waldemar-brodkorb.de>
 <CAOiHx=kU_kNSatruew1FQk2s=nmOanLB3tXjTi9tQ8je2mk2FQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOiHx=kU_kNSatruew1FQk2s=nmOanLB3tXjTi9tQ8je2mk2FQ@mail.gmail.com>
X-Operating-System: Linux 6.12.63+deb13-amd64 x86_64
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[openadk.org];
	TAGGED_FROM(0.00)[bounces-13109-lists,linux-mips=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	R_DKIM_PERMFAIL(0.00)[openadk.org:s=2022];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wbx@openadk.org,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[openadk.org:~];
	TAGGED_RCPT(0.00)[linux-mips];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_SPAM(0.00)[0.968];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,openadk.org:email]
X-Rspamd-Queue-Id: 550CAE509F
X-Rspamd-Action: no action

Hi Jonas,
Jonas Gorski wrote,

> Hi,
> 
> On Tue, Feb 3, 2026 at 7:25 PM Waldemar Brodkorb <wbx@openadk.org> wrote:
> >
> > Hi Jiaxun,
> > Jiaxun Yang wrote,
> > >
> > > On Tue, 3 Feb 2026, at 3:24 PM, Jiaxun Yang wrote:
> > > > On Sun, 1 Feb 2026, at 6:39 PM, Waldemar Brodkorb wrote:
> > > >> Hi MIPS hackers,
> > > >>
> > > >> I want to use the latest Linux kernel on my Mikrotik RB532, but the
> > > >> serial console is non working. I bisected the problem and the first
> > > >> breaking change is this commit:
> > > >
> > > > Hi,
> > > >
> > > > Can you try this?
> > >
> > > Oops sorry I missed a flag, it should be:
> > >
> > > diff --git a/arch/mips/rb532/devices.c b/arch/mips/rb532/devices.c
> > > index 8ecb56be81ac..239018540221 100644
> > > --- a/arch/mips/rb532/devices.c
> > > +++ b/arch/mips/rb532/devices.c
> > > @@ -213,11 +213,12 @@ static struct platform_device rb532_wdt = {
> > >  static struct plat_serial8250_port rb532_uart_res[] = {
> > >         {
> > >                 .type           = PORT_16550A,
> > > -               .membase        = (char *)KSEG1ADDR(REGBASE + UART0BASE),
> > > +               .mapbase        = REGBASE + UART0BASE,
> > > +               .mapsize        = SZ_4K,
> > >                 .irq            = UART0_IRQ,
> > >                 .regshift       = 2,
> > >                 .iotype         = UPIO_MEM,
> > > -               .flags          = UPF_BOOT_AUTOCONF,
> > > +               .flags          = UPF_BOOT_AUTOCONF | UPF_IOREMAP,
> > >         },
> > >         {
> > >                 .flags          = 0,
> > >
> >
> > I tried the patch, but it still hangs here:
> >
> > RouterBOOT booter 2.18
> >
> > RouterBoard 532
> >
> > CPU frequency: 399 MHz
> >   Memory size:  32 MB
> >
> > Press any key within 3 seconds to enter setup...
> > trying dhcp protocol... OK
> > resolved mac address 9C:BF:0D:00:D6:4E
> > Gateway: 192.168.1.254
> > transfer started ........................................ transfer ok, time=525.70s
> > setting up elf image... OK
> > jumping to kernel code
> >
> > Nothing in tcpdump tries to mount nfs, so I believe serial console
> > breakage is not the only problem here.
> 
> Have you tried the patch on top of master or
> 6e690d54cfa802f939cefbd2fa2c91bd0b8bd1b6?
> 
> If it works on top of 6e690d54cfa802f939cefbd2fa2c91bd0b8bd1b6, then
> it fixes the serial issue, and you can do a new git bisect between
> 6e690d54cfa802f939cefbd2fa2c91bd0b8bd1b6 and master to find the next
> breakage, with the patch re-applied on top each step (so serial stays
> working).

Yes, thanks for the idea. I already had this idea in mind and I am 9
steps before I get the next breakage :)

Thanks for the heads up,

 best regards
  Waldemar

