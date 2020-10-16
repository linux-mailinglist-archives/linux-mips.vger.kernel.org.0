Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A07729060D
	for <lists+linux-mips@lfdr.de>; Fri, 16 Oct 2020 15:12:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404498AbgJPNMD (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 16 Oct 2020 09:12:03 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:42674 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404255AbgJPNMD (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 16 Oct 2020 09:12:03 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 3DE591C0B7D; Fri, 16 Oct 2020 15:12:00 +0200 (CEST)
Date:   Fri, 16 Oct 2020 15:11:59 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Tiezhu Yang <yangtiezhu@loongson.cn>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>
Subject: Re: [PATCH 3/3] MIPS: Loongson64: Add /proc/boardinfo
Message-ID: <20201016131159.GB4335@amd>
References: <1602241050-24051-1-git-send-email-yangtiezhu@loongson.cn>
 <1602241050-24051-4-git-send-email-yangtiezhu@loongson.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="cmJC7u66zC7hs+87"
Content-Disposition: inline
In-Reply-To: <1602241050-24051-4-git-send-email-yangtiezhu@loongson.cn>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


--cmJC7u66zC7hs+87
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> Add /proc/boardinfo to get mainboard and BIOS info easily on the Loongson
> platform, this is useful to point out the current used mainboard type and
> BIOS version when there exists problems related with hardware or firmware.
>=20
> E.g. with this patch:
>=20
> [loongson@linux ~]$ cat /proc/boardinfo
> Board Info
> Manufacturer            : LEMOTE
> Board Name              : LEMOTE-LS3A4000-7A1000-1w-V01-pc
> Family                  : LOONGSON3
>=20
> BIOS Info
> Vendor                  : Kunlun
> Version                 : Kunlun-A1901-V4.1.3-20200414093938
> ROM Size                : 4 KB
> Release Date            : 2020-04-14

Please put this into /sys somewhere, with usual rules. This is hard to
extend/parse.

								Pavel

--=20
http://www.livejournal.com/~pavelmachek

--cmJC7u66zC7hs+87
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl+JnB8ACgkQMOfwapXb+vLn0wCgmNnQeZx5FmOu7cl3XVBFMGnY
36AAoJNjhzh6wbTcj5iiQuDXfwCfLKTr
=YsR6
-----END PGP SIGNATURE-----

--cmJC7u66zC7hs+87--
