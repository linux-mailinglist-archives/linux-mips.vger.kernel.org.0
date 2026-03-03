Return-Path: <linux-mips+bounces-13337-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yOKNMGBSp2lsgwAAu9opvQ
	(envelope-from <linux-mips+bounces-13337-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 03 Mar 2026 22:28:00 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CB5841F7825
	for <lists+linux-mips@lfdr.de>; Tue, 03 Mar 2026 22:27:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B256C3029450
	for <lists+linux-mips@lfdr.de>; Tue,  3 Mar 2026 21:27:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 219FE3E715F;
	Tue,  3 Mar 2026 21:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="lZCV9T01";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="PhIeBIWU"
X-Original-To: linux-mips@vger.kernel.org
Received: from fout-b7-smtp.messagingengine.com (fout-b7-smtp.messagingengine.com [202.12.124.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7F0937267F;
	Tue,  3 Mar 2026 21:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772573274; cv=none; b=ZydML/dmUPunlBEufZ+O/3/qgjjwQ2fHNwg+B+KoHoFVJxPBxlCiIZGXMTMKgfiY6y8vHAZ2KeZwIs/C0MQLLHbM04DBTYCdi/lGvgaxyy7UBzTrLA0oY2zbSJcbmAkx4FRr6dvmw6bGt0vAUrsqn8PFHaWoM4tpdKbfYJEjgh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772573274; c=relaxed/simple;
	bh=tD5lXOJjQxSAYJHitU1t5GBzcTMVIRC4YuI9KX1pOsA=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=UJ0xMaZtV/0BXuqH9ZB3fzgR1TLFugYaBnUu9ae/F4Pw8iTkfMI1rVdkhBzEbfamqp19wyMIitSw26DeAcGWm+d+UXIHoySB98g8B0lCgaXj55Jrzf29XA/Aazrs8Ui4LT5GCzNQcnc8T/HeHTqScUrcazx+Jxt7/gEJilA3kaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=lZCV9T01; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=PhIeBIWU; arc=none smtp.client-ip=202.12.124.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id 5A02A1D001DB;
	Tue,  3 Mar 2026 16:27:51 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Tue, 03 Mar 2026 16:27:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1772573271;
	 x=1772659671; bh=28CxBeTt3kOsCs8skczdKMpkv349+QFzE1KV3dW7sn0=; b=
	lZCV9T01LXpLtoPsH4lUH9cYniHQeu2vrjSiCNoGVAaaB8oeeQhbOvFeeDs+936u
	a+hB8JXW2HRJ5vHnKp9Ym7GVriUOb2fh5hDRGxZ3JfMaF59F+OwdMMlvGVGPfbaD
	XUop8hy9UshnIcub/R0VsfNXmqB3NlMI8GYcM+axHhkdHBAaM2ZcHX0nJ1mOtzZR
	vhJJ7uB2XhsKJmw91VoPRMUJ4LB5P9KwM4TUZFGQZQiaOf7Boy3jJ/yNWKBCGmCp
	3PA6cgkrUfLxBTy0L2CwpNrDWaDAuL4dQV3u+30y9RnDzPM+dRrCVLCDMEb6POdz
	Yb/GjrgRyF9xcF1+juIODQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1772573271; x=
	1772659671; bh=28CxBeTt3kOsCs8skczdKMpkv349+QFzE1KV3dW7sn0=; b=P
	hIeBIWU/DDgQgVF3uTqLj3/kF5yeo5z4skzYBWBx2ybEGK9GBTNI+i5JE8iyDUU1
	9cp0p3DoQyBtRJ79kMj2viS61BWLalPOh4tE7VfGX3Riwn5lleR3PgPqRmv7+KQt
	oXQX9AsdGFNuiHx1EsWhW88xx32Hfs7dIG/cHSYc/8lVhPric3HLzjIOcAiq+LIM
	ecPC3thmr7A9ruR0HSNI0EMML3Dcy84R8upF5JrNIkcI2OkjxJ/l42K6N7OEtgGD
	s5zyoD/dM37zDd71oKjAXblspKqNmiEX7VXBuL7TdOiGyJdAJGHLkRX92Xw8krIq
	SCvAhj74DuhAzMBMSub9A==
X-ME-Sender: <xms:VVKnaYg4tnQxAZgRC0wJdP4mFK6_IXvHa7X4_en6jD0MR1IlEdGauQ>
    <xme:VVKnab0VT1FCevR3MDgXsRAC8k4pVsRPqfFNw-ksHAGYuDStEKSa2P65tsbVA0NmF
    V9KhqSk7CKNs5wCSo1a6JnrUux1ZRE-07O4WysODwe0jn671GFW85U>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvieduieejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefggfevudegudevledvkefhvdei
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnh
    gusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepvddupdhmohguvgepshhmthhpohhu
    thdprhgtphhtthhopegsphesrghlihgvnhekrdguvgdprhgtphhtthhopehtshgsohhgvg
    hnugesrghlphhhrgdrfhhrrghnkhgvnhdruggvpdhrtghpthhtoheptggrthgrlhhinhdr
    mhgrrhhinhgrshesrghrmhdrtghomhdprhgtphhtthhopehvihhntggvnhiiohdrfhhrrg
    hstghinhhosegrrhhmrdgtohhmpdhrtghpthhtoheplhhinhhugiesrghrmhhlihhnuhig
    rdhorhhgrdhukhdprhgtphhtthhopehmphgvsegvlhhlvghrmhgrnhdrihgurdgruhdprh
    gtphhtthhopehnphhighhgihhnsehgmhgrihhlrdgtohhmpdhrtghpthhtoheptghhlhgv
    rhhohieskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhuthhosehkvghrnhgvlhdroh
    hrgh
X-ME-Proxy: <xmx:VVKnaVcrU-9VwnlmWGxBZRivKWAFveS6JaifkuuRoOpwHv-9ozBDNw>
    <xmx:VVKnaexEn8uDcE14Stq58ColeH6KVzUPpXb4IrYCsbooyacEaQrJiQ>
    <xmx:VVKnaej8RsplonwyHAIHr7J9g40_5nYtiAPuTKdB6IKwwMeqUNOjJg>
    <xmx:VVKnaT4Soz_WFPFXJYdtynMJnvWHYd0Bh4irP8gSIA_jmFCVBjNXzQ>
    <xmx:V1KnadB0MhYISDQR-2fGEVcVFLF8w_6U-1QIxVi6lmY9aqTdwhBz4dTR>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 311D5700069; Tue,  3 Mar 2026 16:27:49 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: ARwL1vy566MZ
Date: Tue, 03 Mar 2026 22:27:27 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "H. Peter Anvin" <hpa@zytor.com>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: "Andy Lutomirski" <luto@kernel.org>, "Thomas Gleixner" <tglx@kernel.org>,
 "Ingo Molnar" <mingo@redhat.com>, "Borislav Petkov" <bp@alien8.de>,
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
Message-Id: <d92f424c-9aee-417e-899e-3a0002a80f4a@app.fastmail.com>
In-Reply-To: <56591FD5-0DD0-4117-BC7B-4565E3F6512E@zytor.com>
References: <20260227-vdso-compat_32bit_time-v1-0-3f0286a7bac3@linutronix.de>
 <20260227-vdso-compat_32bit_time-v1-1-3f0286a7bac3@linutronix.de>
 <c29f5e70-bd17-4e1b-a005-5a3282e70075@app.fastmail.com>
 <03cd1e21-a2f2-46a1-a674-cbaef9712016@app.fastmail.com>
 <20260227103226-cc3bb32c-0107-4c09-b81a-ca33ea03ad5c@linutronix.de>
 <49b7c9f9-198a-49f7-880b-6ae74d7bd985@zytor.com>
 <2b1ac7b9-fcc8-4aa3-a0ad-eb37e4bce030@app.fastmail.com>
 <56591FD5-0DD0-4117-BC7B-4565E3F6512E@zytor.com>
Subject: Re: [PATCH 1/7] x86/vdso: Respect COMPAT_32BIT_TIME
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: CB5841F7825
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.15 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arndb.de,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[arndb.de:s=fm3,messagingengine.com:s=fm1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	TAGGED_FROM(0.00)[bounces-13337-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,redhat.com,alien8.de,linux.intel.com,armlinux.org.uk,arm.com,linux.ibm.com,ellerman.id.au,gmail.com,alpha.franken.de,vger.kernel.org,lists.infradead.org,lists.ozlabs.org];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[messagingengine.com:dkim,arndb.de:dkim,arndb.de:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Tue, Mar 3, 2026, at 22:00, H. Peter Anvin wrote:
> On March 3, 2026 12:50:33 PM PST, Arnd Bergmann <arnd@arndb.de> wrote:
>>On Tue, Mar 3, 2026, at 19:11, H. Peter Anvin wrote:
>>> A bigger question is whether or not we should omit these from the vDSO
>>> completely (potentially causing link failures) or replace them with stubs
>>> returning -ENOSYS.
>>
>>I see no harm in keeping gettimeofday() in the vdso when
>>COMPAT_32BIT_TIME is turned on, as existing code will call it
>>no matter whether it's in the vdso or the syscall.
>
> That wasn't the point. The point was what kind of error behavior we want.

I see. I would argue here that a link failure is actually the best
case then: the entire point of CONFIG_COMPAT_32BIT_TIME=n is to
enforce the fail-early case, as opposed to silent data corruption
after (now) 12 years of operation.

I don't think there is an actual link failure here, as dl_vdso_vsym()
resolves it at runtime by glibc (when using time32), while musl
doesn't use __vdso_gettimeofday at all.

      Arnd

