Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 280BD35A4E5
	for <lists+linux-mips@lfdr.de>; Fri,  9 Apr 2021 19:48:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234313AbhDIRsW (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 9 Apr 2021 13:48:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234332AbhDIRsV (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 9 Apr 2021 13:48:21 -0400
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com [IPv6:2607:f8b0:4864:20::72e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01728C061761
        for <linux-mips@vger.kernel.org>; Fri,  9 Apr 2021 10:48:08 -0700 (PDT)
Received: by mail-qk1-x72e.google.com with SMTP id c123so1825648qke.1
        for <linux-mips@vger.kernel.org>; Fri, 09 Apr 2021 10:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=uHAUZvCcNfoEyfCeKPn7O2806Byy7CVuFTn6Knaa2Dg=;
        b=eKg+gs3xU9qsNNbzHwGIz+hQzwV6OI5FA2LfVV2qoCs2smUTDYMuX20oEvrVrRvayp
         2+mPqsGd407yb4XJxWZ9cbD+jE6vTjPrSdjarBDy2pmhd/DHSdbbNbqwX5jazCoMetHj
         PX5klzK2aB1H7gQXP8PRtz7Mbm6iSKwMwXIdQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=uHAUZvCcNfoEyfCeKPn7O2806Byy7CVuFTn6Knaa2Dg=;
        b=D0LlOskOnD4z1SNpfnDJyv2jbm3sMUwMZg56uvjImsVpo+flremRsvz3xWaXMYjM7w
         GKX9BQ4AJq8HfnA7envmKs794TIGopijgCW2PUXuKgqyVhvQMBEJo9x+THG1SLmwiYDo
         hszuPlXgLMtarqggQHhCC/9przYcX3Beq5OK/OYfug6nK00bWNMWsARZPCCbQi7ZMSRQ
         teHr6JkBH4ueh8jnvGW5bkVF4x8BD9zLbDPE+qxfSn4xoLjxYWghIERBS1o2PM6vi/Ov
         0tr0JdsTXAzUNroJTiChPUNz3SWkHBQ2IzhFOw3KcTw5xmrXaXk4A8MTcEJTaP9rTv26
         qLJg==
X-Gm-Message-State: AOAM533I8y+eCqBn5ZdYOOMj0YP1O+vxc/mnGrwsTjFplGnaBCjEwLgR
        tKVF9t/vPKSvAjr0a6pZxgHQ7w==
X-Google-Smtp-Source: ABdhPJx2LXELHejnku4tthLo4cRSI3ToR6QqGS5dH+TqHcFGdikvdvI3cnBs9jv4Kc2yIvDawBgu6Q==
X-Received: by 2002:a37:7147:: with SMTP id m68mr14645178qkc.286.1617990487081;
        Fri, 09 Apr 2021 10:48:07 -0700 (PDT)
Received: from bill-the-cat (cpe-65-184-140-239.ec.res.rr.com. [65.184.140.239])
        by smtp.gmail.com with ESMTPSA id h16sm2270622qto.45.2021.04.09.10.48.05
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 09 Apr 2021 10:48:05 -0700 (PDT)
Date:   Fri, 9 Apr 2021 13:47:34 -0400
From:   Tom Rini <trini@konsulko.com>
To:     Simon Glass <sjg@chromium.org>
Cc:     Nathan Chancellor <nathan@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        U-Boot Mailing List <u-boot@lists.denx.de>,
        linux-mips@vger.kernel.org
Subject: Re: mkimage regression when building ARCH=mips defconfig Linux kernel
Message-ID: <20210409174734.GJ1310@bill-the-cat>
References: <20210408182253.6m3j6lhmh3iflquz@archlinux-ax161>
 <CAPnjgZ1ks+JfqO581veycOoLFRLzsXPZBMVSRrDATfukh4z_sw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="JFb47evK0XYfMnOZ"
Content-Disposition: inline
In-Reply-To: <CAPnjgZ1ks+JfqO581veycOoLFRLzsXPZBMVSRrDATfukh4z_sw@mail.gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


--JFb47evK0XYfMnOZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 09, 2021 at 11:55:52AM +1200, Simon Glass wrote:
> +Tom Rini
>=20
> Hi Nathan,
>=20
> On Fri, 9 Apr 2021 at 06:23, Nathan Chancellor <nathan@kernel.org> wrote:
> >
> > Hi Simon,
> >
> > Apologies if this is not the proper way to report a regression, this is=
 my first
> > time interacting with the U-Boot community.
> >
> > My distribution updated the uboot-tools package to 2021.04, which broke=
 my
> > Linux kernel builds for ARCH=3Dmips:
> >
> > $ make -skj"$(nproc)" ARCH=3Dmips CROSS_COMPILE=3Dmips-linux- defconfig=
 all
> > ...
> > /usr/bin/mkimage: verify_header failed for FIT Image support with exit =
code 1
> > make[2]: *** [arch/mips/boot/Makefile:173: arch/mips/boot/vmlinux.gz.it=
b] Error 1
> > ...
> >
> > I bisected this down to your commit:
> >
> > 3f04db891a353f4b127ed57279279f851c6b4917 is the first bad commit
> > commit 3f04db891a353f4b127ed57279279f851c6b4917
> > Author: Simon Glass <sjg@chromium.org>
> > Date:   Mon Feb 15 17:08:12 2021 -0700
> >
> >     image: Check for unit addresses in FITs
> >
> >     Using unit addresses in a FIT is a security risk. Add a check for t=
his
> >     and disallow it.
> >
> >     CVE-2021-27138
> >
> >     Signed-off-by: Simon Glass <sjg@chromium.org>
> >     Reported-by: Bruce Monroe <bruce.monroe@intel.com>
> >     Reported-by: Arie Haenel <arie.haenel@intel.com>
> >     Reported-by: Julien Lenoir <julien.lenoir@intel.com>
> >
> >  common/image-fit.c          | 56 +++++++++++++++++++++++++++++++++++++=
++++----
> >  test/py/tests/test_vboot.py |  9 ++++----
> >  2 files changed, 57 insertions(+), 8 deletions(-)
> > bisect run success
> >
> > $ git bisect log
> > # bad: [e9c99db7787e3b5c2ef05701177c43ed1c023c27] Merge branch '2021-04=
-07-CI-improvements'
> > # good: [c4fddedc48f336eabc4ce3f74940e6aa372de18c] Prepare v2021.01
> > git bisect start 'e9c99db7787e3b5c2ef05701177c43ed1c023c27' 'v2021.01'
> > # good: [b2c86f596cfb1ea9f7f5138f72f1c5c49e3ae3f1] arm: dts: r8a774a1: =
Import DTS queued for Linux 5.12-rc1
> > git bisect good b2c86f596cfb1ea9f7f5138f72f1c5c49e3ae3f1
> > # bad: [74f4929c2c73beb595faf7d5d9bb6a78d710c2fd] ddr: marvell: axp: fi=
x array types have different bounds warning
> > git bisect bad 74f4929c2c73beb595faf7d5d9bb6a78d710c2fd
> > # bad: [cbe607b920bc0827d8fe379ed4f5ae4e2058513e] Merge tag 'xilinx-for=
-v2021.04-rc3' of https://gitlab.denx.de/u-boot/custodians/u-boot-microblaze
> > git bisect bad cbe607b920bc0827d8fe379ed4f5ae4e2058513e
> > # good: [d5f3aadacbc63df3b690d6fd9f0aa3f575b43356] test: Add tests for =
the 'evil' vboot attacks
> > git bisect good d5f3aadacbc63df3b690d6fd9f0aa3f575b43356
> > # bad: [a1a652e8016426e2d67148cab225cd5ec45189fb] Merge tag 'mmc-2021-2=
-19' of https://gitlab.denx.de/u-boot/custodians/u-boot-mmc
> > git bisect bad a1a652e8016426e2d67148cab225cd5ec45189fb
> > # bad: [aeedeae40733131467de72c68e639cf9d795e059] spl: fit: Replace #if=
def blocks with more readable constructs
> > git bisect bad aeedeae40733131467de72c68e639cf9d795e059
> > # bad: [eb5fd9e46c11ea41430d9c5bcc81d4583424216e] usb: kbd: destroy dev=
ice after console is stopped
> > git bisect bad eb5fd9e46c11ea41430d9c5bcc81d4583424216e
> > # bad: [99cb2b996bd649d98069a95941beaaade0a4447a] stdio: Split out null=
dev_register() and move it under #if
> > git bisect bad 99cb2b996bd649d98069a95941beaaade0a4447a
> > # bad: [3f04db891a353f4b127ed57279279f851c6b4917] image: Check for unit=
 addresses in FITs
> > git bisect bad 3f04db891a353f4b127ed57279279f851c6b4917
> > # good: [6f3c2d8aa5e6cbd80b5e869bbbddecb66c329d01] image: Add an option=
 to do a full check of the FIT
> > git bisect good 6f3c2d8aa5e6cbd80b5e869bbbddecb66c329d01
> > # good: [124c255731c76a2b09587378b2bcce561bcd3f2d] libfdt: Check for mu=
ltiple/invalid root nodes
> > git bisect good 124c255731c76a2b09587378b2bcce561bcd3f2d
> > # first bad commit: [3f04db891a353f4b127ed57279279f851c6b4917] image: C=
heck for unit addresses in FITs
> >
> > Is this an actual regression or is this now the expected behavior? I ha=
ve added
> > Thomas and the linux-mips mailing list to take a look and see if the Li=
nux
> > kernel needs to have its sources updated.
>=20
> It is expected. See the code in that commit:
>=20
>       /*
>        * U-Boot stopped using unit addressed in 2017. Since libfdt
>        * can match nodes ignoring any unit address, signature
>        * verification can see the wrong node if one is inserted with
>        * the same name as a valid node but with a unit address
>        * attached. Protect against this by disallowing unit addresses.
>        */
>       if (!ret && CONFIG_IS_ENABLED(FIT_SIGNATURE)) {
>          ret =3D fdt_check_no_at(fit, 0);
>=20
>          if (ret) {
>             log_debug("FIT check error %d\n", ret);
>             return ret;
>          }
>       }
>=20
> Possibly you are using @ nodes in your FIT files in the kernel. Is it
> possible to use a hyphen instead?

Yeah, it looks like arch/mips/generic/*.its.S in the kernel will need to
be updated.

--=20
Tom

--JFb47evK0XYfMnOZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmBwkzIACgkQFHw5/5Y0
tywgiQwAhFHWv9Ol3dcefBCvUODShZvEQ6gVChj/rKA+3sv/hyFz+nHQjC829qOA
E2L3XHn2lbgrQ8P37+9Jl48pxYPKaksF/qPhBHTkpoOOfGuz/51NnDSx4CRemzu+
ZCO2dGXwHRemykARAA3XkPCQluilmoBvZ6crzEHKbxkk+RbF+XwanK/lHxQsAsSE
zrtOWzNOHdOJ6FuhurzyyO/RTnATEQb57IXskyynz0Of4CXhTqkdYPq9FVZ4zi5B
aUUodAc9cXQLdqZgRAnfQzXS0EXnz/9yZrT5XJEt9wiBNLs52WNpoY2MnBS/wlQW
YYEtD9woxABQtvWuQT3exRo7iU+XfDhIoJ8sZEN5yjL9ZIOFC3PS4em5O1Z+W/bQ
2v+522r3WS+yuXkp8eYJ5rNIjd56UyJyGMQJbTIU0DT2tInPj7AtmZrrjdIldkmX
vqP9JD5ZR4fiDRcLq1YsDzaOnXwkMFk6fUWQG9oZvy5pE2PeW/Fx9ITUMWgeIcTK
rgJomVAy
=se1V
-----END PGP SIGNATURE-----

--JFb47evK0XYfMnOZ--
