Return-Path: <linux-mips+bounces-14135-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aCP6LuAU3WkOZQkAu9opvQ
	(envelope-from <linux-mips+bounces-14135-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 13 Apr 2026 18:08:00 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 270753EE598
	for <lists+linux-mips@lfdr.de>; Mon, 13 Apr 2026 18:08:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F3880301C59C
	for <lists+linux-mips@lfdr.de>; Mon, 13 Apr 2026 16:00:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA28C126F3B;
	Mon, 13 Apr 2026 16:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="kJA6OGRc";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Jvg7F7L8"
X-Original-To: linux-mips@vger.kernel.org
Received: from fout-b3-smtp.messagingengine.com (fout-b3-smtp.messagingengine.com [202.12.124.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74A3229408;
	Mon, 13 Apr 2026 16:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776096018; cv=none; b=gX6FjhYloa30ZJJejYXdAZbUxlQaDtt0KrjWNbboRKuSe2R5/Me5w+onZ1AV/ZTAoVe3gp4VCruh17Yi7AZmResKLlueBpyRvW11y/eu5ojsg/dROi+wbFVgau7CwkP0It4R1sHXCOppcrOOcMcRfh5D8+h9dhTFbWyAUKpYZL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776096018; c=relaxed/simple;
	bh=i7fK206NwhnRyk4dMUwoIo5kTsp3EBbIF39VgZZ7qrQ=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=kJEbbg/EMIBBOBWcDlf98iJMMa4FuDa/o/HTbWyy8PtqHuitsYCKsUNxRC8sm15efCRYddtl3XcpRYdsR4rP9eaHIjPY5hN4t6nluybJwvz0jy1F157sD8Fzt7SNlGe+gVnpZeqPSgc6QcnR6/uUgMn1kqEsaig6r5L9tHKXris=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=kJA6OGRc; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Jvg7F7L8; arc=none smtp.client-ip=202.12.124.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id C4D1C1D0022B;
	Mon, 13 Apr 2026 12:00:15 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Mon, 13 Apr 2026 12:00:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1776096015;
	 x=1776182415; bh=/iv/pcTfVSlpNC7zw/ioPJR8syUP7va6YCEpuLUEAwc=; b=
	kJA6OGRcjNDnTIHp9/+o9ZSHh9U87mPaZgP1CwmmfY7MzwbD1aaqBmf4pqbx2oj9
	CA9nc2uYHzCwWiDRhdD7xdmxeE5hww1zGg6XE0EIGZKdpY9fdY1dAybDwqY050jV
	CHeGqwVoOWucCrUshb8+nbkMzeavCz5a+gZq8qC6yEIbnBuhu/YB9Q+asq66prQ6
	6H0vsKgJAbjd3hUF0HU0r4s6qMlifDEIrqTtstf0PARc4QnZQHMFW6Q53s7S54LZ
	Np1WO1WbzjIZCt6MNhqsmbUujAjnIeqkgIdGgAsk+Sux/e3t1j83u2O6e9FQft47
	Hw17JZ5GfI7gL2eHhRxawA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1776096015; x=
	1776182415; bh=/iv/pcTfVSlpNC7zw/ioPJR8syUP7va6YCEpuLUEAwc=; b=J
	vg7F7L8FyJXYdEnshDaciGCf9pIcFLCzR6Ene0aVah8RXDmBfwO4I/D3d9sZ5SRL
	PJ5TX3D01Eh3m3eBBavB/Pb70oI+jTdcr8jTI5SXajknnjpj5aaxnapPdTk6i4xm
	lAB2XOZMRDqDU1MTlTs/0hcb5iVewpXmtj20v73LEUw1qCm68NzWZtlIxHOuYpJr
	5GvirjO2QGVhHrJ9h1Jmrv5wHA1TACl3EoY2djQvAlOKfDy5FVi05eEDciHnCi/P
	dr9LcTzns3NdtlWMgS9B1MUkd7FYCsscuTLLgvfcasG3xlv/yfl1DMsLMwWNmVzv
	6+zbP9hjfWjpb7I/mghRw==
X-ME-Sender: <xms:DRPdaVfdpotbO1iYzJjWWlXaJS3HI_WoSltc4WepeMHyXE-PoL754Q>
    <xme:DRPdaeA7q7qiKTkxoFUOnmfeCh4AEYt6wrZGhDTXArkCzVlA45_bCrL8inlNZW0v_
    orrl3be3-etlzj-DOSMsUzgm2Y7rS_Wwulvzl5-ZSDUZdLUYfZO8A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdefkeeihecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthhqredtredtjeenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpedvhfdvkeeuudevfffftefgvdevfedvleehvddvgeejvdefhedtgeegveehfeeljeen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnug
    esrghrnhgusgdruggvpdhnsggprhgtphhtthhopedvuddpmhhouggvpehsmhhtphhouhht
    pdhrtghpthhtohepsghpsegrlhhivghnkedruggvpdhrtghpthhtohepthhssghoghgvnh
    gusegrlhhphhgrrdhfrhgrnhhkvghnrdguvgdprhgtphhtthhopegtrghtrghlihhnrdhm
    rghrihhnrghssegrrhhmrdgtohhmpdhrtghpthhtohepvhhinhgtvghniihordhfrhgrsh
    gtihhnohesrghrmhdrtghomhdprhgtphhtthhopehlihhnuhigsegrrhhmlhhinhhugidr
    ohhrghdruhhkpdhrtghpthhtohepmhhpvgesvghllhgvrhhmrghnrdhiugdrrghupdhrtg
    hpthhtohepnhhpihhgghhinhesghhmrghilhdrtghomhdprhgtphhtthhopegthhhlvghr
    ohihsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehluhhtoheskhgvrhhnvghlrdhorh
    hg
X-ME-Proxy: <xmx:DRPdaf5fXMYwGOWBC0zanDfiF2IuNgZk_f2iUCfvYVFiausgWLXSbw>
    <xmx:DRPdaQe6zPs0blaShvhgRAIWo-HOdiomZZkaBaFNhrGCYsRBTl9QAQ>
    <xmx:DRPdaWcbvINdiaSI1XeAv8M2D9FanhzKGKlthu3sWagepmnnwbbCpA>
    <xmx:DRPdaVEo-67EI4TFYpv1ZRy9W9liAZ64tRhZLtOBgqsKoT83ANCSpQ>
    <xmx:DxPdaUet41BCzQhq9q0SSToBRAc2fnLXzjh2mVL22hpKsfvYU4qlR34c>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 6BE7270006D; Mon, 13 Apr 2026 12:00:13 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: ARwL1vy566MZ
Date: Mon, 13 Apr 2026 17:59:52 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: "H. Peter Anvin" <hpa@zytor.com>, "Andy Lutomirski" <luto@kernel.org>,
 "Thomas Gleixner" <tglx@kernel.org>, "Ingo Molnar" <mingo@redhat.com>,
 "Borislav Petkov" <bp@alien8.de>,
 "Dave Hansen" <dave.hansen@linux.intel.com>, x86@kernel.org,
 "Russell King" <linux@armlinux.org.uk>,
 "Catalin Marinas" <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>,
 "Madhavan Srinivasan" <maddy@linux.ibm.com>,
 "Michael Ellerman" <mpe@ellerman.id.au>,
 "Nicholas Piggin" <npiggin@gmail.com>,
 "Christophe Leroy" <chleroy@kernel.org>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "Vincenzo Frascino" <vincenzo.frascino@arm.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org
Message-Id: <15925544-1ae5-406a-b9cc-af5935cc9f02@app.fastmail.com>
In-Reply-To: 
 <20260410091131-46b6354c-9d06-4e47-9345-ee224d8528f7@linutronix.de>
References: <20260227-vdso-compat_32bit_time-v1-0-3f0286a7bac3@linutronix.de>
 <20260227-vdso-compat_32bit_time-v1-1-3f0286a7bac3@linutronix.de>
 <c29f5e70-bd17-4e1b-a005-5a3282e70075@app.fastmail.com>
 <03cd1e21-a2f2-46a1-a674-cbaef9712016@app.fastmail.com>
 <20260227103226-cc3bb32c-0107-4c09-b81a-ca33ea03ad5c@linutronix.de>
 <49b7c9f9-198a-49f7-880b-6ae74d7bd985@zytor.com>
 <2b1ac7b9-fcc8-4aa3-a0ad-eb37e4bce030@app.fastmail.com>
 <20260410091131-46b6354c-9d06-4e47-9345-ee224d8528f7@linutronix.de>
Subject: Re: [PATCH 1/7] x86/vdso: Respect COMPAT_32BIT_TIME
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.15 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arndb.de,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[arndb.de:s=fm1,messagingengine.com:s=fm2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	TAGGED_FROM(0.00)[bounces-14135-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[zytor.com,kernel.org,redhat.com,alien8.de,linux.intel.com,armlinux.org.uk,arm.com,linux.ibm.com,ellerman.id.au,gmail.com,alpha.franken.de,vger.kernel.org,lists.infradead.org,lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arnd@arndb.de,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[arndb.de:+,messagingengine.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-mips];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,messagingengine.com:dkim,arndb.de:dkim,app.fastmail.com:mid]
X-Rspamd-Queue-Id: 270753EE598
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 10, 2026, at 09:24, Thomas Wei=C3=9Fschuh wrote:
> On Tue, Mar 03, 2026 at 09:50:33PM +0100, Arnd Bergmann wrote:
>> On Tue, Mar 3, 2026, at 19:11, H. Peter Anvin wrote:
>> >
>> > The time zone in the kernel has never worked anyway, as it would re=
quire the
>> > kernel to contain at least the forward portion of the zoneinfo/tzda=
ta table in
>> > order to actually work correctly. The only plausible use of it woul=
d be for
>> > local time-based filesystems like FAT, but I don't think we bother.
>> >
>> > A bigger question is whether or not we should omit these from the v=
DSO
>> > completely (potentially causing link failures) or replace them with=
 stubs
>> > returning -ENOSYS.
>>=20
>> I see no harm in keeping gettimeofday() in the vdso when
>> COMPAT_32BIT_TIME is turned on, as existing code will call it
>> no matter whether it's in the vdso or the syscall.
>
> We would still always keep them for 64-bit ABIs, right?

Yes, I think we can't easily change that now. It was probably
a mistake to keep them in the generic syscall table after
we dropped them for 32-bit non-time32 targets, so riscv64
and loongarch should have not had these in the first place.

>> Equally, I see no point in having either version of
>> gettimeofday() or settimeofday() when COMPAT_32BIT_TIME is
>> disabled, as clearly anything calling it would pass incorrect
>> data for times past 2038.
>
> Should we also drop the syscalls in these cases?
> We will need to keep settimeofday() in some form to support the
> timewarping call done by init.
>
> Recap/Proposal:
>
> * Keep the gettimeofday()/time() syscalls when they are y2038 safe or
>   CONFIG_COMPAT_32BIT_TIME is set.
> * The vDSO functions always mirror the systemcall availability.

These sound good.

> * Always provide settimeofday(). If CONFIG_COMPAT_32BIT_TIME is *not*
>   set, reject passing any 'tv' argument where it may not be y2038 safe.

This sounds wrong to me now: the case I'm worried about is a 32-bit
system calling settimeofday() based on the value of an RTC or NTP.
The idea of CONFIG_COMPAT_32BIT_TIME=3Dn is to catch this by causing
an intentional ENOSYS error even for valid times, so it doesn't
suddenly start breaking in 2038.

     Arnd

