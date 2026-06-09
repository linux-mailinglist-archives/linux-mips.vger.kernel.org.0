Return-Path: <linux-mips+bounces-15014-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id GAAaKcorKGr8/QIAu9opvQ
	(envelope-from <linux-mips+bounces-15014-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 09 Jun 2026 17:05:46 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EF1466182E
	for <lists+linux-mips@lfdr.de>; Tue, 09 Jun 2026 17:05:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=posteo.de header.s=2017 header.b=aQ9CXDh1;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15014-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-mips+bounces-15014-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=posteo.de;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7E0AB3037982
	for <lists+linux-mips@lfdr.de>; Tue,  9 Jun 2026 14:57:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 689903F20FC;
	Tue,  9 Jun 2026 14:56:53 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CF3C43901E
	for <linux-mips@vger.kernel.org>; Tue,  9 Jun 2026 14:56:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781017013; cv=none; b=B8U/1iX3eeZMkGVhDilHlwHAIvk6OIZ6EA4fOjGiqPCa7J0c599VGI/bnHublggk/HnTLRsVni3EugE5rZob9+/n8VVFsrvahhkCBqYXtdrCyXEIvX6dqk85rXaNky2+Sgk4nkZfaBp6vl2IhexJgo5JHEud5iTnvQGNrBzksLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781017013; c=relaxed/simple;
	bh=zj9Wu73Ltk1sOzoQhTIe1zSxGj1RV23OuqYlJJxGKB0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BDHmY9n+/dA/NymlOdaXF+u8aJ4fPvmTGb2EAxxTH5VJ32kRBPycZY/pJZq0CL2roJscsZzEsWcH3otQaDA9ynviYBUk3z+bq7AxQNXc2wFdE0CpIPXO28Xi7ugMyCaY3Qb/NoDSqVRXyk3c75uYlvs7h5GRK/MCCcu8yYJwEhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de; spf=pass smtp.mailfrom=posteo.de; dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b=aQ9CXDh1; arc=none smtp.client-ip=185.67.36.65
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 23B86240027
	for <linux-mips@vger.kernel.org>; Tue,  9 Jun 2026 16:56:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.de; s=2017;
	t=1781017004; bh=TkCq9T8Scv4lUIRS90x1KMGa7qnjIlxLdGrH7gewdXk=;
	h=Message-ID:Subject:From:To:Cc:Date:Autocrypt:Content-Type:
	 MIME-Version:OpenPGP:From;
	b=aQ9CXDh120YKFaeBkxSGZWEMwoUezQ90aFYnHQjOzWsERTlS1L8fj5zd4aVKajIhg
	 dWq1k8TiHkEjBq+W25d7ScC8Pfh/lXcd0ux/pDemyaB93atdj2L8hNUgZ3q23W9lgP
	 iOhFIZbpGER7850bUyj0uLY1NxopjD4v+kYtgK+eiXXxRGjuuOl3d/hIxqIXMwGITt
	 GGnzg5uEa1nyws/xtraiyrDbbp/RBEjhxyIMncMS4ZqQCUAyUHbgOXEmueiv+nLUZT
	 mnegwzfVMGxWZpgiQvK4QfRuEocZr3MR4RlkMtQvlaycASUAPr9hbvCasPsDxLwClD
	 TzzvYvOwvyl3A==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4gZX6x5xJkz6txs;
	Tue,  9 Jun 2026 16:56:41 +0200 (CEST)
Message-ID: <44a6e266e6ead9b7cbbb6c9c11f18f21a13d8c2a.camel@posteo.de>
Subject: Re: [PATCH RESEND v2 1/2] serial: earlycon: add uart_clk_freq
 parameter
From: Markus Probst <markus.probst@posteo.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Ard Biesheuvel
 <ardb@kernel.org>, Ilias Apalodimas	 <ilias.apalodimas@linaro.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>,  Jiri Slaby
 <jirislaby@kernel.org>, linux-acpi@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, 	linux-efi@vger.kernel.org,
 linux-serial@vger.kernel.org
Date: Tue, 09 Jun 2026 14:56:43 +0000
In-Reply-To: <CAMuHMdXH0mR9Sr+ze2_m94uc46_7gubApzWOkf+vUO+w=DmNoQ@mail.gmail.com>
References: <20260609-acpi_spcr-v2-0-3cd9a3bda727@posteo.de>
	 <20260609-acpi_spcr-v2-1-3cd9a3bda727@posteo.de>
	 <CAMuHMdXH0mR9Sr+ze2_m94uc46_7gubApzWOkf+vUO+w=DmNoQ@mail.gmail.com>
Autocrypt: addr=markus.probst@posteo.de; prefer-encrypt=mutual;
 keydata=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
 jfGillcaQOqFZ3WwVqyzG1BUfTow==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-eHB9O6aTLRCXTUNZoAwj"
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
OpenPGP: url=https://posteo.de/keys/markus.probst@posteo.de.asc; preference=encrypt
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[posteo.de,none];
	R_DKIM_ALLOW(-0.20)[posteo.de:s=2017];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-15014-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:geert@linux-m68k.org,m:rafael@kernel.org,m:lenb@kernel.org,m:tsbogend@alpha.franken.de,m:ardb@kernel.org,m:ilias.apalodimas@linaro.org,m:gregkh@linuxfoundation.org,m:jirislaby@kernel.org,m:linux-acpi@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-m68k@lists.linux-m68k.org,m:linux-mips@vger.kernel.org,m:linux-efi@vger.kernel.org,m:linux-serial@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[markus.probst@posteo.de,linux-mips@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[posteo.de:+];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[markus.probst@posteo.de,linux-mips@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	DBL_BLOCKED_OPENRESOLVER(0.00)[posteo.de:dkim,posteo.de:email,posteo.de:mid,posteo.de:from_mime,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2EF1466182E


--=-eHB9O6aTLRCXTUNZoAwj
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2026-06-09 at 08:53 +0200, Geert Uytterhoeven wrote:
> Hi Markus,
>=20
> On Tue, 9 Jun 2026 at 00:40, Markus Probst <markus.probst@posteo.de> wrot=
e:
> > Add `uart_clk_freq` parameter to `setup_earlycon`. This allows the
> > options string to be reused with `add_preferred_console`, while still
> > allowing to set the uart clock frequency. This will be used in the
> > following commit ("ACPI: SPCR: Support UART clock frequency field").
> >=20
> > No logical change intended.
> >=20
> > Signed-off-by: Markus Probst <markus.probst@posteo.de>
>=20
> > --- a/drivers/tty/serial/earlycon.c
> > +++ b/drivers/tty/serial/earlycon.c
> > @@ -135,11 +135,14 @@ static int __init parse_options(struct earlycon_d=
evice *device, char *options)
> >         return 0;
> >  }
> >=20
> > -static int __init register_earlycon(char *buf, const struct earlycon_i=
d *match)
> > +static int __init register_earlycon(char *buf, unsigned int uart_clk_f=
req,
> > +                                   const struct earlycon_id *match)
> >  {
> >         int err;
> >         struct uart_port *port =3D &early_console_dev.port;
> >=20
> > +       port->uartclk =3D uart_clk_freq;
>=20
> Who is actually consuming this value?

I think primarily init_port in drivers/tty/serial/8250/8250_early.c.

> Earlycon typically works with the serial console, as configured before
> Linux boot by the firmware.
Thats defined in the SPCR table. If "Configured Baud Rate" is set to 0,
it will use it as is [1]. If not, it will configure it.

Thanks
- Markus Probst

[1]https://learn.microsoft.com/en-us/windows-hardware/drivers/bringup/seria=
l-port-console-redirection-table

> The Microsoft doc referenced in patch 2 seem to agree with that:
>=20
>    "On a system where the BIOS or system firmware uses the serial
>     port for console input/output, this table should be used to convey
>     information about the settings, to ensure a seamless transition
>     between the firmware console output and Windows EMS output."
>=20
> > +
> >         /* On parsing error, pass the options buf to the setup function=
 */
> >         if (buf && !parse_options(&early_console_dev, buf))
> >                 buf =3D NULL;
>=20
> Gr{oetje,eeting}s,
>=20
>                         Geert

--=-eHB9O6aTLRCXTUNZoAwj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEgnQYxPSsWOdyMMRzNHYf+OetQ9IFAmooKakbFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMiwyAAoJEDR2H/jnrUPSTOQP/3lOjjeD4rihyrtDkGdA
vD1xzqthwYFbU2fa+qQ1yTgmbp+z5+h7rcbx8T5S2Y7HkuLbilRDe7Q8SGJocpIg
T9085pQlUhA9lCVY+5s0oXqUp+8rSaUSwXYp+MJH8ZXSwPVdr4kDJoAOs8t+PUt0
i9EGA6/6vW2ccRJwYLaCDxmJowfeQZJJG0cjG5ZWLPj2pOOwbXc3Tm8ZWrtfzADd
sS9irtr/CjlO4L6CBUZ2qEIAT1QylOZTOat/B0Xw0VmupSK0ib31FfEzZsxOoCnR
0Dx16p95q+DMLIKa7zgAhrUyvrJjxI2pDpALJfXrbwhjMbjhB+d6lIfL0kEJF8F3
JJg5y5X9ixNdfWomlDFFn6IyLzcuTqrymCLcW14h/lIuGlAv4CDg3OS/i4T+wBW+
raRTVeakyeBUxxwS499UN0EmcFuxI6CuYiEd9it6kbBJU/4w4mfsbB5Lr2eoWh3m
OSuACvoFlS84V3+SQbbziaTFRo+eLtyNfHHpKNM4d2n2Pdn5tWdoXKkoGacl5hhJ
maQmavGZGDX2pWcpdmoB8fDys9gHkhVdMPUPWSdA8KQ3YG01u2gF98UeClteWJOW
tWr4TpLpsrH/5rzFgz4usuMXaetG7wyeMdjVq+7LjG1pGjbeEifYux73o2CxjPkg
6DHab0pVROd5cS1MZIXwtSA/
=g1gl
-----END PGP SIGNATURE-----

--=-eHB9O6aTLRCXTUNZoAwj--

