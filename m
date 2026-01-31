Return-Path: <linux-mips+bounces-13061-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QD1MMWTCfWk0TgIAu9opvQ
	(envelope-from <linux-mips+bounces-13061-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Sat, 31 Jan 2026 09:50:44 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 29BBBC14DA
	for <lists+linux-mips@lfdr.de>; Sat, 31 Jan 2026 09:50:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1B711300CC2D
	for <lists+linux-mips@lfdr.de>; Sat, 31 Jan 2026 08:50:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4089D2FD665;
	Sat, 31 Jan 2026 08:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="esJUYmz9"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DEDE2E7657
	for <linux-mips@vger.kernel.org>; Sat, 31 Jan 2026 08:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769849440; cv=none; b=plGmoeZ+WMCpmk05SQRvZNi9PXz2eTXe64bNLWdJQsg1F4+N72BXcTsdwXFrCrL1CzOQgMZohip6chFpa//qZr6SuKr1avb1t27PC4xsaac9zrKCI9eIJmy7KROCqU0IGMDwoSR7/oH+pM0Im7eENa8XSuP5iuT4CyHFFYqNCiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769849440; c=relaxed/simple;
	bh=vySMPrpBYcsqqqwyb0Y73rGsGAGij0QBUJZITGVwK9Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Yctm4ySUGo04e3o9ma0DchfICfJzhhhBy7jD48WpljKOXeFoaSeitTJWGVLxi4gnJnpDOd5rot9O6Ok1u9WSuMPkgCWh6iYIiet5BxWD95Ac9uzCSF2yaOCF6zSiKwMhgAs623PXqRd8w0UkHUwXjLRkPX9nP5QI9H3VUlBkAHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=esJUYmz9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2361C2BCB5
	for <linux-mips@vger.kernel.org>; Sat, 31 Jan 2026 08:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769849439;
	bh=vySMPrpBYcsqqqwyb0Y73rGsGAGij0QBUJZITGVwK9Q=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=esJUYmz9Q5O44tgApY1/1BxRYv7xVun0m3XRvWhWJLpOl3BEn15dcJSJEDM3/pPze
	 0AzJ9IjsFkQknp/imMoryUnu0exO0nOCp7ZjSxe7vdO4s5NTqkKCgdN9ND/upEWXym
	 70SITA0utNz9CdYgbmr23k1IxEoenwmQ8sPgzkI2xuxqdCxv+qgtrLMIyugE/SrSNg
	 6Hq8r3uJuM+RoTLj3jZCLg6lMNZPbTBEDKAirPx7Jd4y+0JGbkMmhpXbRakshBUf0R
	 jV/Hj95aVQyZK46soCTy4gz/9hcBgMXp4qCQvFtkP4UrdhIpZoXKSBhxuozftjO11c
	 jq5p50+0G4Ibw==
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-65814266b08so5718029a12.3
        for <linux-mips@vger.kernel.org>; Sat, 31 Jan 2026 00:50:39 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUGJsAxqmMOb+MJH9mkPhesS99pudiINJQtmOOJ2kyMdKOuJVXTBqocL0e7Hs6ywf6W0hOboHlpU6DS@vger.kernel.org
X-Gm-Message-State: AOJu0YyDteJ4mMQWBa5Q73GdGgDaamWgY4YpeIZx8lr9lIjrvsUMLpbU
	pSpTHUVaHqaciy6S1L9CX1NWPp6BVKRy5Cg6LvwKaFCwsoiYmyA7ftnHTfgpvpWCXIub+2lPWKe
	VLaWPJt1Oimco2mYSVCPI4nZ72abIF4A=
X-Received: by 2002:a17:906:7946:b0:b84:2fe8:b5d8 with SMTP id
 a640c23a62f3a-b8dff5cbdb3mr333334566b.14.1769849438443; Sat, 31 Jan 2026
 00:50:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260107094007.966496-1-john.g.garry@oracle.com>
 <20260107094007.966496-3-john.g.garry@oracle.com> <CAAhV-H6qAtsBF3jwxbYGEUytZXH2ZRPfzPtUZRBnXOiZ_K5bYg@mail.gmail.com>
 <59101a15-fa63-4948-9169-3db6596bf618@oracle.com>
In-Reply-To: <59101a15-fa63-4948-9169-3db6596bf618@oracle.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sat, 31 Jan 2026 16:50:26 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5Y-FzdhaNNPUa+P0Enk5hvPxJYAduQGvRUXwDuBaR+HA@mail.gmail.com>
X-Gm-Features: AZwV_Qiwi5AAaKPHw38sH3q4aPAGkPNUvDXGj5Ir4MfEEmod4jV1jrLep1qAkhY
Message-ID: <CAAhV-H5Y-FzdhaNNPUa+P0Enk5hvPxJYAduQGvRUXwDuBaR+HA@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] LoongArch: Make cpumask_of_node() robust against NUMA_NO_NODE
To: John Garry <john.g.garry@oracle.com>
Cc: kernel@xen0n.name, jiaxun.yang@flygoat.com, tsbogend@alpha.franken.de, 
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, hpa@zytor.com, luto@kernel.org, 
	peterz@infradead.org, arnd@arndb.de, x86@kernel.org, 
	loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-arch@vger.kernel.org, vulab@iscas.ac.cn, 
	gregkh@linuxfoundation.org, rafael@kernel.org, dakr@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13061-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[chenhuacai@kernel.org,linux-mips@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-mips];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 29BBBC14DA
X-Rspamd-Action: no action

On Fri, Jan 30, 2026 at 8:21=E2=80=AFPM John Garry <john.g.garry@oracle.com=
> wrote:
>
> On 25/01/2026 03:55, Huacai Chen wrote:
> > Reviewed-by: Huacai Chen <chenhuacai@loongson.cn>
>
> Thanks
>
> So can a loongarch maintainer pick this up please?
OK, applied.

Huacai

>
> >
> > On Wed, Jan 7, 2026 at 5:48=E2=80=AFPM John Garry <john.g.garry@oracle.=
com> wrote:
> >>
> >> The arch definition of cpumask_of_node() cannot handle NUMA_NO_NODE - =
which
> >> is a valid index - so add a check for this.
> >>
> >> Signed-off-by: John Garry <john.g.garry@oracle.com>
> >> ---
> >>   arch/loongarch/include/asm/topology.h | 2 +-
> >>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/arch/loongarch/include/asm/topology.h b/arch/loongarch/in=
clude/asm/topology.h
> >> index f06e7ff25bb7c..6b79d6183085a 100644
> >> --- a/arch/loongarch/include/asm/topology.h
> >> +++ b/arch/loongarch/include/asm/topology.h
> >> @@ -12,7 +12,7 @@
> >>
> >>   extern cpumask_t cpus_on_node[];
> >>
> >> -#define cpumask_of_node(node)  (&cpus_on_node[node])
> >> +#define cpumask_of_node(node)  ((node) =3D=3D NUMA_NO_NODE ? cpu_all_=
mask : &cpus_on_node[node])
> >>
> >>   struct pci_bus;
> >>   extern int pcibus_to_node(struct pci_bus *);
> >> --
> >> 2.43.5
> >>
>

