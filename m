Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AFCB22FB911
	for <lists+linux-mips@lfdr.de>; Tue, 19 Jan 2021 15:35:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2395401AbhASOSR (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 19 Jan 2021 09:18:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732626AbhASK5f (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 19 Jan 2021 05:57:35 -0500
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7921DC061574
        for <linux-mips@vger.kernel.org>; Tue, 19 Jan 2021 02:56:54 -0800 (PST)
Received: by mail-pj1-x102d.google.com with SMTP id md11so11576666pjb.0
        for <linux-mips@vger.kernel.org>; Tue, 19 Jan 2021 02:56:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=w+aWrlPAQkQn5hA/G8Lg3mcceSqywW4mZ6MNxXvaDxs=;
        b=phxZydL7PStdwnmTwzImfXw31NwsqOXZnjdR3XbBo7mQMLVcJ0nAYeKvSv6De1vnwJ
         YsMA8id+cCsYvSx8G/EZ9KDEjtNP4tdBfogLxYgk58JgqsaraJc6rhzvKQvpX2wwrQRC
         GDJwj1wViQJ9n9kbYbco7GdNHZyBkTQXxNIeKfogLOyhTN9uO07FELdZ8DtXvRA/5xLq
         9lgjv1bLB+RvtxHp5TeOKiu5/SVqpIk8ugTmOZvgeCEeAnDhKwSqs64p96FgSHEKLAGU
         u6Yt571COtd77T/Axd9e6P3SAvLbs0ttOMe0zPkvqStwvJlAOkUidbS9hPv6Zk3x/cYG
         GHhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=w+aWrlPAQkQn5hA/G8Lg3mcceSqywW4mZ6MNxXvaDxs=;
        b=odtWI87hZEDC0Osd2IVf26TPNK6vvoBE2M23CFxSkNLwwMwTA+mU/MkyqO0QY9GpxG
         06x6diEI8uc7m79gk2051enT0D9nydhe0otQamI7ktVJP+Xz1/oFkeHUwjRzMG++CAtE
         plIn8Kibsx/XFxxEfEEN7q88co6xPHwt3oj79Z09xdq/zmQ7yV7ENSyrqrrWcBlyMIT4
         vY4m2rc7ZvXEsPwZ6VHFPWYLtr0226pAUCvvrBfwwmrzGrcfisl6hk47EhCVLMSz/xLY
         k649gUr1Sgmd/Iz5OOc8/5fcMQynD00F/NWUeQNmrnubM8M+YBB/oWywMVw3K4BMazmc
         /X2A==
X-Gm-Message-State: AOAM533ytBeAms8rOtID2VMlXuVMJbtW/vQ1OOybYzJg+FN2ZXUKOH4D
        SJm4Be6QRRHxUJTiTzwLNKI+iqMUQXk=
X-Google-Smtp-Source: ABdhPJxDhZWfL2/q2ea+h3bpgSsCVnuTcNKkcqJYrjMqsDPbmlXwKW4ZJYy+OcNg8nhcGRs3QnnxGg==
X-Received: by 2002:a17:902:ab91:b029:de:30a4:3607 with SMTP id f17-20020a170902ab91b02900de30a43607mr4211403plr.28.1611053814081;
        Tue, 19 Jan 2021 02:56:54 -0800 (PST)
Received: from pek-khao-d2.corp.ad.wrs.com (unknown-105-121.windriver.com. [147.11.105.121])
        by smtp.gmail.com with ESMTPSA id g16sm17342632pfh.187.2021.01.19.02.56.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Jan 2021 02:56:53 -0800 (PST)
Date:   Tue, 19 Jan 2021 18:56:48 +0800
From:   Kevin Hao <haokexin@gmail.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org
Subject: Re: [PATCH] MIPS: OCTEON: Fix the boot broken when using built-in DTB
Message-ID: <20210119105648.GA343327@pek-khao-d2.corp.ad.wrs.com>
References: <20210109114958.16470-1-haokexin@gmail.com>
 <20210118182419.GA16580@alpha.franken.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="tKW2IUtsqtDRztdT"
Content-Disposition: inline
In-Reply-To: <20210118182419.GA16580@alpha.franken.de>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


--tKW2IUtsqtDRztdT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 18, 2021 at 07:24:19PM +0100, Thomas Bogendoerfer wrote:
> On Sat, Jan 09, 2021 at 07:49:58PM +0800, Kevin Hao wrote:
> > For the OCTEON boards, it need to patch the built-in DTB before using
> > it. Previously it judges if it is a built-in DTB by checking
> > fw_passed_dtb. But after commit 37e5c69ffd41 ("MIPS: head.S: Init
> > fw_passed_dtb to builtin DTB", the fw_passed_dtb is initialized even
> > when using built-in DTB. This causes the OCTEON boards boot broken due
> > to an unpatched built-in DTB is used. Add more checks to judge if we
> > really use built-in DTB or not.
> >=20
> > Fixed: 37e5c69ffd41 ("MIPS: head.S: Init fw_passed_dtb to builtin DTB")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Kevin Hao <haokexin@gmail.com>
> > ---
> >  arch/mips/cavium-octeon/setup.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/arch/mips/cavium-octeon/setup.c b/arch/mips/cavium-octeon/=
setup.c
> > index 982826ba0ef7..41d9c80e9666 100644
> > --- a/arch/mips/cavium-octeon/setup.c
> > +++ b/arch/mips/cavium-octeon/setup.c
> > @@ -1149,7 +1149,8 @@ void __init device_tree_init(void)
> >  	bool do_prune;
> >  	bool fill_mac;
> > =20
> > -	if (fw_passed_dtb) {
> > +	if (fw_passed_dtb && (fw_passed_dtb !=3D (ulong)&__dtb_octeon_68xx_be=
gin) &&
> > +	    (fw_passed_dtb !=3D (ulong)&__dtb_octeon_3xxx_begin)) {
>=20
> well, if someone add a third dtb do the builtin DTBs, this might fail
> again. Let's fix it for real...
>=20
> >  		fdt =3D (void *)fw_passed_dtb;
> >  		do_prune =3D false;
> >  		fill_mac =3D true;
>=20
> .... IMHO the real bug is d9df9fb901d2 MIPS: Octeon: Remove special handl=
ing
> of CONFIG_MIPS_ELF_APPENDED_DTB=3Dy. I'm tending to simply revert that co=
mmit.

Yes, this indeed seem much better. I will send a patch to revert d9df9fb901=
d2.
Another issue is that the name of fw_passed_dtb seems pretty confusion afte=
r the
change of commit 37e5c69ffd41. Could we rename it to something like final_d=
tb_addr?

Thanks,
Kevin

> A different option would be to not place the two __dtb_octeon dtbs into t=
he
> builtin dtb section, which looks like more work for not much gain...
>=20
> Thomas.
>=20
> --=20
> Crap can work. Given enough thrust pigs will fly, but it's not necessaril=
y a
> good idea.                                                [ RFC1925, 2.3 ]

--tKW2IUtsqtDRztdT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEHc6qFoLCZqgJD98Zk1jtMN6usXEFAmAGuvAACgkQk1jtMN6u
sXE8kgf+O7PHJ6Z/QwIKec1pbfF4uw61JOMwkdJ/OzPXo15bKfGB7DSms3QjEl1S
abss4uclKhwPOQr7H831xleF1irHLEYTjs++QmiwRcWzWaS1PkdYGqsNG7chOInL
G4VCYUzjeI0sdNyzGE4Nce26CN5u2lROuwmrfuTX0xdWKiNVJnwVbD06N/dc6Or6
4iBD1y31u5pcMTm104/QYfRamsS6IoCTdqmw2sVnaCpNo0/9a7W1tNOdary4/8ow
upk5i5p1MwNVhNNnjsWt6WGGxSbxEZBAyNmf07dBiIZXguZfCNtZWg/Idcd2OpSp
w2yAgQb4lJ1YbMfCuepUxBR9xZD3jw==
=xjKg
-----END PGP SIGNATURE-----

--tKW2IUtsqtDRztdT--
