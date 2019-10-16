Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1D270D9E39
	for <lists+linux-mips@lfdr.de>; Thu, 17 Oct 2019 00:03:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406673AbfJPV5J (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 16 Oct 2019 17:57:09 -0400
Received: from mx2.suse.de ([195.135.220.15]:54348 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2406644AbfJPV5I (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 16 Oct 2019 17:57:08 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id ACEE3B39C;
        Wed, 16 Oct 2019 21:57:06 +0000 (UTC)
From:   NeilBrown <neil@brown.name>
To:     Sergio Paracuellos <sergio.paracuellos@gmail.com>, hauke@hauke-m.de
Date:   Thu, 17 Oct 2019 08:57:00 +1100
Cc:     paul.burton@mips.com, linux-mips@vger.kernel.org,
        ralf@linux-mips.org
Subject: Re: PCI support for SOC_MT7621
In-Reply-To: <CAMhs-H93MvRBPpR2ra33wf667V_wyDmQGWY0n_rB=puq_aBGog@mail.gmail.com>
References: <CAMhs-H93MvRBPpR2ra33wf667V_wyDmQGWY0n_rB=puq_aBGog@mail.gmail.com>
Message-ID: <87v9sopd5f.fsf@notabene.neil.brown.name>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

--=-=-=
Content-Type: text/plain

On Wed, Oct 16 2019, Sergio Paracuellos wrote:

> Hi all,
>
> I have a concern about commit:
>
> c4d48cf5e2f0 ("MIPS: ralink: deactivate PCI support for SOC_MT7621")
>
> This commit make a regression for my kernel configuration for gnubee
> board which is mt7621 SOC based and also has PCI. With this applied
> PCI_DRIVERS_GENERIC is not selectable anymore and it becomes into a
> PCI_DRIVERS_LEGACY configuration making impossible to compile
> mt7621-pci driver for this board.
>
> I think this should be reverted. Am I missing something here?

The commit reports a build error without the patch, and we don't want
that.
Maybe change the
  select HAVE_PCI
to
  select HAVE_PCI if STAGING
or
  select HAVE_PCI if PCI_MT7621

Hauke: do either of those fix your compile error?

Thanks,
NeilBrown


>
> Thanks in advance for your time.
>
> Best regards,
>     Sergio Paracuellos

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEG8Yp69OQ2HB7X0l6Oeye3VZigbkFAl2nkiwACgkQOeye3VZi
gblQPg//Z5LD/4sXMKejfOyRB71IRuXIIikdvLVvOlbnhWPn4/by7QNGaBpEZB5j
vU1W0MwsyGyAoiZvNzzBxFLzEDk44BHVHRzsVdgjTXSq5dEd0ywtybeh4/8SJMs8
6CBNOuZllTyC0H+dE58OquOILW6ubl/wqBwrcRv6YxdDC57WfSbEEJD2oP3C5icm
Js2WmynSaClPMWmy6E6Mxmh9+6AdkrLsb2ZvHzr83pHhdIkXBcWarr04OQJSmJN9
aS7tTifRjiXY4cC8blYjU1G6E2LM3PVtl2nCZ1DQUZbAksYAqL9Nc5Pjbx5aDOmr
D2Nwq4/MPHAJ8rKadQy+4KlrRPNAvSQGrYuYSIEjBovzMikiMzEDmQNFMExZ24yY
7+3fuSE5F1F6HQULBl1MlOBhaXksgdKXqgkM//U4+EvmNB//s59iMUa+Q7/84jD9
qIiNr5w5szad4Wqn5TdSRcAn0QV0zZPgFrRkpLPtiNxKuBAd5vbZj2XTgIesIMKP
YBPK2LDGo860S0ltPM3iBTrzlGxoOoBUU0ofRdH/aXU5S8tNrjVGwF/h2AQN5VSv
8oT/I9ZCq6pvmufpiuj2hOegJUhod9GzjguRzbDmk2QhOyOdtrtu9eCMd95IIp3A
l6M9Exs6N04F2JhITX4elHEe1kWENbpnqFIXfATfHu0KInkkLK4=
=t1wG
-----END PGP SIGNATURE-----
--=-=-=--
