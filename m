Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CFAF423E972
	for <lists+linux-mips@lfdr.de>; Fri,  7 Aug 2020 10:45:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726985AbgHGIpK (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 7 Aug 2020 04:45:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726382AbgHGIpJ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 7 Aug 2020 04:45:09 -0400
X-Greylist: delayed 560 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 07 Aug 2020 01:45:09 PDT
Received: from glittertind.blackshift.org (glittertind.blackshift.org [IPv6:2a01:4f8:1c1c:29e9::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2143BC061574
        for <linux-mips@vger.kernel.org>; Fri,  7 Aug 2020 01:45:09 -0700 (PDT)
Received: from bjornoya.blackshift.org (unknown [IPv6:2a03:f580:87bc:d400:213:3bff:fe04:292])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256
         client-signature RSA-PSS (4096 bits) client-digest SHA256)
        (Client CN "bjornoya.blackshift.org", Issuer "Let's Encrypt Authority X3" (verified OK))
        by glittertind.blackshift.org (Postfix) with ESMTPS id D3AE83D0598;
        Fri,  7 Aug 2020 08:35:45 +0000 (UTC)
Received: from [IPv6:2a03:f580:87bc:d400:807b:6cdc:6efd:a5b4] (unknown [IPv6:2a03:f580:87bc:d400:807b:6cdc:6efd:a5b4])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256
         client-signature RSA-PSS (4096 bits) client-digest SHA256)
        (Client CN "mkl@blackshift.org", Issuer "StartCom Class 1 Client CA" (not verified))
        (Authenticated sender: mkl@blackshift.org)
        by smtp.blackshift.org (Postfix) with ESMTPSA id C8581545301;
        Fri,  7 Aug 2020 08:35:44 +0000 (UTC)
Subject: Re: loongson ls2k1000: PCIe serial card WCH CH382L not working, maybe
 ioports problem
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Du Huanpeng <u74147@gmail.com>, linux-mips@vger.kernel.org
Cc:     zhangj@wch.cn, linux@rempel-privat.de
References: <20200807030826.GA10693@tkernel.org>
 <88921f60-1458-ab04-2ed9-bce57ce7101d@flygoat.com>
From:   Marc Kleine-Budde <mkl@blackshift.org>
Autocrypt: addr=mkl@blackshift.org; prefer-encrypt=mutual; keydata=
 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
 Zro5xcru+8uEU2dlvA==
Message-ID: <ad026820-6b57-15a1-a31e-2d8c8829b7f4@blackshift.org>
Date:   Fri, 7 Aug 2020 10:35:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <88921f60-1458-ab04-2ed9-bce57ce7101d@flygoat.com>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="xhKmNKnexsUQYs8pW2lBCFGoFzQaLV5nF"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--xhKmNKnexsUQYs8pW2lBCFGoFzQaLV5nF
Content-Type: multipart/mixed; boundary="gvbUyPzcQNjsR1xiHdho72yuD9p5qOolL";
 protected-headers="v1"
From: Marc Kleine-Budde <mkl@blackshift.org>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, Du Huanpeng <u74147@gmail.com>,
 linux-mips@vger.kernel.org
Cc: zhangj@wch.cn, linux@rempel-privat.de
Message-ID: <ad026820-6b57-15a1-a31e-2d8c8829b7f4@blackshift.org>
Subject: Re: loongson ls2k1000: PCIe serial card WCH CH382L not working, maybe
 ioports problem
References: <20200807030826.GA10693@tkernel.org>
 <88921f60-1458-ab04-2ed9-bce57ce7101d@flygoat.com>
In-Reply-To: <88921f60-1458-ab04-2ed9-bce57ce7101d@flygoat.com>

--gvbUyPzcQNjsR1xiHdho72yuD9p5qOolL
Content-Type: text/plain; charset=utf-8
Content-Language: de-DE
Content-Transfer-Encoding: quoted-printable

On 8/7/20 10:01 AM, Jiaxun Yang wrote:
>> I'm testing a PCIe card to two uarts (WCH CH382L compatible,
>>           https://item.jd.com/48547850173.html) on a loongson ls2k1000=
 board.
>>
>> With the card inserted the kernel detects the two new uarts:
>>
>> [    2.060884] pci 0000:00:04.1: EHCI: unrecognized capability ff
>> [    2.066721] pci 0000:00:04.1: EHCI: capability loop?
>> [    2.066745] pci 0000:00:04.1: quirk_usb_early_handoff+0x0/0xa60 too=
k 358764 usecs
>> [    2.074542] pcieport 0000:00:09.0: PME: Signaling with IRQ 2
>> [    2.080651] pcieport 0000:00:0a.0: PME: Signaling with IRQ 3
>> [    2.086648] pcieport 0000:00:0b.0: PME: Signaling with IRQ 4
>> [    2.092616] pcieport 0000:00:0c.0: PME: Signaling with IRQ 5
>> [    2.098579] pcieport 0000:00:0d.0: PME: Signaling with IRQ 6
>> [    2.104557] pcieport 0000:00:0e.0: PME: Signaling with IRQ 7
>> [    2.113728] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled=

>> [    2.120891] serial 0000:06:00.0: limiting MRRS to 256
>> [    2.126314] 0000:06:00.0: ttyS0 at I/O 0xc0 (irq =3D 7, base_baud =3D=
 115200) is a XR16850
>> [    2.134618] 0000:06:00.0: ttyS1 at I/O 0xc8 (irq =3D 7, base_baud =3D=
 115200) is a XR16850
>> [    2.143130] 1fe00000.serial: ttyS2 at MMIO 0x1fe00000 (irq =3D 1, b=
ase_baud =3D 7812500) is a 16550A
>> [    2.151946] printk: console [ttyS2] enabled
>> [    2.160255] printk: bootconsole [early0] disabled
>> [    2.170112] [drm] radeon kernel modesetting enabled.
>>
>> However a write to the serial fails:
>> / # echo "hello" >/dev/ttyS0
>> [ 9369.631915] serial 0000:06:00.0: LSR safety check engaged!
>> sh: write error: Input/output error
>=20
> I assume you're using my out-of-tree fork to support LS2K.
> I messed with Logic PIO in that fork.
> I'll fix it in mainline, sorry for the issue...

Do you have a tree that we can test?

Marc


--gvbUyPzcQNjsR1xiHdho72yuD9p5qOolL--

--xhKmNKnexsUQYs8pW2lBCFGoFzQaLV5nF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEK3kIWJt9yTYMP3ehqclaivrt76kFAl8tElwACgkQqclaivrt
76kd8wgAi23rjIjbLVKievB3nwkwrAWjQwIURhv1fUusPAhQpFFTDwOsmq6zbsR5
iFTrB6A3VbwtBNFh0HaccjMCJndEMIhKIdIkK1e9eDQ+jMclZ0ZW1a69P9XY7PgF
dO8TJubDrG3CJaE6Uq/MoLzPeKA7eJ5psNXZGtZ+gEfMZvSuMw43SdSTQz/QLKbW
gEcHxq4cu4I2Pkm45xp1EQtRLJz7wOopggnlph94JAsbCTtI4dt/KG2HltnCjlCU
TAJI+1g6ujaZ89rj1pwCJVKh5rbZG3aBLoAHGuvq9LqRAYsfUtf8k13fVkbFXbi4
7+nEpDqrLpRoJoXTIaFSiNThYHFq4g==
=Ah/4
-----END PGP SIGNATURE-----

--xhKmNKnexsUQYs8pW2lBCFGoFzQaLV5nF--
